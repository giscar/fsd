using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.DataAccess.Core;

namespace PE.GOB.FSD.BusinessLogic.Core
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
