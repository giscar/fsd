using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Common
{
    public class MenuDataAccess
    {
        public List<Menu> listarPorMenu(int id)
        {
            return (BaseService<Menu>.QueryForList("select_menu", id));
        }
    }
}
