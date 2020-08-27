<%@ Page Language="C#" MasterPageFile="plantilla.Master" AutoEventWireup="true" CodeBehind="preSeleccion.aspx.cs" Inherits="PE.GOB.FSD.Web.pages.preSeleccion" %>

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
                    <select class="form-control" style="width:100%">
                        <option value="">--Seleccionar--</option>
                        <option value="1">Banco de Comercio</option>
                        <option value="2">Banco de Crédito del Perú</option>
                        <option value="3">Banco Interamericano de Finanzas (BanBif)</option>
                        <option value="4">Banco Pichincha</option>
                        <option value="5">BBVA</option>
                        <option value="6">Citibank Perú</option>
                        <option value="7">Interbank</option>
                        <option value="8">MiBanco</option>
                        <option value="9">Scotiabank Perú</option>
                        <option value="10">Banco GNB Perú</option>
                        <option value="11">Banco Falabella</option>
                        <option value="12">Banco Ripley</option>
                        <option value="13">Banco Santander Perú</option>
                        <option value="14">Banco Azteca</option>
                        <option value="15">CRAC CAT Perú</option>
                        <option value="16">ICBC PERU BANK</option>
                    </select>
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
                    <asp:DropDownList class="form-control" ID="ddlClasificacionRiesgo" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"
                                      AutoPostBack="true" OnSelectedIndexChanged="ddlClasificacionRiesgo_Change"></asp:DropDownList>
                </div>
                <!--<div class="col-sm-2">
                    <select class="form-control" style="width:100%">
                        <option value="">--Seleccionar--</option>
                        <option value="12">A+</option>
                        <option value="11">A</option>
                        <option value="10">A-</option>
                        <option value="9">B+</option>
                        <option value="8">B</option>
                        <option value="7">B-</option>
                        <option value="6">C+</option>
                        <option value="5">C</option>
                        <option value="4">C-</option>
                        <option value="3">D+</option>
                        <option value="2">D</option>
                        <option value="1">D-</option>
                    </select>
                </div>-->
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
                    <asp:DropDownList class="form-control" ID="ddlPorcentajeOficinas" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"
                                      AutoPostBack="true" OnSelectedIndexChanged="ddlPorcentajeOficinas_Change"></asp:DropDownList>
                </div>
                <!---<div class="col-sm-2">
                    <select class="form-control" style="width:100%">
                        <option value="">--Seleccionar--</option>
                        <option value="1">95 %</option>
                        <option value="2">90 %</option>
                        <option value="3">85 %</option>
                        <option value="4">80 %</option>
                        <option value="5">75 %</option>
                        <option value="6">70 %-</option>
                        <option value="7">65 %</option>
                        <option value="8">60 %</option>
                        <option value="9">55 %-</option>
                    </select>
                </div>-->
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
                    <asp:DropDownList class="form-control" ID="ddlIndicadorDeudaFSD" runat="server" DataValueField="IdParametroValor" DataTextField="Nombre"
                                      AutoPostBack="true" OnSelectedIndexChanged="ddlIndicadorDeudaFSD_Change"></asp:DropDownList>
                </div>
                <!--<div class="col-sm-2">
                    <select class="form-control" style="width:100%">
                        <option value="">--Seleccionar--</option>
                        <option value="1">SI</option>
                        <option value="2">NO</option>
                    </select>
                </div>-->
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
            <table id="order-listing" class="table">
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
                    <tr>
                        <td>2</td>
                        <td>Banco de Crédito del Perú</td>
                        <td>A+</td>
                        <td>90%</td>
                        <td>NO</td>
                        <td>
                          <label class="badge badge-success">APTO</label>
                        </td>
                        <td>
                          <button class="btn btn-outline-primary">VER DETALLES</button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Banco Pichincha</td>
                        <td>A+</td>
                        <td>90%</td>
                        <td>NO</td>
                        <td>
                          <label class="badge badge-success">APTO</label>
                        </td>
                        <td>
                          <button class="btn btn-outline-primary">VER DETALLES</button>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Interbank</td>
                        <td>A+</td>
                        <td>80%</td>
                        <td>NO</td>
                        <td>
                          <label class="badge badge-success">APTO</label>
                        </td>
                        <td>
                          <button class="btn btn-outline-primary">VER DETALLES</button>
                        </td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>BBVA</td>
                        <td>A+</td>
                        <td>95%</td>
                        <td>NO</td>
                        <td>
                          <label class="badge badge-success">APTO</label>
                        </td>
                        <td>
                          <button class="btn btn-outline-primary">VER DETALLES</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
</asp:Content>