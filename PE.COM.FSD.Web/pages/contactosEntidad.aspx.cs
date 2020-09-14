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


namespace PE.COM.FSD.Web.pages
{
    public partial class contactosEntidad : PaginaBase
    {
        ContactoBusinessLogic contactoBusinessLogic = new ContactoBusinessLogic();
        List<Contacto> listadoContactos;
        string idRequestEntidad = "";
        

        protected void Page_Load(object sender, EventArgs e)
        {                if (!string.IsNullOrEmpty(Request.QueryString["id"]) == true)
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
                    cargarLista();
                    cargarCombos();
                }
                catch (Exception ex)
                {
                    //    // logger.ErrorException(ex.Message, ex);
                    //    //EventLog.WriteEntry("Application", "Ocurrió el error: " + ex.Message, EventLogEntryType.Error);

                }
            }
        }

        protected void cargarLista()
        {

            listadoContactos = contactoBusinessLogic.listarPorContacto();
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

        protected void GridViewContactos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

            protected void Submit_nuevo_contacto(Object sender, EventArgs e)
        {
            Usuario usuarioSession = (Usuario)HttpContext.Current.Session["Usuario"];

            Contacto contacto = new Contacto
            {
                IdEntidad = int.Parse(idRequestEntidad),
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

            cargarLista();
            limpiar();
        }

    }
}