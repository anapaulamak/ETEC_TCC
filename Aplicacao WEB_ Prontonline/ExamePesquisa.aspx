﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExamePesquisa.aspx.cs" Inherits="ExamesPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-6">
            <br />
		    <h1 class="Titulo">MEUS EXAMES</h1>
            <br />
        </div>
    </div>
       
    <div class="row">
        <div class="col-3 align-left">
        <asp:Label ID="Label1" runat="server" Text="Pesquisar por nome de exame"></asp:Label>
        </div>
        <div class="col-4">
        <asp:TextBox ID="TextBoxNome" runat="server" Width="100%"></asp:TextBox>
        </div>
        <div class="col-3">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" OnClick="Button1_Click"/>
        </div>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-7 align-left">
            <asp:Label ID="Label2" runat="server" Text="Resultado da Pesquisa"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
            
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            
            
<%--            <asp:DataGrid ID="DataGrid1" runat="server" CssClass="ConfGridView" AutoGenerateColumns="False" OnDeleteCommand="DataGrid1_DeleteCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
<%--                OnEditCommand="DataGrid1_EditCommand" OnUpdateCommand="DataGrid1_UpdateCommand"--%>
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundColumn DataField="id_exame" HeaderText="Registro" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="consulta" HeaderText="Consulta"></asp:BoundColumn>
                    <asp:BoundColumn DataField="data" HeaderText="Data"></asp:BoundColumn>
                    <asp:BoundColumn DataField="nome" HeaderText="Nome Exame"></asp:BoundColumn>
                    <asp:BoundColumn DataField="tipoExame" HeaderText="Tipo de Exame"></asp:BoundColumn>
                    <asp:BoundColumn DataField="imagem" HeaderText="Imagem"></asp:BoundColumn>
                    <asp:ButtonColumn CommandName="Delete" HeaderText="Excluir" Text="Excluir"></asp:ButtonColumn>
                    <%--<asp:EditCommandColumn CancelText="Cancelar" EditText="Editar" HeaderText="Editar" UpdateText="Atualizar"></asp:EditCommandColumn>--%>
                </Columns>
                <EditItemStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataGrid>--%>
        </div>
    </div>

    <div class="row">
        <div class="col-10"></div>
        <div class="col-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar" OnClick="Button2_Click" class="ConfButton"/>
        </div>
    </div>

</asp:Content>
