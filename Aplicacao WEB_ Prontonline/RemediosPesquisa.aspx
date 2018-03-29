<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RemediosPesquisa.aspx.cs" Inherits="ReceitasPesquisa" %>

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
        <div class="col-2 align-left">
        <asp:Label ID="Label1" runat="server" Text="Pesquisar nome do Remédio"></asp:Label>
        </div>
        <div class="col-4">
        <asp:TextBox ID="TextBoxNomeRemedio" runat="server" Width="100%"></asp:TextBox>
        </div>
        <div class="col-1"></div>
        <div class="col-3">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Onclick="ButtonBuscar_Click"/>
        </div>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-11 align-left">
            <asp:Label ID="Label2" runat="server" Text="Resultado da Pesquisa"></asp:Label>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="GridViewRemedios" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField HeaderText="Nome do Remédio" />
                <asp:BoundField HeaderText="Dosagem" />
                <asp:ImageField HeaderText="Rótulo do Remédio">
                </asp:ImageField>
                <asp:BoundField HeaderText="Data Início" />
                <asp:BoundField HeaderText="Data Fim" />
                <asp:ButtonField HeaderText="Editar" Text="Editar" />
            </Columns>
        </asp:GridView>
    </div>

    <div class="row">
        <div class="col-10"></div>
        <div class="col-2">
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" class="ConfButton" OnClick="ButtonVoltar_Click" />
        </div>
    </div>


</asp:Content>

