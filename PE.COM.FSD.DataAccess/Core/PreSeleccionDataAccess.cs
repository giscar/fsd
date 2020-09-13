using System;
using System.Collections.Generic;
using PE.COM.FSD.Entity.Core;

namespace PE.COM.FSD.DataAccess.Core
{
    public class PreSeleccionDataAccess
    {
        public List<PreSeleccion> buscarPreSeleccion(PreSeleccion _preSeleccion)
        {
            return (BaseService<PreSeleccion>.QueryForList("select_preseleccion", _preSeleccion));
        }
    }
}
