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
        public List<Contacto> listarContactoPorEntidad(int id)
        {
            return (BaseService<Contacto>.QueryForList("select_contacto_porEntidad", id));
        }

        public void guardarContacto(Contacto _contacto)
        {
            Convert.ToInt32(MapperPro.Instance().Insert("insert_contacto", _contacto));
        }

        public Contacto buscarContactoPorId(int id)
        {
            return (BaseService<Contacto>.QueryForObject("select_contacto_id", id));
        }

        public void ActualizarContacto(Contacto _contacto)
        {
            MapperPro.Instance().Update("update_contacto", _contacto);
        }

        public void InactivarContacto(Contacto _contacto)
        {
            MapperPro.Instance().Update("inactive_contacto", _contacto);
        }
    }
}
