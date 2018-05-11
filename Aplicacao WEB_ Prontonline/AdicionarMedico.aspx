<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdicionarMedico.aspx.cs" Inherits="AdicionarMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<section class="row">
	<h1 class="Titulo">ADICIONAR NOVO MÉDICO</h1>

    <div class="row">
        <div class="col-md-6 align-left">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Nome Médico"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxNomeMedico" runat="server" Width="90%" class="ConfTextBox"></asp:TextBox>
            </div>

            <div>
                <asp:Label ID="Label2" runat="server" Text="CRM"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxCRM" runat="server" Width="90%" class="ConfTextBox"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="ButtonAdicionar" runat="server" Text="Adicionar" CssClass="ConfButton2" Width="50%" onclick="ButtonAdicionar_Click"/>
            </div>
		</div>

        <div class="col-md-6 align-left">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" DeleteCommand="DELETE FROM [tb_medico] WHERE [id_medico] = @id_medico" InsertCommand="INSERT INTO [tb_medico] ([id_usuario], [CRM], [nome]) VALUES (@id_usuario, @CRM, @nome)" SelectCommand="SELECT * FROM [tb_medico] WHERE ([id_usuario] = @id_usuario)" UpdateCommand="UPDATE [tb_medico] SET [id_usuario] = @id_usuario, [CRM] = @CRM, [nome] = @nome WHERE [id_medico] = @id_medico">
                        <DeleteParameters>
                            <asp:Parameter Name="id_medico" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="id_usuario" Type="Int32" />
                            <asp:Parameter Name="CRM" Type="String" />
                            <asp:Parameter Name="nome" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="id_usuario" SessionField="IdUsuario" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="id_usuario" Type="Int32" />
                            <asp:Parameter Name="CRM" Type="String" />
                            <asp:Parameter Name="nome" Type="String" />
                            <asp:Parameter Name="id_medico" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_medico" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="136px" Width="432px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="id_medico" HeaderText="id_medico" InsertVisible="False" ReadOnly="True" SortExpression="id_medico" Visible="False" />
                            <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" Visible="False" />
                            <asp:BoundField DataField="nome" HeaderText="Nome Médico" SortExpression="nome" />
                            <asp:BoundField DataField="CRM" HeaderText="CRM" SortExpression="CRM" />
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Apagar" />
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
    </div>

    <div class="row">
        <div class="col-md-9"></div>
        <div class="col-md-3">
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" CssClass="ConfButton" OnClick="ButtonVoltar_Click"/>
        </div>
    </div>

</section>
</asp:Content>