<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsultaMedica.aspx.cs" Inherits="ConsultaMedica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="row">
        <div class="col-7">
            <br />
		    <h1 class="Titulo">CONSULTA MÉDICA</h1>
            <br />
        </div>

        <div class="row">
            <div class="col-2 align-left">
                <asp:Label ID="Label9" runat="server" Text="Data do Exame"></asp:Label>
            </div>
            <div class="col-2 align-left">
                <asp:TextBox ID="TextBoxData" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <br />
            <br />
	    </div>
                      
        <div class="row">
            <div class="col-11">
                <p class="align-left">Informações do Médico</p>
                <fieldset>
                    <div class="row">
                        <div class="col-4">
                            <div class="row">
				                <div class="col-12 align-left">
                                    <asp:Label ID="Label1" runat="server" Text="Nome Médico"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DropDownListMedico" runat="server" Width="85%" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_medico" OnSelectedIndexChanged="DropDownListMedico_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
				                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_medico], [nome] FROM [tb_medico]"></asp:SqlDataSource>
                                <br />
				                </div>
                            </div>
                        </div>                          
                        <div class="col-4">
                            <div class="row">
				                <div class="col-12 align-left">
                                    <asp:Label ID="Label2" runat="server" Text="CRM"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBoxCRM" runat="server" Width="90%" ></asp:TextBox>
                                <br />
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="row">
                                <div class="col-12 align-left">
                                    <asp:Label ID="Label3" runat="server" Text="Especialidade"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DropDownListEspecialidade" runat="server" Width="90%" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_especialidade"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProntonlineConnectionString %>" SelectCommand="SELECT [id_especialidade], [nome] FROM [tb_especialidade]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4"></div>
			            <div class="col-3 align-left">
                            <asp:Button ID="ButtonAdicionarMedico" runat="server" Text="Cadastrar Novo Médico" CssClass="ConfButton2" OnClick="ButtonAdicionarMedico_Click" />
                        </div>
                    </div>
                <br />
		        </fieldset>	
            </div>
        </div>
            <br />
            <br />

        <div class="row">
            <div class="col-11">
            <p class="align-left">Informações da Consulta</p>
	            <fieldset>
                    <div class="row">
                        <div class="col-6">
                            <div class="row">
                                    <div class="col-1"></div>
					                <div class="col-10 align-left">
                                        <asp:Label ID="Label4" runat="server" Text="Motivo da ida" ></asp:Label>
                                    </div>
                                    <div class="col-1"></div>
                                        <br />
                                </div>     
                            <div class="row">
                                    <div class="col-1"></div>
					                <div class="col-10 align-left">
                                        <asp:TextBox ID="TextBoxMotivo" runat="server" Width="90%" maxlength="500" TextMode="MultiLine" rows="4"></asp:TextBox>
                                    </div>
                                    <div class="col-1"></div>
                                        <br />
                                </div>                   
                    
                            <div class="row">
                                    <div class="col-1"></div>
					                <div class="col-10 align-left">
                                        <asp:Label ID="Label6" runat="server" Text="Diagnóstico"></asp:Label>
                                    </div>
                                    <div class="col-1"></div>
                                        <br />
                                </div>     
                            <div class="row">
                                    <div class="col-1"></div>
					                <div class="col-10 align-left">
                                        <asp:TextBox ID="TextBoxDiagnostico" runat="server" TextMode="Multiline" rows="4" Width="90%"></asp:TextBox>
                                    </div>
                                    <div class="col-1"></div>
                                        <br />
                                </div>  
                        </div>
                   
                        <div class="col-6">
                                <div class="row">
                                    <div class="col-1"></div>
					                <div class="col-10 align-left">
                                        <asp:Label ID="Label7" runat="server" Text="Recomendações"></asp:Label>
                                    </div>
                                    <div class="col-1"></div>
                                        <br />
                                </div>     
                                <div class="row">
                                    <div class="col-1"></div>
					                <div class="col-10 align-left">
                                        <asp:TextBox ID="TextBoxRecomendacoes" runat="server" TextMode="Multiline" Width="90%" rows="4"></asp:TextBox>
                                    </div>
                                    <div class="col-1"></div>
                                        <br />
                                </div>  
                    
                                <div class="row">
                                    <div class="col-1"></div>
					                <div class="col-10 align-left">
                                        <asp:Label ID="Label8" runat="server" Text="Outras informações"></asp:Label>
                                    </div>
                                    <div class="col-1"></div>
                                        <br />
                                </div>     
                                <div class="row">
                                    <div class="col-1"></div>
					                <div class="col-10 align-left">
                                        <asp:TextBox ID="TextBoxOutrasInformacoes" runat="server" TextMode="Multiline" Width="90%" rows="4"></asp:TextBox>
                                    </div>
                                    <div class="col-1"></div>
                                        <br />
                                </div>  
                        </div>          
                    </div>
        
		        </fieldset>  
            </div>
        </div>

        <div class="row">
            <div class="col-11">
            <p class="align-left">Exames e Receitas</p>
                <fieldset>            
                    <br />
                    <div class="col-5">
                    <asp:Button ID="ButtonReceita" runat="server" Text="Cadastrar Exame" class="ConfButton" OnClick="ButtonExame_Click"/>
                    <br /><br />
                    </div>
                    <div class="col-1"></div>
                    <div class="col-5">
                    <asp:Button ID="ButtonExame" runat="server" Text="Cadastrar Receita" class="ConfButton" OnClick="ButtonReceita_Click"/>
                    <br /><br />
                    </div>
                    <br /><br />
                </fieldset>
            </div>
        </div>

        <div class="row">
        <br />
        <br />
        <div class="col-2"></div>
        <div class="col-4">
            <asp:Button ID="ButtonAdicionar" runat="server" Text="Salvar" class="ConfButton" OnClick="ButtonAdicionar_Click"></asp:Button>
        </div>
        <div class="col-1"></div>
        <div class="col-4">
            <asp:Button ID="ButtonMinhasConsulta" runat="server" Text="Minhas Consultas" class="ConfButton" OnClick="ButtonMinhasConsulta_Click"/>
        </div>
        <br />
    </div>
  


	</section>
</asp:Content>

