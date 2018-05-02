<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Mensagem.aspx.cs" Inherits="Memsagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <div class="row">    
        <h1 class="Titulo">ENVIAR MENSAGEM</h1>
        <asp:Label ID="LabelSituacao" runat="server" Text="1" Visible="False"></asp:Label>
		<div class="col-md-1"></div>
		<div class="col-md-10 align-left">
            <asp:Label ID="Label1" runat="server" Text="Tipo da mensagem"></asp:Label>
            <asp:DropDownList ID="DropDownListTipo" runat="server" width="100%" class="ConfTextBox">
                <asp:ListItem>Outros</asp:ListItem>
                <asp:ListItem>Dúvida</asp:ListItem>
                <asp:ListItem>Sugestão</asp:ListItem>
                <asp:ListItem>Comentário</asp:ListItem>
                <asp:ListItem>Reclamação</asp:ListItem>
            </asp:DropDownList>
        </div>
		<div class="col-md-1"></div>
    </div>

    <div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10 align-left">
            <asp:Label ID="LabelAssunto" runat="server" Text="Assunto da mensagem"></asp:Label>
            <asp:TextBox ID="TextBoxAssunto" runat="server" width="100%" class="ConfTextBox"></asp:TextBox>
        </div>
		<div class="col-md-1"></div>
        <br />
	</div>
            
    <div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10 align-left">
            <asp:Label ID="LabelMensagem" runat="server" Text="Mensagem"></asp:Label>
            <asp:TextBox ID="TextBoxMensagem" runat="server" TextMode="MultiLine" width="100%" class="ConfTextArea"></asp:TextBox>
        </div>
		<div class="col-md-1"></div>
        <br />
	</div>   
                
    <div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10 align-left">
            <asp:Label ID="LabelResposta" runat="server" Text="Resposta"></asp:Label>
            <asp:TextBox ID="TextBoxResposta" runat="server" TextMode="MultiLine" width="100%" class="ConfTextArea"></asp:TextBox>
        </div>
		<div class="col-md-1"></div>
        <br />
	</div>  
    
    <div class="row">
        <br />
        <div class="col-md-2"></div>
        <div class="col-md-4">
        <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar" class="ConfButton" OnClick="ButtonEnviar_Click"/>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-4">
        <asp:Button ID="ButtonMinhasMensagens" runat="server" Text="Minhas Mensagens" class="ConfButton" OnClick="ButtonMinhasMensagens_Click"/>
        </div>
    </div>

</asp:Content>

