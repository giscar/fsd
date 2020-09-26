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

        public List<Entidad> ListarPorEntidad()
        {
            return (_entidadDataAccess.ListarPorEntidad());
        }

        public void GuardarEntidad(Entidad _entidad)
        {
            _entidadDataAccess.GuardarEntidad(_entidad);
        }

        public Entidad BuscarEntidadForID(int id)
        {
            return _entidadDataAccess.BuscarEntidadForID(id);
        }

        public void ActualizarEntidad(Entidad _entidad)
        {
            _entidadDataAccess.ActualizarEntidad(_entidad);
        }

        public Entidad EntidadForID(int _idEntidad)
        {
            return (_entidadDataAccess.BuscarEntidadForID(_idEntidad));
        }

    }
}
