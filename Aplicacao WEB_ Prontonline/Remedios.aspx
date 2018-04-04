<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Remedios.aspx.cs" Inherits="Remedios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-6">
            <br />
            <h1 class="Titulo">MEUS REMÉDIOS</h1>
            <br />
        </div>
    </div>

    <div class="row">
        <div class="col-6">            
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="Label1" runat="server" Text="Nome do Remédio"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxRemedio" runat="server" width="90%"></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>

            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="Label2" runat="server" Text="Dosagem"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
                <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxDosagem" runat="server" width="90%"></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
        </div>

        <div class="col-6">
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="LabelDataInicio" runat="server" Text="Começou a tomar em: "></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxDataInicio" runat="server" TextMode="Date"></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>

            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="LabelDataFim" runat="server" Text="Parar de tomar em: "></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxDataFim" runat="server" TextMode="Date"></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
        </div>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-3"></div>
		<div class="col-3">
            <asp:Button ID="ButtonAdicionar" runat="server" Text="Salvar Agora" class="ConfButton" OnClick="ButtonAdicionar_Click" Width="90%" />
        </div>
		<div class="col-3">
            <asp:Button ID="ButtonAdicionarImagem" runat="server" Text="Adicionar Imagens" class="ConfButton" OnClick="ButtonAdicionarImagem_Click" />
        </div>
		<div class="col-3">
            <asp:Button ID="ButtonMeusRemedios" runat="server" Text="Meus Remedios" class="ConfButton" Width="90%" OnClick="ButtonMeusRemedios_Click" />
        </div>             
    </div>
</asp:Content>

