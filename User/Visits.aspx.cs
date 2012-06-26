using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Objects;

namespace Assignment2.User
{
   public partial class Visits : System.Web.UI.Page
   {
      public int VisitIdSelected {get; set;}

      protected void Page_Load(object sender, EventArgs e)
      {
         if (!Page.IsPostBack)
         {
            OutPatientsDataSource.SelectParameters.Add(
               new ControlParameter("fromDate", "PickerFromDate"));
            OutPatientsDataSource.SelectParameters.Add(
               new ControlParameter("toDate", "PickerToDate"));
            OutPatientsDataSource.SelectParameters.Add(
               new ControlParameter("name", "TxtName"));
            OutPatientsDataSource.SelectParameters.Add(
               new ControlParameter("dateColumn", "DropDownFilterCol"));
         }
      }

      protected void OutPatientsView_Bound(object sender, ListViewItemEventArgs e)
      {
         if (e.Item.ItemType == ListViewItemType.DataItem)
         {
            LinkButton lb = (LinkButton)e.Item.FindControl("DetailsLink");
            var actualItem = (GetOutPatients_Result) e.Item.DataItem;

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

            LoginView lv = (LoginView)e.Item.FindControl("LoginView1");
            LinkButton btnDischarge = (LinkButton)lv.FindControl("DischargeLink");
            if (btnDischarge != null)
            {
               btnDischarge.PostBackUrl = ResolveUrl("~/Admin/DischargeInPatient.aspx?id=" + actualItem.Id);
            }
         }
      }
   }
}