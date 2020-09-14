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

        public List<Contacto> listarPorContacto()
        {
            return (_contactoDataAccess.listarPorEntidad());
        }

        public void guardarContacto(Contacto _contacto)
        {
            _contactoDataAccess.guardarContacto(_contacto);
        }

        public Contacto buscarContactoForID(int id)
        {
            return _contactoDataAccess.buscarContactoForID(id);
        }

        public void ActualizarContacto(Contacto _contacto)
        {
            _contactoDataAccess.ActualizarContacto(_contacto);
        }
    }
}
