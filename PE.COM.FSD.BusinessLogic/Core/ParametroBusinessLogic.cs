using System;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;
using System.Collections.Generic;

namespace PE.COM.FSD.BusinessLogic.Core
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
