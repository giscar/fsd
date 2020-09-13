using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using PE.COM.FSD.Web.comun;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.BusinessLogic.Core;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using PE.COM.FSD.Web.util;

namespace PE.COM.FSD.Web.pages
{
    public partial class parametro : PaginaBase
    {
        ParametroBusinessLogic parametroBusinessLogic = new ParametroBusinessLogic();
        ParametroValorBusinessLogic parametroValorBusinessLogic = new ParametroValorBusinessLogic();
        int codigoParametro;
        public static int codigoParametroValor;
        String nombreParametro;

        protected void Page_Load(object sender, EventArgs e)
        {
            //UsuarioSession();
            if (!Page.IsPostBack)
            {
                try
                {
                    if (UsuarioSession() == null)
                    {
                        Response.Redirect("../pages/login.aspx");
                    }
                    Limpiar();
                    cargarCombos();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Application", "Ocurrió el error: " + ex.Message);
                }
            }

        }

        private void cargarCombos()
        {
            LlenarDropDownList(ddlCodigoParametro, new ParametroBusinessLogic().buscarTodos().OrderBy(x => x.Nombre), "0", Constantes.selectLabelDefault);
        }

        protected void Submit_limpiar(object sender, EventArgs e)
        {
            Limpiar();
            cargarCombos();
        }

        protected void ddlCodigoParametro_Change(object sender, EventArgs e)
        {
            Limpiar();
            codigoParametro = int.Parse(ddlCodigoParametro.SelectedValue);
            nombreParametro = ddlCodigoParametro.SelectedItem.Text;
            lblModalTitleValor.Text = "Nuevo Parametro Valor";
            btnRegistrarParametroValor.Text = "Registrar";
            btnRegistrarParametroValor.CommandName = "Nuevo";
            if (codigoParametro > 0)
            {
                btnParametroValor.Visible = true;
                txtNombreParametro.Value = nombreParametro;
            }
            else
            {
                btnParametroValor.Visible = false;
            }
        }

        protected void Submit_buscar(object sender, EventArgs e)
        {
            codigoParametro = int.Parse(ddlCodigoParametro.SelectedValue);
            CargarLista();
        }


        private void CargarLista()
        {
            List<ParametroValor> parametrosValores = parametroValorBusinessLogic.buscarParametroValorForID(codigoParametro);
            GridView1.DataSource = parametrosValores;
            GridView1.DataBind();
        }

        protected void Submit_nuevo_parametro(object sender, EventArgs e)
        {
            Parametro parametro = new Parametro
            {
                Nombre = txtNombre.Value,
                Descripcion = txtDescripcion.Value,
                Estado = (int)Constantes.EstadoFlag.ACTIVO,
                UsuarioCreacion = UsuarioSession().DetCodigo,
                FechaCreacion = DateTime.Today
            };
            parametroBusinessLogic.guardarParametro(parametro);
            Limpiar();
            cargarCombos();
            AlertDanger("Se realizaron los cambios");
        }

        protected void Submit_registrar_parametro_valor(object sender, EventArgs e)
        {
            string accion = btnRegistrarParametroValor.CommandName;
            codigoParametro = int.Parse(ddlCodigoParametro.SelectedValue);
            if (accion == "Nuevo")
            {
                ParametroValor parametroValor = new ParametroValor
                {
                    IdParametro = codigoParametro,
                    Nombre = txtNombreValor.Value,
                    Descripcion = txtDescripcionValor.Value,
                    Valor = txtValor.Value,
                    Estado = (int)Constantes.EstadoFlag.ACTIVO,
                    UsuarioCreacion = UsuarioSession().DetCodigo,
                    FechaCreacion = DateTime.Today
                };
                parametroValorBusinessLogic.guardarParametroValor(parametroValor);

            }
            if (accion == "Editar")
            {
                ParametroValor parametroValor = new ParametroValor
                {
                    IdParametroValor = codigoParametroValor,
                    IdParametro = codigoParametro,
                    Nombre = txtNombreValor.Value,
                    Descripcion = txtDescripcionValor.Value,
                    Valor = txtValor.Value,
                    Estado = (int)Constantes.EstadoFlag.ACTIVO,
                    UsuarioModificacion = UsuarioSession().DetCodigo,
                    FechaModificacion = DateTime.Today
                };
                parametroValorBusinessLogic.actualizarParametroValor(parametroValor);
            }

            Limpiar();
            Submit_cerrar_parametro_valor(sender, e);
            ddlCodigoParametro_Change(sender, e);
            Submit_buscar(sender, e);
            btnParametroValor.Visible = true;
            AlertDanger("Se realizaron los cambios");
            ScriptManager.RegisterStartupScript(this, GetType(), "refresh", "window.location.reload();", true);
            //PARA REFRESCAR CON TIEMPO
            //ScriptManager.RegisterStartupScript(this, GetType(), "refresh", "window.setTimeout('window.location.reload(true);',2000);", true);
        }

        protected void Submit_cerrar_parametro_valor(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script>$(function() { $('#parametroValorModal').modal('toggle'); });</script>");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "parametroValorModal", sb.ToString(), false);

            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "toggleModal", "<script type='text/javascript'>toggleModal();</script>", false);
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "<script type='text/javascript'>helloFromCodeBehind();</script>", false);
            LimpiarPopUpParametroValor();
        }

        private void Limpiar()
        {
            txtNombre.Value = "";
            txtDescripcion.Value = "";
            GridView1.DataSource = null;
            GridView1.DataBind();
            btnParametroValor.Visible = false;

            LimpiarPopUpParametroValor();
        }

        private void LimpiarPopUpParametroValor()
        {
            txtNombreValor.Value = "";
            txtDescripcionValor.Value = "";
            txtValor.Value = "";
        }

        protected void GridView1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int idParametroValor = Int32.Parse(e.CommandArgument.ToString());
                Console.WriteLine(idParametroValor);
                ParametroValor parametroValor = parametroValorBusinessLogic.buscarParametroValorForIDValor(idParametroValor);
                codigoParametroValor = parametroValor.IdParametroValor;
                txtNombreValor.Value = parametroValor.Nombre;
                txtDescripcionValor.Value = parametroValor.Descripcion;
                txtValor.Value = parametroValor.Valor;

                btnRegistrarParametroValor.CommandName = "Editar";
                lblModalTitleValor.Text = "Editar Parametro Valor";
                btnRegistrarParametroValor.Text = "Guardar cambios";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script>$(function() { $('#parametroValorModal').modal('toggle'); });</script>");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "parametroValorModal", sb.ToString(), false);
                upModal.Update();
                /*
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script language='javascript'>");
                sb.Append(@"function toggleModal() { $('#parametroValorModal').modal('toggle'); }");
                sb.Append(@"</script>");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "toggleModal", sb.ToString(), false);
                */
                /* ASI TAMBIEN FUNCIONA
                string str = "<script>alert(\"ok\");</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
                */
            }
        }

        protected void AlertDanger(string pmessage)
        {
            idModalInfoServer.Visible = true;
            lblMensajeOk.Text = pmessage;
        }
    }
}
