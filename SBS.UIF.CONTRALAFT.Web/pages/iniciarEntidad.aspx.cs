using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using NLog;
using SBS.UIF.BUZ.Web.util;
using PE.GOB.FSD.BusinessLogic.Core;
using PE.GOB.FSD.BusinessLogic.Common;
using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.Web.comun;
using PE.GOB.FSD.Web.util;
using System.Data;
using System.Linq;
using System.Web;


namespace PE.GOB.FSD.Web.pages
{

    public partial class inicializarEntidad : PaginaBase
    {
        EntidadBusinessLogic entidadBusinessLogic = new EntidadBusinessLogic();
        OficinaBusinessLogic oficinaBusinessLogic = new OficinaBusinessLogic();
        List<Entidad> listadoEntidades;
        List<Oficina> listadoOficinas;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    cargarLista();
                    cargarCombos();
                }
                catch (Exception ex)
                {
                    // logger.ErrorException(ex.Message, ex);
                    //EventLog.WriteEntry("Application", "Ocurrió el error: " + ex.Message, EventLogEntryType.Error);

                }
            }
        }

        private void cargarCombos()
        {
            LlenarDropDownList(ddlDepartamento, new UbigeoBusinessLogic().listarDepartamento().OrderBy(x => x.DesDepartamento), "0", Constantes.MensajeComboRegistro);
            LlenarDropDownList(ddlAgenciaDepartamento, new UbigeoBusinessLogic().listarDepartamento().OrderBy(x => x.DesDepartamento), "0", Constantes.MensajeComboRegistro);

        }

        private void cargarCombosEditar()
        {
            LlenarDropDownList(ddlDepartamentoEditar, new UbigeoBusinessLogic().listarDepartamento().OrderBy(x => x.DesDepartamento), "0", Constantes.MensajeComboRegistro);
            //LlenarDropDownList(ddlAgenciaDepartamento, new UbigeoBusinessLogic().listarDepartamento().OrderBy(x => x.DesDepartamento), "0", Constante.MensajeComboRegistro);

        }

        protected void GridViewOficinas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //cargarLista();
            //listadoOficinas = oficinaBusinessLogic.listarPorEntidad(13);
            //GridViewOficinas.DataSource = listadoOficinas;
            //GridViewOficinas.DataBind();

            GridViewOficinas.PageIndex = e.NewPageIndex;
            GridViewOficinas.DataBind();
            //if (GridViewOficinas.Columns.Count > 0)
            //{
            //    GridViewOficinas.Columns[0].Visible = false;
            //}
            //this.GridViewOficinas.Columns[0].Visible = false;
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cargarLista();
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
            if (GridView2.Columns.Count > 0)
            {
                GridView2.Columns[0].Visible = false;
            }
            this.GridView2.Columns[0].Visible = false;
        }

        private void cargarLista()
        {
            listadoEntidades = entidadBusinessLogic.listarPorEntidad();
            GridView2.DataSource = listadoEntidades;
            GridView2.DataBind();
        }

        /*
        protected void Submit_nuevo(object sender, EventArgs e)
        {
            string password = Membership.GeneratePassword(12, 1);
            Usuario _usuario = new Usuario();
            _usuario.DetNombre = txtNombre.Value;
            SHA256Managed sha = new SHA256Managed();
            Console.WriteLine(password);
            byte[] pass = Encoding.Default.GetBytes(password);
            byte[] passCifrado = sha.ComputeHash(pass);
            //_usuario.DetContrasenia = BitConverter.ToString(passCifrado).Replace("-", "");
            _usuario.DetContrasenia = BitConverter.ToString(passCifrado).Replace("-", "");
            _usuario.DetCodigo = txtDocumento.Value;
            _usuario.FecRegistro = DateTime.Today;
            _usuario.FlActivo = 1;
            _usuario.IdEntidad = int.Parse(ddlCodigoEntidad.SelectedValue);
            _usuario.IdPerfil = int.Parse(ddlCodigoPerfil.SelectedValue);
            _usuario.UsuRegistro = usuarioSession.DetCodigo;
            new UsuarioBusinessLogic().guardarPersona(_usuario);
            cargarLista();
            limpiar();
        }
        */
        protected void OnSelectedIndexChanged_dep(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = ddlDepartamento.SelectedValue;
            // MessageBox.show("","", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            LlenarDropDownList(ddlProvincia, new UbigeoBusinessLogic().listarProvincia(u).OrderBy(x => x.DesProvincia), "0", Constantes.MensajeComboRegistro);
            upProvincia.Update();
        }

        protected void OnSelectedIndexChanged_prov(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = ddlDepartamento.SelectedValue;
            u.IdProvincia = ddlProvincia.SelectedValue;
            // MessageBox.show("","", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            LlenarDropDownList(ddlDistrito, new UbigeoBusinessLogic().listarDistrito(u).OrderBy(x => x.DesDistrito), "0", Constantes.MensajeComboRegistro);
            upDistrito.Update();
        }

        protected void OnSelectedIndexChanged_dep_editar(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = ddlDepartamentoEditar.SelectedValue;
            // MessageBox.show("","", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            LlenarDropDownList(ddlProvinciaEditar, new UbigeoBusinessLogic().listarProvincia(u).OrderBy(x => x.DesProvincia), "0", Constantes.MensajeComboRegistro);
            upProvinciaEditar.Update();
        }

        protected void OnSelectedIndexChanged_prov_editar(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = ddlDepartamentoEditar.SelectedValue;
            u.IdProvincia = ddlProvinciaEditar.SelectedValue;
            // MessageBox.show("","", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            LlenarDropDownList(ddlDistritoEditar, new UbigeoBusinessLogic().listarDistrito(u).OrderBy(x => x.DesDistrito), "0", Constantes.MensajeComboRegistro);
            // UpdatePanel4.Update();
            upDistritoEditar.Update();
        }


        protected void OnSelectedIndexChanged_depAgencia(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = this.ddlAgenciaDepartamento.SelectedValue;
            // MessageBox.show("","", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            LlenarDropDownList(ddlAgenciaProvincia, new UbigeoBusinessLogic().listarProvincia(u).OrderBy(x => x.DesProvincia), "0", Constantes.MensajeComboRegistro);
            upProvinciaAgencia.Update();
        }

        protected void OnSelectedIndexChanged_provAgencia(Object sender, EventArgs e)
        {
            Ubigeo u = new Ubigeo();
            u.IdDepartamento = ddlAgenciaDepartamento.SelectedValue;
            u.IdProvincia = ddlAgenciaProvincia.SelectedValue;
            // MessageBox.show("","", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            LlenarDropDownList(ddlAgenciaDistrito, new UbigeoBusinessLogic().listarDistrito(u).OrderBy(x => x.DesDistrito), "0", Constantes.MensajeComboRegistro);
            upDistritoAgencia.Update();
        }


        protected void Submit_modificar_entidad(object sender, EventArgs e)
        {
            try
            {
                Usuario usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];
                Entidad entidad = new Entidad
                {
                    DesTipo = txtEntidadEditar.Value,
                    CodRuc = txtRUCEditar.Value,
                    Direccion = txtDireccionEditar.Value
                };
                entidadBusinessLogic.ActualizarEntidad(entidad);
                cargarLista();
                limpiar();
            }
            catch (Exception ex)
            {
                // Log.Error(ex);
            }
        }

        protected void Submit_nuevo_entidad(object sender, EventArgs e)
        {
            Usuario usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];
            Entidad entidad = new Entidad
            {
                DesTipo = txtEntidad.Value,
                CodRuc = txtRuc.Value,
                Direccion = txtDireccion.Value,
                IdDstro = ddlDistrito.SelectedValue,
                IdProv = ddlProvincia.SelectedValue,
                IdDpto = ddlDepartamento.SelectedValue,
                FecRegistro = DateTime.Today,
                UsuarioCreacion = usuarioSession.DetCodigo,
                Estado = (int)Constantes.EstadoFlag.ACTIVO
            };
            entidadBusinessLogic.guardarEntidad(entidad);
            cargarLista();
            limpiar();
        }

        protected void Submit_nuevo_agencia(object sender, EventArgs e)
        {
            Usuario usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];

            Oficina oficina = new Oficina
            {
                IdTipo = int.Parse(txtEntidadAgenciaSel.Value),
                NombreOficina = txtAgenciaRazonSocial.Value,
                Direccion = txtAgenciaDireccion.Value,
                CodigoPostal = txtAgenciaCodigoPostal.Value,
                IdDstro = ddlAgenciaDistrito.SelectedValue,
                IdProv = ddlAgenciaProvincia.SelectedValue,
                IdDpto = ddlAgenciaDepartamento.SelectedValue,
                Estado = (int)Constantes.EstadoFlag.ACTIVO,
                UsuarioCreacion = usuarioSession.DetCodigo,
                FecCreacion = DateTime.Today
            };
            oficinaBusinessLogic.guardarOficina(oficina);
            cargarLista();
            limpiar();
        }



        private void limpiar()
        {
            txtEntidad.Value = "";
            txtRuc.Value = "";
            ddlDepartamento.SelectedValue = "0";
            ddlProvincia.SelectedValue = "0";
            txtAgenciaRazonSocial.Value = "";
            txtAgenciaDireccion.Value = "";
            txtAgenciaCodigoPostal.Value = "";
            ddlAgenciaDepartamento.SelectedValue = "0";
            ddlAgenciaProvincia.SelectedValue = "0";
            ddlAgenciaDistrito.SelectedValue = "0";
        }


        /*  protected void btn_clck(object sender, CommandEventArgs e)
          {
              listadoOficinas = oficinaBusinessLogic.listarPorEntidad();
              GridViewOficinas.DataSource = listadoOficinas;
              GridViewOficinas.DataBind();
          }
          */
        protected void gridOficinas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String modal = "";
            int idEntidad = int.Parse(e.CommandArgument.ToString());

            Entidad entidad = new Entidad();
            entidad = entidadBusinessLogic.buscarEntidadForID(idEntidad);

            if (e.CommandName == "btn_clck")
            {
                // datos de la entidad
                verEntidad.Value = entidad.DesTipo;
                // lista de oficinas
                listadoOficinas = oficinaBusinessLogic.listarPorEntidad(idEntidad);
                GridViewOficinas.DataSource = listadoOficinas;
                GridViewOficinas.DataBind();
                // ventana modal
                modal = "GrillaEntidadAgencia";
            }

            if (e.CommandName == "btn_editar")
            {
                cargarCombosEditar();
                // datos de la entidad
                txtEntidadEditar.Value = entidad.DesTipo;
                txtRUCEditar.Value = entidad.CodRuc;
                txtDireccionEditar.Value = entidad.Direccion;
                ddlDepartamentoEditar.Items.FindByValue(entidad.IdDpto).Selected = true;
                Ubigeo u = new Ubigeo();
                u.IdDepartamento = entidad.IdDpto;
                u.IdProvincia = entidad.IdProv;

                LlenarDropDownList(ddlProvinciaEditar, new UbigeoBusinessLogic().listarProvincia(u).OrderBy(x => x.DesProvincia), "0", Constantes.MensajeComboRegistro);
                ddlProvinciaEditar.Items.FindByValue(entidad.IdProv).Selected = true;

                LlenarDropDownList(ddlDistritoEditar, new UbigeoBusinessLogic().listarDistrito(u).OrderBy(x => x.DesDistrito), "0", Constantes.MensajeComboRegistro);
                ddlDistritoEditar.Items.FindByValue(entidad.IdDstro).Selected = true;

                modal = "entidadEditarModal";
            }

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$(document).ready(function() {$('#");
            sb.Append(modal);
            sb.Append("').modal('show');});");
            sb.Append(@"</script>");
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), modal.ToString(), sb.ToString(), false);
        }

    }

}