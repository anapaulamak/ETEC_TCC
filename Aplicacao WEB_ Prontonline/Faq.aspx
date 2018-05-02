<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Faq.aspx.cs" Inherits="Faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1 class="Titulo align-left">PERGUNTAS FREQUENTES</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Panel ID="Panel1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString3 %>" 
            SelectCommand="SELECT * FROM [tb_faq] WHERE ([pergunta] LIKE '%' + @pergunta + '%')">

            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxPalavra" Name="pergunta" PropertyName="Text" Type="String" />
            </SelectParameters>

        </asp:SqlDataSource>

        <div class="row">
            <div class="col-md-4 align-left">
                <asp:Label ID="Label6" runat="server" Text="Palavra-chave"></asp:Label>
                <asp:TextBox ID="TextBoxPalavra" runat="server" width="100%" class="ConfTextBox"></asp:TextBox>
            </div>
		    <div class="col-md-4 align-left">
                <asp:Button ID="Button1" runat="server" Text="Buscar" class="ConfButton2" OnClick="Button1_Click"/>
		    </div>
        </div>

        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="5" ForeColor="#333333" GridLines="None" CellSpacing="3">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Left" VerticalAlign="Middle" />
                <Columns>
                    <asp:BoundField DataField="id_faq" HeaderText="id_faq" Visible="False" />
                    <asp:BoundField DataField="pergunta" HeaderText="Pergunta" />
                    <asp:BoundField DataField="resposta" HeaderText="Resposta" />
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

    </asp:Panel>                     
</asp:Content>

