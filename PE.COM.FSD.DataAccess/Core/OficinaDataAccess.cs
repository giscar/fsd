using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Core
{
    public class OficinaDataAccess
    {
        public List<Oficina> listarPorEntidad(int idEntidad)
        {
            return (BaseService<Oficina>.QueryForList("select_oficina", idEntidad));
        }

        public void guardarOficina(Oficina _oficina)
        {
            Convert.ToInt32(MapperPro.Instance().Insert("insert_oficina", _oficina));
        }

        public Oficina buscarOficinaForID(int id)
        {
            return (BaseService<Oficina>.QueryForObject("select_oficina_id", id));
        }

        public void ActualizarOficina(Oficina _oficina)
        {
            MapperPro.Instance().Update("update_oficina", _oficina);
        }

        public void InactivarOficina(Oficina _oficina)
        {
            MapperPro.Instance().Update("inactive_oficina", _oficina);
        }
    }
}
