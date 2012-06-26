using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment2.Credit
{
   public class Provider
   {
      public static ICreditProvider Get()
      {
         return new LocalProvider();
      }
   }
}