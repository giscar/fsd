using System;
using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.DataAccess.Core;
using System.Collections.Generic;

namespace PE.GOB.FSD.BusinessLogic.Core
{
    public class ParametroValorBusinessLogic
    {
        private readonly ParametroValorDataAccess _parametroValorDataAccess;

        public ParametroValorBusinessLogic()
        {
            _parametroValorDataAccess = new ParametroValorDataAccess();
        }

        public List<ParametroValor> buscarTodos()
        {
            return _parametroValorDataAccess.buscarTodos();
        }

        public List<ParametroValor> buscarParametroValorForID(int idParametro)
        {
            return _parametroValorDataAccess.buscarParametroValorForID(idParametro);
        }
    }
}
