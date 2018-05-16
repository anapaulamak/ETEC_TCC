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
                SelectCommand="SELECT * FROM [tb_statusSaude] WHERE ([id_usuario] = @id_usuario) AND mes=@mes AND ano=@ano" 
                UpdateCommand="UPDATE [tb_statusSaude] SET [id_usuario] = @id_usuario, [dataStatus] = @dataStatus, [colesterol] = @colesterol, [glicemia] = @glicemia, [peso] = @peso, [altura] = @altura WHERE [id_saude] = @id_saude" >

                <DeleteParameters>
                    <asp:Parameter Name="id_saude" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="dataStatus" />
                    <asp:Parameter Name="colesterol" Type="Decimal" />
                    <asp:Parameter Name="glicemia" Type="Decimal" />
                    <asp:Parameter Name="peso" Type="Decimal" />
                    <asp:Parameter Name="altura" Type="Decimal" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="id_usuario" SessionField="IdUsuario" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownListMeses" Name="mes" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBoxAno" Name="ano" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="dataStatus" />
                    <asp:Parameter Name="colesterol" Type="Decimal" />
                    <asp:Parameter Name="glicemia" Type="Decimal" />
                    <asp:Parameter Name="peso" Type="Decimal" />
                    <asp:Parameter Name="altura" Type="Decimal" />
                    <asp:Parameter Name="id_saude" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

    <div class="row">
        <div class="col-md-5 align-left">
        <asp:Label ID="LabelMes" runat="server" Text="Pesquisar por Mês" ></asp:Label>
        <asp:DropDownList ID="DropDownListMeses" runat="server" Width="90%" class="ConfTextBox">
                <asp:ListItem Value="Janeiro">Janeiro</asp:ListItem>
                <asp:ListItem Value="Fevereiro">Fevereiro</asp:ListItem>
                <asp:ListItem Value="Março">Março</asp:ListItem>
                <asp:ListItem Value="Abril">Abril</asp:ListItem>
                <asp:ListItem Value="Maio">Maio</asp:ListItem>
                <asp:ListItem Value="Junho">Junho</asp:ListItem>
                <asp:ListItem Value="Julho">Julho</asp:ListItem>
                <asp:ListItem Value="Agosto">Agosto</asp:ListItem>
                <asp:ListItem Value="Setembro">Setembro</asp:ListItem>
                <asp:ListItem Value="Outubro">Outubro</asp:ListItem>
                <asp:ListItem Value="Novembro">Novembro</asp:ListItem>
                <asp:ListItem Value="Dezembro">Dezembro</asp:ListItem>
            </asp:DropDownList>
        <asp:Label ID="LabelANo" runat="server" Text="Pesquisar por Ano"></asp:Label>
        <asp:TextBox ID="TextBoxAno" runat="server" Width="90%" class="ConfTextBox" MaxLength="4"></asp:TextBox>        
        </div>
        <div class="col-md-3">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Width="80%" OnClick="ButtonBuscar_Click" />
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_saude" DataSourceID="SqlDataSource1" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id_saude" HeaderText="id_saude" InsertVisible="False" ReadOnly="True" SortExpression="id_saude" />
                <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" />
                <asp:BoundField DataField="colesterol" HeaderText="colesterol" SortExpression="colesterol" />
                <asp:BoundField DataField="glicemia" HeaderText="glicemia" SortExpression="glicemia" />
                <asp:BoundField DataField="peso" HeaderText="peso" SortExpression="peso" />
                <asp:BoundField DataField="altura" HeaderText="altura" SortExpression="altura" />
                <asp:BoundField DataField="mes" HeaderText="mes" SortExpression="mes" />
                <asp:BoundField DataField="ano" HeaderText="ano" SortExpression="ano" />
                <asp:CommandField DeleteText="Apagar" ShowDeleteButton="True" />
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
            <br />
            <asp:Button ID="Button2" runat="server" Text="Voltar" OnClick="Button2_Click" class="ConfButton"/>
        </div>
    </div>
</asp:Content>

