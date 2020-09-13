﻿using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.DataAccess.Common;
using System.Collections.Generic;

namespace PE.COM.FSD.BusinessLogic.Common
{
    public class PerfilRolBusinessLogic
    {
        private readonly PerfilRolDataAccess _perfilRolDataAccess;

        public PerfilRolBusinessLogic()
        {
            _perfilRolDataAccess = new PerfilRolDataAccess();
        
        }


        public void guardarPerfilRol(PerfilRol _perfilRol)
        {
            _perfilRolDataAccess.GuardarPerfilRol(_perfilRol);
        }

        public void GuardarActualizarPerfilRol(PerfilRol _perfilRol)
        {
            List<PerfilRol> lista = _perfilRolDataAccess.ValidarPerfilRol(_perfilRol);
            if (lista.Count > 0)
            {
                foreach (PerfilRol item in lista)
                {
                    if (_perfilRol.CodPerfil == item.CodPerfil)
                    {
                        _perfilRolDataAccess.ActualizarPerfilRol(_perfilRol);
                    }
                }
            }
            else {
                _perfilRolDataAccess.GuardarPerfilRol(_perfilRol);
            }
        }
    }
}
