using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment2
{
   public partial class General : System.Web.UI.MasterPage
   {
      protected void Page_Load(object sender, EventArgs e)
      {
         Page.Header.DataBind();
      }

      public void ErrorMessage(string text)
      {
         PageContent.Visible = false;
         ErrorDescription.Visible = true;
         ErrorDescription.InnerText = text;
      }
   }
}