<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Receita.aspx.cs" Inherits="Receita" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <h1 class="Titulo">RECEITAS MÉDICAS</h1>
        <div class="col-md-6">            
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label1" runat="server" Text="Receita Médica"></asp:Label>
                    <asp:TextBox ID="TextBoxNomeReceita" runat="server" Width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
			    <div class="col-md-1"></div>
		    </div>

            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label2" runat="server" Text="Associar à Consulta:"></asp:Label>
                    <asp:DropDownList ID="DropDownListConsulta" runat="server" DataSourceID="SqlDataSource1" DataTextField="EXP1" DataValueField="id_consulta" Width="100%" class="ConfTextBox"></asp:DropDownList>
			        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT concat ( c.data, ' - ' + m.nome) as EXP1, c.id_consulta, u.id_usuario FROM tb_usuario as u JOIN tb_consulta as c on u.id_usuario=c.id_usuario INNER JOIN tb_medico AS m ON c.id_medico = m.id_medico WHERE u.CPF=@cpf">
                        <SelectParameters>
                            <asp:SessionParameter Name="cpf" SessionField="UserId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
			    <div class="col-md-1"></div>
		    </div>
        </div>

        <div class="col-md-6">                
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label3" runat="server" Text="Data" Width="100%"></asp:Label>
                    <asp:TextBox ID="TextBoxData" runat="server" TextMode="Date" Width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
			    <div class="col-md-1"></div>
		    </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6"></div>
		<div class="col-md-3">
            <asp:Button ID="ButtonAdicionarImagem" runat="server" Text="Adicionar Imagens" class="ConfButton" Width="90%" OnClick="ButtonAdicionarImagem_Click"/>
        </div>
        <div class="col-md-3">
            <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar Receita" class="ConfButton" Width="90%" OnClick="ButtonSalvar_Click" />
        </div>      
    </div>

    <div id="inserirImagem" runat="server">     
        <div class="row">
            <h2 class="Titulo">Imagens da Receita Médica</h2>   
            <asp:Label ID="lblIdReceita" runat="server" Text="idReceita" Visible="false"></asp:Label>
            <asp:Label ID="lblIdImgReceita" runat="server" Text="idImagemReceita" Visible="false"></asp:Label>

            <div class="col-md-4">
                <div class="row">
		            <div class="col-md-1"></div>
		            <div class="col-md-10 align-left">
                        <asp:Label ID="Label5" runat="server" Text="Nome da imagem"></asp:Label>
                        <br /><br />
                        <asp:TextBox ID="NomeImagemReceita" runat="server" width="100%" class="ConfTextBox" />
                        <br /><br />
                        <asp:FileUpload ID="ImagemReceita" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <br />
                <asp:Button ID="btnImagemReceita" runat="server" Text="Inserir" CssClass="ConfButton" width="90%" OnClick="btnImagemReceita_Click"/>
            </div>

            <div class="col-md-6">
                <asp:Image ID="img1" runat="server" style="width:60%"/>
<%--                <asp:Image ID="img2" runat="server" style="width:30%"/>
                <asp:Image ID="img3" runat="server" style="width:30%"/>
                <asp:Image ID="img4" runat="server" style="width:30%"/>
                <asp:Image ID="img5" runat="server" style="width:30%"/>
                <asp:Image ID="img6" runat="server" style="width:30%"/>--%>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-3">
            <asp:Button ID="ButtonEditar" runat="server" Text="Salvar Edições" class="ConfButton" Width="90%" OnClick="ButtonEditar_Click"/>
        </div>
    	<div class="col-md-3">
            <asp:Button ID="ButtonNovaReceita" runat="server" Text="Novo Registro" class="ConfButton" Width="90%" OnClick="ButtonNovaReceita_Click" />
    	</div>
    	<div class="col-md-3">
            <asp:Button ID="ButtonMinhasReceitas" runat="server" Text="Minhas Receitas" class="ConfButton" Width="90%" OnClick="ButtonMinhasReceitas_Click"/>
        </div>
    </div>   

</asp:Content>

