<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsultaMedicaPesquisa.aspx.cs" Inherits="ConsultaMedicaPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">		   
    <div class="row">
        <h1 class="Titulo">MINHAS CONSULTAS MÉDICAS</h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
                    DeleteCommand="DELETE FROM [tb_consulta] WHERE [id_consulta] = @id_consulta" 
                    InsertCommand="INSERT INTO [tb_consulta] ([id_medico], [id_especialidade], [id_usuario], [data], [motivo], [diagnostico], [recomendacoes], [obs]) VALUES (@id_medico, @id_especialidade, @id_usuario, @data, @motivo, @diagnostico, @recomendacoes, @obs)" 
                    SelectCommand="SELECT * FROM [tb_consulta] WHERE ([id_usuario] = @id_usuario) and ([motivo] LIKE '%' + @motivo + '%') " 
                    UpdateCommand="UPDATE [tb_consulta] SET [id_medico] = @id_medico, [id_especialidade] = @id_especialidade, [id_usuario] = @id_usuario, [data] = @data, [motivo] = @motivo, [diagnostico] = @diagnostico, [recomendacoes] = @recomendacoes, [obs] = @obs WHERE [id_consulta] = @id_consulta">

                    <DeleteParameters>
                        <asp:Parameter Name="id_consulta" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_medico" Type="Int32" />
                        <asp:Parameter Name="id_especialidade" Type="Int32" />
                        <asp:Parameter Name="id_usuario" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="data" />
                        <asp:Parameter Name="motivo" Type="String" />
                        <asp:Parameter Name="diagnostico" Type="String" />
                        <asp:Parameter Name="recomendacoes" Type="String" />
                        <asp:Parameter Name="obs" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="id_usuario" SessionField="UserId" />
                        <asp:ControlParameter ControlID="TextBoxNomeConsulta" Name="motivo" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_medico" Type="Int32" />
                        <asp:Parameter Name="id_especialidade" Type="Int32" />
                        <asp:Parameter Name="id_usuario" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="data" />
                        <asp:Parameter Name="motivo" Type="String" />
                        <asp:Parameter Name="diagnostico" Type="String" />
                        <asp:Parameter Name="recomendacoes" Type="String" />
                        <asp:Parameter Name="obs" Type="String" />
                        <asp:Parameter Name="id_consulta" Type="Int32" />
                    </UpdateParameters>

                </asp:SqlDataSource>
                <div class="col-md-4 align-left">
                <asp:Label ID="Label3" runat="server" Text="Pesquisar pelos sintomas"></asp:Label>
                <asp:TextBox ID="TextBoxNomeConsulta" runat="server" Width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
                <div class="col-md-4">
                <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" OnClick="ButtonBuscar_Click"/>
                </div>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_consulta" DataSourceID="SqlDataSource1">

                    <Columns>
                        <asp:BoundField DataField="id_consulta" HeaderText="id_consulta" InsertVisible="False" ReadOnly="True" SortExpression="id_consulta" />
                        <asp:BoundField DataField="id_medico" HeaderText="id_medico" SortExpression="id_medico" />
                        <asp:BoundField DataField="id_especialidade" HeaderText="id_especialidade" SortExpression="id_especialidade" />
                        <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
                        <asp:BoundField DataField="motivo" HeaderText="motivo" SortExpression="motivo" />
                        <asp:BoundField DataField="diagnostico" HeaderText="diagnostico" SortExpression="diagnostico" />
                        <asp:BoundField DataField="recomendacoes" HeaderText="recomendacoes" SortExpression="recomendacoes" />
                        <asp:BoundField DataField="obs" HeaderText="obs" SortExpression="obs" />
                    </Columns>

                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>


    </div>

    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar"  class="ConfButton" Onclick="Button2_Click"/>
        </div>
    </div>

</asp:Content>

