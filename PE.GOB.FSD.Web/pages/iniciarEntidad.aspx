<%@ Page Language="C#" MasterPageFile="plantilla.Master" AutoEventWireup="true" CodeBehind="iniciarEntidad.aspx.cs" Inherits="PE.GOB.FSD.Web.pages.inicializarEntidad" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link rel="stylesheet" href="/css/style.css">
    <div class="row">
        <div class="col-sm-9 col-md-6 col-lg-8" >
            <h5 class="card-title mb-4">Listado de Entidades Financieras</h5>
        </div>
        <div class="col-sm-3 col-md-6 col-lg-4 d-flex justify-content-end">
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
                        <br />
                        <asp:hiddenfield  id="txtEntidadAgenciaSel" runat="server" />

                        <!-- Modal nueva entidad-->
                        <div class="modal fade" id="entidadModal" tabindex="-1" role="dialog" aria-labelledby="entidadModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="entidadModalLabel">Información de la Entidad Financiera</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtEntidad">Razón Social</label>
                                            <input type="text" class="form-control" id="txtEntidad" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese razón social" />
                                            <small class="form-text text-muted">Ingrese la Razón Social</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDireccion">Dirección Principal</label>
                                            <input type="text" class="form-control" id="txtDireccion" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese dirección principal" />
                                            <small class="form-text text-muted">Ingrese la dirección principal</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlDepartamento">Departamento</label>
                                            <asp:DropDownList class="form-control" ID="ddlDepartamento" runat="server" DataValueField="IdDepartamento" DataTextField="DesDepartamento" OnSelectedIndexChanged = "OnSelectedIndexChanged_dep" AutoPostBack="true"></asp:DropDownList>
                                            <small class="form-text text-muted">Seleccione el departamento</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Provincia</label>
                                            <asp:UpdatePanel ID="upProvincia" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList class="form-control" ID="ddlProvincia" runat="server" DataValueField="IdProvincia" DataTextField="DesProvincia" OnSelectedIndexChanged = "OnSelectedIndexChanged_prov" AutoPostBack="true"></asp:DropDownList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlDepartamento" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted">Seleccione la provincia</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Distrito</label>
                                            <asp:UpdatePanel ID="upDistrito" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control" ID="ddlDistrito" runat="server" DataValueField="IdDistrito" DataTextField="DesDistrito"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProvincia" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                             </asp:UpdatePanel>
                                             <small class="form-text text-muted">Seleccione el distrito</small>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtRUC">RUC</label>
                                            <input type="text" class="form-control" id="txtRuc" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese RUC" />
                                            <small class="form-text text-muted">Ingrese el RUC de la entidad.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtCodigoPostal">Código Postal</label>
                                            <input type="text" class="form-control" id="txtCodigoPostal" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese código postal" />
                                            <small class="form-text text-muted">Ingrese el código postal.</small>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary" ID="Button2" runat="server" Text="Registrar entidad" OnClick="Submit_nuevo_entidad" />
                                    </div>
                                </div>
                            </div>
                        </div>
