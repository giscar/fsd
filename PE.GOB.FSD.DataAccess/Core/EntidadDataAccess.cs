using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.DataAccess.Mapper;

namespace PE.GOB.FSD.DataAccess.Core
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

        public Entidad buscarEntidadForID(int id)
        {
            return (BaseService<Entidad>.QueryForObject("select_entidad_id", id));
        }

        public void ActualizarEntidad(Entidad _entidad)
        {
            MapperPro.Instance().Update("update_entidad", _entidad);
        }

    }
}
