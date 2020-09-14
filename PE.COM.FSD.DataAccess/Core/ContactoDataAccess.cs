using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Core
{
    public class ContactoDataAccess
    {
        public List<Contacto> listarPorEntidad()
        {
            return (BaseService<Contacto>.QueryForList("select_contacto", null));
        }

        public void guardarContacto(Contacto _contacto)
        {
            Convert.ToInt32(MapperPro.Instance().Insert("insert_contacto", _contacto));
        }

        public Contacto buscarContactoForID(int id)
        {
            return (BaseService<Contacto>.QueryForObject("select_contacto_id", id));
        }

        public void ActualizarContacto(Contacto _contacto)
        {
            MapperPro.Instance().Update("update_contacto", _contacto);
        }

    }
}
