<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Exame.aspx.cs" Inherits="Exame" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <h1 class="Titulo">EXAMES</h1>
        <div class="col-md-6">                
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label1" runat="server" Text="Selecione o tipo de exame"></asp:Label>
                    <asp:DropDownList ID="DropDownListTipo" runat="server" Width="100%" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_tipoExame" class="ConfTextBox"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_tipoExame], [nome] FROM [tb_tipoExame]  where situacao=1"></asp:SqlDataSource>
                </div>
			    <div class="col-md-1"></div>
                <br />
		    </div>

            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label4" runat="server" Text="Associar à consulta: "></asp:Label>
                    <asp:DropDownList ID="DropDownListConsulta" runat="server" DataSourceID="SqlDataSource2" DataTextField="EXP1" DataValueField="id_consulta" Width="100%" class="ConfTextBox"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT concat ( c.data, ' - ' + m.nome) as EXP1, c.id_consulta, u.id_usuario FROM tb_usuario as u JOIN tb_consulta as c on u.id_usuario=c.id_usuario INNER JOIN tb_medico AS m ON c.id_medico = m.id_medico WHERE u.CPF=@cpf">
                        <SelectParameters>
                            <asp:SessionParameter Name="cpf" SessionField="UserId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
			    <div class="col-md-1"></div>
                <br />
		    </div>
        </div>
    
        <div class="col-md-6">               
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label2" runat="server" Text="Descrição"></asp:Label>
                    <asp:TextBox ID="TextBoxNome" runat="server" Width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
			    <div class="col-md-1"></div>
                <br />
		    </div>

            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label3" runat="server" Text="Data do Exame"></asp:Label>
                    <asp:TextBox ID="TextBoxData" runat="server" TextMode="Date" Width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
			    <div class="col-md-1"></div>
                <br />
		    </div>
		</div>
    </div>
   
    <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-3">
            <asp:Button ID="ButtonAdicionarImagem" runat="server" Text="Adicionar Imagens" class="ConfButton" Width="90%" Onclick="ButtonAdicionarImagem_Click"/>
        </div>
		<div class="col-md-3">
            <asp:Button ID="ButtonAdicionar" runat="server" Text="Salvar Exame" class="ConfButton" Width="90%" OnClick="ButtonAdicionar_Click" />
        </div>           
    </div>

    <div id="inserirImagem" runat="server">
        <div class="row">
            <div>
                <h2 class="Titulo">Imagens do Exame</h2>
                <asp:Label ID="lblIdExame" runat="server" Text="idExame" Visible="false"></asp:Label>
                <asp:Label ID="lblIdImgExame" runat="server" Text="idImagemExame" Visible="false"></asp:Label>
            </div>
     
            <div class="col-md-4">
                <div class="row">
		            <div class="col-md-1"></div>
		            <div class="col-md-10 align-left">
                        <asp:Label ID="Label5" runat="server" Text="Nome da imagem"></asp:Label>
                        <br /><br />
                        <asp:TextBox ID="NomeImagemExame" runat="server" width="100%" class="ConfTextBox" />
                        <br /><br />
                        <asp:FileUpload ID="ImagemExame" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <br />
                    <asp:Button ID="btnImagemExame" runat="server" Text="Inserir" Width="90%" class= "ConfButton" OnClick="btnImagemExame_Click"/>
                </div>
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
            <asp:Button ID="ButtonNovoExame" runat="server" Text="Novo Registro" class="ConfButton" Width="90%"  OnClick="ButtonNovoExame_Click" />
        </div>
		<div class="col-md-3">
            <asp:Button ID="ButtonMeusExames" runat="server" Text="Meus Exames" class="ConfButton" Width="90%" OnClick="ButtonMeusExames_Click" />
        </div>

    </div>
  

</asp:Content>

