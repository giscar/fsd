using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Common;

namespace PE.GOB.FSD.BusinessLogic.Common
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
