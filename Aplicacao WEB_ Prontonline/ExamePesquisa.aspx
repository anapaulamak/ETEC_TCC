<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExamePesquisa.aspx.cs" Inherits="ExamesPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
		<h1 class="Titulo">MEUS EXAMES</h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>">
                </asp:SqlDataSource>

                <div class="col-md-4 align-left">
                <asp:Label ID="Label1" runat="server" Text="Pesquisar por nome de exame"></asp:Label>
                <asp:TextBox ID="TextBoxNome" runat="server" Width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
                <div class="col-md-4">
                <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" class="ConfButton2" OnClick="Button1_Click"/>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id_exame">

                    <Columns>
                        <asp:BoundField DataField="id_exame" HeaderText="id_exame" InsertVisible="False" ReadOnly="True" SortExpression="id_exame" />
                        <asp:BoundField DataField="id_tipoExame" HeaderText="id_tipoExame" SortExpression="id_tipoExame" />
                        <asp:BoundField DataField="id_consulta" HeaderText="id_consulta" SortExpression="id_consulta" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    </Columns>

                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <asp:Button ID="Button2" runat="server" Text="Voltar" OnClick="Button2_Click" class="ConfButton"/>
        </div>
    </div>

</asp:Content>

