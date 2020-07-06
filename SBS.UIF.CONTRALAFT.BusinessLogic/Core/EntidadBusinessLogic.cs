﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SBS.UIF.CONTRALAFT.Entity.Core;
using SBS.UIF.CONTRALAFT.DataAccess.Core;

namespace SBS.UIF.CONTRALAFT.BusinessLogic.Core
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

    }
}
