using System.Collections.Generic;
using System.Linq;
using System.Collections;

namespace PE.COM.FSD.DataAccess.Mapper
{
   public class CastType<T>
    {
       public static T CastValue(object Objeto)
       {          
           return (T)Objeto;
       }

       public static List<T> CastList(IList ilst)
       {
           return new List<T>(ilst.Cast<T>());
       }
    }
}
