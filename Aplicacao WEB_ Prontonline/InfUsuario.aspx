<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InfUsuario.aspx.cs" Inherits="InfUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="FormCadastro" runat="server">
        <br />
        <div class="row">
            <div class="col-6">
                <h1 class="Titulo">MINHAS INFORMAÇÕES</h1>
            </div>
        </div>

		<div class="row">
			<div class="col-1"></div>
			<div class="col-8 align-left">
			    <asp:Label ID="Label1" runat="server">Nome Completo</asp:Label>
                <span class="campoObrigatorio">* </span>
			    <asp:TextBox ID="TextBoxNome" runat="server" maxlength="150" value="" tabindex="1" width="100%"></asp:TextBox>
            </div>
            <br />
		</div>
		<br/>

        <div class="row">
			<div class="col-1"></div>
			<div class="col-8 align-left">
			    <asp:Label ID="Label2" runat="server">Email</asp:Label>
                <span class="campoObrigatorio">* </span>
			    <asp:TextBox ID="TextBoxEmail" runat="server" maxlength="50" value="" tabindex="2" width="100%"></asp:TextBox>
			</div>
            <br />
		</div>
		<br/>

        <div class="row">
			<div class="col-1"></div>
			<div class="col-8 align-left">
			    <asp:Label ID="Label3" runat="server">CPF</asp:Label>
                <span class="campoObrigatorio">* </span>
			    <asp:TextBox ID="TextBoxCPF" runat="server" maxlength="11" value="" tabindex="3" width="100%"></asp:TextBox>
			</div>
            <br />
        </div>
		<br/>

		<div class="row">
			<div class="col-1"></div>
			<div class="col-8 align-left">
			    <asp:Label ID="Label4" runat="server">Data de Nascimento</asp:Label>
                <span class="campoObrigatorio">* </span>
			    <asp:TextBox ID="TextBoxData" runat="server" value="" tabindex="4" width="100%"></asp:TextBox>
			</div>
            <br />
		</div>
		<br/>

		<div class="row">
			<div class="col-1"></div>
			<div class="col-8 align-left">
				<asp:Label ID="Label5" runat="server">Sexo</asp:Label>
                <span class="campoObrigatorio"> * </span>
			</div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-8 align-left">
				<div class="row">
                    <div class="col-1"></div>
					<div class="col-3">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Text="Masculino" value ="M" />
                            <asp:ListItem Text="Feminino" value="F"/>
                        </asp:RadioButtonList>
                    </div>
                    <div class="col-5"></div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-3"></div>
			<div class="col-2">
				<asp:Button ID="ButtonEditar" runat="server" Text="Editar" class="ConfButton" OnClick="ButtonEditar_Click"/>
			</div>
            <div class="col-1"></div>
			<div class="col-2">
				<asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" class="ConfButton"/>
			</div>
            <div class="col-1"></div>
			<div class="col-2">
                <asp:Button ID="ButtonCancelar" runat="server" Text="Cancelar" class="ConfButton"/>
			</div>
		</div>

    </div>

</asp:Content>

