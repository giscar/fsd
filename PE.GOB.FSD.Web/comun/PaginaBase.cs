using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PE.GOB.FSD.Entity.Core;

namespace PE.GOB.FSD.Web.comun {

    public class PaginaBase : Page
    {
        public Usuario usuarioSession = null;

        public void LlenarDropDownList(DropDownList Combo, object Lista, string ValorRegistroVacio, string TextoRegistroVacio) {
            Combo.Items.Clear();
            Combo.DataSource = Lista;
            Combo.DataBind();
            if (ValorRegistroVacio != "") {
                Combo.Items.Insert(0, new ListItem(TextoRegistroVacio, ValorRegistroVacio));
            }
        }

        public void LlenarCheckList(CheckBoxList Combo, object Lista, string ValorRegistroVacio, string TextoRegistroVacio)
        {
            Combo.Items.Clear();
            Combo.DataSource = Lista;
            Combo.DataBind();
            if (ValorRegistroVacio != "")
            {
                Combo.Items.Insert(0, new ListItem(TextoRegistroVacio, ValorRegistroVacio));
            }
        }

        public void GetUsuarioSession() {
            usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];
            if (usuarioSession == null)
            {
                Response.Redirect("../pages/login.aspx");
            }
        }
    }
}