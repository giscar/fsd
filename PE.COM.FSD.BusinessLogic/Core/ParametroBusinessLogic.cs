using System;
using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.DataAccess.Core;
using System.Collections.Generic;

namespace PE.GOB.FSD.BusinessLogic.Core
{
    public class ParametroBusinessLogic
    {
        private readonly ParametroDataAccess _parametroDataAccess;

        public ParametroBusinessLogic()
        {
            _parametroDataAccess = new ParametroDataAccess();
        }

        public List<Parametro> buscarTodos()
        {
            return _parametroDataAccess.buscarTodos();
        }

        public void guardarParametro(Parametro _parametro)
        {
            _parametroDataAccess.guardarParametro(_parametro);
        }
    }
}
