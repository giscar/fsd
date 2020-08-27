
using System.Collections.Generic;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Common;

namespace PE.GOB.FSD.BusinessLogic.Common
{
    public class UbigeoBusinessLogic
    {
        private readonly UbigeoDataAccess _ubigeoDataAccess;

        public UbigeoBusinessLogic()
        {
            _ubigeoDataAccess = new UbigeoDataAccess();

        }


        public List<Ubigeo> listarDepartamento()
        {
            return (_ubigeoDataAccess.listarPorDepartamento());
        }

        public List<Ubigeo> listarProvincia(Ubigeo _ubigeo)
        {
            return (_ubigeoDataAccess.listarProvincias(_ubigeo));
        }

        public List<Ubigeo> listarDistrito(Ubigeo _ubigeo)
        {
            return (_ubigeoDataAccess.listarDistritos(_ubigeo));
        }

    }
}
