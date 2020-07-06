using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Mapper;

namespace PE.GOB.FSD.DataAccess.Common
{
    public class PerfilDataAccess
    {
        public List<Perfil> listarPorPerfil()
        {
            return (BaseService<Perfil>.QueryForList("select_perfil", null));
        }

        public int guardarPerfil(Perfil _perfil)
        {
            return (Convert.ToInt32(MapperPro.Instance().Insert("insert_perfil", _perfil)));
        }
    }
}
