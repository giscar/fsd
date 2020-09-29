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
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using PE.COM.FSD.BusinessLogic.Common;
using NLog;

namespace PE.COM.FSD.Web.pages
{
    public partial class preSeleccion : PaginaBase
    {
        readonly Logger Log = LogManager.GetCurrentClassLogger();

        PreSeleccionBusinessLogic preSeleccionBusinessLogic = new PreSeleccionBusinessLogic();
        ContactoBusinessLogic contactoBusinessLogic = new ContactoBusinessLogic();
        EntidadBusinessLogic _entidadBusinessLogic = new EntidadBusinessLogic();
        PerfilBusinessLogic _perfilBusinessLogic = new PerfilBusinessLogic();

        public static List<Contacto> contactos;

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
            LlenarDropDownList(ddlEntidades, new EntidadBusinessLogic().listarPorEntidad().OrderBy(x => x.DesTipo), "0", Constantes.selectLabelDefault);
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
            contactos = new List<Contacto>();
            foreach (PreSeleccion item in preSelecciones)
            {
                List<Contacto> contactosTemp = contactoBusinessLogic.listarContactoPorEntidad(item.IdEntidad);
                foreach (Contacto contacto in contactosTemp)
                {
                    contactos.Add(contacto);
                }
            }
            GridView2.DataSource = contactos;
            GridView2.DataBind();
            mostrarOcultar(true);
            //HttpContext.Current.ToString();
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
            try
            {
                foreach (Contacto contacto in contactos)
                {
                    string password = Membership.GeneratePassword(12, 1);
                    password = Regex.Replace(password, @"[^a-zA-Z0-9]", m => "9");
                    SHA256Managed sha = new SHA256Managed();
                    byte[] pass = Encoding.Default.GetBytes(password);
                    byte[] passCifrado = sha.ComputeHash(pass);
                    Usuario _usuario = new Usuario
                    {
                        DetNombre = contacto.Nombres + " " + contacto.Apellidos,
                        DetContrasenia = BitConverter.ToString(passCifrado).Replace("-", ""),
                        DetCodigo = contacto.DNI,
                        DetEmail = contacto.Email,
                        FecRegistro = DateTime.Today,
                        FlActivo = (int)Constantes.EstadoFlag.ACTIVO,
                        IdEntidad = contacto.IdTipo,
                        IdPerfil = int.Parse("3"),
                        UsuRegistro = UsuarioSession().DetCodigo,
                        ContraseniaEmail = password
                    };
                    new UsuarioBusinessLogic().GuardarPersona(_usuario);
                    EnviarEmail(_usuario);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        private void EnviarEmail(Usuario _usuario)
        {
            Comunicacion comunicacion = new Comunicacion();
            comunicacion.CorreoUsuario = _usuario.DetEmail;
            comunicacion.UserId = _usuario.DetCodigo;
            comunicacion.NombreUsuario = _usuario.DetNombre;
            comunicacion.Pass = _usuario.ContraseniaEmail;
            if (_usuario.IdPerfil > 2)
                comunicacion.Entidad = _entidadBusinessLogic.buscarEntidadForID(_usuario.IdEntidad).DesTipo;
            comunicacion.Perfil = _perfilBusinessLogic.PerfilForId(_usuario.IdPerfil).DesTipo;
            comunicacion.IdPerfil = _usuario.IdPerfil;
            comunicacion.Subject = Constantes.textoSubjectInvitacionPropuesta;
            Correo correo = new Correo();
            correo.SendMailInvitacionPropuesta(comunicacion);
        }
    }
}
