using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;

namespace PE.COM.FSD.BusinessLogic.Core
{
    public class EntidadBusinessLogic
    {
        private readonly EntidadDataAccess _entidadDataAccess;

        public EntidadBusinessLogic()
        {
            _entidadDataAccess = new EntidadDataAccess();
        
        }

        public List<Entidad> listarPorEntidad()
        {
            return (_entidadDataAccess.listarPorEntidad());
        }

        public void guardarEntidad(Entidad _entidad)
        {
            _entidadDataAccess.guardarEntidad(_entidad);
        }

        public Entidad buscarEntidadForID(int id)
        {
            return _entidadDataAccess.buscarEntidadForID(id);
        }

        public void ActualizarEntidad(Entidad _entidad)
        {
            _entidadDataAccess.ActualizarEntidad(_entidad);
        }

    }
}
