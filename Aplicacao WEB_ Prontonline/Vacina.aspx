<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vacina.aspx.cs" Inherits="img_Vacina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-6">
            <br />
            <h1 class="Titulo">VACINAS</h1>
            <br />
        </div>
    </div>    

    <div class="row">
        <div class="col-6">
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="LabelTipoVacina" runat="server" Text="Tipo da vacina"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:DropDownList ID="DropDownListTipo" runat="server" Width="90%" DataSourceID="SqlDataSource1" DataTextField="descricao" DataValueField="id_tipoVacina"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_tipoVacina], [descricao] FROM [tb_tipoVacina] where situacao=1"></asp:SqlDataSource>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
        </div>
            
        <div class="col-6">     
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-5 align-left">
                    <asp:Label ID="LabelData" runat="server" Text="Data"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxData" runat="server" TextMode="Date"></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
        </div>        
    </div>

    <div class="row">
        <div class="col-6">
            <br />
            <h2 class="Titulo">Imagens da Vacina</h2>
            <br />
        </div>
    </div>

    <div class="row">
        <div class="col-6">
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="Label5" runat="server" Text="Nome da imagem"></asp:Label>
                </div>
            </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="NomeImagemVacina" runat="server" width="90%" />
                </div>
            </div>                               
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:FileUpload ID="ImagemVacina" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Button ID="btnImagemVacina" runat="server" Text="Inserir"/>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">            
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Image ID="img" runat="server"/>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-4"></div>
		<div class="col-2">
            <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" class="ConfButton" Onclick="ButtonSalvar_Click"/>
        </div>
        <div class="col-1"></div>
		<div class="col-4">
            <asp:Button ID="ButtonMinhasVacinas" runat="server" Text="Minhas Vacinas" class="ConfButton" OnClick="ButtonMinhasVacinas_Click"/>
        </div>             
    </div>

</asp:Content>

