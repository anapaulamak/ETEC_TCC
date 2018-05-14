<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExamePesquisa.aspx.cs" Inherits="ExamesPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<h1 class="Titulo">MEUS EXAMES</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
                DeleteCommand="DELETE FROM [tb_exame] WHERE [id_exame] = @id_exame" 
                InsertCommand="INSERT INTO [tb_exame] ([id_tipoExame], [id_consulta], [data], [nome]) VALUES (@id_tipoExame, @id_consulta, @data, @nome)" 
                SelectCommand="Select e.id_exame, e.data, e.nome as exame, te.nome 
from tb_exame as e join tb_tipoExame as te on e.id_tipoExame=te.id_tipoExame
join tb_consulta as c on e.id_consulta=c.id_consulta 
join tb_usuario as u on c.id_usuario=u.id_usuario
where u.id_usuario=@usuario and e.nome LIKE ('%' + @nome + '%')
" 
                UpdateCommand="UPDATE [tb_exame] SET [id_tipoExame] = @id_tipoExame, [id_consulta] = @id_consulta, [data] = @data, [nome] = @nome WHERE [id_exame] = @id_exame">
                <DeleteParameters>
                    <asp:Parameter Name="id_exame" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_tipoExame" Type="Int32" />
                    <asp:Parameter Name="id_consulta" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="data" />
                    <asp:Parameter Name="nome" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="usuario" SessionField="IdUsuario" />
                    <asp:ControlParameter ControlID="TextBoxNome" Name="nome" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_tipoExame" Type="Int32" />
                    <asp:Parameter Name="id_consulta" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="data" />
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="id_exame" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <div class="row">
        <div class="col-md-5 align-left">
        <asp:Label ID="Label1" runat="server" Text="Pesquisar por nome de exame"></asp:Label>
        <asp:TextBox ID="TextBoxNome" runat="server" Width="90%" class="ConfTextBox"></asp:TextBox>
        </div>
        <div class="col-md-3">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" onclick="ButtonBuscar_Click"/>
        </div>
    </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_exame" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id_exame" HeaderText="id_exame" InsertVisible="False" ReadOnly="True" SortExpression="id_exame" Visible="False" />
                    <asp:BoundField DataField="nome" HeaderText="Exame" SortExpression="nome" />
                    <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" />
                    <asp:BoundField DataField="exame" HeaderText="Descrição" SortExpression="exame" />
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
    <div class="row">
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar" OnClick="Button2_Click" class="ConfButton"/>
        </div>
    </div>

</asp:Content>

