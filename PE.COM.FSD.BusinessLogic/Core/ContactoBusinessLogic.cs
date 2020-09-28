using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;

namespace PE.COM.FSD.BusinessLogic.Core
{
    public class ContactoBusinessLogic
    {
        private readonly ContactoDataAccess _contactoDataAccess;

        public ContactoBusinessLogic()
        {
            _contactoDataAccess = new ContactoDataAccess();

        }

        public List<Contacto> listarContactoPorEntidad(int id)
        {
            return (_contactoDataAccess.listarContactoPorEntidad(id));
        }

        public void guardarContacto(Contacto _contacto)
        {
            _contactoDataAccess.guardarContacto(_contacto);
        }

        public Contacto buscarContactoPorId(int id)
        {
            return _contactoDataAccess.buscarContactoPorId(id);
        }

        public void ActualizarContacto(Contacto _contacto)
        {
            _contactoDataAccess.ActualizarContacto(_contacto);
        }

        public void InactivarContacto(Contacto _contacto)
        {
            _contactoDataAccess.InactivarContacto(_contacto);
        }

        public List<Contacto> ListarContacto()
        {
            return (_contactoDataAccess.ListarContacto());
        }
    }
}
