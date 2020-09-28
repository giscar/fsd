using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;

namespace PE.COM.FSD.BusinessLogic.Core
{
    public class OficinaBusinessLogic
    {
        private readonly OficinaDataAccess _oficinaDataAccess;

        public OficinaBusinessLogic()
        {
            _oficinaDataAccess = new OficinaDataAccess();

        }

        public List<Oficina> listarPorEntidad(int idEntidad)
        {
            return (_oficinaDataAccess.listarPorEntidad(idEntidad));
        }

        public void guardarOficina(Oficina _oficina)
        {
            _oficinaDataAccess.guardarOficina(_oficina);
        }

        public Oficina buscarOficinaForID(int id)
        {
            return _oficinaDataAccess.buscarOficinaForID(id);
        }

        public void ActualizarOficina(Oficina _oficina)
        {
            _oficinaDataAccess.ActualizarOficina(_oficina);
        }

        public void InactivarOficina(Oficina _oficina)
        {
            _oficinaDataAccess.InactivarOficina(_oficina);
        }
    }
}
