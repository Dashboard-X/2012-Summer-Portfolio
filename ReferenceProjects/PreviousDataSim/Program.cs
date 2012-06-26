using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataGenerator;

namespace ConsoleApplication1
{
   class Program
   {
      static double repeat_patient_chance = 0.4;
      static double out_patient_chance = 0.9;
      static double out_patient_notes_chance = 0.6;
      static int max_doctor_load = 3;
      static int min_stay_duration = 1;
      static int max_stay_duration = 7;

      static DateTime start_sim = new DateTime(2012, 01, 01);
      static DateTime end_sim = new DateTime(2012, 02, 02);
      static int patient_min_time_minutes = 1;
      static int patient_max_time_minutes = 120;


      static baxtech_clinicEntities context = new baxtech_clinicEntities();

      static Random rnd = new Random();
      static Patient ExistingPatient()
      {

         var pList = context.Patients.Select(p => p.Id).ToList();

         var selectedId = pList[0 + rnd.Next(pList.Count)];
         return context.Patients.First(p => p.Id.Equals(selectedId));
      }

      static bool RandomEvent(double probability)
      {
         return rnd.NextDouble() <= probability;
      }

      static Patient NewPatient(DateTime time_added)
      {

         Patient newPatient = Patient.CreatePatient(0, 
            Generate.RandomFullName(),
            String.Format("{0} {1} {2}", Generate.RandomStreetAddress(), Generate.RandomCity(), Generate.RandomZipCode()),
            Generate.RandomBirth(),
            Generate.RandomPhone(),
            String.Format("{0} {1}", Generate.RandomFullName(), Generate.RandomPhone()),
            time_added);

         context.Patients.AddObject(newPatient);
         context.SaveChanges();

         return newPatient;
      }

      static Doctor GetAvailableDoc(bool isOutPatient)
      {
      
         IEnumerable<Doctor> pool;

         if (isOutPatient)
            pool = context.Doctors;
         else
         {
            pool = context.Doctors.Where(doc => doc.Visits.Where(visit => visit.DateOfDischarge == null).Count() < max_doctor_load);
         }

         if (pool.Count() == 0) return null;

         return pool.ToList()[0 + rnd.Next(pool.Count())];
      }

      class PatientStay
      {
         public Visit visit;
         public TimeSpan length;
      }

      static void Main(string[] args)
      {
         var ongoingPatients = new List<PatientStay>();
         DateTime sim_time = start_sim;

         if (context.Patients.Count() == 0) NewPatient(sim_time);

         while (sim_time < end_sim)
         {
            sim_time += new TimeSpan(0, Generate.RandomInt(patient_min_time_minutes, patient_max_time_minutes), Generate.RandomInt(1, 10));
            
            ProcessExpiredStays(sim_time, ongoingPatients);
            Patient nextPatient = RandomEvent(repeat_patient_chance) ? ExistingPatient() : NewPatient(sim_time);

            bool isOutPatient = RandomEvent(out_patient_chance);

            Doctor doctor = GetAvailableDoc(isOutPatient);
            if (doctor == null)
            {
               Console.WriteLine("ran out of doctors!");
               Console.WriteLine("Current time: {0}", sim_time);
               continue;
            };

            PatientStay stay = ProcessPatientVisit(sim_time, nextPatient, doctor, isOutPatient);
            if (stay != null) ongoingPatients.Add(stay);

         }

      }

      private static PatientStay ProcessPatientVisit(DateTime now, Patient nextPatient, Doctor doctor, bool isOutPatient)
      {
         Visit visit = Visit.CreateVisit(0, doctor.Id, nextPatient.Id, now);

         if (isOutPatient)
         {
            visit.DateOfDischarge = now;
         }
         else
         {
            var nextBed = NextAvailableBed();
            if (nextBed == null)
            {
               Console.WriteLine("no beds available!!!!");
               Console.WriteLine("Current time: {0}", now);
               return null;
            }

            visit.Bed = nextBed;
         }

         context.Visits.AddObject(visit);
         context.SaveChanges();
         
         if (!isOutPatient || RandomEvent(out_patient_notes_chance))
         {
            CreateAmusingVisitDetail(visit);
         }

         if (isOutPatient) return null;

         PatientStay stay = new PatientStay() {
         visit = visit, 
         length = new TimeSpan(rnd.Next(min_stay_duration, max_stay_duration), 0, 0, 0)};

         return stay;
      }

      private static void CreateAmusingVisitDetail(Visit visit)
      {

         var detail = VisitDetail.CreateVisitDetail(0,
         Generate.RandomSymptoms(),
         Generate.RandomDiagnosis(),
         Generate.RandomTreatment());

         visit.VisitDetail = detail;
         context.SaveChanges();
      }

      private static Bed NextAvailableBed()
      {
         
         var takenBeds = context.Visits
         .Where(visit => visit.DateOfDischarge == null)
         .Select(visit => visit.Bed);

         var availableBeds = context.Beds.Except(takenBeds);

         if (availableBeds.Count() == 0) return null;
         else return availableBeds.ToList()[0 + rnd.Next(availableBeds.Count())];
      }

      static void ProcessExpiredStays(DateTime now, List<PatientStay> stays)
      {
         var expired = stays
         .Where(stay => now > stay.visit.DateOfVisit + stay.length)
         .ToList();

         expired.ForEach(stay => DischargePatient(stay, now));
         stays.RemoveAll(stay => expired.Contains(stay));

         context.SaveChanges();
      }

      private static void DischargePatient(PatientStay stay, DateTime now)
      {
         stay.visit.DateOfDischarge = now;
      }
   }
}
