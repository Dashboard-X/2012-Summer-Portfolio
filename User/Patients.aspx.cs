using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2.User
{
   public class PatientsDAL
   {
      public IEnumerable<GetPatients_Result> getPatients(string name)
      {
         var context = ContextEntity.Get();

         var filteredPatients = context.GetPatients();
         if (name != null)
            return filteredPatients.Where(p =>p.Name.IndexOf(name, StringComparison.OrdinalIgnoreCase) >= 0).ToList();
         else
            return context.GetPatients().ToList();
      }
   }

   public partial class Patients : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {
      }

      protected void BtnSearchName_Click(object sender, EventArgs e)
      {
      }
   }
}