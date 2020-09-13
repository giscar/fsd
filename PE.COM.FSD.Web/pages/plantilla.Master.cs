using PE.COM.FSD.BusinessLogic.Common;
using System;
using System.Collections.Generic;
using System.Web;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.Entity.Core;

namespace PE.COM.FSD.Web
{
    public partial class plantilla : System.Web.UI.MasterPage
    {

        MenuBusinessLogic _menuBusinessLogic = new MenuBusinessLogic();

        List<Menu> listadoMenu;

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];
            listadoMenu = _menuBusinessLogic.listarPorMenu(usuarioSession.IdPerfil);
            cdcatalog.DataSource = listadoMenu;
            cdcatalog.DataBind();
        }
    }
}