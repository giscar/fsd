using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Mapper;

namespace PE.GOB.FSD.DataAccess.Common
{
    public class PerfilRolDataAccess
    {

        public int guardarPerfilRol(PerfilRol _perfilRol)
        {
            return (Convert.ToInt32(MapperPro.Instance().Insert("insert_perfilRol", _perfilRol)));
        }

    }
}
