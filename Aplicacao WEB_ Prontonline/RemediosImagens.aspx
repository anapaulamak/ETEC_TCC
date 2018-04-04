<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RemediosImagens.aspx.cs" Inherits="RemediosImagens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <br />
        <h2 class="Titulo">Imagens desse Remédio</h2>
        <asp:Label ID="lblIdRemedio" runat="server" Text="Label"></asp:Label>
        <br />
    </div>
    <div class="row">
        <div class="col-8">
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="txt_nome" runat="server" Text="Nome da imagem"></asp:Label>
                </div>
            </div>

            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="NomeImagemRemedio" runat="server" width="90%"/>
                </div>
            </div> 
            
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:FileUpload ID="ImagemRemedio" runat="server"/>
                </div>
            </div>
        </div>

        <div class="col-3">
            <asp:Button ID="btnImagemRemedio" runat="server" Text="Inserir" class="ConfButton" Width="60%" OnClick="btnImagemRemedio_Click"/>
        </div>
    </div>
          
    <div class="row">
        <asp:Image ID="img" runat="server" style="width:300px"/>
    </div>

    <div class="row">
        <br />
        <br />
        <div class="col-9"></div>
		<div class="col-3">
            <asp:Button ID="ButtonMeusRemedios" runat="server" Text="Meus Remedios" class="ConfButton" OnClick="ButtonMeusRemedios_Click" />
        </div>             
    </div>
</asp:Content>



