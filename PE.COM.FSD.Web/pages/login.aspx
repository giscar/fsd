<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PE.COM.FSD.Web.pages.Login" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CONTRALAFT</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
</head>
<body>
    <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
        <div class="row w-100 mx-auto">
          <div class="col-lg-4 mx-auto">
            <div class="auto-form-wrapper">
                                <h3 class="mr-auto">Modulo de Subastas Virtuales</h3>
                <p class="mb-5 mr-auto">Ingrese los datos de acceso.</p>
              <form id="form1" runat="server">
                <div class="form-group">
                  <label class="label">Usuario</label>
                  <div class="input-group">
                    <input type="text" class="form-control login-input-text" id="txtCodigo" runat="server" autocomplete="off" maxlength="80" placeholder="Usuario"/>
                    <div class="input-group-append">
                      <span class="input-group-text"><i class="mdi mdi-check-circle-outline"></i></span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="label">Password</label>
                  <div class="input-group">
                    <input type="password" class="form-control login-input-text" placeholder="Contraseña" id="txtContra" runat="server" />
                    <div class="input-group-append">
                      <span class="input-group-text"><i class="mdi mdi-check-circle-outline"></i></span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <asp:Button  class="btn btn-block g-loginn btn-primary" ID="Button1" runat="server" Text="Acceder" OnClick="Submit_Login" />
                </div>
                
              </form>
            </div>
            <ul class="auth-footer ">
              <li><a class="text-primary" href="#">Condiciones</a></li>
              <li><a class="text-primary" href="#">Ayuda</a></li>
              <li><a class="text-primary" href="#">Terminos de referencia</a></li>
            </ul>
            <p class="footer-text text-center text-primary">copyright © 2020 fsd.org.pe todos los derechos reservados.</p>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
        
        
    
    <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <script src="../../vendors/js/vendor.bundle.addons.js"></script>
</body>
</html>



