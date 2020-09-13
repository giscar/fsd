using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Core
{
    public class EntidadDataAccess
    {
        public List<Entidad> listarPorEntidad()
        {
            return (BaseService<Entidad>.QueryForList("select_entidad", null));
        }

        public void guardarEntidad(Entidad _entidad)
        {
           Convert.ToInt32(MapperPro.Instance().Insert("insert_entidad", _entidad));
        }
    }
}
