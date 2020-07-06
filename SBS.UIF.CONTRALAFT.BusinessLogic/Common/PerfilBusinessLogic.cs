﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SBS.UIF.CONTRALAFT.Entity.Common;
using SBS.UIF.CONTRALAFT.DataAccess.Common;

namespace SBS.UIF.CONTRALAFT.BusinessLogic.Common
{
    public class PerfilBusinessLogic
    {
        private readonly PerfilDataAccess _perfilDataAccess;

        public PerfilBusinessLogic()
        {
            _perfilDataAccess = new PerfilDataAccess();
        
        }

        public List<Perfil> listarPorPerfil()
        {
            return (_perfilDataAccess.listarPorPerfil());
        }

        public void guardarPerfil(Perfil _perfil)
        {
            _perfilDataAccess.guardarPerfil(_perfil);
        }

    }
}
