<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StatusSaudePesquisa.aspx.cs" Inherits="StatusSaudePesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
		<h1 class="Titulo">MEUS STATUS SAÚDE</h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server">

                </asp:SqlDataSource>

                    <div class="col-md-4 align-left">
                    <asp:Label ID="Label1" runat="server" Text="Pesquisar por data"></asp:Label>
                    <asp:TextBox ID="TextBoxNome" runat="server" TextMode="Date"  Width="100%" class="ConfTextBox">Digite data do Status Saúde</asp:TextBox>               
                    </div>
                    <div class="col-md-4">
                    <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Width="80%" OnClick="Button1_Click" />
                    </div>

                <asp:GridView ID="GridView1" runat="server"></asp:GridView>

            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="row">
            <div class="col-md-10"></div>
            <div class="col-md-2">
                <br />
                <asp:Button ID="Button2" runat="server" Text="Voltar" OnClick="Button2_Click" class="ConfButton"/>
            </div>
        </div>
    </div>

</asp:Content>

