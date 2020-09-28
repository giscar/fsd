<%@ Page Title="" Language="C#" MasterPageFile="~/pages/plantilla.Master" AutoEventWireup="true" CodeBehind="contactosEntidad.aspx.cs" Inherits="PE.COM.FSD.Web.pages.contactosEntidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link rel="stylesheet" href="/css/style.css">
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-4">Listado de contactos de la entidad</h5>
        </div>
        <div class="col-md-6">
            <button type="button" class="btn btn-primary" onclick="window.location.href = 'iniciarEntidad.aspx'">Regresar</button>
            <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#entidadContacto">Crear Contacto</button> -->
            <asp:Button class="btn btn-primary" ID="btnNuevoContacto" runat="server" Text="Crear Contacto" OnClick="Modal_nuevo_contacto" />
        </div>
    </div>

    <div class="fluid-container">
        <div class="row mt-3 pb-2 border-bottom pb-3 mb-3">
            <div class="col-md-12">
                <div class="container " style="border: 1px solid #fff;">
                    <div>
                        <!-- Modal Nuevo Contacto-->
                        <div class="modal fade" id="contactoModal" tabindex="-1" role="dialog" aria-labelledby="ContactoLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="ContactoLabel">Nuevo Contacto</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtContactoEntidad">Entidad Financiera</label>
                                            <input type="text" class="form-control" id="txtContactoEntidad" runat="server" autocomplete="off" maxlength="80" value="" readonly />
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlCargo">Cargo</label>
                                            <asp:DropDownList class="form-control ddlCargo" ID="ddlCargo" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"></asp:DropDownList>
                                            <small class="form-text text-muted ddlCargoLabel">Seleccione el cargo</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoNombres ">Nombres</label>
                                            <input type="text" class="form-control txtContactoNombres" id="txtContactoNombres" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Nombres" />
                                            <small class="form-text text-muted txtContactoNombreslabel">Ingrese los Nombres</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoApellidos">Apellidos</label>
                                            <input type="text" class="form-control txtContactoApellidos" id="txtContactoApellidos" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Apellidos" />
                                            <small class="form-text text-muted txtContactoApellidoslabel">Ingrese los Apellidos</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoDNI">Número de DNI</label>
                                            <input type="text" class="form-control txtContactoDNI soloNumeros" id="txtContactoDNI" runat="server" autocomplete="off" maxlength="8" placeholder="Ingrese DNI" />
                                            <small class="form-text text-muted txtContactoDNIlabel">Ingrese el número de DNI</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoEmail">Correo Electrónico</label>
                                            <input type="text" class="form-control txtContactoEmail" id="txtContactoEmail" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese correo electrónico" />
                                            <small class="form-text text-muted txtContactoEmaillabel">Ingrese el correo electrónico</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoCelular">Número de Celular</label>
                                            <input type="text" class="form-control txtContactoCelular soloNumeros" id="txtContactoCelular" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese número celular" />
                                            <small class="form-text text-muted txtContactoCelularlabel">Ingrese el número Celular</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtContactoTelefonoFijo">Número de Teléfono fijo</label>
                                            <input type="text" class="form-control txtContactoTelefonoFijo soloNumeros" id="txtContactoTelefonoFijo" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese número de teléfono fijo" />
                                            <small class="form-text text-muted txtContactoTelefonoFijolabel">Ingrese el número de teléfono fijo</small>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:HiddenField ID="hdNuevaEntidad" runat="server" Value="" />
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary btnNuevo" OnClientClick="return validaCrearContacto()" ID="btnGrabarContacto" runat="server" Text="Nuevo Contacto" OnClick="Submit_nuevo" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridViewContactos" runat="server" AllowPaging="true" OnPageIndexChanging="GridViewContactos_PageIndexChanging"
                                    CssClass="table table-hover table-striped table-bordered" PageSize="20" AutoGenerateColumns="false" OnRowCommand="gridContactos_RowCommand">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="20%" DataField="Nombres" HeaderText="Nombres" />
                                        <asp:BoundField ItemStyle-Width="20%" DataField="Apellidos" HeaderText="Apellidos" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="DNI" HeaderText="DNI" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="Celular" HeaderText="Celular" />
                                        <asp:TemplateField ShowHeader="false" ItemStyle-Width="30%">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("Id") %>' CommandName="editarContacto">Editar</asp:LinkButton>
                                                <asp:LinkButton runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("Id")  + ";" + Eval("IdTipo") %>' CommandName="eliminarContacto">Eliminar</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <!-- modal editar -->
                        <div class="modal fade" id="editarContactoModal" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Modificar Contacto</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtEditarContactoEntidad">Entidad Financiera</label>
                                            <input type="text" class="form-control" id="txtEditarContactoEntidad" runat="server" autocomplete="off" maxlength="80" value="" readonly />
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlEditarCargo" class="col-form-label">Cargo</label>
                                            <asp:DropDownList class="form-control ddlEditarCargo" ID="ddlEditarCargo" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"></asp:DropDownList>
                                            <small class="form-text text-muted ddlEditarCargolabel">Editar el Cargo</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarContactoNombres">Nombres</label>
                                            <input type="text" class="form-control txtEditarContactoNombres" id="txtEditarContactoNombres" runat="server" autocomplete="off" maxlength="80" placeholder="Editar los nombres"/>
                                            <small class="form-text text-muted txtEditarContactoNombreslabel">Editar los nombres</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarContactoApellidos">Apellidos</label>
                                            <input type="text" class="form-control txtEditarContactoApellidos" id="txtEditarContactoApellidos" runat="server" autocomplete="off" maxlength="80" placeholder="Editar los apellidos" />
                                            <small class="form-text text-muted txtEditarContactoApellidoslabel">Editar los Apellidos</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarContactoDNI">Número de DNI</label>
                                            <input type="text" class="form-control txtEditarContactoDNI soloNumeros" id="txtEditarContactoDNI" runat="server" autocomplete="off" maxlength="8" placeholder="Editar DNI" />
                                            <small class="form-text text-muted txtEditarContactoDNIlabel">Editar el número de DNI</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarContactoEmail">Correo Electrónico</label>
                                            <input type="text" class="form-control txtEditarContactoEmail" id="txtEditarContactoEmail" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese correo electrónico" />
                                            <small class="form-text text-muted txtEditarContactoEmaillabel">Ingrese el correo electrónico</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarContactoCelular">Número de Celular</label>
                                            <input type="text" class="form-control txtEditarContactoCelular soloNumeros" id="txtEditarContactoCelular" runat="server" autocomplete="off" maxlength="80" placeholder="Editar el número de celular" />
                                            <small class="form-text text-muted txtEditarContactoCelularlabel">Editar el número Celular</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarContactoTelefonoFijo">Número de Teléfono fijo</label>
                                            <input type="text" class="form-control txtEditarContactoTelefonoFijo soloNumeros" id="txtEditarContactoTelefonoFijo" runat="server" autocomplete="off" maxlength="80" placeholder="Editar el número de teléfono fijo" />
                                            <small class="form-text text-muted txtEditarContactoTelefonoFijolabel">Editar el número de teléfono fijo</small>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                           <asp:HiddenField ID="hdEditarEntidad" runat="server" Value="" />
                                           <asp:HiddenField ID="hdInactivarContacto" runat="server" Value="" />
                                        <asp:Button class="btn btn-success" ID="btnSeleccionar" runat="server" Text="Modificar Contacto" OnClientClick="return validarEditarContacto()" OnClick="Submit_edit" />
                                        <button type="button" class="btn btn-light" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- modal confirmacion -->
                        <div class="modal fade" id="confirmacion" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-sm" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="tituloVentanaCrear">Ventana de Confirmación</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Esta seguro de registrar el nuevo Contacto.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button class="btn btn-success" ID="btnNuevo" runat="server" Text="Crear Contacto" OnClick="Submit_nuevo" />
                                        <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- modal inactivar -->
                        <div class="modal fade" id="inactivacion" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-sm" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="tituloVentanaInactivar">Ventana de Confirmación</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Esta seguro de inactivar el Contacto.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:HiddenField ID="hdModificarEntidad" runat="server" Value="" />
                                        <asp:Button class="btn btn-danger" ID="btnInactive" runat="server" Text="Inactivar" OnClick="Submit_inactive" />
                                        <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/js/pages/contacto.js"></script>
</asp:Content>
