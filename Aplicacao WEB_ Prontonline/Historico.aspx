<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Historico.aspx.cs" Inherits="Historico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="FormStatusSaude" runat="server">
        <h1 class="Titulo">HISTÓRICO DE SAÚDE</h1>
        <asp:TextBox ID="TextBoxIdSaude" runat="server" Visible="false"></asp:TextBox>
            <div class="row align-left">                        
				<div class="col-md-3 align-left">
                    <asp:Label ID="LabelAlergias" runat="server" Text="Alergias"></asp:Label>   
                    <asp:DropDownList ID="DropDownListAlergia" runat="server" DataSourceID="SqlDataSourceAlergia" DataTextField="descricao" DataValueField="id_tipoAlergia" width="90%" class="ConfTextBox"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceAlergia" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_tipoAlergia], [descricao] FROM [tb_tipoAlergia]  where situacao=1"></asp:SqlDataSource>
                </div>
                <div class="col-md-3 align-left">
                    <asp:Label ID="LabelDataAlergias" runat="server" Text="Data"></asp:Label>
                    <asp:TextBox ID="TextBoxData" runat="server" TextMode="Date" width="90%" class="ConfTextBox"></asp:TextBox>
                    <br />
                    <asp:Button ID="ButtonAdicionarAlergia" runat="server" Text="Adicionar" class="ConfButton2" Width="90%" OnClick="ButtonAdicionarAlergia_Click"/>
                </div>
                <div class="col-md-6 align-left">
                    <br />
                    <asp:DataGrid ID="DataGridAlergia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnDeleteCommand="DataGridAlergia_DeleteCommand" PageSize="5" Width="100%" AllowPaging="True">
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundColumn DataField="id_alergia" HeaderText="Id_alergia" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="id_usuario" HeaderText="Id_usuario" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="descricao" HeaderText="Alergia"></asp:BoundColumn>
                            <asp:BoundColumn DataField="dataAlergia" HeaderText="Data"></asp:BoundColumn>
                            <asp:ButtonColumn CommandName="Delete" Text="Apagar" ButtonType="PushButton"></asp:ButtonColumn>
                        </Columns>
                        <EditItemStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataGrid>
                </div>
                </div>
                    
            <div class="row align-left">             
				<div class="col-md-3 align-left">
                    <asp:Label ID="LabelCirurgias" runat="server" Text="Cirurgias"></asp:Label>
                    <asp:DropDownList ID="DropDownListCirurgia" runat="server" DataSourceID="SqlDataSourceCirurgia" DataTextField="descricao" DataValueField="id_tipoCirurgia" width="90%" class="ConfTextBox"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCirurgia" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_tipoCirurgia], [descricao] FROM [tb_tipoCirurgia]  where situacao=1"></asp:SqlDataSource>
                </div>
                <div class="col-md-3 align-left">
                    <asp:Label ID="LabelDataCirurgias" runat="server" Text="Data"></asp:Label>
                    <asp:TextBox ID="TextBoxData2" runat="server" TextMode="Date" Width="90%" CssClass="ConfTextBox"></asp:TextBox>
                    <br />
                    <asp:Button ID="ButtonAdicionarCirurgia" runat="server" Text="Adicionar" CssClass="ConfButton2" Width="90%" OnClick="ButtonAdicionarCirurgia_Click"/>
                </div>
                <div class="col-md-6 align-left">
                    <br />
                    <asp:DataGrid ID="DataGridCirurgia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnDeleteCommand="DataGridCirurgia_DeleteCommand" Width="100%" AllowPaging="True" PageSize="5">
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundColumn DataField="id_cirurgia" HeaderText="Id_cirurgia" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="id_usuario" HeaderText="Id_usuario" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="descricao" HeaderText="Cirurgia"></asp:BoundColumn>
                            <asp:BoundColumn DataField="dataCirurgia" HeaderText="Data"></asp:BoundColumn>
                            <asp:ButtonColumn CommandName="Delete" Text="Apagar" ButtonType="PushButton"></asp:ButtonColumn>
                        </Columns>
                        <EditItemStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataGrid>
                </div>
            </div>

            <div class="row align-left">           
				<div class="col-md-3 align-left">
                    <asp:Label ID="LabelFraturas" runat="server" Text="Fraturas"></asp:Label>
                    <asp:DropDownList ID="DropDownListFratura" runat="server" DataSourceID="SqlDataSourceFratura" DataTextField="descricao" DataValueField="id_tipoFratura" width="90%" class="ConfTextBox"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceFratura" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_tipoFratura], [descricao] FROM [tb_tipoFratura]  where situacao=1"></asp:SqlDataSource>
                </div>
                <div class="col-md-3 align-left">
                    <asp:Label ID="LabelDataFraturas" runat="server" Text="Data"></asp:Label>
                    <asp:TextBox ID="TextBoxData3" runat="server" TextMode="Date" width="90%" class="ConfTextBox"></asp:TextBox>
                    <br/>
                    <asp:Button ID="ButtonAdicionarFratura" runat="server" Text="Adicionar" CssClass="ConfButton2" Width="90%" OnClick="ButtonAdicionarFratura_Click"/>
                </div>
                <div class="col-md-6 align-left">
                    <br />
                    <asp:DataGrid ID="DataGridFratura" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnDeleteCommand="DataGridFratura_DeleteCommand" Width="100%" AllowPaging="True" PageSize="5">
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundColumn DataField="id_fratura" HeaderText="Id_fratura" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="id_usuario" HeaderText="Id_usuario" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="descricao" HeaderText="Fratura"></asp:BoundColumn>
                            <asp:BoundColumn DataField="dataFratura" HeaderText="Data"></asp:BoundColumn>
                            <asp:ButtonColumn CommandName="Delete" Text="Apagar" ButtonType="PushButton"></asp:ButtonColumn>
                        </Columns>
                        <EditItemStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataGrid>
                </div>
            </div>
    </div>
</asp:Content>

