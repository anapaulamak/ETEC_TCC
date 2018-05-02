<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RemediosPesquisa.aspx.cs" Inherits="ReceitasPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
    <h1 class="Titulo">MEUS REMÉDIOS</h1>      
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
                    DeleteCommand="DELETE FROM [tb_remedios] WHERE [id_remedio] = @id_remedio" 
                    InsertCommand="INSERT INTO [tb_remedios] ([id_usuario], [nome], [dosagem], [dataInicio], [dataFim]) VALUES (@id_usuario, @nome, @dosagem, @dataInicio, @dataFim)" 
                    SelectCommand="SELECT * FROM [tb_remedios] WHERE ([nome] LIKE '%' + @nome + '%')" 
                    UpdateCommand="UPDATE [tb_remedios] SET [id_usuario] = @id_usuario, [nome] = @nome, [dosagem] = @dosagem, [dataInicio] = @dataInicio, [dataFim] = @dataFim WHERE [id_remedio] = @id_remedio">
                    
<%--                    Só pegar os registros do Id UserId
                    SelectCommand="SELECT * FROM [tb_remedios] WHERE ([nome] LIKE '%' + @nome + '%') and id_usuario=@id_usuario" --%>

                    <DeleteParameters>
                        <asp:Parameter Name="id_remedio" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_usuario" Type="Int32" />
                        <asp:Parameter Name="nome" Type="String" />
                        <asp:Parameter Name="dosagem" Type="String" />
                        <asp:Parameter DbType="Date" Name="dataInicio" />
                        <asp:Parameter DbType="Date" Name="dataFim" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBoxNomeRemedio" Name="nome" PropertyName="Text" />
                        <asp:SessionParameter Name="id_usuario" SessionField="UserId" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_usuario" Type="Int32" />
                        <asp:Parameter Name="nome" Type="String" />
                        <asp:Parameter Name="dosagem" Type="String" />
                        <asp:Parameter DbType="Date" Name="dataInicio" />
                        <asp:Parameter DbType="Date" Name="dataFim" />
                        <asp:Parameter Name="id_remedio" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <div class="col-md-4 align-left">
                <asp:Label ID="Label1" runat="server" Text="Pesquisar nome do Remédio"></asp:Label>
                <asp:TextBox ID="TextBoxNomeRemedio" runat="server" width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
                <div class="col-md-4">
                <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" OnClick="ButtonBuscar_Click"/>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_remedio" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id_remedio" HeaderText="id_remedio" SortExpression="id_remedio" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                        <asp:BoundField DataField="dosagem" HeaderText="dosagem" SortExpression="dosagem" />
                        <asp:BoundField DataField="dataInicio" HeaderText="dataInicio" SortExpression="dataInicio" />
                        <asp:BoundField DataField="dataFim" HeaderText="dataFim" SortExpression="dataFim" />
                        <asp:CommandField ButtonType="Button" />
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
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
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" class="ConfButton" OnClick="ButtonVoltar_Click" />
        </div>
    </div>

</asp:Content>

