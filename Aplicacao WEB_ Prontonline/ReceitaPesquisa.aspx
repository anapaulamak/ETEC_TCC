<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReceitaPesquisa.aspx.cs" Inherits="ReceitaPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<h1 class="Titulo">MINHAS RECEITAS MÉDICAS</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
                DeleteCommand="DELETE FROM [tb_receita] WHERE [id_receita] = @id_receita" 
                InsertCommand="INSERT INTO [tb_receita] ([id_consulta], [nome], [data]) VALUES (@id_consulta, @nome, @data)" 
                SelectCommand="Select r.id_receita, r.id_consulta, r.nome, r.data 
from tb_receita as r join tb_consulta as c on r.id_consulta=c.id_consulta
join tb_usuario as u on c.id_usuario=u.id_usuario
 where u.id_usuario=@usuario and ([nome] LIKE '%' + @nome + '%')" 
                UpdateCommand="UPDATE [tb_receita] SET [id_consulta] = @id_consulta, [nome] = @nome, [data] = @data WHERE [id_receita] = @id_receita">

                <DeleteParameters>
                    <asp:Parameter Name="id_receita" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_consulta" Type="Int32" />
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter DbType="Date" Name="data" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="usuario" SessionField="IdUsuario" />
                    <asp:ControlParameter ControlID="TextBoxNomeReceita" Name="nome" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_consulta" Type="Int32" />
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter DbType="Date" Name="data" />
                    <asp:Parameter Name="id_receita" Type="Int32" />
                </UpdateParameters>

            </asp:SqlDataSource>

    <div class="row">
        <div class="col-md-5 align-left">
            <asp:Label ID="Label1" runat="server" Text="Pesquisar pelo Nome da Receita"></asp:Label>
            <asp:TextBox ID="TextBoxNomeReceita" runat="server" Width="90%" class="ConfTextBox"></asp:TextBox>
        </div>
        <div class="col-md-3">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Onclick="ButtonBuscar_Click" />
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="id_receita" Width="100%">

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id_receita" HeaderText="id_receita" InsertVisible="False" ReadOnly="True" SortExpression="id_receita" Visible="False" />
                <asp:BoundField DataField="id_consulta" HeaderText="id_consulta" SortExpression="id_consulta" Visible="False" />
                <asp:BoundField DataField="nome" HeaderText="Nome da Receita" SortExpression="nome" />
                <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" />
                <asp:CommandField ButtonType="Button" DeleteText="Apagar" ShowDeleteButton="True" />
                <asp:HyperLinkField DataNavigateUrlFields="id_receita" DataNavigateUrlFormatString="Receita.aspx?id_receita={0}" Text="Editar" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

        </asp:GridView>
    </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar" class="ConfButton" OnClick="Button2_Click"/>
        </div>
    </div>
</asp:Content>

