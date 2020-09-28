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
//using SBS.UIF.BUZ.Web.util;


namespace PE.COM.FSD.Web.pages
{
    public partial class deudasEntidad : PaginaBase
    {
        EntidadBusinessLogic entidadBusinessLogic = new EntidadBusinessLogic();
        DeudaBusinessLogic deudaBusinessLogic = new DeudaBusinessLogic();
        List<Deuda> listadoDeudas;
        string idRequestEntidad = "";
        int nEntidad = 0;
        readonly Logger Log = LogManager.GetCurrentClassLogger();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]) == true)
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
                    Log.Error(ex);

                }
            }
        }

        protected void cargaInformacionEntidad(int idEntidad)
        {
            Entidad entidad = new Entidad();
            entidad = entidadBusinessLogic.buscarEntidadForID(idEntidad);
            txtDeudaEntidad.Value = entidad.DesTipo;
        }


        protected void cargarLista(int idEntidad)
        {

            listadoDeudas = deudaBusinessLogic.listarDeudasPorEntidad(idEntidad);
            GridViewDeuda.DataSource = listadoDeudas;
            GridViewDeuda.DataBind();

        }

        protected void limpiar()
        {
            txtDeudaObservaciones.Value = "";
            txtDeudaMonto.Value = "";

        }

        private void cargarCombos()
        {
               LlenarDropDownList(ddlConcepto, new ParametroValorBusinessLogic().buscarParametroValorForID((int)Constantes.Parametro.CONCEPTO_DE_DEUDA).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);

        }

        private void cargarCombosEditar()
        {
            LlenarDropDownList(ddlEditarConcepto, new ParametroValorBusinessLogic().buscarParametroValorForID((int)Constantes.Parametro.CONCEPTO_DE_DEUDA).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);
        }

        protected void GridViewDeuda_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cargarLista(nEntidad);
            GridViewDeuda.PageIndex = e.NewPageIndex;
            GridViewDeuda.DataBind();
            if (GridViewDeuda.Columns.Count > 0)
            {
                GridViewDeuda.Columns[0].Visible = false;
            }
            this.GridViewDeuda.Columns[0].Visible = false;
        }

       protected void gridDeuda_RowCommand (object sender, GridViewCommandEventArgs e)
      {
           ViewState["parametro"] = e.CommandArgument.ToString();
          try
           {
              if (e.CommandName == "editarDeuda")
             {
                 cargarCombosEditar();
          Deuda deudaActualizado = new Deuda();
           deudaActualizado = deudaBusinessLogic.buscarDeudaPorId(int.Parse(ViewState["parametro"].ToString()));
                 txtEditarDeudaEntidad.Value = deudaActualizado.Entidad;
                    ddlEditarConcepto.SelectedValue = deudaActualizado.IdConcepto.ToString();
                    txtEditarDuedaObservaciones.Value = deudaActualizado.Observacion;
                     txtEditarDeudaMonto.Value = Convert.ToString(deudaActualizado.Monto);
          
                hdEditarEntidad.Value = deudaActualizado.IdTipo.ToString();
               System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$(document).ready(function() {$('#editarDeudaModal').modal('show');});");
                    sb.Append(@"</script>");
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "editarDeudaModal", sb.ToString(), false);
             }

                if (e.CommandName == "eliminarDeuda")
              {
                    string[] arg = new string[2];
                   arg = e.CommandArgument.ToString().Split(';');
                    hdModificarEntidad.Value = arg[1];
                    hdInactivarDeuda.Value = arg[0];
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
            Deuda _deuda= new Deuda
             {
                    Id = int.Parse(ViewState["parametro"].ToString()),
                    Observacion = txtEditarDuedaObservaciones.Value,
                    Monto = int.Parse(txtEditarDeudaMonto.Value),
                    IdConcepto = int.Parse(ddlEditarConcepto.SelectedValue),
                    UsuarioModificacion = UsuarioSession().DetCodigo,
                    FecModificacion = DateTime.Now
                };
                deudaBusinessLogic.ActualizarDeuda(_deuda);
                 Limpiar();
                cargarLista(int.Parse(hdEditarEntidad.Value));
               ClientMessageBox.Show("Se modificó el perfil seleccionado", this);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        protected void Modal_nueva_deuda(object sender, EventArgs e)
        {
            try
            {
                Limpiar();
                //divEntidad.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(document).ready(function() {$('#deudaModal').modal('show');});");
                sb.Append(@"</script>");
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "deudaModal", sb.ToString(), false);
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
                Deuda deuda = new Deuda
                {
                    Id = int.Parse(hdInactivarDeuda.Value.ToString()),
                    UsuarioModificacion = UsuarioSession().DetCodigo,
                    FecModificacion = DateTime.Now,
                    Estado = (int)Constantes.EstadoFlag.INACTIVO
                };
            deudaBusinessLogic.InactivarDeuda(deuda);
                Limpiar();
                cargarLista(int.Parse(hdModificarEntidad.Value));
                ClientMessageBox.Show("Se inactivo la deuda", this);
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
             Deuda deuda = new Deuda
              {
                  IdTipo = int.Parse(idRequestEntidad),
                 IdConcepto = Convert.ToInt32(ddlConcepto.SelectedValue),
                  Observacion = txtDeudaObservaciones.Value,
                  Monto =int.Parse(txtDeudaMonto.Value),
                  Estado = (int)Constantes.EstadoFlag.ACTIVO,
                  UsuarioCreacion = usuarioSession.DetCodigo,
                   FecCreacion = DateTime.Today
               };
             deudaBusinessLogic.guardarDeuda(deuda);

            cargarLista(deuda.IdTipo);
             limpiar();
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

    }
}