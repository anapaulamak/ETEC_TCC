<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vacina.aspx.cs" Inherits="img_Vacina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <h1 class="Titulo">VACINAS</h1>
 
        <div class="col-md-6">
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="LabelTipoVacina" runat="server" Text="Tipo da vacina"></asp:Label>
                    <asp:DropDownList ID="DropDownListTipo" runat="server" width="100%" class="ConfTextBox" DataSourceID="SqlDataSource1" DataTextField="descricao" DataValueField="id_tipoVacina" ></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_tipoVacina], [descricao] FROM [tb_tipoVacina] where situacao=1"></asp:SqlDataSource>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="LabelData" runat="server" Text="Data"></asp:Label>
                    <asp:TextBox ID="TextBoxData" runat="server" onblur="validaData(this);" Text="dd/mm/aaaa" width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
		    </div>
        </div> 
    </div>
        
    <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-3">
            <asp:Button ID="ButtonAdicionarImagem" runat="server" Text="Adicionar Imagens" class="ConfButton" Width="90%" OnClick="ButtonAdicionarImagem_Click"/>
        </div>
        <div class="col-md-3">
            <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar Vacina" class="ConfButton" Width="90%" OnClick="ButtonSalvar_Click" />       
        </div>
    </div>

    <div id="inserirImagem" runat="server">
        <div class="row align-left">
        <h2 class="Titulo">Imagens da Vacina</h2>
        <asp:Label ID="lblIdVacina" runat="server" Text="idVacina" Visible="false"></asp:Label>
        <asp:Label ID="lblIdImgVacina" runat="server" Text="idImagemVacina" Visible="false"></asp:Label>

        <div class="col-md-4">
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label5" runat="server" Text="Nome da imagem"></asp:Label>
                    <br /><br />
                    <asp:TextBox ID="NomeImagemVacina" runat="server" width="100%" CssClass="ConfTextBox"/>
                    <br /><br />
                    <asp:FileUpload ID="ImagemVacina" runat="server" />
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <br />
            <asp:Button ID="btnImagemVacina" runat="server" Text="Inserir" class="ConfButton" Width="90%" OnClick="btnImagemVacina_Click"/>
        </div>

        <div class="col-md-6 align-center">
            <asp:Image ID="img1" runat="server" style="width:60%"/>
<%--            <asp:Image ID="img2" runat="server" style="width:30%"/>
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
            <asp:Button ID="ButtonNovaVacina" runat="server" Text="Novo Registro" class="ConfButton" Width="90%" OnClick="ButtonNovaVacina_Click"></asp:Button>
        </div>
        <div class="col-md-3">
            <asp:Button ID="ButtonMinhasVacinas" runat="server" Text="Minhas Vacinas" class="ConfButton" Width="90%" Onclick="ButtonMinhasVacinas_Click"/>
        </div>   
    </div>

</asp:Content>

