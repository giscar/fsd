<%@ Page Title="" Language="C#" MasterPageFile="~/pages/plantilla.Master" AutoEventWireup="true" CodeBehind="contactosEntidad.aspx.cs" Inherits="PE.COM.FSD.Web.pages.contactosEntidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link rel="stylesheet" href="/css/style.css">
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-4">Listado de contactos de la entidad</h5>
        </div>
         <div class="col-md-6">

             <button type="button" class="btn btn-primary" onClick="history.go(-1); return false;">
                Regresar
            </button>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#entidadContacto">
                Crear Contacto
            </button>

        </div>
    </div>

    <div class="fluid-container">
        <div class="row mt-3 pb-2 border-bottom pb-3 mb-3">
            <div class="col-md-12">
                <div class="container " style="border: 1px solid #fff;">
                    <div>


                        <!-- Modal Nuevo Contacto-->
                        <div class="modal fade" id="entidadContacto" tabindex="-1" role="dialog" aria-labelledby="ContactoLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="ContactoLabel">Registrar Contacto</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtContactoEntidad">Entidad Financiera</label>
                                            <input type="text" class="form-control" id="txtContactoEntidad" autocomplete="off" maxlength="80" value="" readonly />
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlCargo">Cargo</label>
                                            <asp:DropDownList class="form-control" ID="ddlCargo" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"></asp:DropDownList>
                                            <small class="form-text text-muted">Ingrese el Cargo</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoNombres">Nombres</label>
                                            <input type="text" class="form-control" id="txtContactoNombres" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Nombres" />
                                            <small class="form-text text-muted">Ingrese los Nombres</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoApellidos">Apellidos</label>
                                            <input type="text" class="form-control" id="txtContactoApellidos" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Apellidos" />
                                            <small class="form-text text-muted">Ingrese los Apellidos</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoDNI">Número de DNI</label>
                                            <input type="text" class="form-control" id="txtContactoDNI" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese DNI" />
                                            <small class="form-text text-muted">Ingrese el número de DNI</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoCelular">Número de Celular</label>
                                            <input type="text" class="form-control" id="txtContactoCelular" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese número celular" />
                                            <small class="form-text text-muted">Ingrese el número Celular</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoTelefonoFijo">Número de Teléfono fijo</label>
                                            <input type="text" class="form-control" id="txtContactoTelefonoFijo" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese número de teléfono fijo" />
                                            <small class="form-text text-muted">Ingrese el número de teléfono fijo</small>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:HiddenField ID="hdEntidadAgenciaSel" runat="server" Value="" />
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary" ID="btnGrabarContacto" runat="server" Text="Grabar" OnClick="Submit_nuevo_contacto" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridViewContactos" runat="server" AllowPaging="true" OnPageIndexChanging="GridViewContactos_PageIndexChanging"
                                    CssClass="table table-hover table-striped table-bordered" PageSize="20" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="30%" DataField="Nombres" HeaderText="Nombres" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="Apellidos" HeaderText="Apellidos" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="DNI" HeaderText="DNI" />
                                         <asp:BoundField ItemStyle-Width="10%" DataField="Celular" HeaderText="Celular" />
                                         <asp:BoundField ItemStyle-Width="10%" DataField="TelefonoFijo" HeaderText="Telefono Fijo" />
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                     </div>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        //function agregarContacto(id, agenciaEntidad) {
            //$('#txtAgenciaEntidadFinanciera').val(agenciaEntidad);
            //$('#cphBody_txtEntidadAgenciaSel').val(id);
        //    $('#entidadAgencia').modal('show');
        //}
    </script>
</asp:Content>
