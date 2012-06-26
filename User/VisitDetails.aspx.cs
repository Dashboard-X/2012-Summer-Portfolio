using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2.User
{
   public partial class VisitDetails : System.Web.UI.Page
   {
      private int _requestId = 0;

      protected void Page_Load(object sender, EventArgs e)
      {
         string reqId = Request.QueryString["id"];
            if (reqId == null) return;
            try
            {
               _requestId = Convert.ToInt32(reqId);
            }
            catch (FormatException)
            {
               return;
            }

         if (!Page.IsPostBack)
         {
            var context = ContextEntity.Get();

            var details = context.VisitDetailsForVisit(_requestId).ToList();
            if (details.Count == 0 && context.FindVisit(_requestId).First() == 1)
            {
               BtnCreateTreatment.Visible = true;
            }
            else if (details.Count == 0)
            {
               Master.ErrorMessage("No visit exists with that ID");
            }
            else
            {
               PnlNoVisitFound.Visible = false;
               PnlFoundTreatment.Visible = true;

               TxtSymptoms.Text = details.First().Symptoms;
               TxtDiagnosis.Text = details.First().Disease;
               TxtTreatment.Text = details.First().Treatment;
            }
         }
      }

      protected void BtnCreateTreatment_Click(object sender, EventArgs e)
      {
         PnlNoVisitFound.Visible = false;
         PnlFoundTreatment.Visible = true;
      }

      protected void BtnSubmit_Click(object sender, EventArgs e)
      {
         var context = ContextEntity.Get();

         context.RecordVisitDetails(_requestId,
            TxtSymptoms.Text, TxtDiagnosis.Text, TxtTreatment.Text);

         Response.Redirect(ResolveUrl("~/User/Visits.aspx"));
      }
   }
}