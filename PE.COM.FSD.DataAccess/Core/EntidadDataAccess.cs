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
        public List<Entidad> ListarPorEntidad()
        {
            return (BaseService<Entidad>.QueryForList("select_entidad", null));
        }

        public void GuardarEntidad(Entidad _entidad)
        {
           Convert.ToInt32(MapperPro.Instance().Insert("insert_entidad", _entidad));
        }

        public Entidad BuscarEntidadForID(int id)
        {
            return (BaseService<Entidad>.QueryForObject("select_entidad_id", id));
        }

        public void ActualizarEntidad(Entidad _entidad)
        {
            MapperPro.Instance().Update("update_entidad", _entidad);
        }

    }
}
