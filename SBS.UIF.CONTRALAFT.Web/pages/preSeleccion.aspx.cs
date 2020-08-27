using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using PE.GOB.FSD.Web.comun;
using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.BusinessLogic.Core;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using PE.GOB.FSD.Web.util;

namespace PE.GOB.FSD.Web.pages
{
    public partial class preSeleccion : PaginaBase
    {
        ParametroValorBusinessLogic parametroValorBusinessLogic = new ParametroValorBusinessLogic();

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
            //CARGAR COMBOS DE ENTIDADES
            LlenarDropDownList(ddlClasificacionRiesgo, new ParametroValorBusinessLogic().buscarParametroValorForID((int)Constantes.Parametro.CLASIFICACION_RIESGO).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);
            LlenarDropDownList(ddlPorcentajeOficinas, new ParametroValorBusinessLogic().buscarParametroValorForID((int)Constantes.Parametro.PORCENTAJE_COINCIDENCIA_OFICINAS).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);
            LlenarDropDownList(ddlIndicadorDeudaFSD, new ParametroValorBusinessLogic().buscarParametroValorForID((int)Constantes.Parametro.DEUDA_FSD).OrderBy(x => x.Nombre), "0", Constantes.MensajeComboRegistro);
            //VALORES POR DEFECTO
            ddlClasificacionRiesgo.Items.FindByText(Constantes.SELECCION_DEFECTO_CLASIFICACION_RIESGO).Selected = true;
            ddlPorcentajeOficinas.Items.FindByText(Constantes.SELECCION_DEFECTO_PORCENTAJE_COINCIDENCIA_OFICINAS).Selected = true;
            ddlIndicadorDeudaFSD.Items.FindByText(Constantes.SELECCION_DEFECTO_DEUDA_FSD).Selected = true;
        }

        protected void Submit_IniciarPreSeleccion(object sender, EventArgs e)
        {
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
    }
}
