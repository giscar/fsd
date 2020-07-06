﻿using System;
using System.Text;
using System.Security.Cryptography;
using PE.GOB.FSD.BusinessLogic.Core;
using PE.GOB.FSD.Entity.Core;

namespace PE.GOB.FSD.Web.pages
{
    public partial class login : System.Web.UI.Page
    {
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
                _usuario = new UsuarioBusinessLogic().buscarUsuario(_usuario);
                Session["Usuario"] = _usuario;
                Response.Redirect("usuario.aspx");
                MsgServidor("sadasd");
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private void MsgServidor(string pmessage)
        {
            /*idModalInfoServer.Visible = true;
            lblMensajeOk.Text = pmessage;*/
        }
    }
}