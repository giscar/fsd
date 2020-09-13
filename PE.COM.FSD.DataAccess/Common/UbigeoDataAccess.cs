using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Common
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
