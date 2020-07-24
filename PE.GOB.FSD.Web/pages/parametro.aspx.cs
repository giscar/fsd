using System;
using System.Web;
using System.Web.UI;
using PE.GOB.FSD.Web.comun;
using PE.GOB.FSD.Util;
using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.BusinessLogic.Core;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace PE.GOB.FSD.Web.pages
{

    public partial class parametro : PaginaBase
    {
        ParametroBusinessLogic parametroBusinessLogic = new ParametroBusinessLogic();
        ParametroValorBusinessLogic parametroValorBusinessLogic = new ParametroValorBusinessLogic();
        List<Parametro> parametros;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];
                    var usuario = HttpContext.Current.Session["Usuario"];
                    if (usuario == null)
                    {
                        Response.Redirect("../login/login.aspx");
                    }
                    //parametros = parametroBusinessLogic.buscarTodos();
                    cargarCombos();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Application", "Ocurrió el error: " + ex.Message);
                    //logger.ErrorException(ex.Message, ex);
                    //EventLog.WriteEntry("Application", "Ocurrió el error: " + ex.Message, EventLogEntryType.Error);
                }
            }

        }

        private void cargarCombos()
        {
            LlenarDropDownList(ddlCodigoParametro, parametroBusinessLogic.buscarTodos(), "0", Constante.MensajeComboRegistro);
        }

        protected void Submit_buscar(object sender, EventArgs e)
        {
            int codigoParametro = int.Parse(ddlCodigoParametro.SelectedValue);
            List<ParametroValor> parametrosValores = parametroValorBusinessLogic.buscarParametroValorForID(codigoParametro);
            GridView1.DataSource = parametrosValores;
            GridView1.DataBind();
            Limpiar();
            AlertDanger("Se realizaron los cambios");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarLista();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        private void CargarLista()
        {
            int codigoParametro = int.Parse(ddlCodigoParametro.SelectedValue);
            List<ParametroValor> parametrosValores = parametroValorBusinessLogic.buscarParametroValorForID(codigoParametro);
            GridView1.DataSource = parametrosValores;
            GridView1.DataBind();
        }

        private void Limpiar()
        {

        }

        protected void AlertDanger(string pmessage)
        {

        }
    }

}
