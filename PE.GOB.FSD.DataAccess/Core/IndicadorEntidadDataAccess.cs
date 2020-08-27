using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.DataAccess.Mapper;

namespace PE.GOB.FSD.DataAccess.Core
{
    public class IndicadorEntidadDataAccess
    {
        public void guardarIndicadorEntidad(IndicadorEntidad _indicadorEntidad)
        {
           Convert.ToInt32(MapperPro.Instance().Insert("insert_indicadorEntidad", _indicadorEntidad));
        }
    }
}
