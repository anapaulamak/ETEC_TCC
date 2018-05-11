<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>	    
    <link href="css/Style.css" rel="stylesheet"/>		
    <link type="text/css" rel="stylesheet" href="Content/css/bootstrap.min.css"/>
    <!--biblioteca para adicionar os ícones de retorno para home-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <title>ProntOnline</title>
</head>

<body>
    <section id="inicio" class="row">
        <div class="col-md-4">       
			<img src="img/logo.png" width="450px";/>
        </div> 

        <div class="col-md-8">
		    <nav id="MenuPrincipal" class="row">
			    <div class="col-md-2"></div>
			    <div class="col-md-10 menuCor">
				    <div class="row">
					    <div class="col-md-3">
						    <a href="#ProntOnline" class="ItemMenu">ProntOnline</a>
					    </div>		
					    <div class="col-md-3">
						    <a href="#Cadastrar" class="ItemMenu">Cadastrar</a>
					    </div>
					    <div class="col-md-3">				
						    <a href="#QuemSomos" class="ItemMenu">Quem Somos</a>
					    </div>
                        <div class="col-md-3">				
                            <a href="#Valores" class="ItemMenu">Valores</a>
					    </div>
				    </div>
			    </div>
   		    </nav>		
        </div>
	</section>
	<form id="FormLogin" runat="server">

	<section id="Index" class="ConfFundoVerde row">		    
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-10">
			        <img src="img/ImagemHome3.png" class="ConfImagem"/>
                </div>
            </div>

		</div>

		<div class="col-md-6" >
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 ConfForm1">					
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
					        <asp:Label ID="Label1" runat="server">LOGIN</asp:Label>
					        <asp:TextBox ID="TextBoxLogin" runat="server" class="ConfTextBox" maxlength="11" value="" tabindex="1" width="100%"></asp:TextBox>
					        <asp:Label ID="Label2" runat="server">SENHA</asp:Label>
					        <asp:TextBox ID="TextBoxSenha" runat="server" class="ConfTextBox" type="password" maxlength="8" value="" tabindex="2" width="100%"></asp:TextBox>
       		
                            <div class="row">
                                <div class="col-md-5">
                                    <asp:Button ID="ButtonLogar" runat="server" Text="Entrar" type="submit" class="ConfButton2" width="100%" OnClick="ButtonLogar_Click"/>	
                                </div>
                                <div class="col-md-7">  
                                    <a href="#Cadastrar" class="align-center AjustNovoLink">Sou novo aqui!</a>									
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
                <div class="col-md-2"></div>
            </div>
	    </div>	
	</section>

	<section id="ProntOnline">
		<div class="row">
			<div class="col-md-5 align-center">
				<article class="descricao">
					<p>Uma solução rápida e prática para organizar a sua saúde.</p>
                    <p>Armazene seus exames e receitas médicas, registre suas consultas realizadas, os remédios e vacinas tomadas, em um lugar só.</p>
				</article>
			</div>
			<div class="col-md-7 ConfVideo align-center">
             <iframe width="600" height="400" src="https://www.youtube.com/embed/GtG7kB4OGnQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		    </div>
		</div>
        <div class="row align-center ajustIconHome">
            <a href="#inicio"><i class="material-icons" style="font-size:36px; color:black">home</i></a>
        </div>                       
	</section>	

    <section id="QuemSomos">
        <div class="ConfFundoVerde row">
		    <header class="Fonte2">Quem Somos</header>
		    <div class="row ConfFotos">           
                <div class="col-md-4">   
                    <div class="row">
                        <div class="col-md-6 align-center">
				            <img src="img/anacarol.jpg" class="Foto" />
                            <div class="IconsRedes">
                                <a href="https://www.linkedin.com/in/ana-carolina-bispo-278b93148/" target="_blank"><img src="img/li.png" class="IconRedesSociais1"/></a> 
                                <a href="" target="_blank"><img src="img/gh.png" class="IconRedesSociais2"/></a> 
                                <a href="https://www.facebook.com/carolisbispo" target="_blank"><img src="img/fb.png" class="IconRedesSociais1"/></a> 
                            </div>
                        </div>
                        <div class="col-md-6 align-left">
				            <p class="FonteFoto">ANA CAROLINA</p>
                            <p class="FonteFotoDescricao"> </p>
                        </div>
                    </div>
			    </div>

	    	    <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-6 align-center">
				            <img src="img/anapaula.jpg" class="Foto"/>
                            <div class="IconsRedes">
                                <a href="https://www.linkedin.com/in/ana-paula-aoyama-kajihara/" target="_blank"><img src="img/li.png" class="IconRedesSociais1"/></a> 
                                <a href="https://github.com/anapaulamak" target="_blank"><img src="img/gh.png" class="IconRedesSociais2"/></a> 
                                <a href="https://www.facebook.com/anapaula.kajihara" target="_blank"><img src="img/fb.png" class="IconRedesSociais1"/></a> 
                            </div>
                        </div>
                        <div class="col-md-6 align-left">
				            <p class="FonteFoto">ANA PAULA</p>
                            <p class="FonteFotoDescricao"></p>
                        </div>
                    </div>
			    </div>

                <div class="col-md-4">   
                    <div class="row">
                        <div class="col-md-6 align-center">
				            <img src="img/gabi.jpg" class="Foto"/>
                            <div class="IconsRedes">
                                <a href="" target="_blank"><img src="img/li.png" class="IconRedesSociais1"/></a> 
                                <a href="" target="_blank"><img src="img/gh.png" class="IconRedesSociais2"/></a> 
                                <a href="https://www.facebook.com/gabrielawv2" target="_blank"><img src="img/fb.png" class="IconRedesSociais1"/></a>                         
                            </div>
                        </div>
                        <div class="col-md-6 align-left">
				            <p class="FonteFoto">GABRIELA</p>
                            <p class="FonteFotoDescricao"></p>
                        </div>
                    </div>
			    </div>
            </div>

		    <div class="row ConfFotos">
                <div class="col-md-2"></div>
                <div class="col-md-4 align-center">
                     <div class="row">
                        <div class="col-md-6 align-center">
				            <img src="img/julia.jpg" class="Foto"/>
                            <div class="IconsRedes">
                                <a href="https://www.linkedin.com/in/juliafranca/" target="_blank"><img src="img/li.png" class="IconRedesSociais1"/></a> 
                                <a href="" target="_blank"><img src="img/gh.png" class="IconRedesSociais2"/></a> 
                                <a href="https://www.facebook.com/juliafranca6" target="_blank"><img src="img/fb.png" class="IconRedesSociais1"/></a> 
                            </div>
                        </div>
                        <div class="col-md-6 align-left">
				            <p class="FonteFoto">JULIA</p>
                            <p class="FonteFotoDescricao"> </p>
                        </div>
                    </div>
                </div>

			    <div class="col-md-4 align-center">
                    <div class="row">
                        <div class="col-md-6 align-center">
				            <img src="img/mari.jpg" class="Foto"/>
                            <div class="IconsRedes">
                                <a href="https://www.linkedin.com/in/mariana-zangrossi-b48030148/" target="_blank"><img src="img/li.png" class="IconRedesSociais1"/></a> 
                                <a href="https://github.com/marianazangrossi" target="_blank"><img src="img/gh.png" class="IconRedesSociais2"/></a> 
                                <a href="https://www.facebook.com/mari.zangue" target="_blank"><img src="img/fb.png" class="IconRedesSociais1"/></a> 
                            </div>
                        </div>
                        <div class="col-md-6 align-left">
				            <p class="FonteFoto">MARIANA</p>
                            <p class="FonteFotoDescricao"> </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>

            <div class="row align-center ajustIconHome">
			    <a href="#inicio"><i class="material-icons" style="font-size:36px; color:black">home</i></a>
            </div>	
        </div>							
	</section>	

    <section id="Cadastrar" class="row">
		<header class="Fonte2">Cadastre-se</header>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 ConfForm2">
                <div id="FormCadastro" runat="server">                      
		            <div class="row ConfFormItens">
                        <div class="col-md-8 align-left Fonte">
			                <asp:Label ID="Label7" runat="server">Nome Completo</asp:Label>
                            <asp:TextBox ID="TextBoxNome" runat="server" maxlength="100" value="" tabindex="3" width="97%" class="ConfTextBox"></asp:TextBox>   
                        </div>
                        <div class="col-md-4 align-left Fonte">
				            <asp:Label ID="Label9" runat="server">CPF</asp:Label>
                            <asp:TextBox ID="TextBoxCPF" runat="server" maxlength="11" value="" tabindex="4" width="95%" class="ConfTextBox"></asp:TextBox>				    
                        </div>                       
                    </div>

                    <div class="row ConfFormItens">
                        <div class="col-md-4 align-left Fonte">
                            <asp:Label ID="Label8" runat="server">Email</asp:Label>     
                            <asp:TextBox ID="TextBoxEmail" runat="server" maxlength="50" value="" tabindex="5" width="95%" class="ConfTextBox"></asp:TextBox>
                        </div>
                        <div class="col-md-4 align-left Fonte">
                            <asp:Label ID="Label10" runat="server">Data de Nascimento</asp:Label>                
                            <asp:TextBox ID="TextBoxNascimento" runat="server" TextMode="Date" value="" tabindex="6" width="95%" class="ConfTextBox"></asp:TextBox>
                        </div>
                        <div class="col-md-4 align-left Fonte">
                            <asp:Label ID="LabelEstado" runat="server">Estado onde mora</asp:Label>
                            <asp:DropDownList ID="DropDownListEstado" runat="server" value="" tabindex="7" width="95%" class="ConfTextBox">
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

                    <div class="row ConfFormItens">
                        <div class="col-md-4 align-left Fonte">       
                            <div class="row">
                                <div class="col-md-4">
					                <asp:Label ID="Label11" runat="server">Sexo</asp:Label>
                                </div>
                                <div class="col-md-8">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                        <asp:ListItem Text="Masculino" value ="M" />
                                        <asp:ListItem Text="Feminino" value="F"/>
                                    </asp:RadioButtonList>  
                                </div>
                            </div>                            
                        </div>

                        <div class="col-md-4 align-left Fonte">
                            <asp:Label ID="LabelSenha1" runat="server">Cadastre uma senha</asp:Label>
							<asp:TextBox ID="TextBoxSenha1" runat="server" type="password" maxlength="11" value="" tabindex="8" width="96%" class="ConfTextBox"></asp:TextBox>
                        </div>

                        <div class="col-md-4 align-left Fonte">
							<asp:Label ID="Label4" runat="server">Confirme sua senha</asp:Label>
							<asp:TextBox ID="TextBoxSenha2" runat="server" type="password" maxlength="8" value="" tabindex="9" width="96%" class="ConfTextBox"></asp:TextBox>
                        </div>
			        </div>

			        <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
					        <asp:Button ID="ButtonCadastrar" runat="server" Text="Cadastrar" class="ConfButton2" OnClick="ButtonCadastrar_Click"/>
				        </div>
			        </div>
                </div>
		    </div>
		</div>
        <div class="row align-center ajustIconHome">
			<a href="#inicio"><i class="material-icons" style="font-size:36px; color:black">home</i></a>
		</div>	
	</section>	
	
    </form>

    <section id="Valores">
        <div class="confValores ConfFundoVerde">
            <div class="row ">
                <div class="col-md-4 align-center">
                    <img src="img/missao.png" class="ConfIconValores" />
                    <p class="FonteValores">MISSÃO</p>
                    <p class="Fonte4">Ser um agente de transformação, simplificando o uso da tecnologia para usuários da
