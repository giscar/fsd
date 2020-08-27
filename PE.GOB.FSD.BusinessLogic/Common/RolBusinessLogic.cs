﻿using System;
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

        public List<Rol> ListarPorRol()
        {
            return (_rolDataAccess.ListarPorRol());
        }

        public int GuardarRol(Rol _rol)
        {
            return _rolDataAccess.GuardarRol(_rol);
        }

        public void ActualizarRol(Rol _rol)
        {
            _rolDataAccess.ActualizarRol(_rol);
        }

        public void InactivarRol(Rol _rol)
        {
            _rolDataAccess.InactivarRol(_rol);
        }
    }
}
