<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Faq.aspx.cs" Inherits="Faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="form1" runat="server">
        <div class="row">
            <div class="col-11">
                <div class="row">
                    <br />
                    <h1 class="Titulo">PERGUNTAS FREQUENTES</h1>
                </div>

                <fieldset>
                    <div class="row">
                        <br />
		                <div class="col-1"></div>
		                <div class="col-10 align-left">
                            <asp:Label ID="Label6" runat="server" Text="Palavra-chave"></asp:Label>
                        </div>
			            <div class="col-1"></div>
                        <br />
		            </div>

                    <div class="row">
		                <div class="col-1"></div>
		                <div class="col-5 align-left">
                            <asp:TextBox ID="TextBoxPalavra" runat="server" width="90%"></asp:TextBox>
                        </div>
		                <div class="col-3 align-left">
                        <asp:Button ID="Button1" runat="server" Text="Buscar" class="ConfButton2" OnClick="Button1_Click"/>
                        </div>
                        <br />
		            </div>

                    <div class="row">
		                <div class="col-1"></div>
		                <div class="col-10 align-left">
                            <asp:Label ID="Label7" runat="server" Text="Resultado"></asp:Label>
                        </div>
			            <div class="col-1"></div>
                        <br />
		            </div>

                    <div class="row">
		                <div class="col-1"></div>
		                <div class="col-10 align-left">
                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundColumn DataField="pergunta" HeaderText="Pergunta"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="resposta" HeaderText="Resposta"></asp:BoundColumn>
                                </Columns>
                                <EditItemStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            </asp:DataGrid>
                        </div>
			            <div class="col-1"></div>
                        <br />
		            </div>                          
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>

