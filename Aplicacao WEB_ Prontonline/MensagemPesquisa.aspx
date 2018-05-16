<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MensagemPesquisa.aspx.cs" Inherits="MensagemPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <h1 class="Titulo">MINHAS MENSAGEM</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
                DeleteCommand="DELETE FROM [tb_mensagem] WHERE [id_mensagem] = @id_mensagem" 
                InsertCommand="INSERT INTO [tb_mensagem] ([id_usuario], [tipoMensagem], [titulo], [mensagem], [dataEnvio], [situacao], [resposta], [dataResposta]) VALUES (@id_usuario, @tipoMensagem, @titulo, @mensagem, @dataEnvio, @situacao, @resposta, @dataResposta)" 
                SelectCommand="SELECT * FROM [tb_mensagem] WHERE ([id_usuario] = @id_usuario) and ([titulo] LIKE '%' + @titulo + '%')" 
                UpdateCommand="UPDATE [tb_mensagem] SET [id_usuario] = @id_usuario, [tipoMensagem] = @tipoMensagem, [titulo] = @titulo, [mensagem] = @mensagem, [dataEnvio] = @dataEnvio, [situacao] = @situacao, [resposta] = @resposta, [dataResposta] = @dataResposta WHERE [id_mensagem] = @id_mensagem">

                <DeleteParameters>
                    <asp:Parameter Name="id_mensagem" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter Name="tipoMensagem" Type="String" />
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="mensagem" Type="String" />
                    <asp:Parameter Name="dataEnvio" Type="DateTime" />
                    <asp:Parameter Name="situacao" Type="Boolean" />
                    <asp:Parameter Name="resposta" Type="String" />
                    <asp:Parameter Name="dataResposta" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="id_usuario" SessionField="IdUsuario" Type="Int32"/>
                    <asp:ControlParameter ControlID="TextBoxNome" Name="titulo" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter Name="tipoMensagem" Type="String" />
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="mensagem" Type="String" />
                    <asp:Parameter Name="dataEnvio" Type="DateTime" />
                    <asp:Parameter Name="situacao" Type="Boolean" />
                    <asp:Parameter Name="resposta" Type="String" />
                    <asp:Parameter Name="dataResposta" Type="DateTime" />
                    <asp:Parameter Name="id_mensagem" Type="Int32" />
                </UpdateParameters>

            </asp:SqlDataSource>
            <div class="row">              
                <div class="col-md-5 align-left">
                    <asp:Label ID="Label1" runat="server" Text="Pesquisar por título"></asp:Label>
                    <asp:TextBox ID="TextBoxNome" runat="server" Width="90%" class="ConfTextBox"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" Width="80%" OnClick="ButtonBuscar_Click"/>
                </div>
            </div>

            <div class="row">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_mensagem" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">

                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                    <Columns>
                        <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" Visible="False" />
                        <asp:BoundField DataField="id_mensagem" HeaderText="id_mensagem" InsertVisible="False" ReadOnly="True" SortExpression="id_mensagem" Visible="False" />
                        <asp:BoundField DataField="tipoMensagem" HeaderText="Tipo" SortExpression="tipoMensagem" />
                        <asp:BoundField DataField="titulo" HeaderText="Título" SortExpression="titulo" />
                        <asp:BoundField DataField="mensagem" HeaderText="Mensagem" SortExpression="mensagem" />
                        <asp:BoundField DataField="dataEnvio" HeaderText="Enviado em" SortExpression="dataEnvio" />
                        <asp:CheckBoxField DataField="situacao" HeaderText="situacao" SortExpression="situacao" Visible="False" />
                        <asp:BoundField DataField="resposta" HeaderText="Resposta" SortExpression="resposta" />
                        <asp:BoundField DataField="dataResposta" HeaderText="Respondido em" SortExpression="dataResposta" />
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

