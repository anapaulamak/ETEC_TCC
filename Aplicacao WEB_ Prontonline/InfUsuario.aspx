<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InfUsuario.aspx.cs" Inherits="InfUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="FormCadastro" runat="server">
        <h1 class="Titulo">MINHAS INFORMAÇÕES</h1>

        <div class="row">
            <div class="col-md-6">
		        <div class="row">
			        <div class="col-md-1"></div>
			        <div class="col-md-10 align-left">
			            <asp:Label ID="Label1" runat="server">Nome Completo</asp:Label>
			            <asp:TextBox ID="TextBoxNome" runat="server" maxlength="150" value="" tabindex="1" width="100%" class="ConfTextBox"></asp:TextBox>
                    </div>
		        </div>

                <div class="row">
			        <div class="col-md-1"></div>
			        <div class="col-md-10 align-left">
			            <asp:Label ID="Label2" runat="server">Email</asp:Label>
			            <asp:TextBox ID="TextBoxEmail" runat="server" maxlength="50" value="" tabindex="2" width="100%" class="ConfTextBox"></asp:TextBox>
			        </div>
		        </div>

                <div class="row">
			        <div class="col-md-1"></div>
			        <div class="col-md-10 align-left">
			            <asp:Label ID="Label3" runat="server">CPF</asp:Label>
			            <asp:TextBox ID="TextBoxCPF" runat="server" maxlength="11" value="" tabindex="3" width="100%" class="ConfTextBox"></asp:TextBox>
			        </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="row">
			        <div class="col-md-1"></div>
			        <div class="col-md-10 align-left">
			            <asp:Label ID="Label4" runat="server">Data de Nascimento</asp:Label>
			            <asp:TextBox ID="TextBoxData" runat="server" value="" tabindex="4" width="100%"></asp:TextBox>
			        </div>
		        </div>

                <div class="row">
			        <div class="col-md-1"></div>
			        <div class="col-md-10 align-left">
			        <asp:Label ID="Label6" runat="server">Estado</asp:Label>
                    <asp:DropDownList ID="DropDownListEstado" runat="server" value="" tabindex="5" width="100%" class="login-input ConfTextBox">
                        <asp:ListItem>AC</asp:ListItem>
                        <asp:ListItem>AL</asp:ListItem>
                        <asp:ListItem>AP</asp:ListItem>
                        <asp:ListItem>AM</asp:ListItem>
                        <asp:ListItem>BA</asp:ListItem>
                        <asp:ListItem>CE</asp:ListItem>
                        <asp:ListItem>DF</asp:ListItem>
                        <asp:ListItem>ES</asp:ListItem>
                        <asp:ListItem>GO</asp:ListItem>
                        <asp:ListItem>MA</asp:ListItem>
                        <asp:ListItem>MG</asp:ListItem>
                        <asp:ListItem>MS</asp:ListItem>
                        <asp:ListItem>MT</asp:ListItem>
                        <asp:ListItem>PA</asp:ListItem>
                        <asp:ListItem>PB</asp:ListItem>
                        <asp:ListItem>PE</asp:ListItem>
                        <asp:ListItem>PR</asp:ListItem>
                        <asp:ListItem>PI</asp:ListItem>
                        <asp:ListItem>RJ</asp:ListItem>
                        <asp:ListItem>RN</asp:ListItem>
                        <asp:ListItem>RS</asp:ListItem>
                        <asp:ListItem>RR</asp:ListItem>
                        <asp:ListItem>RO</asp:ListItem>
                        <asp:ListItem>SC</asp:ListItem>
                        <asp:ListItem>SP</asp:ListItem>
                        <asp:ListItem>SE</asp:ListItem>
                        <asp:ListItem>TO</asp:ListItem>
                    </asp:DropDownList>
			</div>
		        </div>

                <div class="row">
			        <div class="col-md-1"></div>
			        <div class="col-md-2 align-left">
				        <asp:Label ID="Label5" runat="server">Sexo</asp:Label>
                    </div>
			        <div class="col-md-9 align-left">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Text="Masculino" value ="M" />
                            <asp:ListItem Text="Feminino" value="F"/>
                        </asp:RadioButtonList>
                    </div>
		        </div>

            </div>  
        </div>

		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-2">
				<asp:Button ID="ButtonEditar" runat="server" Text="Editar" class="ConfButton" OnClick="ButtonEditar_Click"/>
			</div>
            <div class="col-md-1"></div>
			<div class="col-md-2">
				<asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" class="ConfButton"/>
			</div>
            <div class="col-md-1"></div>
			<div class="col-md-2">
                <asp:Button ID="ButtonCancelar" runat="server" Text="Cancelar" class="ConfButton"/>
			</div>
		</div>

    </div>

</asp:Content>

