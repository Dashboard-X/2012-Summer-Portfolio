using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Objects;

namespace Assignment2.Admin
{
   public partial class InPatientFinalise : System.Web.UI.Page
   {
      protected GetDoctors_Result DoctorInfo {get; set;}
      protected GetPatients_Result PatientInfo {get; set;}
      protected IEnumerable<Beds_Result> FreeBeds {get; set;}

      protected void Page_Load(object sender, EventArgs e)
      {
         if (Page.IsPostBack)
         {
            if (ViewState["doctor"] != null) DoctorInfo = (GetDoctors_Result)ViewState["doctor"];
            if (ViewState["patient"] != null) PatientInfo = (GetPatients_Result)ViewState["patient"];
            if (ViewState["beds"] != null) FreeBeds = (IEnumerable<Beds_Result>)ViewState["beds"];
            return;
         }

         try
         {
            int patientId = Convert.ToInt32(Request["patient"]);
            int doctorId = Convert.ToInt32(Request["doctor"]);

            DoctorInfo = ContextEntity.Get().GetDoctors().First(d => d.Id.Equals(doctorId));
            PatientInfo = ContextEntity.Get().GetPatients().First(p => p.Id.Equals(patientId));

            if (DoctorInfo.PatientsInCare >= BusinessRuleMagic.MaxTreatments)
            {
               Master.ErrorMessage("That doctor is not currently able to take on additional in-patients.");
               return;
            }

            var occupiedBeds = ContextEntity.Get().OccupiedBeds().ToList();
            if (occupiedBeds.Any(bed => bed.PatientId.Equals(PatientInfo.Id)))
            {
               Master.ErrorMessage("This patient is already assigned as an in-patient!");
               return;
            }

            FreeBeds = ContextEntity.Get().FreeBeds().ToList();

            if (FreeBeds.Count() == 0)
            {
               Master.ErrorMessage("There are no beds free at this time.");
               return;
            }

            ViewState["doctor"] = DoctorInfo;
            ViewState["patient"] = PatientInfo;
            ViewState["beds"] = FreeBeds;

            Page.DataBind();

            LstFreeBeds.DataSource = FreeBeds;
            LstFreeBeds.DataValueField = "Id";
            LstFreeBeds.DataTextField = "BedName";
            LstFreeBeds.DataBind();
            LstFreeBeds.SelectedIndex = 0;
            updateBedFields(FreeBeds.First());
         }
         catch (Exception ex)
         {
            if (ex is FormatException || ex is NullReferenceException || ex is InvalidOperationException)
            {
               Response.Redirect(ResolveUrl("~/Admin/DoctorPatientInfo.aspx"));
            }
            else
            {
               throw;
            }
         }
      }

      private void updateBedFields(Beds_Result selected)
      {
         LblBedRate.Text = String.Format("{0:C}", selected.RatePerDay);
         LblBedType.Text = selected.Description;
      }

      protected void LstFreeBeds_SelectedIndexChanged(object sender, EventArgs e)
      {
         int selectedId = Convert.ToInt32(LstFreeBeds.SelectedValue);
         Beds_Result selected = FreeBeds.First(b => b.Id.Equals(selectedId));

         updateBedFields(selected);
      }

      protected void BtnSubmit_Click(object sender, EventArgs e)
      {
         int selectedBedId = Convert.ToInt32(LstFreeBeds.SelectedValue);

         if (DoctorInfo.PatientsInCare >= BusinessRuleMagic.MaxTreatments)
         {
            throw new Exception("Stop trying to hax the server");
         }

         ContextEntity.Get().NewInPatient(PatientInfo.Id, DoctorInfo.Id, selectedBedId);
         Response.Redirect(ResolveUrl("~/Admin/DoctorPatientInfo.aspx"));
      }
   }
}