using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment2.Credit
{
   /**
    * Acts as a dummy class - The preparation step would store the details, check that the
    * payment gateway is currently active etc. The transact step would carry out the transaction.
    */
   public class LocalProvider : ICreditProvider
   {
      bool ICreditProvider.Prepare(string number, string address, int expiryMonth, int expiryYear)
      {
         return true;
      }

      bool ICreditProvider.Transact(decimal amount)
      {
         return true;
      }
   }
}