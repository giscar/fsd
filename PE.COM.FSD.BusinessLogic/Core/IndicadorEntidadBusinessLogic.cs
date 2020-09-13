using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Core;

namespace PE.COM.FSD.BusinessLogic.Core
{
    public class IndicadorEntidadBusinessLogic
    {
        private readonly IndicadorEntidadDataAccess _indicadorEntidadDataAccess;

        public IndicadorEntidadBusinessLogic()
        {
            _indicadorEntidadDataAccess = new IndicadorEntidadDataAccess();
        }

        public void guardarIndicadorEntidad(IndicadorEntidad _indicadorEntidad)
        {
            _indicadorEntidadDataAccess.guardarIndicadorEntidad(_indicadorEntidad);
        }

    }
}
