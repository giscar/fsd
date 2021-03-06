﻿<%@ Page Language="C#" MasterPageFile="plantilla.Master" AutoEventWireup="true" CodeBehind="iniciarEntidad.aspx.cs" Inherits="PE.COM.FSD.Web.pages.inicializarEntidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link rel="stylesheet" href="/css/style.css">
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-4">Entidades Financieras</h5>
        </div>
        <div class="col-md-6">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#entidadModal">
                Crear entidad
            </button>
           
        </div>
    </div>

    <div class="fluid-container">
        <div class="row mt-3 pb-2 border-bottom pb-3 mb-3">
            <div class="col-md-12">
                <div class="container " style="border: 1px solid #fff;">
                    <div>
                        <!-- Modal nueva entidad-->
                        <div class="modal fade" id="entidadModal" tabindex="-1" role="dialog" aria-labelledby="entidadModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="entidadModalLabel">Nueva Entidad Financiera</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtRUC">RUC</label>
                                            <input type="text" class="form-control txtRuc soloNumeros" id="txtRuc" runat="server" autocomplete="off" maxlength="11" placeholder="Ingrese RUC" />
                                            <small class="form-text text-muted txtRuclabel">Ingrese el RUC de la entidad.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEntidad">Razón Social</label>
                                            <input type="text" class="form-control txtEntidad" id="txtEntidad" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese razón social" />
                                            <small class="form-text text-muted txtEntidadlabel">Ingrese la Razón Social</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDireccion">Dirección Principal</label>
                                            <input type="text" class="form-control txtDireccion" id="txtDireccion" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese dirección principal" />
                                            <small class="form-text text-muted txtDireccionlabel">Ingrese la dirección principal</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtLatitud">Latitud</label>
                                            <input type="text" class="form-control txtLatitud" id="txtLatitud" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Latitud" />
                                            <small class="form-text text-muted txtLatitudlabel">Ingrese la Latitud</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtLongitud">Longitud</label>
                                            <input type="text" class="form-control txtLongitud" id="txtLongitud" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Longitud" />
                                            <small class="form-text text-muted txtLongitudlabel">Ingrese la Longitud</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtCodigoPostal">Código Postal</label>
                                            <input type="text" class="form-control txtCodigoPostal" id="txtCodigoPostal" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese código postal" />
                                            <small class="form-text text-muted txtCodigoPostallabel">Ingrese el código postal.</small>
                                        </div>

                                        <div class="form-group">
                                            <label for="ddlDepartamento">Departamento</label>
                                            <asp:DropDownList class="form-control ddlDepartamento" ID="ddlDepartamento" runat="server" DataValueField="IdDepartamento" DataTextField="DesDepartamento" OnSelectedIndexChanged="OnSelectedIndexChanged_dep" AutoPostBack="true"></asp:DropDownList>
                                            <small class="form-text text-muted ddlDepartamentolabel">Seleccione el departamento</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Provincia</label>
                                            <asp:UpdatePanel ID="upProvincia" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control ddlProvincia" ID="ddlProvincia" runat="server" DataValueField="IdProvincia" DataTextField="DesProvincia" OnSelectedIndexChanged="OnSelectedIndexChanged_prov" AutoPostBack="true"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlDepartamento" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted ddlProvincialabel">Seleccione la provincia</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Distrito</label>
                                            <asp:UpdatePanel ID="upDistrito" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control ddlDistrito" ID="ddlDistrito" runat="server" DataValueField="IdDistrito" DataTextField="DesDistrito"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProvincia" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted ddlDistritolabel">Seleccione el distrito</small>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary" OnClientClick="return validaCrearEntidad()" ID="Button2" runat="server" Text="Nueva Entidad" OnClick="Submit_nuevo_entidad" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Modal editar entidad-->
                        <div class="modal fade" id="entidadEditarModal" tabindex="-1" role="dialog" aria-labelledby="entidadEditarModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="entidadEditarModalLabel">Modificar Entidad Financiera</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtEntidadEditar">Razón Social</label>
                                            <input type="text" class="form-control txtEntidadEditar" id="txtEntidadEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese razón social" />
                                            <small class="form-text text-muted txtEntidadEditarlabel">Ingrese la Razón Social</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtRUCEditar">RUC</label>
                                            <input type="text" class="form-control txtRUCEditar" id="txtRUCEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese RUC" />
                                            <small class="form-text text-muted txtRUCEditarlabel">Ingrese el RUC de la entidad.</small>
                                        </div>


                                        <div class="form-group">
                                            <label for="txtDireccionEditar">Dirección Principal</label>
                                            <input type="text" class="form-control txtDireccionEditar" id="txtDireccionEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese dirección principal" />
                                            <small class="form-text text-muted txtDireccionEditarlabel">Ingrese la dirección principal</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtLatitudEditar">Latitud</label>
                                            <input type="text" class="form-control txtLatitudEditar" id="txtLatitudEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Latitud" />
                                            <small class="form-text text-muted txtLatitudEditarlabel">Ingrese la Latitud</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtLongitudEditar">Longitud</label>
                                            <input type="text" class="form-control txtLongitudEditar" id="txtLongitudEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Longitud" />
                                            <small class="form-text text-muted txtLongitudEditarlabel">Ingrese la Longitud</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtCodigoPostalEditar">Código Postal</label>
                                            <input type="text" class="form-control txtCodigoPostalEditar" id="txtCodigoPostalEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese código postal" />
                                            <small class="form-text text-muted txtCodigoPostalEditarlabel">Ingrese el código postal.</small>
                                        </div>


                                        <div class="form-group">
                                            <label>Departamento</label>
                                            <asp:DropDownList class="form-control ddlDepartamentoEditar" ID="ddlDepartamentoEditar" runat="server" DataValueField="IdDepartamento" DataTextField="DesDepartamento" OnSelectedIndexChanged="OnSelectedIndexChanged_dep_editar" AutoPostBack="true"></asp:DropDownList>
                                            <small class="form-text text-muted ddlDepartamentoEditarlabel">Seleccione el departamento</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Provincia</label>
                                            <asp:UpdatePanel ID="upProvinciaEditar" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control ddlProvinciaEditar" ID="ddlProvinciaEditar" runat="server" DataValueField="IdProvincia" DataTextField="DesProvincia" OnSelectedIndexChanged="OnSelectedIndexChanged_prov_editar" AutoPostBack="true"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlDepartamentoEditar" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted ddlProvinciaEditarlabel">Seleccione la provincia</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Distrito</label>
                                            <asp:UpdatePanel ID="upDistritoEditar" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control ddlDistritoEditar" ID="ddlDistritoEditar" runat="server" DataValueField="IdDistrito" DataTextField="DesDistrito"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProvinciaEditar" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted ddlDistritoEditarlabel">Seleccione el distrito</small>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <asp:HiddenField ID="hdEntidadAgenciaSel" runat="server" Value="" />
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary" OnClientClick="return validarEditarEntidad()" ID="Button3" runat="server" Text="Modificar entidad" OnClick="Submit_modificar_entidad" />
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- Modal Agencias-->
                        <div class="modal fade" id="entidadAgencia" tabindex="-1" role="dialog" aria-labelledby="agenciaModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">

                                        <h5 class="modal-title" id="agenciaModalLabel">Registrar Oficina</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtAgenciaEntidadFinanciera">Entidad Financiera</label>
                                            <input type="text" class="form-control" id="txtAgenciaEntidadFinanciera" autocomplete="off" maxlength="80" value="" readonly />

                                        </div>
                                        <div class="form-group">
                                            <label for="txtAgenciaRazonSocial">Oficina</label>
                                            <input type="text" class="form-control" id="txtAgenciaRazonSocial" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Oficina" />
                                            <small class="form-text text-muted">Ingrese la Oficina</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtAgenciaDireccion">Dirección</label>
                                            <input type="text" class="form-control" id="txtAgenciaDireccion" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Dirección" />
                                            <small class="form-text text-muted">Ingrese la dirección</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtAgenciaCodigoPostal">Código Postal</label>
                                            <input type="text" class="form-control" id="txtAgenciaCodigoPostal" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Código Postal" />
                                            <small class="form-text text-muted">Ingrese el Código Postal</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Departamento</label>
                                            <asp:DropDownList class="form-control" ID="ddlAgenciaDepartamento" runat="server" DataValueField="IdDepartamento" DataTextField="DesDepartamento" OnSelectedIndexChanged="OnSelectedIndexChanged_depAgencia" AutoPostBack="true"></asp:DropDownList>
                                            <small class="form-text text-muted">Seleccione el departamento</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Provincia</label>
                                            <asp:UpdatePanel ID="upProvinciaAgencia" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control" ID="ddlAgenciaProvincia" runat="server" DataValueField="IdProvincia" DataTextField="DesProvincia" OnSelectedIndexChanged="OnSelectedIndexChanged_provAgencia" AutoPostBack="true"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlAgenciaDepartamento" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted">Seleccione la provincia</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Distrito</label>
                                            <asp:UpdatePanel ID="upDistritoAgencia" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control" ID="ddlAgenciaDistrito" runat="server" DataValueField="IdDistrito" DataTextField="DesDistrito"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlAgenciaProvincia" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted">Seleccione el distrito</small>
                                        </div>

                                    </div>
                                    <div class="modal-footer">

                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary" ID="Button1" runat="server" Text="Grabar" OnClick="Submit_nuevo_agencia" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Grilla Agencias-->

                        <asp:UpdatePanel ID="upModal" runat="server">
                            <ContentTemplate>

                                <div class="modal fade" id="GrillaEntidadAgencia" tabindex="-1" role="dialog" aria-labelledby="GridAgenciaModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="GridAgenciaModalLabel">Listado de Oficinas</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label>Entidad</label>
                                                    <input type="text" class="form-control" id="verEntidad" runat="server" autocomplete="off" maxlength="80" readonly />
                                                </div>
                                                <asp:GridView ID="GridViewOficinas" runat="server" AllowPaging="true" OnPageIndexChanging="GridViewOficinas_PageIndexChanging"
                                                    CssClass="table table-hover table-striped table-bordered" PageSize="20" AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField ItemStyle-Width="40%" DataField="NombreOficina" HeaderText="Razón Social" />
                                                        <asp:BoundField ItemStyle-Width="10%" DataField="Departamento" HeaderText="Departamento" />
                                                        <asp:BoundField ItemStyle-Width="10%" DataField="Provincia" HeaderText="Provincia" />
                                                        <asp:BoundField ItemStyle-Width="10%" DataField="Distrito" HeaderText="Distrito" />
                                                        <asp:BoundField ItemStyle-Width="10%" DataField="CodigoPostal" HeaderText="Codigo Postal" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="GridView2" EventName="RowCommand" />
                            </Triggers>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView2" runat="server" AllowPaging="true" OnPageIndexChanging="GridView2_PageIndexChanging"
                                    CssClass="table table-hover table-striped table-bordered" PageSize="20" AutoGenerateColumns="false" OnRowCommand="gridOficinas_RowCommand">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="30%" DataField="DesTipo" HeaderText="Razón Social" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="Departamento" HeaderText="Departamento" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="Provincia" HeaderText="Provincia" />
                                        <asp:BoundField ItemStyle-Width="10%" DataField="Distrito" HeaderText="Distrito" />
                                        <asp:TemplateField ShowHeader="false" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="linkbtnEditar" runat="server" CssClass="btn btn-icons btn-inverse-primary" CommandArgument='<%# Eval("IdTipo") %>' CommandName="btn_editar"><i class="mdi mdi-pencil"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ShowHeader="false" ItemStyle-Width="10%">   
                                            <ItemTemplate>
                                                <asp:LinkButton ID="linkbtnContactos" runat="server" CssClass="btn btn-icons btn-inverse-warning" CommandArgument='<%# Eval("IdTipo") %>' CommandName="btn_contactos"><i class="mdi mdi-account"></i></asp:LinkButton>
                                                 <br /><br /><asp:LinkButton ID="linkbtnDeudas" runat="server" CssClass="btn btn-icons btn-inverse-warning" CommandArgument='<%# Eval("IdTipo") %>' CommandName="btn_deudas"><i class="mdi mdi-gavel"></i></asp:LinkButton>
                                                 <br /><br /><asp:LinkButton ID="linkbtnOficinas" runat="server" CssClass="btn btn-icons btn-inverse-warning" CommandArgument='<%# Eval("IdTipo") %>' CommandName="btn_oficinas"><i class="mdi mdi-map-marker-radius"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        function mi(id, agenciaEntidad) {
            $('#txtAgenciaEntidadFinanciera').val(agenciaEntidad);
            $('#cphBody_txtEntidadAgenciaSel').val(id);
            $('#GrillaEntidadAgencia').modal('show');
        }

        function agregarAgencia(id, agenciaEntidad) {
            $('#txtAgenciaEntidadFinanciera').val(agenciaEntidad);
            $('#cphBody_txtEntidadAgenciaSel').val(id);
            $('#entidadAgencia').modal('show');
        }
    </script>
     <script src="/js/pages/entidad.js"></script>
</asp:Content>
