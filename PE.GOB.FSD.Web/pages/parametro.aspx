<%@ Page Language="C#" MasterPageFile="plantilla.Master" AutoEventWireup="true" CodeBehind="parametro.aspx.cs" Inherits="PE.GOB.FSD.Web.pages.parametro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>     

    <script type="text/javascript">
        function helloFromCodeBehind() { alert("hello!") }
    </script>
    
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-4">Administrar Parametros del Sistema</h5>
        </div>
        <div class="col-md-6">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#parametroModal">
                Crear Parametro
            </button>
        </div>
    </div>
    <div class="form-group">
        <label style="vertical-align: bottom">Parametros</label>
        <asp:DropDownList class="form-control" ID="ddlCodigoParametro" runat="server" DataValueField="IdParametro" DataTextField="Nombre"
            AutoPostBack="true" OnSelectedIndexChanged="ddlCodigoParametro_Change"></asp:DropDownList>
    </div>
    <div class="form-group">
        <asp:Button class="btn btn-lg btn-primary" ID="btnLimpiar" runat="server" Text="Limpiar"
            OnClick="Submit_limpiar" />
        <asp:Button class="btn btn-lg btn-primary" ID="btnBuscar" runat="server" Text="Buscar"
            OnClick="Submit_buscar" />
        <asp:Button class="btn btn-lg btn-primary" ID="btnParametroValor" runat="server" Text="AGREGAR"
            data-toggle="modal" data-target="#parametroValorModal" OnClientClick="return false;" />
    </div>
    
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="true"
                  CssClass="table table-hover table-striped table-bordered" AutoGenerateColumns="false" >
        <Columns>
            <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField ItemStyle-Width="40%" DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField ItemStyle-Width="50%" DataField="Descripcion" HeaderText="Descripcion" />
            <asp:BoundField ItemStyle-Width="50%" DataField="Estado" HeaderText="Estado" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:LinkButton ID="Button" Text="Editar" CssClass="btn btn-success" runat="server" CommandName="Editar"
                                    OnCommand="GridView1_Command" CommandArgument='<%# Eval("IdParametroValor") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    <!-- Modal nuevo Parametro-->
    <div class="modal fade" id="parametroModal" tabindex="-1" role="dialog" aria-labelledby="parametroModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="parametroModalLabel">Nuevo Parametro</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtNombre">Nombre</label>
                        <input type="text" class="form-control" id="txtNombre" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Nombre" />
                        <small class="form-text text-muted">Ingrese el nombre del parametro.</small>
                    </div>
                    <div class="form-group">
                        <label for="txtContra">Descripción</label>
                        <input type="text" class="form-control" id="txtDescripcion" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Descripción" />
                        <small class="form-text text-muted">Ingrese la descripción del parametro.</small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <asp:Button class="btn btn-lg btn-primary" ID="btnRegistrarParametro" runat="server" Text="Registrar Parametro" OnClick="Submit_nuevo_parametro" />
                </div>
            </div>
        </div>
    </div>
    
     <!-- Modal nuevo Parametro Valor-->
    <div class="modal fade" id="parametroValorModal" tabindex="-1" role="dialog" aria-labelledby="parametroValorModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="parametroValorModalLabel">
                                <asp:Label ID="lblModalTitleValor" runat="server" Text=""></asp:Label>
                            </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="txtNombre">Parametro Padre</label>
                                <input type="text" class="form-control" id="txtNombreParametro" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Nombre Padre" disabled="true"/>
                            </div>
                            <div class="form-group">
                                <label for="txtNombre">Nombre</label>
                                <input type="text" class="form-control" id="txtNombreValor" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Nombre" />
                                <small class="form-text text-muted">Ingrese el nombre del parametro valor.</small>
                            </div>
                            <div class="form-group">
                                <label for="txtContra">Descripción</label>
                                <input type="text" class="form-control" id="txtDescripcionValor" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Descripción" />
                                <small class="form-text text-muted">Ingrese la descripción del parametro valor.</small>
                            </div>
                            <div class="form-group">
                                <label for="txtContra">Valor</label>
                                <input type="text" class="form-control" id="txtValor" runat="server" autocomplete="off" maxlength="80" placeholder="Ingrese Valor" />
                                <small class="form-text text-muted">Ingrese valor del parametro.</small>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>-->
                            <asp:Button class="btn btn-lg" ID="btnCerrarParametroValor" runat="server" Text="Cerrar" OnClick="Submit_cerrar_parametro_valor" />
                            <asp:Button class="btn btn-lg btn-primary" ID="btnRegistrarParametroValor" runat="server" Text="Registrar Parametro Valor" OnClick="Submit_registrar_parametro_valor" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <br />
    <div id="idModalInfoServer" runat="server">
        <div class="modal show" id="idInfoServer">
            <div class="modal-dialog ">
                <div class="modal-content" style="background: #D9EDF7">
                    <div class="modal-header" style="padding: 5px;">
                        <a onclick="cerrarModalInfo()" class="close" data-dismiss="modal" aria-label="Close"><span style="color: red; font-size: large" class="glyphicon glyphicon-remove"></span></a>
                        <p style="color: #3170A5; font-size: 1.5em">Se enviaron los datos</p>
                    </div>
                    <div style="background: white; box-sizing: border-box;">
                        <div class="modal-body" style="padding: 7px;">
                            <table style="width: 100%">
                                <tr>
                                    <td style="padding-right: 8px">
                                        <img style="width: 30px" src="img/info.png" />
                                    </td>
                                    <td>
                                        <div id="mensajeInfo" style="font-size: 1.4em">
                                            <asp:Label ID="lblMensajeOk" runat="server" Text=""></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>