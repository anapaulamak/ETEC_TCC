<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StatusSaude.aspx.cs" Inherits="Receitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="FormStatusSaude" runat="server">
        <br />
        <div class="row">
            <div class="col-6">
                <h1 class="Titulo">STATUS SAÚDE</h1>
            </div>
            <div class="col-6"></div>
        </div>
            
        <div class="row">
            <div class="col-11">
                <fieldset>      
                    <div class="row">
                        <div class="col-2">
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:Label ID="Label2" runat="server" Text="Peso"></asp:Label>
                                </div>
                                <br />
                            </div>
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:TextBox ID="TextBoxPeso" runat="server" Width="80%"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="col-2">
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:Label ID="Label3" runat="server" Text="Altura"></asp:Label>
                                </div>
                                <br />
                            </div>
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:TextBox ID="TextBoxAltura" runat="server" Width="80%"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="col-2">
                            <br />                  
                            <asp:Button ID="ButtonCalcularIMC" runat="server" Text="Calcular" class="ConfButton2" Width="70%" OnClick="ButtonCalcularIMC_Click"/>
                        </div>

                        <div class="col-2"> 
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:Label ID="Label4" runat="server" Text="IMC"></asp:Label>
                                </div>
                                <br />
                            </div>
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:TextBox ID="TextBoxIMC" runat="server" Width="80%"></asp:TextBox>
					            </div>
                                <br />
                            </div>
                        </div>

                        <div class="col-2">
                            <div class="row">
                                <div class="col-12"> 
                                <br />
                                </div>
                            </div>
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:Label ID="LabelIMC" runat="server"></asp:Label>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>       
                </fieldset>
            <br />
            </div>
        </div>

        <div class="row">
            <br />
            <div class="col-11">
                <fieldset>
                    <div class="row">
					    <div class="col-12 align-left">
                            <asp:Label ID="Label8" runat="server" Text="Nível Colesterol"></asp:Label>
                        </div>
                        <br />
                    </div>

                    <div class="row">
                        <div class="col-2">
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:TextBox ID="TextBoxColesterol" runat="server" Width="80%"></asp:TextBox>
                                </div>
                                 <br />
                            </div>
                        </div>

                        <div class="col-3 align-left">
                            <asp:Button ID="ButtonColesterol" runat="server" Text="Mostrar" class="ConfButton2" Width="80%" OnClick="ButtonColesterol_Click"/>
                        </div>

                        <div class="col-6">
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:Label ID="LabelColesterol" runat="server" Text=""></asp:Label>
                                </div>
                                 <br />
                            </div>
                        </div>
                    </div>

                    <div class="row">
					    <div class="col-12 align-left">
                            <asp:Label ID="Label9" runat="server" Text="Nível Glicemia"></asp:Label>
                        </div>
                        <br />
                    </div>

                    <div class="row">
                        <div class="col-2">
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:TextBox ID="TextBoxGlicemia" runat="server" Width="80%" ></asp:TextBox>
                                </div>
                                 <br />
                            </div>
                        </div>

                        <div class="col-3 align-left">
                            <asp:Button ID="ButtonGlicemia" runat="server" Text="Mostrar" CssClass="ConfButton2" Width="80%" Onclick="ButtonGlicemia_Click"/>
                        </div>

                        <div class="col-6">
                            <div class="row">
					            <div class="col-12 align-left">
                                    <asp:Label ID="LabelGlicemia" runat="server" Text=""></asp:Label> 
                                </div>
                                 <br />
                            </div>
                        </div>
                    </div>  
  
				</fieldset>       
            </div>

        </div>

        <div class="row">
            <br />
            <br />
            <div class="col-5"></div>
            <div class="col-2">
                <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" class="ConfButton" onClick="ButtonSalvar_Click"/>
            </div>    
            <div class="col-1"></div>
            <div class="col-3">
                <asp:Button ID="ButtonMeusStatus" runat="server" Text="Meus Status Saúde" class="ConfButton" OnClick="ButtonMeusStatus_Click"/>
            </div>  
        </div>
    </div>
</asp:Content>

