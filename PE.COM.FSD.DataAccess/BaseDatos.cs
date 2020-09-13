using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess
{
    public class BaseService<T>
    {
        public static List<T> QueryForList(string nombreMetodo, object map, string mapper = "")
        {
            var listaProject = MapperPro.Instance().QueryForList(nombreMetodo, map);
            return CastType<T>.CastList(listaProject);
        }

        public static T QueryForObject(string nombreMetodo, object map, string mapper = "")
        {
            var listaProject = MapperPro.Instance().QueryForObject(nombreMetodo, map);
            return CastType<T>.CastValue(listaProject);
        }
    }
}