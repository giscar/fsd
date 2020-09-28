using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PE.COM.FSD.Web.comun;
using PE.COM.FSD.Entity.Core;
using PE.COM.FSD.Web.util;
using PE.COM.FSD.BusinessLogic.Core;
using NLog;
//using SBS.UIF.BUZ.Web.util;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.BusinessLogic.Common;

namespace PE.COM.FSD.Web.pages
{
    public partial class OficinasEntidad : PaginaBase
    {
        EntidadBusinessLogic entidadBusinessLogic = new EntidadBusinessLogic();
        OficinaBusinessLogic oficinaBusinessLogic = new OficinaBusinessLogic();
        List<Oficina> listadoOficinas;

        string idRequestEntidad = "";
        int nEntidad = 0;
        readonly Logger Log = LogManager.GetCurrentClassLogger();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]) == true)
            {
                idRequestEntidad = Request.QueryString["id"];
                ViewState["viewEntidad"] = idRequestEntidad;

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
                    cargarLista();
                    cargarCombos();
                    cargaInformacionEntidad(nEntidad);
                }
                catch (Exception ex)
                {
                    Log.Error(ex);
                }
            }
        }

        protected void cargaInformacionEntidad(int idEntidad)
        {
            Entidad entidad = new Entidad();
            entidad = entidadBusinessLogic.buscarEntidadForID(idEntidad);
            this.txtOficinasEntidadFinanciera.Value = entidad.DesTipo;
            this.txtEditarOficinasEntidad.Value = entidad.DesTipo;
        }

        protected void limpiar()
        {
            this.txtOficinaCodigoPostals.Value = "";
            this.txtOficinaDireccion.Value = "";
            this.txtOficinasRazonSocial.Value = "";            
        }

        protected void OnSelectedIndexChanged_depOficina(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = this.ddlOficinaDepartamento.SelectedValue;
            LlenarDropDownList(ddlOficinaProvincia, new UbigeoBusinessLogic().listarProvincia(u).OrderBy(x => x.DesProvincia), "0", Constantes.MensajeComboRegistro);
            upProvinciaOficina.Update();
        }

        protected void OnSelectedIndexChanged_depEditarOficina(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = this.ddlEditarOficinaDepartamento.SelectedValue;
            LlenarDropDownList(ddlEditarOficinaProvincia, new UbigeoBusinessLogic().listarProvincia(u).OrderBy(x => x.DesProvincia), "0", Constantes.MensajeComboRegistro);
            upEditarProvinciaOficina.Update();
        }


        protected void OnSelectedIndexChanged_provOficina(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = ddlOficinaDepartamento.SelectedValue;
            u.IdProvincia = ddlOficinaProvincia.SelectedValue;
            LlenarDropDownList(ddlOficinaDistrito, new UbigeoBusinessLogic().listarDistrito(u).OrderBy(x => x.DesDistrito), "0", Constantes.MensajeComboRegistro);
            upDistritoOficina.Update();
        }

        protected void OnSelectedIndexChanged_provEditarOficina(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = ddlEditarOficinaDepartamento.SelectedValue;
            u.IdProvincia = ddlEditarOficinaProvincia.SelectedValue;
            LlenarDropDownList(ddlEditarOficinaDistrito, new UbigeoBusinessLogic().listarDistrito(u).OrderBy(x => x.DesDistrito), "0", Constantes.MensajeComboRegistro);
            upEditarDistritoOficina.Update();
        }


        protected void cargarLista()
        {
            int idEntidad = int.Parse(ViewState["viewEntidad"].ToString());
            listadoOficinas = oficinaBusinessLogic.listarPorEntidad(idEntidad);
            GridViewOficinas.DataSource = listadoOficinas;
            GridViewOficinas.DataBind();
        }

        protected void GridViewOficinas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cargarLista();
            GridViewOficinas.PageIndex = e.NewPageIndex;
            GridViewOficinas.DataBind();
            if (GridViewOficinas.Columns.Count > 0)
            {
                GridViewOficinas.Columns[0].Visible = false;
            }
            this.GridViewOficinas.Columns[0].Visible = false;
        }


        private void cargarCombos()
        {
            LlenarDropDownList(this.ddlTipoOficina, new ParametroValorBusinessLogic().buscarParametroValorForID(5).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);
            LlenarDropDownList(this.ddlOficinaDepartamento, new UbigeoBusinessLogic().listarDepartamento().OrderBy(x => x.DesDepartamento), "0", Constantes.MensajeComboRegistro);
        }

        private void cargarCombosEditar()
        {
            LlenarDropDownList(this.ddlEditarTipoOficina, new ParametroValorBusinessLogic().buscarParametroValorForID(5).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);
            LlenarDropDownList(this.ddlEditarOficinaDepartamento, new UbigeoBusinessLogic().listarDepartamento().OrderBy(x => x.DesDepartamento), "0", Constantes.MensajeComboRegistro);

        }

        protected void gridOficinas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ViewState["parametro"] = e.CommandArgument.ToString();
            try
            {
                if (e.CommandName == "editarOficina")
                {
                    cargarCombosEditar();
                    Oficina oficinaActualizado = new Oficina();
                    oficinaActualizado = oficinaBusinessLogic.buscarOficinaForID(int.Parse(ViewState["parametro"].ToString()));
                    this.txtEditarOficinaCodigoPostal.Value = oficinaActualizado.CodigoPostal;
                    this.txtEditarOficinaDireccion.Value = oficinaActualizado.Direccion;
                    this.txtEditarOficinasRazonSocial.Value = oficinaActualizado.NombreOficina;
                    this.ddlEditarTipoOficina.SelectedValue = oficinaActualizado.IdTipoOficina.ToString();
                    this.ddlEditarOficinaDepartamento.SelectedValue = oficinaActualizado.IdDpto.ToString();

                    Ubigeo u = new Ubigeo();
                    u.IdDepartamento = oficinaActualizado.IdDpto;
                    u.IdProvincia = oficinaActualizado.IdProv;

                    LlenarDropDownList(ddlEditarOficinaProvincia, new UbigeoBusinessLogic().listarProvincia(u).OrderBy(x => x.DesProvincia), "0", Constantes.MensajeComboRegistro);
                    ddlEditarOficinaProvincia.Items.FindByValue(oficinaActualizado.IdProv).Selected = true;

                    LlenarDropDownList(ddlEditarOficinaDistrito, new UbigeoBusinessLogic().listarDistrito(u).OrderBy(x => x.DesDistrito), "0", Constantes.MensajeComboRegistro);
                    ddlEditarOficinaDistrito.Items.FindByValue(oficinaActualizado.IdDstro).Selected = true;

                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$(document).ready(function() {$('#editarOficinaModal').modal('show');});");
                    sb.Append(@"</script>");
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "editarOficinaModal", sb.ToString(), false);
                }

                if (e.CommandName == "eliminarOficina")
                {
                    string[] arg = new string[2];
                    arg = e.CommandArgument.ToString().Split(';');
                    hdModificarEntidad.Value = arg[1];
                    hdInactivarOficina.Value = arg[0];
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
                Oficina _oficina = new Oficina
                {
                    Id = int.Parse(ViewState["parametro"].ToString()),
                    NombreOficina = this.txtEditarOficinasRazonSocial.Value,
                    Direccion = this.txtEditarOficinaDireccion.Value,
                    CodigoPostal = this.txtEditarOficinaCodigoPostal.Value,
                    IdTipoOficina = int.Parse(ddlEditarTipoOficina.SelectedValue),
                    IdDpto = ddlEditarOficinaDepartamento.SelectedValue,
                    IdProv = ddlEditarOficinaProvincia.SelectedValue,
                    IdDstro = ddlEditarOficinaDistrito.SelectedValue,
                    UsuarioModificacion = UsuarioSession().DetCodigo,
                    FecModificacion = DateTime.Now
                };
                oficinaBusinessLogic.ActualizarOficina(_oficina);
                Limpiar();
                cargarLista();
                ClientMessageBox.Show("Se modificó el perfil seleccionado", this);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }
        protected void Modal_nueva_oficina(object sender, EventArgs e)
        {
            try
            {
                Limpiar();
                //divEntidad.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(document).ready(function() {$('#oficinaModal').modal('show');});");
                sb.Append(@"</script>");
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "oficinaModal", sb.ToString(), false);
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
                Oficina oficina = new Oficina
                {
                    Id = int.Parse(hdInactivarOficina.Value.ToString()),
                    UsuarioModificacion = UsuarioSession().DetCodigo,
                    FecModificacion = DateTime.Now,
                    Estado = (int)Constantes.EstadoFlag.INACTIVO
                };
               oficinaBusinessLogic.InactivarOficina(oficina);
                Limpiar();
                cargarLista();
                ClientMessageBox.Show("Se inactivo la oficina", this);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }


        protected void Submit_nuevo(Object sender, EventArgs e)
        {
            Usuario usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];

            Oficina oficina = new Oficina
            {
                IdTipo = int.Parse(ViewState["viewEntidad"].ToString()),
                NombreOficina = this.txtOficinasRazonSocial.Value,
                IdTipoOficina = int.Parse(this.ddlTipoOficina.SelectedValue),
                Direccion = this.txtOficinaDireccion.Value,
                CodigoPostal = txtOficinaCodigoPostals.Value,
                IdDstro = this.ddlOficinaDistrito.SelectedValue,
                IdProv = this.ddlOficinaProvincia.SelectedValue,
                IdDpto = this.ddlOficinaDepartamento.SelectedValue,
                Estado = (int)Constantes.EstadoFlag.ACTIVO,
                UsuarioCreacion = usuarioSession.DetCodigo,
                FecCreacion = DateTime.Today
            };
            oficinaBusinessLogic.guardarOficina(oficina);
            cargarLista();
            limpiar();
        }

    }
}