using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;

namespace PE.COM.FSD.BusinessLogic.Core
{
    public class IndicadorBusinessLogic
    {
        private readonly IndicadorDataAccess _indicadorDataAccess;

        public IndicadorBusinessLogic()
        {
            _indicadorDataAccess = new IndicadorDataAccess();
        }

        public List<Indicador> listarPorIndicador()
        {
            return (_indicadorDataAccess.listarPorIndicador());
        }

        public void guardarIndicador(Indicador _indicador)
        {
            _indicadorDataAccess.guardarIndicador(_indicador);
        }

    }
}