área de saúde através do desenvolvimento de soluções inovadoras.</p>
                </div>
                <div class="col-md-4 align-center">
                    <img src="img/visao.png" class="ConfIconValores" />
                    <p class="FonteValores">VISÃO</p>
                    <p class="Fonte4">Contribuir para tornar o uso da tecnologia na área de saúde abrangente, diminuindo a
distância entre os agentes desse setor, trazendo benefícios diretos para cada um
deles e a sociedade como um todo.</p>
                </div>
                <div class="col-md-4 align-center">
                    <img src="img/valor.png" class="ConfIconValores" />
                    <p class="FonteValores">VALORES</p>
                    <p class="Fonte4">Inovação, Comprometimento, Integridade, Excelência, Igualdade, Empatia.</p>
                </div>
            </div>
            <div class="row align-center ajustIconHome">
			    <a href="#inicio"><i class="material-icons" style="font-size:36px; color:black">home</i></a>
		    </div>	
        </div>
    </section>


    <footer id="Footer">
    <div class="row">
	    <div class="col-md-12 Fonte">ProntOnline - sua saúde em suas mãos</div>
    </div>
    </footer>

<!--Jquery/Bootstrap-->
<script src="Scripts/js/jquery-3.3.1.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
<!--Jquery/Bootstrap-->

</body>
</html>