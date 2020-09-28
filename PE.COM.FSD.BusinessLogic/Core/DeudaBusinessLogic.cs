using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;

namespace PE.COM.FSD.BusinessLogic.Core
{
    public class DeudaBusinessLogic
    {
        private readonly DeudaDataAccess _deudaDataAccess;

        public DeudaBusinessLogic()
        {
            _deudaDataAccess = new DeudaDataAccess();

        }

        public List<Deuda> listarDeudasPorEntidad(int id)
        {
            return (_deudaDataAccess.listarDeudasEntidad(id));
        }

        public void guardarDeuda(Deuda _deuda)
        {
            _deudaDataAccess.guardarDeuda(_deuda);
        }

        public Deuda buscarDeudaPorId(int id)
        {
            return _deudaDataAccess.buscarDeudaPorId(id);
        }

        public void ActualizarDeuda(Deuda _deuda)
        {
            _deudaDataAccess.ActualizarDeuda(_deuda);
        }

        public void InactivarDeuda(Deuda _deuda)
        {
            _deudaDataAccess.InactivarDeuda(_deuda);
        }
    }
}
