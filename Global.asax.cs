using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Assignment2
{
   public class Global : System.Web.HttpApplication
   {

      protected void Application_Start(object sender, EventArgs e)
      {
         if (Roles.GetAllRoles().Length == 0)
         {
            Roles.CreateRole("Clerk");
            Roles.CreateRole("Admin");
            Roles.CreateRole("SuperAdmin");

            Membership.CreateUser("clerk", "clerk", null);
            Membership.CreateUser("admin", "admin", null);
            Membership.CreateUser("superadmin", "superadmin", null);

            Roles.AddUsersToRole(new string[] { "clerk", "admin" }, "Clerk");
            Roles.AddUserToRole("admin", "Admin");
            Roles.AddUserToRole("superadmin", "SuperAdmin");
         }
      }

      protected void Session_Start(object sender, EventArgs e)
      {
         
      }

      protected void Application_BeginRequest(object sender, EventArgs e)
      {
      
      }

      protected void Application_AuthenticateRequest(object sender, EventArgs e)
      {

      }

      protected void Application_Error(object sender, EventArgs e)
      {

      }

      protected void Session_End(object sender, EventArgs e)
      {

      }

      protected void Application_End(object sender, EventArgs e)
      {

      }
   }
}