using System.Web;

namespace Assignment2
{
   public static class ContextEntity
   {
      public static baxtech_clinicEntities Get()
      {
         if (HttpContext.Current != null && HttpContext.Current.Items["DataEntity"] == null)
         {
            var context = new baxtech_clinicEntities();
            context.CommandTimeout = 300;
            HttpContext.Current.Items["DataEntity"] = context;

         }

         return HttpContext.Current.Items["DataEntity"] as baxtech_clinicEntities;
      }
   }
}