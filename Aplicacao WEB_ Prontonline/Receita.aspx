<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Receita.aspx.cs" Inherits="Receita" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-6">
            <br />
            <h1 class="Titulo">RECEITAS MÉDICAS</h1>
            <br />
        </div>
    </div>

    <div class="row">
        <div class="col-6">            
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="Label1" runat="server" Text="Nome do Médico"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:DropDownList ID="DropDownListMedico" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_medico" Width="90%"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_medico], [nome] FROM [tb_medico]"></asp:SqlDataSource>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>

            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="Label2" runat="server" Text="Associar à Consulta:"></asp:Label>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>
            <div class="row">
		        <div class="col-1"></div>
                <div class="col-10 align-left">
                <asp:DropDownList ID="DropDownListConsulta" runat="server" DataSourceID="SqlDataSource1" DataTextField="EXP1" DataValueField="id_consulta" Width="90%"></asp:DropDownList>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT concat ( c.data, ' - ' + m.nome) as EXP1, c.id_consulta, u.id_usuario FROM tb_usuario as u JOIN tb_consulta as c on u.id_usuario=c.id_usuario INNER JOIN tb_medico AS m ON c.id_medico = m.id_medico WHERE u.CPF=@cpf">
                    <SelectParameters>
                        <asp:SessionParameter Name="cpf" SessionField="UserId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </div>
			    <div class="col-1"></div>
                <br />
		    </div>


        </div>

        <div class="col-6">    
            
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="Label5" runat="server" Text="Endereço da imagem"></asp:Label>
                </div>
            </div>
            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:TextBox ID="TextBoxImagem" runat="server" Width="90%"></asp:TextBox>
                </div>
            </div>

            <div class="row">
		        <div class="col-1"></div>
		        <div class="col-10 align-left">
                    <asp:Label ID="Label3" runat="server" Text="Data"></asp:Label>
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
        <br />
        <br />
        <div class="col-4"></div>
		<div class="col-2">
            <asp:Button ID="ButtonAdicionar" runat="server" Text="Adicionar" class="ConfButton" OnClick="ButtonAdicionar_Click" />
        </div>
        <div class="col-1"></div>
		<div class="col-4">
            <asp:Button ID="ButtonMinhasReceitas" runat="server" Text="Minhas Receitas" class="ConfButton" OnClick="ButtonMinhasReceitas_Click" />
        </div>             
    </div>

</asp:Content>

