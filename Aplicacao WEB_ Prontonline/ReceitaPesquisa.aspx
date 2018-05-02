<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReceitaPesquisa.aspx.cs" Inherits="ReceitaPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
		<h1 class="Titulo">MINHAS RECEITAS MÉDICAS</h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server">

                </asp:SqlDataSource>

                <div class="col-md-4 align-left">
                <asp:Label ID="Label1" runat="server" Text="Pesquisar nome médico"></asp:Label>
                <asp:TextBox ID="TextBoxNome" runat="server" Width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
                <div class="col-md-4">
                <asp:Button ID="Button1" runat="server" Text="Buscar" class="ConfButton2" OnClick="Button1_Click"/>
                </div>

                <asp:GridView ID="GridView1" runat="server">

                </asp:GridView>

            </ContentTemplate>
        </asp:UpdatePanel>


    </div>

    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar" class="ConfButton" OnClick="Button2_Click"/>
        </div>
    </div>
</asp:Content>

