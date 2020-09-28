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
    public partial class preSeleccion : PaginaBase
    {
        PreSeleccionBusinessLogic preSeleccionBusinessLogic = new PreSeleccionBusinessLogic();
        ContactoBusinessLogic contactoBusinessLogic = new ContactoBusinessLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            //GetUsuarioSession();
            if (!Page.IsPostBack)
            {
                try
                {
                    if (UsuarioSession() == null)
                    {
                        Response.Redirect("../pages/login.aspx");
                    }
                    mostrarOcultar(false);
                    cargarCombos();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Application", "Ocurrió el error: " + ex.Message);
                }
            }
        }

        protected void mostrarOcultar(Boolean indicador)
        {
            idDivListaEntidades.Visible = indicador;
            idDivTituloLE.Visible = indicador;
            idDivSubTituloLE.Visible = indicador;
        }

        private void cargarCombos()
        {
            LlenarDropDownList(ddlEntidades, new EntidadBusinessLogic().ListarPorEntidad().OrderBy(x => x.DesTipo), "0", Constantes.selectLabelDefault);
            LlenarDropDownList(ddlClasificacionRiesgo, new ParametroValorBusinessLogic().buscarParametroValorForID((int)Constantes.Parametro.CLASIFICACION_RIESGO).OrderBy(x => x.Nombre), "0", Constantes.selectLabelDefault);
            LlenarDropDownList(ddlPorcentajeOficinas, new ParametroValorBusinessLogic().buscarParametroValorForID((int)Constantes.Parametro.PORCENTAJE_COINCIDENCIA_OFICINAS).OrderBy(x => x.Nombre), "0", Constantes.selectLabelDefault);
            LlenarDropDownList(ddlIndicadorDeudaFSD, new ParametroValorBusinessLogic().buscarParametroValorForID((int)Constantes.Parametro.DEUDA_FSD).OrderBy(x => x.Nombre), "0", Constantes.selectLabelDefault);
            //VALORES POR DEFECTO
            ddlClasificacionRiesgo.Items.FindByText(Constantes.SELECCION_DEFECTO_CLASIFICACION_RIESGO).Selected = true;
            ddlPorcentajeOficinas.Items.FindByText(Constantes.SELECCION_DEFECTO_PORCENTAJE_COINCIDENCIA_OFICINAS).Selected = true;
            ddlIndicadorDeudaFSD.Items.FindByText(Constantes.SELECCION_DEFECTO_DEUDA_FSD).Selected = true;
        }

        protected void Submit_IniciarPreSeleccion(object sender, EventArgs e)
        {
            int idEntidad = int.Parse(ddlEntidades.SelectedValue);
            string porcentajeCR = ddlClasificacionRiesgo.SelectedValue.ToString().Trim();
            int porcentajeCO = int.Parse(ddlPorcentajeOficinas.SelectedValue.ToString().Trim().Substring(0, 2));
            string deudaFSD = ddlIndicadorDeudaFSD.SelectedValue.ToString().Trim();

            PreSeleccion preSeleccion = new PreSeleccion
            {
                IdEntidadInput = idEntidad,
                IndClasificadorInput = porcentajeCR,
                PorcentajeOficinaInput = porcentajeCO,
                IndDeudaFSDInput = deudaFSD
            };

            List<PreSeleccion> preSelecciones = preSeleccionBusinessLogic.buscarPreSeleccion(preSeleccion);
            GridView1.DataSource = preSelecciones;
            GridView1.DataBind();
            //CARGAR CONTACTOS
            List<Contacto> contactos = contactoBusinessLogic.ListarContacto();
            GridView2.DataSource = contactos;
            GridView2.DataBind();
            mostrarOcultar(true);
        }

        protected void Submit_LimpiarPreSeleccion(object sender, EventArgs e)
        {
            mostrarOcultar(false);
        }

        protected void Submit_EnviarInvitaciones(object sender, EventArgs e)
        {
            //ENVIAR INVITACIONES A ENTIDADES PRE- SELECCIONADAS
        }

        protected void ddlClasificacionRiesgo_Change(object sender, EventArgs e)
        {
            //SELECCIONAR VALORES DE CLASIFICACION DE RIESGO
        }

        protected void ddlPorcentajeOficinas_Change(object sender, EventArgs e)
        {
            //SELECCIONAR VALORES DE OFICINAS
        }

        protected void ddlIndicadorDeudaFSD_Change(object sender, EventArgs e)
        {
            //SELECCIONAR VALORES DE DEUDAS CON EL FSD
        }

        protected void ddlEntidades_Change(object sender, EventArgs e)
        {
            //SELECCIONAR VALORES DE ENTIDADES
        }

        protected void Submit_enviar_invitaciones(object sender, EventArgs e)
        {
            Contacto contacto = new Contacto
            {
                Entidad = "TODAS",
              
            };
            //parametroBusinessLogic.guardarParametro(parametro);
            //Limpiar();
            //cargarCombos();
            //AlertDanger("Se realizaron los cambios");
        }
    }
}
