<%@ Page Language="C#" MasterPageFile="plantilla.Master" AutoEventWireup="true" CodeBehind="parametro.aspx.cs" Inherits="PE.GOB.FSD.Web.pages.parametro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-4">Administrar Parametros del Sistema</h5>
        </div>
        <div class="col-md-6">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary">
                Crear Parametro
            </button>
        </div>
    </div>
    <div class="form-group">
        <label style="vertical-align: bottom">Parametros</label>
        <asp:DropDownList class="form-control" ID="ddlCodigoParametro" runat="server" DataValueField="IdParametro" DataTextField="Nombre"></asp:DropDownList>
    </div>
    <div class="form-group">
        <asp:Button class="btn btn-lg btn-primary" ID="btnBuscar" runat="server" Text="Buscar"
            OnClick="Submit_buscar" />
    </div>
    
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
        CssClass="table table-hover table-striped table-bordered" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField ItemStyle-Width="40%" DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField ItemStyle-Width="50%" DataField="Descripcion" HeaderText="Descripcion" />
            <asp:BoundField ItemStyle-Width="50%" DataField="Estado" HeaderText="Estado" />
        </Columns>
    </asp:GridView>

</asp:Content>