using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Common;

namespace PE.GOB.FSD.BusinessLogic.Common
{
    public class RolBusinessLogic
    {
        private readonly RolDataAccess _rolDataAccess;

        public RolBusinessLogic()
        {
            _rolDataAccess = new RolDataAccess();
        
        }

        public List<Rol> listarPorRol()
        {
            return (_rolDataAccess.listarPorRol());
        }

        public int guardarRol(Rol _rol)
        {
            return _rolDataAccess.guardarRol(_rol);
        }
    }
}
