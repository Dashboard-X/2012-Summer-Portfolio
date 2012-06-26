using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment2.Credit
{
   public interface ICreditProvider
   {
      bool Prepare(string number, string address, int expiryMonth, int expiryYear);
      bool Transact(decimal amount);
   }
}