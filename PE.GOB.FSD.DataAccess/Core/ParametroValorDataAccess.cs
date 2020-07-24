using System;
using System.Collections.Generic;
using PE.GOB.FSD.Entity.Core;

namespace PE.GOB.FSD.DataAccess.Core
{
    public class ParametroValorDataAccess
    {
        public List<ParametroValor> buscarTodos()
        {
            return (BaseService<ParametroValor>.QueryForList("select_parametrovalor_todos", null));
        }

        public List<ParametroValor> buscarParametroValorForID(int idParametro)
        {
            return (BaseService<ParametroValor>.QueryForList("select_parametrovalor_idparametro", idParametro));
        }
    }
}
