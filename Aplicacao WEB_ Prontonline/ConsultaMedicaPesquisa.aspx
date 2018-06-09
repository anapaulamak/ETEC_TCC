<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsultaMedicaPesquisa.aspx.cs" Inherits="ConsultaMedicaPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">		   
    <h1 class="Titulo">MINHAS CONSULTAS MÉDICAS</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
                DeleteCommand="DELETE FROM [tb_consulta] WHERE [id_consulta] = @id_consulta" 
                InsertCommand="INSERT INTO [tb_consulta] ([id_medico], [id_especialidade], [id_usuario], [data], [motivo], [diagnostico], [recomendacoes], [obs]) VALUES (@id_medico, @id_especialidade, @id_usuario, @data, @motivo, @diagnostico, @recomendacoes, @obs)" 
                SelectCommand="SELECT  c.id_usuario, c.id_consulta, m.nome, esp.nome, c.data, c.diagnostico, c.motivo, c.recomendacoes, c.obs 
from tb_especialidade as esp 
join tb_consulta as c on esp.id_especialidade=c.id_especialidade
join tb_medico as m on m.id_medico=c.id_medico
join tb_usuario as u on c.id_usuario=u.id_usuario
WHERE u.id_usuario=@id_usuario and ([motivo] LIKE '%' + @motivo + '%')" 
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
                    <asp:SessionParameter Name="id_usuario" SessionField="IdUsuario" />
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

    <div class="row">
        <div class="col-md-5 align-left">
        <asp:Label ID="Label3" runat="server" Text="Pesquisar pelos sintomas"></asp:Label>
        <asp:TextBox ID="TextBoxNomeConsulta" runat="server" Width="90%" class="ConfTextBox"></asp:TextBox>
        </div>
        <div class="col-md-3">
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" OnClick="ButtonBuscar_Click"/>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="0" ForeColor="#333333" GridLines="None" CssClass="ConfGridView" Width="100%" DataKeyNames="id_consulta" CellSpacing="3">

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

            <Columns>
                <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" Visible="False"/>
                <asp:BoundField DataField="id_consulta" HeaderText="id_consulta" InsertVisible="False" ReadOnly="True" SortExpression="id_consulta" Visible="False" />
                <asp:BoundField DataField="nome" HeaderText="Médico" SortExpression="nome" >
                </asp:BoundField>
                <asp:BoundField DataField="nome1" HeaderText="Consulta" SortExpression="nome1" >
                </asp:BoundField>
                <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" />
                <asp:BoundField DataField="diagnostico" HeaderText="Diagnóstico" SortExpression="diagnostico" />
                <asp:BoundField DataField="motivo" HeaderText="Motivo" SortExpression="motivo" />
                <asp:BoundField DataField="recomendacoes" HeaderText="Recomendações" SortExpression="recomendacoes" />
                <asp:BoundField DataField="obs" HeaderText="Observações" SortExpression="obs" />
                <asp:CommandField ButtonType="Button" DeleteText="Apagar" ShowDeleteButton="True" />
                <asp:HyperLinkField DataNavigateUrlFields="id_consulta" DataNavigateUrlFormatString="ConsultaMedica.aspx?id_consulta={0}" Text="Editar" />
            </Columns>

            <EditRowStyle BackColor="#999999" Wrap="True" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="confCelula" />
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
            <asp:Button ID="Button2" runat="server" Text="Voltar"  class="ConfButton" Onclick="Button2_Click"/>
        </div>
    </div>

</asp:Content>

