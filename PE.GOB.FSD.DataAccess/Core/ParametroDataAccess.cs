using System;
using System.Collections.Generic;
using PE.GOB.FSD.Entity.Core;

namespace PE.GOB.FSD.DataAccess.Core
{
    public class ParametroDataAccess
    {
        public List<Parametro> buscarTodos()
        {
            return (BaseService<Parametro>.QueryForList("select_parametro_todos", null));
        }
    }
}
