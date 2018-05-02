<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdicionarMedico.aspx.cs" Inherits="AdicionarMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<section class="row">
	<h1 class="Titulo">ADICIONAR NOVO MÉDICO</h1>

    <div class="row">
        <div class="col-md-6 align-left">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Nome Médico"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxNomeMedico" runat="server" Width="90%"></asp:TextBox>
            </div>

            <div>
                <asp:Label ID="Label2" runat="server" Text="CRM"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxCRM" runat="server" Width="90%"></asp:TextBox>
            </div>
		</div>

        <div class="col-md-6 align-left">
            <asp:Button ID="ButtonAdicionar" runat="server" Text="Adicionar" CssClass="ConfButton2" Width="50%" onclick="ButtonAdicionar_Click"/>
        </div>
    </div>

    <div class="row">
        <div class="col-8"></div>
        <div class="col-4">
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" CssClass="ConfButton" OnClick="ButtonVoltar_Click"/>
        </div>
    </div>
</section>

</asp:Content>