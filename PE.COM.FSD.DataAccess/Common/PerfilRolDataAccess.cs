using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Common
{
    public class PerfilRolDataAccess
    {

        public int GuardarPerfilRol(PerfilRol _perfilRol)
        {
            return (Convert.ToInt32(MapperPro.Instance().Insert("insert_perfilRol", _perfilRol)));
        }

        public List<PerfilRol> ValidarPerfilRol(PerfilRol _perfilRol)
        {
            return (BaseService<PerfilRol>.QueryForList("list_perfil_rol_all", _perfilRol));   
        }

        public void ActualizarPerfilRol(PerfilRol _perfilRol)
        {
            MapperPro.Instance().Update("update_perfil_rol", _perfilRol);
        }
        
    }
}
