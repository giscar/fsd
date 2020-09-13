using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Core
{
    public class IndicadorDataAccess
    {
        public List<Indicador> listarPorIndicador()
        {
            return (BaseService<Indicador>.QueryForList("select_indicador", null));
        }

        public void guardarIndicador(Indicador _indicador)
        {
           Convert.ToInt32(MapperPro.Instance().Insert("insert_indicador", _indicador));
        }
    }
}
