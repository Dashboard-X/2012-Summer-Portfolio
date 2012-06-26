using System.Collections.Generic;
using System;
using System.Linq;

namespace Assignment2
{
   public class DoctorsDAL
   {
      public IEnumerable<GetDoctors_Result> getDoctors()
      {
         return ContextEntity.Get().GetDoctors().ToList();
      }
   }

   public class InPatientVisitsDAL
   {
      public IEnumerable<GetInPatients_Result> getVisits()
      {
         return ContextEntity.Get().GetInPatients().ToList();
      }
   }

   public class DoctorInPatientsDAL : InPatientVisitsDAL
   {
      public IEnumerable<GetInPatients_Result> getVisits(string DoctorID)
      {
         int id = Convert.ToInt32(DoctorID);
         return getVisits()
               .Where(v => v.DoctorId.Equals(id))
               .ToList();
      }
   }

   public class DoctorOutPatientsDAL : OutPatientVisitsDAL
   {
      public IEnumerable<GetOutPatients_Result> getVisits(string DoctorID)
      {
         int id = Convert.ToInt32(DoctorID);
         return getVisits(null, null, null, "visit")
               .Where(v => v.DoctorId.Equals(id))
               .ToList();
      }
   }

   public class OutPatientVisitsDAL
   {
      public IEnumerable<GetOutPatients_Result> getVisits(string fromDate, string toDate, string name, string dateColumn)
      {
         var context = ContextEntity.Get();

         var fromDateParsed = fromDate != null ? Convert.ToDateTime(fromDate) : DateTime.Now - new TimeSpan(14, 0, 0, 0);
         var toDateParsed = toDate != null ? Convert.ToDateTime(toDate) : DateTime.Now;

         var allVisits = context.GetOutPatients();
         var filteredVisits = FilterVisit(allVisits, fromDateParsed, toDateParsed, dateColumn);

         if (name != null)
            filteredVisits = filteredVisits.Where(v => v.PatientName.IndexOf(name, StringComparison.OrdinalIgnoreCase) >= 0);

         return filteredVisits.Reverse().ToList();
      }

      private IEnumerable<GetOutPatients_Result> FilterVisit(IEnumerable<GetOutPatients_Result> allVisits, DateTime fromDate, DateTime toDate, string dateColumn)
      {
         toDate += new TimeSpan(1, 0, 0, 0);
         if (dateColumn.Equals("visit"))
         {
            return allVisits
               .Where(v => v.DateOfVisit >= fromDate)
               .Where(v => v.DateOfVisit <= toDate);
         }
         else
         {
            return allVisits
               .Where(v => v.DateOfDischarge >= fromDate)
               .Where(v => v.DateOfDischarge <= toDate);
         }
      }
   }
}