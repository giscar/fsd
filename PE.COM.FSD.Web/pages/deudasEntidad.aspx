<%@ Page Title="" Language="C#" MasterPageFile="~/pages/plantilla.Master" AutoEventWireup="true" CodeBehind="deudasEntidad.aspx.cs" Inherits="PE.COM.FSD.Web.pages.deudasEntidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link rel="stylesheet" href="/css/style.css">
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-4">Listado de deudas de la entidad</h5>
        </div>
        <div class="col-md-6">
            <button type="button" class="btn btn-primary" onclick="window.location.href = 'iniciarEntidad.aspx'">Regresar</button>
            <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#entidadContacto">Crear Contacto</button> -->
            <asp:Button class="btn btn-primary" ID="btnNuevoContacto" runat="server" Text="Nueva Deuda" OnClick="Modal_nueva_deuda" />
        </div>
    </div>

    <div class="fluid-container">
        <div class="row mt-3 pb-2 border-bottom pb-3 mb-3">
            <div class="col-md-12">
                <div class="container " style="border: 1px solid #fff;">
                    <div>
                        <!-- Modal Nueva Deuda-->
                        <div class="modal fade" id="deudaModal" tabindex="-1" role="dialog" aria-labelledby="DeudaLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="DeudaLabel">Registrar Deuda</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtDeudaEntidad">Entidad Financiera</label>
                                            <input type="text" class="form-control" id="txtDeudaEntidad" runat="server" autocomplete="off" maxlength="80" value="" readonly />
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlConcepto">Concepto</label>
                                            <asp:DropDownList class="form-control ddlConcepto" ID="ddlConcepto" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"></asp:DropDownList>
                                            <small class="form-text text-muted ddlConceptolabel">Ingrese el Concepto</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDeudaObservaciones">Observaciones</label>
                                            <input type="text" class="form-control txtDeudaObservaciones" id="txtDeudaObservaciones" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Observaciones" />
                                            <small class="form-text text-muted txtDeudaObservacioneslabel">Ingrese las observaciones</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDeudaMonto">Monto</label>
                                            <input type="text" class="form-control txtDeudaMonto soloNumeros" id="txtDeudaMonto" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Monto" />
                                            <small class="form-text text-muted txtDeudaMontolabel">Ingrese el Monto</small>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:HiddenField ID="hdNuevaEntidad" runat="server" Value="" />
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary btnNuevo" OnClientClick="return validaCrearDeuda()" ID="btnGrabarDeuda" runat="server" Text="Nueva Deuda" OnClick="Submit_nuevo" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridViewDeuda" runat="server" AllowPaging="true" OnPageIndexChanging="GridViewDeuda_PageIndexChanging"
                                    CssClass="table table-hover table-striped table-bordered" PageSize="20" AutoGenerateColumns="false" OnRowCommand="gridDeuda_RowCommand">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="20%" DataField="Concepto" HeaderText="Concepto" />
                                        <asp:BoundField ItemStyle-Width="20%" DataField="Observacion" HeaderText="Observacion" />
                                        <asp:BoundField ItemStyle-Width="20%" DataField="Monto" HeaderText="Monto" />
                                        <asp:TemplateField ShowHeader="false" ItemStyle-Width="30%">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("Id") %>' CommandName="editarDeuda">Editar</asp:LinkButton>
                                                <asp:LinkButton runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("Id")  + ";" + Eval("IdTipo") %>' CommandName="eliminarDeuda">Eliminar</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <!-- modal editar -->
                        <div class="modal fade" id="editarDeudaModal" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Modificar Deuda</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtEditarDeudaEntidad">Entidad Financiera</label>
                                            <input type="text" class="form-control" id="txtEditarDeudaEntidad" runat="server" autocomplete="off" maxlength="80" value="" readonly />
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlEditarConcepto" class="col-form-label">Concepto</label>
                                            <asp:DropDownList class="form-control ddlEditarConcepto" ID="ddlEditarConcepto" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"></asp:DropDownList>
                                            <small class="form-text text-muted ddlEditarConceptolabel">Editar el Cargo</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarDuedaObservaciones">Observaciones</label>
                                            <input type="text" class="form-control txtEditarDuedaObservaciones" id="txtEditarDuedaObservaciones" runat="server" autocomplete="off" maxlength="80" placeholder="Editar Observaciones"/>
                                            <small class="form-text text-muted txtEditarDuedaObservacioneslabel">Editar Observaciones</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarDeudaMonto">Monto</label>
                                            <input type="text" class="form-control txtEditarDeudaMonto soloNumeros" id="txtEditarDeudaMonto" runat="server" autocomplete="off" maxlength="80" placeholder="Editar Monto" />
                                            <small class="form-text text-muted txtEditarDeudaMontolabel">Editar Montos</small>
                                        </div>
                                                                            
                                        </div>
                                    <div class="modal-footer">
                                           <asp:HiddenField ID="hdEditarEntidad" runat="server" Value="" />
                                           <asp:HiddenField ID="hdInactivarDeuda" runat="server" Value="" />
                                        <asp:Button class="btn btn-success" ID="btnSeleccionar" runat="server" Text="Modificar Deuda" OnClientClick="return validarEditarDeuda()" OnClick="Submit_edit" />
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
                                        <p>Esta seguro de registrar la deuda.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button class="btn btn-success" ID="btnNuevo" runat="server" Text="Crear Deuda" OnClick="Submit_nuevo" />
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
                                        <p>Esta seguro de inactivar la Deuda.</p>
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
    <script src="/js/pages/deuda.js"></script>
</asp:Content>
