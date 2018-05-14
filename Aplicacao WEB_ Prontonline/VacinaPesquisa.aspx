<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VacinaPesquisa.aspx.cs" Inherits="VacinaPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<h1 class="Titulo">MINHAS VACINAS</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
                DeleteCommand="DELETE FROM [tb_vacina] WHERE [id_vacina] = @id_vacina" 
                InsertCommand="INSERT INTO [tb_vacina] ([id_tipoVacina], [id_usuario], [data]) VALUES (@id_tipoVacina, @id_usuario, @data)" 
                SelectCommand="SELECT tv.descricao, v.id_vacina, v.data, v.id_usuario
FROM tb_tipoVacina as tv join tb_vacina as v on tv.id_tipoVacina=v.id_tipoVacina
 WHERE ([descricao] LIKE '%' + @descricao + '%') and id_usuario=@id_usuario" 
                UpdateCommand="UPDATE [tb_vacina] SET [id_tipoVacina] = @id_tipoVacina, [id_usuario] = @id_usuario, [data] = @data WHERE [id_vacina] = @id_vacina">

                <DeleteParameters>
                    <asp:Parameter Name="id_vacina" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_tipoVacina" Type="Int32" />
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="data" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxNomeVacina" Name="descricao" PropertyName="Text" />
                    <asp:SessionParameter Name="id_usuario" SessionField="IdUsuario" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_tipoVacina" Type="Int32" />
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="data" />
                    <asp:Parameter Name="id_vacina" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        <div class="row">
            <div class="col-md-5 align-left">
            <asp:Label ID="Label1" runat="server" Text="Pesquisar pelo nome da Vacinas"></asp:Label>
            <asp:TextBox ID="TextBoxNomeVacina" runat="server" Width="90%" class="ConfTextBox"></asp:TextBox>
            </div>
            <div class="col-md-3">
            <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Width="80%" OnClick="ButtonBuscar_Click"/>
            </div>
        </div>

        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="id_vacina" Width="100%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" Visible="False" />
                    <asp:BoundField DataField="id_vacina" HeaderText="id_vacina" InsertVisible="False" ReadOnly="True" SortExpression="id_vacina" Visible="False" />
                    <asp:BoundField DataField="descricao" HeaderText="Descricao" SortExpression="descricao" />
                    <asp:BoundField DataField="data" HeaderText="Data da Aplicação" SortExpression="data" />
                    <asp:CommandField ButtonType="Button" DeleteText="Apagar" ShowDeleteButton="True" ShowEditButton="True" />
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
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" class="ConfButton" OnClick="ButtonVoltar_Click"/>
        </div>
    </div>

</asp:Content>

