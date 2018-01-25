<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>	    
    <link href="css/Style.css" rel="stylesheet"/>		
    <!--biblioteca para adicionar os ícones de retorno para home-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <title>ProntOnline</title>
</head>

<body>
    <div id="inicio" class="row">
        <div class="col-3">       
		    <header >
			    <img src="img/logo.png" width="450px";/>
		    </header>	
        </div> 

        <div class="col-9">
		    <nav id="MenuPrincipal" class="row">
			    <div class="col-4"></div>
			    <div class="col-8 menuCor" >
				    <div class="row">
					    <div class="col-4">
						    <a href="#ProntOnline" class="ItemMenu">ProntOnline</a>
					    </div>		
					    <div class="col-4">
						    <a href="#QuemSomos" class="ItemMenu">Quem Somos</a>
					    </div>
					    <div class="col-4">				
						    <a href="#Cadastrar" class="ItemMenu">Cadastrar</a>
					    </div>
				    </div>
			    </div>
   		    </nav>		
        </div>
	</div>
	<form id="FormLogin" runat="server">

	    <section id="Index" class="ConfFundoVerde row">		    
            <div class="col-6">
			    <img src="img/ImagemHome3.png" class="ConfImagem"/>
		    </div>
		    <div class="col-6" >
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8 login ConfForm">					
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10 align-left Fonte">
							<asp:Label ID="Label1" runat="server">LOGIN</asp:Label>
						</div>
						<div class="col-1"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10 align-left Fonte">
							<asp:TextBox ID="TextBoxLogin" runat="server" class="login-input" maxlength="11" value="" tabindex="1" width="100%"></asp:TextBox>
                        </div>
						<div class="col-1"></div>
					</div>

				    <div class="row">
						<div class="col-1"></div>
						<div class="col-10 align-left Fonte">
							<asp:Label ID="Label2" runat="server">SENHA</asp:Label>
						</div>
						<div class="col-1"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10 align-left Fonte">
							<asp:TextBox ID="TextBoxSenha" runat="server" class="login-input" type="password" maxlength="8" value="" tabindex="2" width="100%"></asp:TextBox>
						</div>
						<div class="col-1"></div>
					</div>

                    <div class="row">
                        <div class="col-6">
                            <br />
                            <asp:Button ID="ButtonLogar" runat="server" Text="Entrar" type="submit" class="ConfButton2" width="70%" OnClick="ButtonLogar_Click"/>								    
                        </div>
                        <div class="col-6">
                            <br />
                            <a href="#Cadastrar" class="ConfButton2">Sou novo aqui!</a>									
                        </div>
                    </div>
				</div>
            </div>
			</div>	
	    </section>

	    <section id="ProntOnline" class="ConfHome row">
		    <div class="row descricao">
			    <div class="col-1"></div>
			    <div class="col-4">
				    <article>
                        <br />
                        <br />
                        <br />
					    <h2>Uma solução rápida e prática para organizar a sua saúde. Armazene seus exames e receitas médicas, registre suas consultas realizadas e vacinas tomadas em um só lugar.</h2>
				    </article>
			    </div>
			    <div class="col-1"></div>
			    <div class="col-4">
				    <iframe width="560" height="315" src="https://www.youtube.com/embed/GtG7kB4OGnQ" frameborder="0" allowfullscreen></iframe>				
		        </div>
                <div class="col-2"></div>
		    </div>
		    <div class="row">
			    <div class="col-12">
				    <br/>
				    <a href="#inicio"><i class="material-icons" style="font-size:36px; color:black">home</i></a>
			    </div>
		    </div>
	    </section>	

    	<section id="QuemSomos" class="ConfFundoVerde row">
		    <header class="Fonte"><h1>Quem Somos</h1></header>
		    <div class="row">
		    	<div class="col-4">
				    <img src="img/anacarol.jpg" width="50%" class="Foto" />
				    <p class="Fonte">ANA CAROLINA</p>
			    </div>
					
	    		<div class="col-4">
				    <img src="img/anapaula.jpg" width="50%" class="Foto"/>
				    <p class="Fonte">ANA PAULA</p>
			    </div>
    
			    <div class="col-4">
				    <img src="img/gabi.jpg" width="50%" class="Foto"/>
				    <p class="Fonte">GABRIELA</p>
			    </div>
            </div>
		    <div class="row">
                <div class="col-2"></div>

			    <div class="col-4">
				    <img src="img/julia.jpg" width="50%" class="Foto"/>
				    <p class="Fonte">JULIA</p>
			    </div>

			    <div class="col-4">
				    <img src="img/mari.jpg" width="50%" class="Foto"/>
				    <p class="Fonte">MARIANA</p>
			    </div>	

			    <div class="col-2"></div>			
		    </div>			
	    	<div class="row">
			<div class="col-12">
				<a href="#inicio"><i class="material-icons" style="font-size:36px; color:black">home</i></a>
			</div>					
		</div>			
	    </section>	

    	<section id="Cadastrar" class="row">
		    <header class="Fonte"><h1>Cadastre-se</h1></header>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-9 formulario CadastroForm ConfForm Fonte">
                    <div id="FormCadastro" runat="server">                      
		                <div class="row">
                            <div class="col-1"></div>
                            <div class="col-5 align-left Fonte">
			                    <asp:Label ID="Label7" runat="server">Nome Completo</asp:Label>
                                <br />
                                <asp:TextBox ID="TextBoxNome" runat="server" maxlength="150" value="" tabindex="1" width="90%" class="login-input"></asp:TextBox>                    
                            </div>
                            <div class="col-1"></div>
                            <div class="col-5 align-left Fonte">
                                <asp:Label ID="Label8" runat="server">Email</asp:Label>
                                <br />                  
                                <asp:TextBox ID="TextBoxEmail" runat="server" maxlength="50" value="" tabindex="2" width="90%" class="login-input"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-5 align-left Fonte">
				                <asp:Label ID="Label9" runat="server">CPF</asp:Label>
                                <br />
                                <asp:TextBox ID="TextBoxCPF" runat="server" maxlength="11" value="" tabindex="3" width="90%" class="login-input"></asp:TextBox>				    
                            </div>
                            <div class="col-1"></div>
                            <div class="col-5 align-left Fonte">
                                <asp:Label ID="Label10" runat="server">Data de Nascimento</asp:Label>
                                <br />                  
                                <asp:TextBox ID="TextBoxNascimento" runat="server" TextMode="Date" value="" tabindex="4" width="90%" class="login-input"></asp:TextBox>
                            </div>
                        </div>

                        <div class=" row">
                            <div class="col-1"></div>
                            <div class="col-1 align-left Fonte">
					            <asp:Label ID="Label11" runat="server">Sexo</asp:Label>
                            </div>
                            <div class="col-3 align-left Fonte">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                    <asp:ListItem Text="Masculino" value ="M" />
                                    <asp:ListItem Text="Feminino" value="F"/>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                       
                        <div class="row">
                            <br />
                            <div class="col-1"></div>
                            <div class="col-5 align-left Fonte">
                                <asp:Label ID="LabelSenha1" runat="server">Cadastre uma senha</asp:Label>
                                <br />
							    <asp:TextBox ID="TextBoxSenha1" runat="server" class="login-input" type="password" maxlength="11" value="" tabindex="5" width="90%"></asp:TextBox>
                            </div>
                            <div class="col-1"></div>
                            <div class="col-5 align-left Fonte">
							    <asp:Label ID="Label4" runat="server">Confirme sua senha</asp:Label>
                                <br />
							    <asp:TextBox ID="TextBoxSenha2" runat="server" class="login-input" type="password" maxlength="8" value="" tabindex="6" width="90%"></asp:TextBox>
    					    </div>
			            </div>

			            <div class="row">
                            <br />
                            <div class="col-4"></div>
                            <div class="col-4">
					            <asp:Button ID="ButtonCadastrar" runat="server" Text="Cadastrar" class="ConfButton" OnClick="ButtonCadastrar_Click"/>
				            </div>
			            </div>
                    </div>
		        </div>
			</div>
            <div class="row">
				<div class="col-12">
					<a href="#inicio"><i class="material-icons" style="font-size:36px; color:black">home</i></a>
				</div>
			</div>	
	    </section>	
	
    </form>

    <footer id="Footer">
    <div class="row">
	    <div class="col-12 Fonte">ProntOnline - sua saúde em suas mãos</div>
    </div>
    </footer>

</body>

</html>