using System;
using System.Collections.Generic;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Core
{
    public class ParametroDataAccess
    {
        public List<Parametro> buscarTodos()
        {
            return (BaseService<Parametro>.QueryForList("select_parametro_todos", null));
        }

        public void guardarParametro(Parametro _parametro)
        {
            Convert.ToInt32(MapperPro.Instance().Insert("insert_parametro", _parametro));
        }
    }
}
