<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StatusSaudePesquisa.aspx.cs" Inherits="StatusSaudePesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-6">
            <br />
		    <h1 class="Titulo">MEUS STATUS SAÚDE</h1>
            <br />
        </div>
    </div>
       
    <div class="row">
        <div class="col-2 align-left">
        <asp:Label ID="Label1" runat="server" Text="Pesquisar por data"></asp:Label>
        </div>
        <div class="col-4">
        <asp:TextBox ID="TextBoxNome" runat="server" TextMode="Date"  Width="60%">Digite data do Status Saúde</asp:TextBox>               
        </div>
        <div class="col-4">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Width="80%" OnClick="Button1_Click" />
        </div>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-7 align-left">
            <asp:Label ID="Label2" runat="server" Text="Resultado da Pesquisa"></asp:Label>
            <asp:DataGrid ID="DataGrid1" runat="server" CssClass="ConfGridView" AutoGenerateColumns="False" OnDeleteCommand="DataGrid1_DeleteCommand" OnEditCommand="DataGrid1_EditCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundColumn DataField="id_saude" HeaderText="Registro" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="dataStatus" HeaderText="Data"></asp:BoundColumn>
                    <asp:BoundColumn DataField="peso" HeaderText="Peso"></asp:BoundColumn>
                    <asp:BoundColumn DataField="altura" HeaderText="Altura"></asp:BoundColumn>
                    <asp:BoundColumn DataField="glicemia" HeaderText="Glicemia"></asp:BoundColumn>
                    <asp:BoundColumn DataField="colesterol" HeaderText="Colesterol"></asp:BoundColumn>
<%--                    <asp:BoundColumn DataField="alergias" HeaderText="Alergias"></asp:BoundColumn>
                    <asp:BoundColumn DataField="fraturas" HeaderText="Fraturas"></asp:BoundColumn>
                    <asp:BoundColumn DataField="cirurgias" HeaderText="Cirurgias"></asp:BoundColumn>--%>

<%--                    OBS: Não consigo exibir no mesm grid, ainda.--%>

                    <asp:ButtonColumn CommandName="Delete" HeaderText="Excluir" Text="Excluir"></asp:ButtonColumn>
                    <asp:EditCommandColumn CancelText="Cancelar" EditText="Editar" HeaderText="Editar" UpdateText="Atualizar"></asp:EditCommandColumn>
                </Columns>
                <EditItemStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataGrid>
        </div>
    </div>

    <div class="row">
        <div class="col-10"></div>
        <div class="col-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar" OnClick="Button2_Click" class="ConfButton"/>
        </div>
    </div>

</asp:Content>

