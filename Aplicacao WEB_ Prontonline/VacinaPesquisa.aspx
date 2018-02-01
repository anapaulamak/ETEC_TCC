<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VacinaPesquisa.aspx.cs" Inherits="VacinaPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-6">
            <br />
		    <h1 class="Titulo">MINHAS VACINAS</h1>
            <br />
        </div>
    </div>
       
    <div class="row">
        <div class="col-2 align-left">
        <asp:Label ID="Label1" runat="server" Text="Pesquisar"></asp:Label>
        </div>
        <div class="col-4">
        <asp:TextBox ID="TextBoxNome" runat="server" Width="80%"></asp:TextBox>
        </div>
        <div class="col-4">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Width="80%" OnClick="ButtonBuscar_Click" />
        </div>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-7 align-left">
            <asp:Label ID="Label2" runat="server" Text="Resultado da Pesquisa"></asp:Label>
            <asp:DataGrid ID="DataGrid1" runat="server" CssClass="ConfGridView" Width="90%" AutoGenerateColumns="False" OnDeleteCommand="DataGrid1_DeleteCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                <%--OnEditCommand="DataGrid1_EditCommand" OnUpdateCommand="DataGrid1_UpdateCommand"--%>
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundColumn DataField="id_usuario" HeaderText="Registro" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="id_vacina" HeaderText="Registro" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="data" HeaderText="Data"></asp:BoundColumn>
                    <asp:BoundColumn DataField="descricao" HeaderText="Tipo Vacina"></asp:BoundColumn>
                    <asp:BoundColumn DataField="imagem" HeaderText="Imagem"></asp:BoundColumn>
                    <asp:ButtonColumn CommandName="Delete" HeaderText="Excluir" Text="Excluir"></asp:ButtonColumn>
<%--                    <asp:EditCommandColumn CancelText="Cancelar" EditText="Editar" UpdateText="Atualizar" HeaderText="Editar"></asp:EditCommandColumn>--%>
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
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" class="ConfButton" OnClick="ButtonVoltar_Click"/>
        </div>
    </div>

</asp:Content>

