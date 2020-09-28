<%@ Page Title="" Language="C#" MasterPageFile="~/pages/plantilla.Master" AutoEventWireup="true" CodeBehind="oficinasEntidad.aspx.cs"  Inherits="PE.COM.FSD.Web.pages.OficinasEntidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link rel="stylesheet" href="/css/style.css">
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-4">Oficinas de la entidad</h5>
        </div>
        <div class="col-md-6">
            <button type="button" class="btn btn-primary" onclick="window.location.href = 'iniciarEntidad.aspx'">Regresar</button>
            <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#entidadContacto">Crear Contacto</button> -->
            <asp:Button class="btn btn-primary" ID="btnNuevoContacto" runat="server" Text="Crear Oficina" OnClick="Modal_nueva_oficina" />
        </div>
    </div>

    <div class="fluid-container">
        <div class="row mt-3 pb-2 border-bottom pb-3 mb-3">
            <div class="col-md-12">
                <div class="container container-custom" style="border: 1px solid #fff;">
                    <div>
                        <!-- Modal Nueva Oficina-->
                        <div class="modal fade" id="oficinaModal" tabindex="-1" role="dialog" aria-labelledby="OficinaLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="OficinaLabel">Nueva Oficina</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtOficinasEntidadFinanciera">Entidad Financiera</label>
                                            <input type="text" class="form-control" id="txtOficinasEntidadFinanciera" runat="server" autocomplete="off" maxlength="80" value="" readonly />
                                        </div>
                                        <div class="form-group">
                                            <label for="txtOficinasRazonSocial">Oficina</label>
                                            <input type="text" class="form-control txtOficinasRazonSocial" id="txtOficinasRazonSocial" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Oficina" />
                                            <small class="form-text text-muted txtOficinasRazonSociallabel">Ingrese la Oficina</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlTipoOficina">Tipo de Oficina</label>
                                            <asp:DropDownList class="form-control ddlTipoOficina" ID="ddlTipoOficina" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"></asp:DropDownList>
                                            <small class="form-text text-muted ddlTipoOficinalabel">Ingrese la Oficina</small>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtOficinaCodigoPostal">Código Postal</label>
                                            <input type="text" class="form-control txtOficinaCodigoPostals soloNumeros" id="txtOficinaCodigoPostals" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Código Postal" />
                                            <small class="form-text text-muted txtOficinaCodigoPostalslabel">Ingrese el Código Postal</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Departamento</label>
                                            <asp:DropDownList class="form-control ddlOficinaDepartamento" ID="ddlOficinaDepartamento" runat="server" DataValueField="IdDepartamento" DataTextField="DesDepartamento" OnSelectedIndexChanged="OnSelectedIndexChanged_depOficina" AutoPostBack="true"></asp:DropDownList>
                                            <small class="form-text text-muted ddlOficinaDepartamentolabel">Seleccione el departamento</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Provincia</label>
                                            <asp:UpdatePanel ID="upProvinciaOficina" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control ddlOficinaProvincia" ID="ddlOficinaProvincia" runat="server" DataValueField="IdProvincia" DataTextField="DesProvincia" OnSelectedIndexChanged="OnSelectedIndexChanged_provOficina" AutoPostBack="true"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlOficinaDepartamento" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted  ddlOficinaProvincialabel">Seleccione la provincia</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Distrito</label>
                                            <asp:UpdatePanel ID="upDistritoOficina" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control ddlOficinaDistrito" ID="ddlOficinaDistrito" runat="server" DataValueField="IdDistrito" DataTextField="DesDistrito"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlOficinaDistrito" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted ddlOficinaDistritolabel">Seleccione el distrito</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtOficinaDireccion">Dirección</label>
                                            <input type="text" class="form-control txtOficinaDireccion" id="txtOficinaDireccion" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Dirección" />
                                            <small class="form-text text-muted txtOficinaDireccionlabel">Ingrese la dirección</small>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                           <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary btnNuevo" OnClientClick="return validaCrearOficina()" ID="btnGrabarContacto" runat="server" Text="Nuevo usuario" OnClick="Submit_nuevo" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Grilla Oficinas-->
                        <asp:UpdatePanel ID="upModal" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridViewOficinas" runat="server" AllowPaging="true" OnPageIndexChanging="GridViewOficinas_PageIndexChanging"
                                    CssClass="table table-hover table-striped table-bordered" PageSize="20" AutoGenerateColumns="false" OnRowCommand="gridOficinas_RowCommand">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="10%" DataField="TipoOficina" HeaderText="Tipo de Oficina" />
                                        <asp:BoundField ItemStyle-Width="20%" DataField="NombreOficina" HeaderText="Oficina" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="Departamento" HeaderText="Departamento" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="Provincia" HeaderText="Provincia" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="Distrito" HeaderText="Distrito" />
                                        <asp:TemplateField ShowHeader="false" ItemStyle-Width="30%">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("Id") %>' CommandName="editarOficina">Editar</asp:LinkButton>
                                                <asp:LinkButton runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("Id")  + ";" + Eval("IdTipo") %>' CommandName="eliminarOficina">Eliminar</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <!-- modal editar -->
                        <div class="modal fade" id="editarOficinaModal" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Editar Oficina</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                           <div class="form-group">
                                            <label for="txtEditarOficinasEntidad">Entidad Financiera</label>
                                            <input type="text" class="form-control" id="txtEditarOficinasEntidad" runat="server" autocomplete="off" maxlength="80" value="" readonly />
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarOficinasRazonSocial">Oficina</label>
                                            <input type="text" class="form-control txtEditarOficinasRazonSocial" id="txtEditarOficinasRazonSocial" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Oficina" />
                                            <small class="form-text text-muted txtEditarOficinasRazonSociallabel">Ingrese la Oficina</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlEditarTipoOficina">Tipo de Oficina</label>
                                            <asp:DropDownList class="form-control ddlEditarTipoOficina" ID="ddlEditarTipoOficina" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"></asp:DropDownList>
                                            <small class="form-text text-muted ddlEditarTipoOficinalabel">Ingrese la Oficina</small>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtEditarOficinaCodigoPostal">Código Postal</label>
                                            <input type="text" class="form-control txtEditarOficinaCodigoPostal soloNumeros" id="txtEditarOficinaCodigoPostal" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Código Postal" />
                                            <small class="form-text text-muted txtEditarOficinaCodigoPostallabel">Ingrese el Código Postal</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Departamento</label>
                                            <asp:DropDownList class="form-control ddlEditarOficinaDepartamento" ID="ddlEditarOficinaDepartamento" runat="server" DataValueField="IdDepartamento" DataTextField="DesDepartamento" OnSelectedIndexChanged="OnSelectedIndexChanged_depEditarOficina" AutoPostBack="true"></asp:DropDownList>
                                            <small class="form-text text-muted ddlEditarOficinaDepartamentolabel">Seleccione el departamento</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Provincia</label>
                                            <asp:UpdatePanel ID="upEditarProvinciaOficina" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control ddlEditarOficinaProvincia" ID="ddlEditarOficinaProvincia" runat="server" DataValueField="IdProvincia" DataTextField="DesProvincia" OnSelectedIndexChanged="OnSelectedIndexChanged_provEditarOficina" AutoPostBack="true"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlEditarOficinaDepartamento" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted ddlEditarOficinaProvincialabel">Seleccione la provincia</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Distrito</label>
                                            <asp:UpdatePanel ID="upEditarDistritoOficina" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control ddlEditarOficinaDistrito" ID="ddlEditarOficinaDistrito" runat="server" DataValueField="IdDistrito" DataTextField="DesDistrito"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlEditarOficinaDistrito" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted ddlEditarOficinaDistritolabel">Seleccione el distrito</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEditarOficinaDireccion">Dirección</label>
                                            <input type="text" class="form-control txtEditarOficinaDireccion" id="txtEditarOficinaDireccion" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Dirección" />
                                            <small class="form-text text-muted txtEditarOficinaDireccionlabel">Ingrese la dirección</small>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                           <asp:HiddenField ID="hdEditarEntidad" runat="server" Value="" />
                                           <asp:HiddenField ID="hdInactivarOficina" runat="server" Value="" />
                                        <asp:Button class="btn btn-success" ID="btnSeleccionar" runat="server" Text="Modificar Oficina" OnClientClick="return validaEditarOficina()" OnClick="Submit_edit" />
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
                                        <p>Esta seguro de registrar la nueva Oficina.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button class="btn btn-success" ID="btnNuevo" runat="server" Text="Crear Oficina" OnClick="Submit_nuevo" />
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
                                        <p>Esta seguro de inactivar la Oficina.</p>
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
    <script src="/js/pages/oficina.js"></script>
</asp:Content>