<asp:UpdatePanel ID="UpdatePanel4" runat="server">
<ContentTemplate>                        

                         <!-- Modal editar entidad-->
                        <div class="modal fade" id="entidadEditarModal" tabindex="-1" role="dialog" aria-labelledby="entidadEditarModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="entidadEditarModalLabel">Editar Información de la Entidad Financiera</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="txtEntidadEditar">Razón Social</label>
                                            <input type="text" class="form-control" id="txtEntidadEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese razón social" />
                                            <small class="form-text text-muted">Ingrese la Razón Social</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtRUCEditar">RUC</label>
                                            <input type="text" class="form-control" id="txtRUCEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese RUC" />
                                            <small class="form-text text-muted">Ingrese el RUC de la entidad.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtCodigoPostalEditar">Código Postal</label>
                                            <input type="text" class="form-control" id="txtCodigoPostalEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese código postal" />
                                            <small class="form-text text-muted">Ingrese el código postal.</small>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtDireccionEditar">Dirección Principal</label>
                                            <input type="text" class="form-control" id="txtDireccionEditar" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese dirección principal" />
                                            <small class="form-text text-muted">Ingrese la dirección principal</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Departamento</label>
                                            <asp:DropDownList class="form-control" ID="ddlDepartamentoEditar" runat="server" DataValueField="IdDepartamento" DataTextField="DesDepartamento" OnSelectedIndexChanged = "OnSelectedIndexChanged_dep_editar" AutoPostBack="true"></asp:DropDownList>
                                            <small class="form-text text-muted">Seleccione el departamento</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Provincia</label>
                                            <asp:UpdatePanel ID="upProvinciaEditar" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList class="form-control" ID="ddlProvinciaEditar" runat="server" DataValueField="IdProvincia" DataTextField="DesProvincia" OnSelectedIndexChanged = "OnSelectedIndexChanged_prov_editar" AutoPostBack="true"></asp:DropDownList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlDepartamentoEditar" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                            </asp:UpdatePanel>
                                            <small class="form-text text-muted">Seleccione la provincia</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Distrito</label>
                                            <asp:UpdatePanel ID="upDistritoEditar" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList class="form-control" ID="ddlDistritoEditar" runat="server" DataValueField="IdDistrito" DataTextField="DesDistrito"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProvinciaEditar" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                             </asp:UpdatePanel>
                                             <small class="form-text text-muted">Seleccione el distrito</small>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <asp:Button class="btn btn-lg btn-primary" ID="Button3" runat="server" Text="Modificar entidad" OnClick="Submit_modificar_entidad" />
                                    </div>
                                </div>
                            </div>
                        </div>
      </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="GridView2"  EventName="RowCommand" />  
    </Triggers>
</asp:UpdatePanel>   


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
                                            <input type="text" class="form-control" id="txtAgenciaEntidadFinanciera" autocomplete="off" maxlength="80"  value="" readonly />

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
                                            <asp:DropDownList class="form-control" ID="ddlAgenciaDepartamento" runat="server" DataValueField="IdDepartamento" DataTextField="DesDepartamento" OnSelectedIndexChanged = "OnSelectedIndexChanged_depAgencia" AutoPostBack="true"></asp:DropDownList>
                                            <small class="form-text text-muted">Seleccione el departamento</small>
                                        </div>
                                        <div class="form-group">
                                            <label>Provincia</label>
                                            <asp:UpdatePanel ID="upProvinciaAgencia" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList class="form-control" ID="ddlAgenciaProvincia" runat="server" DataValueField="IdProvincia" DataTextField="DesProvincia" OnSelectedIndexChanged = "OnSelectedIndexChanged_provAgencia" AutoPostBack="true"></asp:DropDownList>
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
                                            <input type="text" class="form-control" id="verEntidad" runat="server" autocomplete="off" maxlength="80"  readonly />
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
        <asp:AsyncPostBackTrigger ControlID="GridView2"  EventName="RowCommand" />  
    </Triggers>
</asp:UpdatePanel>   

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate> 
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="true" OnPageIndexChanging="GridView2_PageIndexChanging"
                                CssClass="table table-hover table-striped table-bordered" PageSize="20" AutoGenerateColumns="false"  OnRowCommand="gridOficinas_RowCommand">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField ItemStyle-Width="10%" DataField="CodRuc" HeaderText="Ruc" />
                                    <asp:BoundField ItemStyle-Width="30%" DataField="DesTipo" HeaderText="Razón Social" />
                                    <asp:BoundField ItemStyle-Width="10%" DataField="Departamento" HeaderText="Departamento" />
                                    <asp:BoundField ItemStyle-Width="10%" DataField="Provincia" HeaderText="Provincia" />
                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="linkbtnEditar" runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("IdTipo") %>' CommandName="btn_editar" >Editar</asp:LinkButton>
                                            </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                              <%--  <asp:LinkButton ID="linkbtn" runat="server" ClientIDMode="Static" CssClass="btn btn-success" data-target="#GrillaEntidadAgencia" 
                                                 data-toggle="modal" CommandArgument='<%# Eval("Id") %>' CommandName="btn_clck" >Ver Oficinas</asp:LinkButton>--%>
                                                <asp:LinkButton ID="linkbtn" runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("IdTipo") %>' CommandName="btn_clck" >Ver Oficinas</asp:LinkButton>
                                            </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <a id="link_agregar" onclick="agregarAgencia('<%# Eval("IdTipo") %>','<%# Eval("DesTipo") %>')" class="btn btn-success"  />Agregar</a>
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
            function mi (id, agenciaEntidad) {
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

</asp:Content>
