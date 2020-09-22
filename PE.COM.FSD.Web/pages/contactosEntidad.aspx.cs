using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PE.COM.FSD.Web.comun;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.Web.util;
using PE.COM.FSD.BusinessLogic.Core;
using NLog;
using SBS.UIF.BUZ.Web.util;

namespace PE.COM.FSD.Web.pages
{
    public partial class contactosEntidad : PaginaBase
    {
        EntidadBusinessLogic entidadBusinessLogic = new EntidadBusinessLogic();
        ContactoBusinessLogic contactoBusinessLogic = new ContactoBusinessLogic();
        List<Contacto> listadoContactos;
        string idRequestEntidad = "";
        int nEntidad = 0;
        readonly Logger Log = LogManager.GetCurrentClassLogger();

        protected void Page_Load(object sender, EventArgs e)
        { if (!string.IsNullOrEmpty(Request.QueryString["id"]) == true)
            {
                // True.
                idRequestEntidad = Request.QueryString["id"];
            }
            else
            {
                Console.WriteLine("Hubo un error al obtener el codigo de la entidad");
            }
            if (!Page.IsPostBack)
            {

                try
                {
                    nEntidad = int.Parse(idRequestEntidad);
                    cargarLista(nEntidad);
                    cargarCombos();

                    cargaInformacionEntidad(nEntidad);
                }
                catch (Exception ex)
                {
                    //    // logger.ErrorException(ex.Message, ex);
                    //    //EventLog.WriteEntry("Application", "Ocurrió el error: " + ex.Message, EventLogEntryType.Error);

                }
            }
        }

        protected void cargaInformacionEntidad(int idEntidad)
        {
            Entidad entidad = new Entidad();
            entidad = entidadBusinessLogic.buscarEntidadForID(idEntidad);
            txtContactoEntidad.Value = entidad.DesTipo;
        }


        protected void cargarLista(int idEntidad)
        {

            listadoContactos = contactoBusinessLogic.listarContactoPorEntidad(idEntidad);
            GridViewContactos.DataSource = listadoContactos;
            GridViewContactos.DataBind();

        }

        protected void limpiar()
        {
            txtContactoNombres.Value = "";
            txtContactoApellidos.Value = "";
            txtContactoDNI.Value = "";
            txtContactoCelular.Value = "";
            txtContactoTelefonoFijo.Value = "";
        }

        private void cargarCombos()
        {
            LlenarDropDownList(ddlCargo, new ParametroValorBusinessLogic().buscarParametroValorForID(6).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);
        }

        private void cargarCombosEditar()
        {
            LlenarDropDownList(ddlEditarCargo, new ParametroValorBusinessLogic().buscarParametroValorForID(6).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);
        }

        protected void GridViewContactos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cargarLista(nEntidad);
            GridViewContactos.PageIndex = e.NewPageIndex;
            GridViewContactos.DataBind();
            if (GridViewContactos.Columns.Count > 0)
            {
                GridViewContactos.Columns[0].Visible = false;
            }
            this.GridViewContactos.Columns[0].Visible = false;
        }

        protected void gridContactos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ViewState["parametro"] = e.CommandArgument.ToString();
            try
            {
                if (e.CommandName == "editarContacto")
                {
                    cargarCombosEditar();
                    Contacto contactoActualizado = new Contacto();
                    contactoActualizado = contactoBusinessLogic.buscarContactoPorId(int.Parse(ViewState["parametro"].ToString()));
                    txtEditarContactoEntidad.Value = contactoActualizado.Entidad;
                    ddlEditarCargo.SelectedValue = contactoActualizado.IdCargo.ToString();
                    txtEditarContactoNombres.Value = contactoActualizado.Nombres;
                    txtEditarContactoApellidos.Value = contactoActualizado.Apellidos;
                    txtEditarContactoDNI.Value = contactoActualizado.DNI;
                    txtEditarContactoCelular.Value = contactoActualizado.Celular;
                    txtEditarContactoTelefonoFijo.Value = contactoActualizado.TelefonoFijo;
                    hdEditarEntidad.Value = contactoActualizado.IdTipo.ToString();
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$(document).ready(function() {$('#editarContactoModal').modal('show');});");
                    sb.Append(@"</script>");
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "editarContactoModal", sb.ToString(), false);
                }

                if (e.CommandName == "eliminarContacto")
                {
                    string[] arg = new string[2];
                    arg = e.CommandArgument.ToString().Split(';');
                    hdModificarEntidad.Value = arg[1];
                    hdInactivarContacto.Value = arg[0];
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$(document).ready(function() {$('#inactivacion').modal('show');});");
                    sb.Append(@"</script>");
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "inactivacion", sb.ToString(), false);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        protected void Submit_edit(object sender, EventArgs e)
        {
            try
            {
                Contacto _contacto = new Contacto
                {
                    Id = int.Parse(ViewState["parametro"].ToString()),
                    Nombres = txtEditarContactoNombres.Value,
                    Apellidos = txtEditarContactoApellidos.Value,
                    IdCargo = int.Parse(ddlEditarCargo.SelectedValue),
                    DNI = txtEditarContactoDNI.Value,
                    Celular = txtEditarContactoCelular.Value,
                    TelefonoFijo = txtEditarContactoTelefonoFijo.Value,
                    UsuarioModificacion = UsuarioSession().DetCodigo,
                    FecModificacion = DateTime.Now
                };
                contactoBusinessLogic.ActualizarContacto(_contacto);
                Limpiar();
                cargarLista(int.Parse(hdEditarEntidad.Value));
                ClientMessageBox.Show("Se modificó el perfil seleccionado", this);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }
        protected void Modal_nuevo_contacto(object sender, EventArgs e)
        {
            try
            {
                Limpiar();
                //divEntidad.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(document).ready(function() {$('#contactoModal').modal('show');});");
                sb.Append(@"</script>");
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "contactoModal", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }
        protected void Limpiar() { }


        protected void Submit_inactive(object sender, EventArgs e)
        {
            try
            {
                Contacto contacto = new Contacto
                {
                    Id = int.Parse(hdInactivarContacto.Value.ToString()),
                    UsuarioModificacion = UsuarioSession().DetCodigo,
                    FecModificacion = DateTime.Now,
                    Estado = (int)Constantes.EstadoFlag.INACTIVO
                };
                contactoBusinessLogic.InactivarContacto(contacto);
                Limpiar();
                cargarLista(int.Parse(hdModificarEntidad.Value));
                ClientMessageBox.Show("Se inactivo el perfil", this);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }


        protected void Submit_nuevo(Object sender, EventArgs e)
        {
            Usuario usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];

            try
            {
                Contacto contacto = new Contacto
                {
                    IdTipo = int.Parse(idRequestEntidad),
                    IdCargo = Convert.ToInt32(ddlCargo.SelectedValue),
                    Nombres = txtContactoNombres.Value,
                    Apellidos = txtContactoApellidos.Value,
                    DNI = txtContactoDNI.Value,
                    Celular = txtContactoCelular.Value,
                    TelefonoFijo = txtContactoTelefonoFijo.Value,
                    Estado = (int)Constantes.EstadoFlag.ACTIVO,
                    UsuarioCreacion = usuarioSession.DetCodigo,
                    FecCreacion = DateTime.Today
                };
                contactoBusinessLogic.guardarContacto(contacto);

                cargarLista(contacto.IdTipo);
                limpiar();
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

    }
}