<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MensagemPesquisa.aspx.cs" Inherits="MensagemPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="row">
        <div class="col-6">
            <br />
		    <h1 class="Titulo">MINHAS MENSAGEM</h1>
            <br />
        </div>
    </div>
    
    <div class="row">
        <div class="col-2 align-left">
            <asp:Label ID="Label1" runat="server" Text="Pesquisar por título"></asp:Label>
        </div>
        <div class="col-4">
            <asp:TextBox ID="TextBoxNome" runat="server" Width="100%"></asp:TextBox>
        </div>
        <div class="col-4">
            <asp:Button ID="Button1" runat="server" Text="Buscar" class="ConfButton2" Width="80%" OnClick="Button1_Click"/>
        </div>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-11 align-left">
            <asp:Label ID="Label2" runat="server" Text="Resultado da Pesquisa"></asp:Label>
            <asp:DataGrid ID="DataGrid1" runat="server" CssClass="ConfGridView" AutoGenerateColumns="False" OnDeleteCommand="DataGrid1_DeleteCommand" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <Columns>
<%--                    <asp:BoundColumn DataField="id_usuario" HeaderText="Registro" Visible="False"></asp:BoundColumn>--%>
                    <asp:BoundColumn DataField="id_mensagem" HeaderText="Registro" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="dataEnvio" HeaderText="Data de Envio"></asp:BoundColumn>
                    <asp:BoundColumn DataField="tipoMensagem" HeaderText="Tipo da Mensagem"></asp:BoundColumn>
                    <asp:BoundColumn DataField="titulo" HeaderText="Assunto"></asp:BoundColumn>
                    <asp:BoundColumn DataField="mensagem" HeaderText="Mensagem"></asp:BoundColumn>
<%--                    <asp:BoundColumn DataField="resposta" HeaderText="Resposta"></asp:BoundColumn>
                    <asp:BoundColumn DataField="dataResposta" HeaderText="Data da Resposta"></asp:BoundColumn>--%>
                    <asp:BoundColumn DataField="situacao" HeaderText="Situação"></asp:BoundColumn>
                    <asp:ButtonColumn CommandName="Delete" HeaderText="Excluir" Text="Excluir"></asp:ButtonColumn>
                    <asp:ButtonColumn CommandName="Select" HeaderText="Resposta" Text="Ver Resposta"></asp:ButtonColumn>
                </Columns>
                <EditItemStyle BackColor="#999999" />
                <FooterStyle BackColor="#002966" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#002966" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataGrid>
        </div>
    </div>

    <div class="row">
        <div class="col-10"></div>
        <div class="col-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar" class="ConfButton" OnClick="Button2_Click"/>
        </div>
    </div>
</asp:Content>

