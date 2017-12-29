<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MensagemResposta.aspx.cs" Inherits="MensagemResposta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-3"></div>
        <div class="col-9">    
            <br />
            <h1 class="Titulo">MENSAGEM RESPONDIDA</h1>
            <br />
        </div>
    </div>

    <div class="row">
        <div class="col-6">
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="Label1" runat="server" Text="Tipo da mensagem"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />     
            </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:DropDownList ID="DropDownListTipo" runat="server" Width="90%">
                        <asp:ListItem>Outros</asp:ListItem>
                        <asp:ListItem>Dúvida</asp:ListItem>
                        <asp:ListItem>Sugestão</asp:ListItem>
                        <asp:ListItem>Comentário</asp:ListItem>
                        <asp:ListItem>Reclamação</asp:ListItem>
                    </asp:DropDownList>
                </div>
			    <div class="col-1"></div>
            </div>

            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="LabelAssunto" runat="server" Text="Assunto da mensagem"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxAssunto" runat="server" Width="90%" ></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="LabelMensagem" runat="server" Text="Mensagem"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxMensagem" runat="server" TextMode="MultiLine" Width="90%"></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>        
        </div>

        <div class="col-6">
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="LabelDataResposta" runat="server" Text="Data de resposta"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxDataResposta" runat="server"  TextMode="Date"  ></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
            </div>
      
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="LabelResposta" runat="server" Text="Resposta"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxResposta" runat="server" Width="90%" TextMode="MultiLine"></asp:TextBox>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
        </div>
    </div>


    <div class="row">
        <div class="row">
            <div class="col-2">
            <asp:Button ID="ButtonEnviar" runat="server" Text="Voltar" class="ConfButton"/>
            </div>
            <div class="col-4">
            <asp:Button ID="ButtonMinhasMensagens" runat="server" Text="Minhas Mensagens" class="ConfButton"/>
            </div>
        </div>
    </div>
</asp:Content>