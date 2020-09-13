using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;

namespace PE.COM.FSD.BusinessLogic.Core
{
    public class AccionBusinessLogic
    {
        private readonly AccionDataAccess _accionDataAccess;

        public AccionBusinessLogic()
        {
            _accionDataAccess = new AccionDataAccess();
        }

        public List<Accion> listarPorAccion()
        {
            return (_accionDataAccess.listarPorAccion());
        }

        public void guardarAccion(Accion _accion)
        {
            _accionDataAccess.guardarAccion(_accion);
        }

    }
}
