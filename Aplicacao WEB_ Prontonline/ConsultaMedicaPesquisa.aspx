<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsultaMedicaPesquisa.aspx.cs" Inherits="ConsultaMedicaPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    <div class="row">
        <div class="col-6">
            <br />
		    <h1 class="Titulo">MINHAS CONSULTAS MÉDICAS</h1>
            <br />
        </div>
    </div>   

    <div class="row">
        <div class="col-2 align-left">
        <asp:Label ID="Label3" runat="server" Text="Pesquisar pelos sintomas"></asp:Label>
        </div>
        <div class="col-4">
        <asp:TextBox ID="TextBoxNome" runat="server" Width="100%"></asp:TextBox>
        </div>
        <div class="col-1"></div>
        <div class="col-3">
        <asp:Button ID="Button1" runat="server" Text="Buscar" class="ConfButton2" OnClick="Button1_Click"/>
        </div>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-11 align-left">
            <asp:Label ID="Label2" runat="server" Text="Resultado da Pesquisa"></asp:Label>
            <br /><br />
            <asp:DataGrid ID="DataGrid1" runat="server" CssClass="ConfGridView" AutoGenerateColumns="False" OnDeleteCommand="DataGrid1_DeleteCommand" OnEditCommand="DataGrid1_EditCommand" OnUpdateCommand="DataGrid1_UpdateCommand" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" PageSize="5">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundColumn DataField="id_usuario" HeaderText="IDusuario" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="id_consulta" HeaderText="IDconsulta" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="data" HeaderText="Data da Consulta"></asp:BoundColumn>
                    <asp:BoundColumn DataField="nome" HeaderText="Médico"></asp:BoundColumn>
                    <asp:BoundColumn DataField="motivo" HeaderText="Motivo"></asp:BoundColumn>
                    <asp:BoundColumn DataField="diagnostico" HeaderText="Diagnóstico"></asp:BoundColumn>
                    <asp:BoundColumn DataField="recomendacoes" HeaderText="Recomendações"></asp:BoundColumn>
                    <asp:BoundColumn DataField="obs" HeaderText="Outras Observações"></asp:BoundColumn>
                    <asp:ButtonColumn CommandName="Delete" HeaderText="Excluir" Text="Excluir"> </asp:ButtonColumn>
                    <asp:EditCommandColumn CancelText="Cancelar" EditText="Editar" HeaderText="Editar" UpdateText="Atualizar"></asp:EditCommandColumn>
                </Columns>
                <EditItemStyle BackColor="#999999" />
                <FooterStyle BackColor="#002966" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#002966" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" />
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataGrid>
        </div>
    </div>

    <div class="row">
        <div class="col-10"></div>
        <div class="col-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar"  class="ConfButton" Onclick="Button2_Click"/>
        </div>
    </div>

</asp:Content>

