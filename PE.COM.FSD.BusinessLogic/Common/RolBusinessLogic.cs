using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.DataAccess.Common;

namespace PE.COM.FSD.BusinessLogic.Common
{
    public class RolBusinessLogic
    {
        private readonly RolDataAccess _rolDataAccess;

        public RolBusinessLogic()
        {
            _rolDataAccess = new RolDataAccess();
        }

        public List<Rol> ListarPorRol()
        {
            return (_rolDataAccess.ListarPorRol());
        }

        public Rol RolForId(int idRol)
        {
            return (_rolDataAccess.RolForId(idRol));
        }

        public int GuardarRol(Rol _rol)
        {
            return _rolDataAccess.GuardarRol(_rol);
        }

        public int ActualizarRol(Rol _rol)
        {
            return _rolDataAccess.ActualizarRol(_rol);
        }

        public void InactivarRol(Rol _rol)
        {
            _rolDataAccess.InactivarRol(_rol);
        }
    }
}
