using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2.Admin
{
   public partial class DoctorPatientInfo : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {
      }

      protected void OutPatientsView_Bound(object sender, ListViewItemEventArgs e)
      {
         if (e.Item.ItemType == ListViewItemType.DataItem)
         {
            LinkButton lb = (LinkButton)e.Item.FindControl("DetailsLink");
            var actualItem = (GetOutPatients_Result)e.Item.DataItem;

            lb.PostBackUrl = ResolveUrl("~/User/VisitDetails.aspx?id=" + actualItem.Id);

            if (actualItem.DetailsId != null)
            {
               lb.Text = "Yes";
            }
            else
            {
               lb.Text = "No";
            }
         }
      }

      protected void InPatientsView_Bound(object sender, ListViewItemEventArgs e)
      {
         if (e.Item.ItemType == ListViewItemType.DataItem)
         {
            LinkButton lb = (LinkButton)e.Item.FindControl("DetailsLink");
            var actualItem = (GetInPatients_Result)e.Item.DataItem;

            lb.PostBackUrl = ResolveUrl("~/User/VisitDetails.aspx?id=" + actualItem.Id);

            LinkButton btnDischarge = (LinkButton)e.Item.FindControl("DischargeLink");
            btnDischarge.PostBackUrl = ResolveUrl("~/Admin/DischargeInPatient.aspx?id=" + actualItem.Id);
         }
      }

      protected void BtnSearchName_Click(object sender, EventArgs e)
      {

      }

      protected void DrpDoctorSelect_SelectedIndexChanged(object sender, EventArgs e)
      {
         if (DrpDoctorSelect.SelectedValue != null && DrpDoctorSelect.SelectedValue != "")
         {
            int selectedValue = Convert.ToInt32(DrpDoctorSelect.SelectedValue);

            // Sloppiness borne of time deficiency, should not have to hit database twice to get Doctor object
            var selectedDoctor = new DoctorsDAL().getDoctors().First(d => d.Id.Equals(selectedValue));

            if (selectedDoctor.PatientsInCare >= BusinessRuleMagic.MaxTreatments) BtnInPatient.Enabled = false;
            else (BtnInPatient.Enabled) = true;
         }
      }

      protected void BtnOutPatient_Click(object sender, EventArgs e)
      {
         if (GridPatients.SelectedIndex < 0) return;

         int patient = (int)GridPatients.SelectedValue;
         int doctor = Convert.ToInt32(DrpDoctorSelect.SelectedValue);

         var context = ContextEntity.Get();
         context.NewOutPatient(patient, doctor);
         OutPatientsView.DataBind();
      }

      protected void BtnInPatient_Click(object sender, EventArgs e)
      {
         if (GridPatients.SelectedIndex < 0) return;

         int patient = (int)GridPatients.SelectedValue;
         int doctor = Convert.ToInt32(DrpDoctorSelect.SelectedValue);

         string queryString = String.Format("?patient={0}&doctor={1}", patient, doctor);
         Response.Redirect(ResolveUrl("~/Admin/InPatientFinalise.aspx" + queryString));
      }
   }
}