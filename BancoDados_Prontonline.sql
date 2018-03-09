use master
go

if exists(select name from master.dbo.sysdatabases where name = 'Prontonline')
	drop database Prontonline
go
	
create database Prontonline 
go

use Prontonline
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_usuario' AND xtype='U')
create table tb_usuario(
	id_usuario INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome_usuario VARCHAR(50),
	cpf CHAR (11),
	sexo CHAR,
	data_nascimento DATE,
	e_mail_usuario VARCHAR(30),
	senha CHAR(8)
) 
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_medico' AND xtype='U')
create table tb_medico(
	id_medico INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
	CRM VARCHAR(20),
	nome VARCHAR(50)
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_especialidade' AND xtype='U')
create table tb_especialidade(
	id_especialidade INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome VARCHAR(30),
	situacao BIT
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_medico_especialidade' AND xtype='U')
create table tb_medico_especialidade(
	id_medico_especialidade INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	id_medico INT FOREIGN KEY REFERENCES tb_medico(id_medico),
	id_especialidade INT FOREIGN KEY REFERENCES tb_especialidade(id_especialidade)
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_consulta' AND xtype='U')
create table tb_consulta(
	id_consulta INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	id_medico INT FOREIGN KEY REFERENCES tb_medico(id_medico),
	id_especialidade INT FOREIGN KEY REFERENCES tb_especialidade(id_especialidade),
	id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
	data DATE,
	motivo VARCHAR(200),
	diagnostico VARCHAR(200),
	sintomas VARCHAR(200),
	recomendacoes VARCHAR(200),
	obs VARCHAR(200)
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_tipoExame' AND xtype='U')
create table tb_tipoExame(
	id_tipoExame INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome VARCHAR(200),
	situacao BIT
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_exame' AND xtype='U')
create table tb_exame(
	id_exame INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	id_tipoExame INT FOREIGN KEY REFERENCES tb_tipoExame(id_tipoExame),
	id_consulta INT FOREIGN KEY REFERENCES  tb_consulta(id_consulta),
	data DATE,
	nome VARCHAR(200),
	imagem VARCHAR(300)
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_receita' AND xtype='U')
create table tb_receita(
	id_receita INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	id_consulta INT FOREIGN KEY REFERENCES  tb_consulta(id_consulta),
	nome VARCHAR(200),
	imagem VARCHAR(300),
	data DATE
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_remerio' AND xtype='U')
create table tb_remedios(
	id_remedio INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	id_usuario INT FOREIGN KEY REFERENCES  tb_usuario(id_usuario),
	nome VARCHAR(200),
	dosagem VARCHAR(200),
	imagem VARCHAR(300),
	dataInicio DATE, 
	dataFim DATE
)
go


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_tipoVacina' AND xtype='U')
create table tb_tipoVacina(
	id_tipoVacina INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	descricao VARCHAR(50),
	situacao BIT
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_vacina' AND xtype='U')
create table tb_vacina(
	id_vacina INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	id_tipoVacina INT FOREIGN KEY REFERENCES tb_tipoVacina(id_tipoVacina),
	id_usuario INT FOREIGN KEY REFERENCES tb_usuario (id_usuario),
	data DATE,
	imagem VARCHAR(300)
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_faq' AND xtype='U')
create table tb_faq(
	id_faq INT IDENTITY(1,1) PRIMARY KEY not null,
	pergunta VARCHAR(200),
	resposta VARCHAR(500),
	situacao BIT
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_permissao' AND xtype='U')
create table tb_permissao(
	id_permissao INT IDENTITY(1,1) PRIMARY KEY not null,
	descricao VARCHAR(30)
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_funcionario' AND xtype='U')
create table tb_funcionario(
	id_funcionario INT IDENTITY(1,1) PRIMARY KEY not null,
	id_permissao INT FOREIGN KEY REFERENCES tb_permissao(id_permissao),
	nome VARCHAR(50),
	CPF CHAR(20),
	senha CHAR(8),
	email VARCHAR(50),
	genero VARCHAR(20),
	funcao VARCHAR(30),
	telefone CHAR(28),
	situacao bit,	
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_mensagem' AND xtype='U')
create table tb_mensagem(
	id_mensagem INT IDENTITY(1,1) PRIMARY KEY not null,
	id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
	tipoMensagem VARCHAR(50),
	titulo VARCHAR(50),
	mensagem VARCHAR(500),
	dataEnvio DATETIME,
	situacao BIT,
	resposta VARCHAR(500),
	dataResposta DATETIME
)
go

--esse codigo adiciona a data de cadastro da informa��o na data
CREATE TRIGGER dataEnvioMensagem
ON tb_mensagem
instead of insert 
AS 
BEGIN

INSERT INTO tb_mensagem (tipoMensagem, titulo, mensagem, id_usuario, dataEnvio)
SELECT tipoMensagem, titulo, mensagem, id_usuario, GETDATE() FROM INSERTED
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_statusSaude' AND xtype='U')
create table tb_statusSaude(
	id_saude INT IDENTITY(1,1) PRIMARY KEY not null,
	id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
	dataStatus DATE,
	colesterol DECIMAL,
	glicemia DECIMAL,
	peso DECIMAL,
	altura DECIMAL
)
go

--esse codigo adiciona a data de cadastro da informa��o na data
CREATE TRIGGER dataStatusSaude
ON tb_statusSaude
instead of insert 
AS 
BEGIN
INSERT INTO tb_statusSaude (colesterol, glicemia, peso, altura, id_usuario, dataStatus)
SELECT colesterol, glicemia, peso, altura, id_usuario, GETDATE() FROM INSERTED
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_tipoFratura' AND xtype='U')
create table tb_tipoFratura(
	id_tipoFratura INT IDENTITY(1,1) PRIMARY KEY not null,
	descricao VARCHAR(100),
	situacao BIT,
)
go

-- alterei chave estrangeira de StatusSaude para Usuario
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_fratura' AND xtype='U')
create table tb_fratura(
	id_fratura INT IDENTITY(1,1) PRIMARY KEY not null,
	id_tipoFratura INT FOREIGN KEY REFERENCES tb_tipoFratura(id_tipoFratura),
	id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
	dataFratura DATE
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_tipoAlergia' AND xtype='U')
create table tb_tipoAlergia(
	id_tipoAlergia INT IDENTITY(1,1) PRIMARY KEY not null,
	descricao VARCHAR (100),
	situacao BIT,
)
go

-- alterei chave estrangeira de StatusSaude para Usuario
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_alergia' AND xtype='U')
create table tb_alergia(
	id_alergia INT IDENTITY(1,1) PRIMARY KEY not null,
	id_tipoAlergia INT FOREIGN KEY REFERENCES tb_tipoAlergia(id_tipoAlergia),
	id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
	dataAlergia DATE
)
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_tipoCirurgia' AND xtype='U')
create table tb_tipoCirurgia(
	id_tipoCirurgia INT IDENTITY(1,1) PRIMARY KEY not null,
	descricao VARCHAR (100),
	situacao BIT, 
)
go

-- alterei chave estrangeira de StatusSaude para Usuario
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tb_cirurgia' AND xtype='U')
create table tb_cirurgia(
	id_cirurgia INT IDENTITY(1,1) PRIMARY KEY not null,
	id_tipoCirurgia INT FOREIGN KEY REFERENCES tb_tipoCirurgia(id_tipoCirurgia),
	id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
	dataCirurgia DATE
)
go

INSERT INTO tb_tipoAlergia (descricao, situacao) 
VALUES	('Pol�n', 1),
	('Poeira', 1),
	('Epit�lios de c�es e/ou gatos', 1),
	('Amendoim e Nozes', 1),
	('Frutos do mar', 1),
	('Ovo', 1),
	('Leite', 1),
	('Gluten', 1),
	('Tomate', 1),
	('Corante', 1),
	('Soja', 1),
	('Milho', 1)

INSERT INTO tb_tipoCirurgia (descricao, situacao)
VALUES  ('Apendicectomia', 1),
	('Cistectomia', 1),
	('Colecistectomia', 1),
	('Craniectomia', 1),
	('Esplenectomia', 1),
	('Colporrafia', 1),
	('Gastrorrafia', 1),
	('Herniorrafia', 1),
	('Palatorrafia', 1),
	('Hisperopexia', 1),
	('Nefropexia', 1),
	('Rinoplastia', 1)

INSERT INTO tb_especialidade (nome, situacao)
VALUES  ('Alergia e Imunologia', 1),
	('Cardiologia', 1),	   
	('Clinica Geral', 1),
	('Dermatologia', 1),
	('Endocrinologia', 1),
	('Geriatria', 1),
	('Ginecologia', 1),
	('Neurologia', 1),
	('Nutri��o', 1),
	('Oftalmologia', 1),
	('Ortopedia', 1),
	('Pediatria', 1)
	   
INSERT INTO tb_tipoVacina (descricao, situacao)
VALUES 	('BCG',1),
	('Hepatite B ',1),
	('Penta',1),
	('VIP/VOP',1),
	('Pneumoc�cica 10V',1),
	('Rotav�rus Humano',1),
	('Meningoc�cica C',1),
	('Febre Amarela',1),
	('Hepatite A',1),
	('Tr�plice Viral',1),
	('Tetra Viral',1),
	('HPV',1),
	('Dupla Adulto',1),
	('dTpa*',1)

INSERT INTO tb_medico (CRM, nome)
VALUES  ('CRM-SP 789441', 'Isabela Forni'),
	('CRM-SP 785245', 'Natan Silva'),
	('CRM-MG 545431', 'Sabrina Marques'),
	('CRN-RJ 548214', 'Ana Freitas'),
	('CRM-MG 394356', 'Carina Peixoto'),
	('CRM-RS 294120', 'Rafael Villar'),
	('CRM-RJ 124816', 'Jose Teixeira Filho'),
	('CRM-MG 364331', 'Amanda Marreiro'),
	('CRM-SP 125647', 'Flavio Zanardi'),
	('CRM-BA 875426', 'Bruno Reis'),
	('CRM-PE 343864', 'Flavio Hiroshi'),
	('CRM-RJ 347896', 'Bruno Barreiro')

INSERT INTO tb_faq (pergunta, resposta, situacao)
VALUES  ('Se eu tiver problemas com o sistema, como fa�o para solucion�-los?', 'O ProntOnline possui uma equipe de suporte altamente qualificada e preparada para resolver seus problemas, al�m de oferecer um atendimento r�pido e eficiente. Voc� tamb�m conta com o suporte online via chat.', 1),
	('Existe um aplicativo para uso em dispositivos m�veis?', 'Ainda n�o. Mas, nossa equipe de desenvolvimento j� est� trabalhando para desenvolver um aplicativo para IOS e Android.', 1),
	('Como recuperar minha senha?', 'Para recuperar sua senha, clique em Esqueci a senha, na pagina de login.', 1),
	('Preciso me preocupar com backup?', 'N�o. O ProntOnline faz o backup automaticamente para voc�.', 1),
	('Qual o valor para utiliza��o por m�s?', 'O ProntOnline � totalmente GRATUITO!', 1)

INSERT INTO tb_funcionario (nome, CPF, senha, email, telefone)
VALUES	('Ana Paula', 13367597089, 'admin123', 'anapaula@prontonline.com', 977676440),
	('Gabriela', 25302780696, 'admin123', 'gabriela@prontonline.com', 944073275),
	('Julia', 45628840051, 'admin123', 'julia@prontonline.com', 936569585),
	('Mariana', 67067661751, 'admin123', 'mariana@prontonline.com', 957727524),
	('Ana Carolina', 58781624820, 'admin123', 'anacarolina@prontonline.com', 997367493)

INSERT INTO tb_tipoFratura (descricao, situacao)
VALUES 
('C�ccix',1),
('Costelas',1),
('Esterno',1),
('Coluna Vertebral',1),
('Vertebra',1),
('Cr�nio',1),
('Maxilar',1),
('Mand�bula',1),
('Clav�cula',1),
('Esc�pula',1), 
('�mero',1),
('Ulna',1),
('R�dio',1),
('Carpais',1), 
('Metacarpais',1), 
('Falange',1), 
('�lio',1),
('�squio',1),
('P�bis',1),
('F�mur',1),
('Patela',1), 
('F�bula',1),
('T�bia',1)

INSERT INTO tb_tipoExame (nome, situacao) VALUES
('Bilirrubina direta',1),
('Bilirrubina indireta',1),
('Bilirrubina total',1),
('Bilirrubina total e fra��es',1),
('Citomegalov�rus',1),
('Creatinina',1),
('Creatinofosfoquinase',1),
('Creatinoquinase',1),
('Desidrogenase L�ctica',1),
('Dextrostix',1),
('Enzima Conversora da Angiotensina',1),
('Fator de Ativa��o Plaquet�ria',1),
('F�sforo',1),
('Hemoglobina',1),
('Hemat�crito',1),
('Horm�nio Tireoestimulante',1),
('Imunoglobulina(IgG, IgM, IgD e IgE)',1),
('Leuc�citos',1),
('Linf�cito T Helper',1),
('Linf�cito T Killer',1),
('Lipoprote�na de alta densidade',1),
('Lipoprote�na de baixa densidade',1),
('Lipoprote�na de muito baixa densidade',1),
('Magn�sio',1),
('Paratohorm�nio',1),
('Pot�ssio',1),
('Prote�na C Reativa',1),
('Protoparasitol�gico de fezes',1),
('Pept�dio Natriur�tico Cerebral',1),
('Tempo de ativa��o parcial de tromboplastina',1),
('Derivativa de Prote�na Purificada',1),
('Teste Tubercul�nico',1), 
('Horm�nio Adrenocorticotr�fico',1), 
('Horm�nio Fol�culo Estimulante',1),    
('Staphylococcus aureusesistente a Meticiclina',1),
('�cido Gama-Aminobut�rico',1),
('Ant�geno Prost�tico Espec�fico',1),  
('Horm�nio Antidiur�tico',1),
('Horm�nio Luteinizante',1),     
('S�dio',1),
('Tempo de Atividade de Protrombina',1),
('Tempo de Protrombina',1),
('Tempo de sangramento',1),    
('Tetraiodotironina ou tiroxina',1),    
('Tiroxina Livre',1),        
('Transaminase Oxaloac�tica',1), 
('Transaminase Pir�vica',1),
('Triiodotironina',1),          
('Ur�ia',1),  
('Ecocardiograma',1),         
('Teste Ergom�trico',1),     
('Resson�ncia Magn�tica',1),     
('Angiografia Magn�tica',1),     
('Tomografia',1),     
('Bi�psia',1),                        
('Pun��o',1),                        
('Ultrassonogafia',1),                 
('Densitometria �ssea',1),             
('Cintilografia �ssea',1),             
('Resson�ncia Magn�tica da Pelve',1),     
('Resson�ncia Magn�tica do Abdome Superior',1),  
('Resson�ncia Magn�tica do T�rax',1),     
('Tomografia Computadorizada do Pesco�o',1),   
('Radiografia',1) 
                          
INSERT INTO tb_permissao (descricao) values ('Administrador'), ('Suporte')
