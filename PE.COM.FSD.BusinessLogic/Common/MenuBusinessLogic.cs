using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.DataAccess.Common;

namespace PE.COM.FSD.BusinessLogic.Common
{
    public class MenuBusinessLogic
    {
        private readonly MenuDataAccess _menuDataAccess;

        public MenuBusinessLogic()
        {
            _menuDataAccess = new MenuDataAccess();
        
        }

        public List<Menu> listarPorMenu(int id)
        {
            return (_menuDataAccess.listarPorMenu(id));
        }

    }
}
