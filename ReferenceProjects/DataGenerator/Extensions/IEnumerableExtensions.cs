namespace DataGenerator.Extensions
{
    using System;
    using System.Collections.Generic;

    public static class IEnumerableExtensions
    {
        public static T RandomItem<T>(this List<T> list, Random rg)
        {
            if (list == null)
            {
                throw new ArgumentNullException("list");
            }

            if (rg == null)
            {
                throw new ArgumentNullException("rg");
            }

            int index = rg.Next(list.Count);
            return list[index];
        }
    }
}
