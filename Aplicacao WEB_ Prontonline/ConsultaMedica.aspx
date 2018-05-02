<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsultaMedica.aspx.cs" Inherits="ConsultaMedica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div>
    <h1 class="Titulo align-left">CONSULTA MÉDICA</h1>

    <div class="row">
        <p class="align-left">Informações do Médico</p>
        <div class="col-md-4 align-left"> 
            <asp:Label ID="Label1" runat="server" Text="Nome Médico"></asp:Label>
            <asp:DropDownList ID="DropDownListMedico" runat="server" 
                DataSourceID="SqlDataSource2" 
                DataTextField="nome" 
                DataValueField="id_medico" 
                Width="100%" 
                OnSelectedIndexChanged="DropDownListMedico_SelectedIndexChanged1" 
                AutoPostBack="True"
                class="ConfTextBox"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString2 %>" 
                SelectCommand="SELECT m.nome, m.id_medico, u.id_usuario FROM tb_medico as m JOIN tb_usuario as u ON m.id_usuario = u.id_usuario WHERE u.cpf=@cpf">
                <SelectParameters>
                    <asp:SessionParameter Name="cpf" SessionField="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
                  
        <div class="col-md-4 align-left">
            <asp:Label ID="Label2" runat="server" Text="CRM"></asp:Label>
            <asp:TextBox ID="TextBoxCRM" runat="server" Width="100%" class="ConfTextBox"></asp:TextBox>
        </div>

        <div class="col-md-4 align-left">
            <asp:Label ID="Label3" runat="server" Text="Especialidade"></asp:Label>
            <asp:DropDownList 
                ID="DropDownListEspecialidade" 
                runat="server" Width="100%" 
                DataSourceID="SqlDataSource1" 
                DataTextField="nome" 
                DataValueField="id_especialidade"
                class="ConfTextBox"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" 
                SelectCommand="SELECT [id_especialidade], [nome] FROM [tb_especialidade]"></asp:SqlDataSource>
        </div>   
    </div>

    <div class="row">
        <div class="col-md-4"></div>
		<div class="col-md-4">
            <asp:Button ID="ButtonAdicionarMedico" runat="server" Text="Cadastrar Novo Médico" CssClass="ConfButton2" width="100%" OnClick="ButtonAdicionarMedico_Click" />
        </div>
    </div>

    <div class="row align-left">
        <div>
            <p class="align-left">Informações da Consulta</p>
            <asp:Label ID="Label9" runat="server" Text="Data do Exame" ></asp:Label>
            <asp:TextBox ID="TextBoxData" runat="server" TextMode="Date" class="ConfTextBox"></asp:TextBox>
        </div>
 
        <div class="col-md-5">
            <div class="row">
                <asp:Label ID="Label4" runat="server" Text="Motivo da ida" ></asp:Label>
                <asp:TextBox ID="TextBoxMotivo" runat="server" Width="100%" maxlength="500" TextMode="MultiLine" rows="3" class="ConfTextArea"></asp:TextBox>
            </div>
            
            <div class="row">
                <asp:Label ID="Label6" runat="server" Text="Diagnóstico"></asp:Label>
                <asp:TextBox ID="TextBoxDiagnostico" runat="server" TextMode="Multiline" rows="3" Width="100%" class="ConfTextArea"></asp:TextBox>
            </div>
        </div>
                   
        <div class="col-md-1"></div>
        <div class="col-md-5">
            <div class="row">
                <asp:Label ID="Label7" runat="server" Text="Recomendações"></asp:Label>
                <asp:TextBox ID="TextBoxRecomendacoes" runat="server" TextMode="Multiline" Width="100%" rows="3" class="ConfTextArea"></asp:TextBox>
            </div>
                    
            <div class="row">
                <asp:Label ID="Label8" runat="server" Text="Outras informações"></asp:Label>
                <asp:TextBox ID="TextBoxOutrasInformacoes" runat="server" TextMode="Multiline" Width="100%" rows="3" class="ConfTextArea"></asp:TextBox>
            </div>          
        </div>   
    </div>

    <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-3">
            <asp:Button ID="ButtonAdicionar" runat="server" Text="Salvar" class="ConfButton" OnClick="ButtonAdicionar_Click"></asp:Button>
        </div>
        <div class="col-md-3">
            <asp:Button ID="ButtonMinhasConsulta" runat="server" Text="Minhas Consultas" class="ConfButton" OnClick="ButtonMinhasConsulta_Click"/>
        </div>
    </div>
</div>
</asp:Content>

