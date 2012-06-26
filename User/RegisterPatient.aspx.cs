using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Assignment2.User
{
   public partial class RegisterPatient : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {

      }

      protected void BtnSubmit_Click(object sender, EventArgs e)
      {
          if (!Page.IsValid) return;

          var context = ContextEntity.Get();

          context.AddPatient(TxtName.Text,
               TxtAddress.Text,
               Convert.ToDateTime(TxtBirth.Text, CultureInfo.InvariantCulture),
               TxtPhone.Text,
               TxtEmergencyName.Text + " " + TxtEmergencyPhone.Text);

         Response.Redirect("Visits.aspx");
      }
   }
}