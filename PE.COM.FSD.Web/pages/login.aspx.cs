﻿using System;
using System.Text;
using System.Security.Cryptography;
using NLog;
using PE.COM.FSD.BusinessLogic.Core;
using PE.COM.FSD.Entity.Core;

namespace PE.COM.FSD.Web.pages
{
    public partial class Login : System.Web.UI.Page
    {

        readonly Logger Log = LogManager.GetCurrentClassLogger();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Login(object sender, EventArgs e)
        {
            try
            {
                Usuario _usuario = new Usuario();
                SHA256Managed sha = new SHA256Managed();
                byte[] pass = Encoding.Default.GetBytes(txtContra.Value);
                byte[] passCifrado = sha.ComputeHash(pass);
                _usuario.DetContrasenia = BitConverter.ToString(passCifrado).Replace("-", "");
                _usuario.DetCodigo = txtCodigo.Value;
                _usuario = new UsuarioBusinessLogic().BuscarUsuario(_usuario);
                Session["Usuario"] = _usuario;
                Response.Redirect("usuario.aspx");
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

        }

    }
}