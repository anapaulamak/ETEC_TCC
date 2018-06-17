<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Remedios.aspx.cs" Inherits="Remedios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">    
        <h1 class="Titulo">MEUS REMÉDIOS</h1>
        <div class="col-md-6">            
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label1" runat="server" Text="Nome do Remédio"></asp:Label>
                    <asp:TextBox ID="TextBoxRemedio" runat="server" width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
			    <div class="col-md-1"></div>
                <br />
		    </div>

            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="Label2" runat="server" Text="Dosagem"></asp:Label>
                    <asp:TextBox ID="TextBoxDosagem" runat="server" width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
			    <div class="col-md-1"></div>
                <br />
		    </div>
        </div>

        <div class="col-md-6">
            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="LabelDataInicio" runat="server" Text="Começou a tomar em: "></asp:Label>
                    <asp:TextBox ID="TextBoxDataInicio" runat="server" onblur="validaData(this);" Text="dd/mm/aaaa" width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
			    <div class="col-md-1"></div>
                <br />
		    </div>

            <div class="row">
		        <div class="col-md-1"></div>
		        <div class="col-md-10 align-left">
                    <asp:Label ID="LabelDataFim" runat="server" Text="Parar de tomar em: "></asp:Label>
                    <asp:TextBox ID="TextBoxDataFim" runat="server" onblur="validaData(this);" Text="dd/mm/aaaa" width="100%" class="ConfTextBox"></asp:TextBox>
                </div>
			    <div class="col-md-1"></div>
                <br />
		    </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6"></div>
		<div class="col-md-3">
            <asp:Button ID="ButtonAdicionarImagem" runat="server" Text="Adicionar Imagens" class="ConfButton" Width="90%" OnClick="ButtonAdicionarImagem_Click"/>
        </div>
        <div class="col-md-3">
            <asp:Button ID="ButtonAdicionar" runat="server" Text="Salvar Remédio" class="ConfButton" OnClick="ButtonAdicionar_Click" Width="90%" />
        </div>      
    </div>
    
    <div id="inserirImagem" runat="server" >
        <div class="row">
            <h2 class="Titulo">Imagens desse Remédio</h2>
            <asp:Label ID="lblIdRemedio" runat="server" Text="idRemedio" Visible="false"></asp:Label>
            <asp:Label ID="lblIdImgRemedio" runat="server" Text="idImagem" Visible="false"></asp:Label>

            <div class="col-md-4">
                <div class="row">
		            <div class="col-md-1"></div>
		            <div class="col-md-10 align-left">
                        <asp:Label ID="txt_nome" runat="server" Text="Nome da imagem"></asp:Label>
                        <br /><br />
                        <asp:TextBox ID="NomeImagemRemedio" runat="server" width="100%" class="ConfTextBox"/>
                        <br /><br />
                        <asp:FileUpload ID="ImagemRemedio" runat="server"/>
                    </div>
                </div>
            </div>

            <div class="col-md-2">
                <br />
                <asp:Button ID="btnImagemRemedio" runat="server" Text="Inserir" class="ConfButton" Width="90%" OnClick="btnImagemRemedio_Click"/>
            </div>

            <div class="col-md-6 align-center">
                <asp:Image ID="img1" runat="server" style="width:60%"/>
<%--                <asp:Image ID="img2" runat="server" style="width:90%"/>
                <asp:Image ID="img3" runat="server" style="width:90%"/>
                <asp:Image ID="img4" runat="server" style="width:90%"/>
                <asp:Image ID="img5" runat="server" style="width:90%"/>
                <asp:Image ID="img6" runat="server" style="width:90%"/>--%>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-3">
            <asp:Button ID="ButtonEditar" runat="server" Text="Salvar Edições" class="ConfButton" Width="90%"/>
        </div>
        <div class="col-md-3">
            <asp:Button ID="ButtonNovoRemedio" runat="server" Text="Novo Registro" class="ConfButton" Width="90%" OnClick="ButtonNovoRemedio_Click"/>
        </div>
        <div class="col-md-3">
            <asp:Button ID="ButtonMeusRemedios" runat="server" Text="Meus Remedios" class="ConfButton" Width="90%" OnClick="ButtonMeusRemedios_Click" />
        </div>
    </div>

</asp:Content>

