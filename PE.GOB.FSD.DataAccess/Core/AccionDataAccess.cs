using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.DataAccess.Mapper;

namespace PE.GOB.FSD.DataAccess.Core
{
    public class AccionDataAccess
    {
        public List<Accion> listarPorAccion()
        {
            return (BaseService<Accion>.QueryForList("select_accion", null));
        }

        public void guardarAccion(Accion _accion)
        {
           Convert.ToInt32(MapperPro.Instance().Insert("insert_accion", _accion));
        }
    }
}
