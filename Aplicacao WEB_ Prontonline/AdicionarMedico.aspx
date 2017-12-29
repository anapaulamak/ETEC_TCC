<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdicionarMedico.aspx.cs" Inherits="AdicionarMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<section class="row">
    <div class="col-7">
        <br />
		<h1 class="Titulo">ADICIONAR NOVO MÉDICO</h1>
        <br />
    </div>

    <div class="row">
        <div class="col-11">
            <fieldset>
                <div class="row">
                    <div class="col-1"></div>
				    <div class="col-10 align-left">
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Nome Médico"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-1"></div>
				    <div class="col-5 align-left">
                        <asp:TextBox ID="TextBoxNomeMedico" runat="server" Width="80%"></asp:TextBox>
                        <br />
                        <br />
				    </div>
                    <div class="col-5">
                        <asp:Button ID="ButtonAdicionar" runat="server" Text="Adicionar" CssClass="ConfButton2" onclick="ButtonAdicionar_Click"/>
                    </div>
                    <br />
                </div>
            </fieldset>
            <br />
            <br />
            <div class="row">
                <div class="col-8"></div>
                <div class="col-4">
                    <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" CssClass="ConfButton" OnClick="ButtonVoltar_Click"/>
                </div>
            </div>
            <br />
        </div>
    </div>
</section>

</asp:Content>