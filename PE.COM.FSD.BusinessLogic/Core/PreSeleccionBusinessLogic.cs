using System;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;
using System.Collections.Generic;

namespace PE.COM.FSD.BusinessLogic.Core
{
    public class PreSeleccionBusinessLogic
    {
        private readonly PreSeleccionDataAccess _preSeleccionDataAccess;

        public PreSeleccionBusinessLogic()
        {
            _preSeleccionDataAccess = new PreSeleccionDataAccess();
        }

        public List<PreSeleccion> buscarPreSeleccion(PreSeleccion _preSeleccion)
        {
            return _preSeleccionDataAccess.buscarPreSeleccion(_preSeleccion);
        }
    }
}
