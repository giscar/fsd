using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Core
{
    public class DeudaDataAccess
    {

        public List<Deuda> listarDeudasEntidad(int id)
        {
            return (BaseService<Deuda>.QueryForList("select_deuda_porEntidad", id));
        }

        public void guardarDeuda(Deuda _deuda)
        {
            Convert.ToInt32(MapperPro.Instance().Insert("insert_deuda", _deuda));
        }

        public Deuda buscarDeudaPorId(int id)
        {
            return (BaseService<Deuda>.QueryForObject("select_deuda_id", id));
        }

        public void ActualizarDeuda(Deuda _deuda)
        {
            MapperPro.Instance().Update("update_deuda", _deuda);
        }

        public void InactivarDeuda(Deuda _deuda)
        {
            MapperPro.Instance().Update("inactive_deuda", _deuda);
        }


    }
}
