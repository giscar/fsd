using System;
using System.Collections.Generic;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Core
{
    public class ParametroValorDataAccess
    {
        public void guardarParametroValor(ParametroValor _parametroValor)
        {
            Convert.ToInt32(MapperPro.Instance().Insert("insert_parametro_valor", _parametroValor));
        }

        public void actualizarParametroValor(ParametroValor _parametroValor)
        {
            Convert.ToInt32(MapperPro.Instance().Update("update_parametro_valor", _parametroValor));
        }

        public List<ParametroValor> buscarTodos()
        {
            return (BaseService<ParametroValor>.QueryForList("select_parametrovalor_todos", null));
        }

        public List<ParametroValor> buscarParametroValorForID(int idParametro)
        {
            return (BaseService<ParametroValor>.QueryForList("select_parametrovalor_idparametro", idParametro));
        }

        public ParametroValor buscarParametroValorForIDValor(int idParametroValor)
        {
            return (BaseService<ParametroValor>.QueryForObject("select_parametrovalor_idparametrovalor", idParametroValor));
        }
    }
}
