<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StatusSaudePesquisa.aspx.cs" Inherits="StatusSaudePesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1 class="Titulo">MEUS STATUS SAÚDE</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
                DeleteCommand="DELETE FROM [tb_statusSaude] WHERE [id_saude] = @id_saude" 
                InsertCommand="INSERT INTO [tb_statusSaude] ([id_usuario], [dataStatus], [colesterol], [glicemia], [peso], [altura]) VALUES (@id_usuario, @dataStatus, @colesterol, @glicemia, @peso, @altura)" 
                SelectCommand="SELECT * FROM [tb_statusSaude] WHERE ([id_usuario] = @id_usuario) and dataStatus=@dataStatus" 
                UpdateCommand="UPDATE [tb_statusSaude] SET [id_usuario] = @id_usuario, [dataStatus] = @dataStatus, [colesterol] = @colesterol, [glicemia] = @glicemia, [peso] = @peso, [altura] = @altura WHERE [id_saude] = @id_saude">

                <DeleteParameters>
                    <asp:Parameter Name="id_saude" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="DateTime" />
                    <asp:Parameter Name="colesterol" Type="Decimal" />
                    <asp:Parameter Name="glicemia" Type="Decimal" />
                    <asp:Parameter Name="peso" Type="Decimal" />
                    <asp:Parameter Name="altura" Type="Decimal" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="id_usuario" SessionField="IdUsuario" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBoxNome" Name="dataStatus" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="DateTime" />
                    <asp:Parameter Name="colesterol" Type="Decimal" />
                    <asp:Parameter Name="glicemia" Type="Decimal" />
                    <asp:Parameter Name="peso" Type="Decimal" />
                    <asp:Parameter Name="altura" Type="Decimal" />
                    <asp:Parameter Name="id_saude" Type="Int32" />
                </UpdateParameters>

            </asp:SqlDataSource>

    <div class="row">
        <div class="col-md-5 align-left">
        <asp:Label ID="Label1" runat="server" Text="Pesquisar por data"></asp:Label>
        <asp:TextBox ID="TextBoxNome" runat="server" TextMode="Date"  Width="90%" class="ConfTextBox">Digite data do Status Saúde</asp:TextBox>               
        </div>
        <div class="col-md-3">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Width="80%" OnClick="Button1_Click" />
        </div>
    </div>

    <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_saude" DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" Visible="False" />
                    <asp:BoundField DataField="id_saude" HeaderText="id_saude" InsertVisible="False" ReadOnly="True" SortExpression="id_saude" Visible="False" />
                    <asp:BoundField DataField="dataStatus" HeaderText="Data de Registro" SortExpression="dataStatus" />
                    <asp:BoundField DataField="colesterol" HeaderText="Nível Colesterol" SortExpression="colesterol" />
                    <asp:BoundField DataField="glicemia" HeaderText="Nível Glicemia" SortExpression="glicemia" />
                    <asp:BoundField DataField="peso" HeaderText="Peso" SortExpression="peso" />
                    <asp:BoundField DataField="altura" HeaderText="Altura" SortExpression="altura" />
                    <asp:CommandField ButtonType="Button" DeleteText="Apagar" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
    </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <br />
            <asp:Button ID="Button2" runat="server" Text="Voltar" OnClick="Button2_Click" class="ConfButton"/>
        </div>
    </div>
</asp:Content>

