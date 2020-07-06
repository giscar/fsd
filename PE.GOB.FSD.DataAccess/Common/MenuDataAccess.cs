using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Mapper;

namespace PE.GOB.FSD.DataAccess.Common
{
    public class MenuDataAccess
    {
        public List<Menu> listarPorMenu(int id)
        {
            return (BaseService<Menu>.QueryForList("select_menu", id));
        }
    }
}
