using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Common;

namespace PE.GOB.FSD.BusinessLogic.Common
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
