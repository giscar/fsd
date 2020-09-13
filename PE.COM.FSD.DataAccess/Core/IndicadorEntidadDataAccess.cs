using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Core
{
    public class IndicadorEntidadDataAccess
    {
        public void guardarIndicadorEntidad(IndicadorEntidad _indicadorEntidad)
        {
           Convert.ToInt32(MapperPro.Instance().Insert("insert_indicadorEntidad", _indicadorEntidad));
        }
    }
}
