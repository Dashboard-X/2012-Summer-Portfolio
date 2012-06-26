using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assignment2.Credit;

namespace Assignment2.Admin
{
   [Serializable]
   public class VisitBindingResult
   {
      public int Id {get; set;}
      public string PatientName {get; set;}
      public string DoctorName { get; set; }
      public string BedName { get; set; }
      public int StayDuration {get; set;}
     
      public decimal RatePerDay {get; set;}
      public string RatePerDayText { 
         get
         {
            return String.Format("{0:C}", RatePerDay);
         }
         set { }
      }

      public decimal AmountDue {get; set;}
      public string AmountDueText
      {
         get
         {
            return String.Format("{0:C}", AmountDue);
         }
         set {}
      }

      public string Address { get; set; }

      public VisitBindingResult(GetInPatients_Result result)
      {
         DateTime dischargeTime = DateTime.Now;

         Id = result.Id;
         PatientName = result.PatientName;
         DoctorName = result.DoctorName;
         BedName = result.BedName;
         StayDuration = (dischargeTime - result.DateOfVisit).Days + 1;

         var beds = ContextEntity.Get().OccupiedBeds();
         RatePerDay = beds.First(b => b.Id.Equals(result.BedId)).RatePerDay;
         AmountDue = RatePerDay * StayDuration;

         var patients = ContextEntity.Get().GetPatients();
         Address = patients.First(p => p.Id.Equals(result.PatientId)).Address;
      }
   }

   public partial class DischargeInPatient : System.Web.UI.Page
   {
      public VisitBindingResult DischargeDetails {get; set;}

      protected void YearValidator_Load(object sender, EventArgs e)
      {
         YearValidator.MinimumValue = DateTime.UtcNow.Year.ToString();
         YearValidator.MaximumValue = (DateTime.UtcNow.Year + 20).ToString();
      }

      protected void Page_Load(object sender, EventArgs e)
      {
         if (IsPostBack)
         {
            if (ViewState["visit"] != null)
            {
               DischargeDetails = (VisitBindingResult)ViewState["visit"];
            }
         }
         else
         {
            try
            {
               var id = Request.QueryString["id"];
               var vId = Convert.ToInt32(id);
               
               var context = ContextEntity.Get();
               
               var visit = context.GetInPatients()
                     .First(v => v.Id.Equals(vId));

               DischargeDetails = new VisitBindingResult(visit);
               ViewState["visit"] = DischargeDetails;

               Page.DataBind();
            }
            catch(Exception ex)
            {
               if (ex is InvalidOperationException || ex is NullReferenceException)
               {
                  Master.ErrorMessage("Patient visit not found.");
                  return;
               }

               throw;
            }
         }
      }

      protected void BtnSubmit_Click(object sender, EventArgs e)
      {
         if (!IsValid) return;

         ICreditProvider provider = Provider.Get();

         bool prepared = provider.Prepare(TxtCardNumber.Text.Trim(), TxtAddress.Text.Trim(),
            Convert.ToInt32(TxtMonthExpiry.Text), Convert.ToInt32(TxtYearExpiry.Text));

         if (!prepared)
         {
            LblError.Text = "We are unable to process your request at this time.";
         }

         bool transacted = provider.Transact(DischargeDetails.AmountDue);

         if (!transacted)
         {
            LblError.Text = "An error occurred while processing the transaction, it has been aborted.";
         }
         else
         {
            LblError.Text = "Transaction successful. Begin printing invoice for paper records.";
            LblTotal.Text = "AMOUNT PAID:";
            LblTitle.Text = "Discharged Patient";
            DischargeLabel.Text = "Date Discharged:";
            DischargeDate.Text = DateTime.Now.ToShortDateString();
            LblAddress.Text = TxtAddress.Text;
            TxtAddress.Visible = false;
            LblAddress.Visible = true;

            BtnSubmit.Visible = false;

            ContextEntity.Get().DischargeVisit(DischargeDetails.Id);
            
         }
      }
   }
}