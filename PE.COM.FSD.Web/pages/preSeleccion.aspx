﻿<%@ Page Language="C#" MasterPageFile="plantilla.Master" AutoEventWireup="true" CodeBehind="preSeleccion.aspx.cs" Inherits="PE.COM.FSD.Web.pages.preSeleccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    
    <div class="row">
        <h4 class="card-title">Entidad a Liquidar</h4>
    </div>
    <div class="row">
        <p class="card-description">
            Sección que contiene la información correspondiente a la entidad a liquidar.
        </p>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <div class="form-group row">
                <label class="col-sm-6 col-form-label">Entidad a Liquidar</label>
                <div class="col-sm-6">
                    <asp:DropDownList class="form-control" ID="ddlEntidades" runat="server" DataValueField="IdTipo" DataTextField="DesTipo"
                                      AutoPostBack="true" OnSelectedIndexChanged="ddlEntidades_Change"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row border-bottom"></div>
    <br>
    
    <div class="row">
        <h4 class="card-title">Criterios de Selección</h4>
    </div>
    <div class="row">
        <p class="card-description">
            Sección que contiene los variables a considerar para la pre-selección
        </p>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <div class="form-group row">
                <label class="col-sm-10 col-form-label">
                    Empresas cuya clasificación de riesgo sea (incluyendo sub-categorías) <b>MAYOR O IGUAL</b> a: 
                </label>
                <div class="col-sm-2">
                    <asp:DropDownList class="form-control" ID="ddlClasificacionRiesgo" runat="server" DataValueField="Nombre" DataTextField="Nombre"
                                      AutoPostBack="true" OnSelectedIndexChanged="ddlClasificacionRiesgo_Change"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <div class="form-group row">
                <label class="col-sm-10 col-form-label">
                    Empresas que cuenten con oficinas en distritos en donde la empresa en liquidación mantiene oficinas <b>(% MÍNIMO)</b>:
                </label>
                <div class="col-sm-2">
                    <asp:DropDownList class="form-control" ID="ddlPorcentajeOficinas" runat="server" DataValueField="Nombre" DataTextField="Nombre"
                                      AutoPostBack="true" OnSelectedIndexChanged="ddlPorcentajeOficinas_Change"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <div class="form-group row">
                <label class="col-sm-10 col-form-label">
                    La empresa deberá mantener obligaciones por pagar vencidas con el <b>FSD</b>:
                </label>
                <div class="col-sm-2">
                    <asp:DropDownList class="form-control" ID="ddlIndicadorDeudaFSD" runat="server" DataValueField="Nombre" DataTextField="Nombre"
                                      AutoPostBack="true" OnSelectedIndexChanged="ddlIndicadorDeudaFSD_Change"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    
    <asp:Button class="btn btn-success mr-2" ID="btnIniciarPreSeleccion" runat="server" Text="Iniciar Pre-Selección"
            OnClick="Submit_IniciarPreSeleccion" />
    
    <asp:Button class="btn btn-light mr-2" ID="btnLimpiarPreSeleccion" runat="server" Text="Limpiar Pre-Selección"
            OnClick="Submit_LimpiarPreSeleccion" />
    
    <br><br>
    <div class="row border-bottom"></div>
    <br>
    <div class="row" runat="server" id="idDivTituloLE">
        <div class="col-md-12">
            <div class="form-group row">
                <div class="col-sm-8">
                    <h4 class="card-title">Entidades Pre-Seleccionadas</h4>
                </div>
                <div class="col-sm-4">                   
                    <asp:Button class="btn btn-success mr-2" ID="btnEnviarInvitaciones" runat="server" Text="Enviar Invitaciones"
                                OnClick="Submit_EnviarInvitaciones" />
                    <i class="mdi mdi-email"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="row" runat="server" id="idDivSubTituloLE">
        <p class="card-description">
            Sección que contiene la información correspondiente a las entidades pre-seleccionadas segun los criterios seleccionados.
        </p>
    </div>
    
    <div class="row" runat="server" id="idDivListaEntidades">
        <div class="col-12 table-responsive">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="true"
                  CssClass="table table-hover table-striped table-bordered" AutoGenerateColumns="false" >
                <Columns>
                    <asp:TemplateField ItemStyle-Width="10%" HeaderText="Nro">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ItemStyle-Width="50%" DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField ItemStyle-Width="20%" DataField="ClasificacionRiesgo" HeaderText="Clasificación de riesgo" />
                    <asp:BoundField ItemStyle-Width="20%" DataField="PorcentajeOficinas" HeaderText="% de Oficinas" />
                    <asp:BoundField ItemStyle-Width="20%" DataField="DeudaFSD" HeaderText="Deudas con el FSD" />
                </Columns>
            </asp:GridView>
            <!-- <table id="order-listing" class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Entidad</th>
                        <th>Clasificación de riesgo</th>
                        <th>% de Oficinas</th>
                        <th>Deudas con el FSD</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Banco de Comercio</td>
                        <td>A</td>
                        <td>80%</td>
                        <td>NO</td>
                        <td>
                          <label class="badge badge-success">APTO</label>
                        </td>
                        <td>
                          <button class="btn btn-outline-primary">VER DETALLES</button>
                        </td>
                    </tr>
                </tbody>
            </table>-->
        </div>
    </div>
    
</asp:Content>