<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StatusSaude.aspx.cs" Inherits="Receitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="FormStatusSaude" runat="server">
        <h1 class="Titulo">STATUS SAÚDE</h1>
            
        <div class="row">
            <div class="col-md-2 align-left">
                <asp:Label ID="Label2" runat="server" Text="Peso"></asp:Label>
                <asp:TextBox ID="TextBoxPeso" runat="server" Width="90%" class="ConfTextArea"></asp:TextBox>
            </div>

            <div class="col-md-2 align-left">
                <asp:Label ID="Label3" runat="server" Text="Altura"></asp:Label>
                <asp:TextBox ID="TextBoxAltura" runat="server" Width="90%" class="ConfTextArea"></asp:TextBox>
            </div>

            <div class="col-md-2 align-left">            
                <asp:Button ID="ButtonCalcularIMC" runat="server" Text="Calcular" class="ConfButton2" Width="90%" OnClick="ButtonCalcularIMC_Click"/>
            </div>

            <div class="col-md-2 align-left"> 
                <asp:Label ID="Label4" runat="server" Text="IMC"></asp:Label>
                <asp:TextBox ID="TextBoxIMC" runat="server" Width="90%" class="ConfTextArea"></asp:TextBox>
            </div>

            <div class="col-md-4 align-left">
                <br />
                <asp:Label ID="LabelIMC" runat="server" Width="100%" ></asp:Label>
            </div>       
        </div>

        <div class="row">
            <div class="col-md-4 align-left">
                <asp:Label ID="Label8" runat="server" Text="Nível Colesterol"></asp:Label>
                <asp:TextBox ID="TextBoxColesterol" runat="server" Width="90%" class="ConfTextBox"></asp:TextBox>
            </div>

            <div class="col-md-2 align-left">
                <asp:Button ID="ButtonColesterol" runat="server" Text="Mostrar" class="ConfButton2" Width="90%" OnClick="ButtonColesterol_Click"/>
            </div>

            <div class="col-md-6 align-left">
                <br />
                <asp:Label ID="LabelColesterol" runat="server" Text="" Width="100%" ></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 align-left">
                <asp:Label ID="Label9" runat="server" Text="Nível Glicemia"></asp:Label>
                <asp:TextBox ID="TextBoxGlicemia" runat="server" Width="90%" class="ConfTextBox" ></asp:TextBox>
            </div>

            <div class="col-md-2 align-left">
                <asp:Button ID="ButtonGlicemia" runat="server" Text="Mostrar" CssClass="ConfButton2" Width="90%" Onclick="ButtonGlicemia_Click"/>
            </div>

            <div class="col-md-6 align-left">
                <br />
                <asp:Label ID="LabelGlicemia" runat="server" Text="" Width="100%"></asp:Label> 
            </div>     
        </div>

        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-3">
                <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" class="ConfButton" Width="90%" onClick="ButtonSalvar_Click"/>
            </div>    
            <div class="col-md-3">
                <asp:Button ID="ButtonMeusStatus" runat="server" Text="Meus Status Saúde" class="ConfButton" Width="90%" OnClick="ButtonMeusStatus_Click"/>
            </div>  
        </div>
    </div>
</asp:Content>

