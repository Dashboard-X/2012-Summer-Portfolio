using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Assignment2
{
   public partial class Home : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {
         SqlCommand cmd = new SqlCommand("select blah from blah");
         cmd.CommandType = CommandType.StoredProcedure;
         SqlDataReader reader = cmd.ExecuteReader();
      }
   }
}