using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Mapper;

namespace PE.GOB.FSD.DataAccess.Common
{
    public class UbigeoDataAccess
    {
        public List<Ubigeo> listarPorDepartamento()
        {
            return (BaseService<Ubigeo>.QueryForList("select_departamento",null));
        }

        public List<Ubigeo> listarProvincias(Ubigeo _ubigeo)
        {
            return (BaseService<Ubigeo>.QueryForList("select_provincia", _ubigeo));
        }

        public List<Ubigeo> listarDistritos(Ubigeo _ubigeo)
        {
            return (BaseService<Ubigeo>.QueryForList("select_distrito", _ubigeo));
        }

    }
}
