CREATE DATABASE T2_BD_Imobiliaria;
GO

USE T2_BD_Imobiliaria;
GO

CREATE TABLE Proprietario(
	Id_Prop INT PRIMARY KEY IDENTITY(1,1),
	Nome_Prop VARCHAR(100) NOT NULL,
	cpf_Prop VARCHAR(14) NOT NULL UNIQUE,
	Tel_Prop VARCHAR(15),
	Email_Prop VARCHAR(100) UNIQUE
);

CREATE TABLE Corretor(
	Id_Corr INT PRIMARY KEY IDENTITY (1,1),
	Nome_Corr VARCHAR(100) NOT NULL,
	Creci VARCHAR(20) NOT NULL UNIQUE,
	Tel_Corr VARCHAR(15) NOT NULL UNIQUE,
	Email_Corr VARCHAR(100),
	Comissao DECIMAL(5,2) NOT NULL
);

CREATE TABLE Imovel(
	Id_Imovel INT PRIMARY KEY IDENTITY(1,1),
	Id_Prop INT NOT NULL,
	Id_Corr INT NOT NULL,
	Tipo_Imovel VARCHAR(30) NOT NULL,
	Endereco VARCHAR(200) NOT NULL,
	Cidade VARCHAR(200) NOT NULL,
	Area_M2 DECIMAL(10,2) NOT NULL,
	Valor_Imovel DECIMAL(15,2) NOT NULL,
	Status_Imovel VARCHAR(20) NOT NULL DEFAULT 'Disponivel',
	Finalidade VARCHAR(10) NOT NUlL CHECK (Finalidade IN('Venda','Aluguel')),
	FOREIGN KEY (Id_Prop) REFERENCES Proprietario(Id_Prop),
	FOREIGN KEY (Id_Corr) REFERENCES Corretor(Id_Corr)
);

CREATE TABLE Cliente(
	Id_Cliente INT PRIMARY KEY IDENTITY(1,1),
	Nome_Cliente VARCHAR(100) NOT NULL,
	cpf_Cliente VARCHAR(14) NOT NULL UNIQUE,
	Tel_Cliente VARCHAR(15),
	Interesse VARCHAR(10) NOT NULL CHECK (Interesse IN('Compra','Aluguel'))
);

CREATE TABLE Visita(
	Id_Visita INT PRIMARY KEY IDENTITY(1,1),
    Id_Cliente INT NOT NULL,
	Id_Imovel INT NOT NULL,
	Id_Corr INT NOT NULL,
	Data_Visita DATETIME NOT NULL,
	Status_Visita VARCHAR(20) NOT NULL DEFAULT 'Agendada' CHECK (Status_Visita IN('Agendada','Realizada','Cancelada')),
	Observacao VARCHAR(300),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
	FOREIGN KEY (Id_Imovel) REFERENCES Imovel(Id_Imovel),
	FOREIGN KEY (Id_Corr) REFERENCES Corretor(Id_Corr)
);

CREATE TABLE Contrato(
	Id_Contrato INT PRIMARY KEY IDENTITY(1,1),
	Id_Imovel INT NOT NULL,
	Id_Cliente INT NOT NULL,
	Id_Corr INT NOT NULL,
	Tipo_Contrato VARCHAR(10) NOT NULL CHECK (Tipo_Contrato IN('Venda','Aluguel')),
	Valor_Contrato DECIMAL(15,2) NOT NULL,
	Data_Assinatura DATE NOT NULL,
	Data_Encerramento DATE,
	Status_Contrato VARCHAR(20) NOT NULL DEFAULT 'Ativo' CHECK (Status_Contrato IN('Ativo','Cancelado','Encerrado')),
	FOREIGN KEY (Id_Imovel) REFERENCES Imovel(Id_Imovel),
	FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
	FOREIGN KEY (Id_Corr) REFERENCES Corretor(Id_Corr)
);

CREATE TABLE Auditoria(
	Id_Auditoria INT PRIMARY KEY IDENTITY(1,1),
	Tabela_Alterada VARCHAR(50) NOT NULL,
	Operacao VARCHAR(10) NOT NULL,
	Id_Registro INT NOT NULL,
	Data_Operacao DATETIME NOT NULL DEFAULT GETDATE(),
	Observacao VARCHAR(500)
);

CREATE INDEX IX_ValorImovel ON Imovel(Valor_Imovel);
CREATE INDEX IX_StatusImovel ON Imovel(Status_Imovel);

INSERT INTO Proprietario(Nome_Prop,cpf_Prop,Tel_Prop,Email_Prop)
VALUES
	('Carlos Eduardo Mendes','011.234.567-89','(11) 91234-5678','carlos.mendes@email.com'),
    ('Ana Paula Ferreira','022.345.678-90','(11) 92345-6789','ana.ferreira@email.com'),
    ('Roberto Alves Lima','033.456.789-01','(11) 93456-7890','roberto.lima@email.com'),
    ('Fernanda Costa Souza','044.567.890-12','(11) 94567-8901', 'fernanda.souza@email.com'),
    ('Marcelo Santos Oliveira','055.678.901-23','(11) 95678-9012','marcelo.oliveira@email.com'),
    ('Juliana Rocha Pereira','066.789.012-34','(11) 96789-0123','juliana.pereira@email.com'),
    ('Ricardo Gomes Teixeira','077.890.123-45','(11) 97890-1234','ricardo.teixeira@email.com'),
    ('Patricia Nascimento','088.901.234-56','(11) 98901-2345','patricia.nascimento@email.com'),
    ('Gustavo Barbosa Ramos','099.012.345-67','(11) 99012-3456','gustavo.ramos@email.com'),
    ('Camila Cardoso Martins','010.123.456-78','(11) 90123-4567','camila.martins@email.com'),
    ('Felipe Araujo Moreira','021.234.567-89','(11) 91234-5670','felipe.araujo@email.com'),
    ('Lucia Vieira Castro','032.345.678-90','(11) 92345-6780','lucia.vieira@email.com'),
    ('Bruno Dias Correia','043.456.789-01','(11) 93456-7891','bruno.dias@email.com'),
    ('Tatiana Pinto Carvalho','054.567.890-12','(11) 94567-8902','tatiana.pinto@email.com'),
    ('Diego Lopes Ribeiro','065.678.901-23','(11) 95678-9013','diego.lopes@email.com'),
    ('Vanessa Monteiro Silva','076.789.012-34','(11) 96789-0124','vanessa.monteiro@email.com'),
    ('Anderson Farias Nunes','087.890.123-45','(11) 97890-1235','anderson.farias@email.com'),
    ('Bianca Rezende Campos','098.901.234-56','(11) 98901-2346','bianca.rezende@email.com'),
    ('Thiago Cunha Azevedo','019.012.345-67','(11) 99012-3457','thiago.cunha@email.com'),
    ('Renata Freitas Moura','020.123.456-78','(11) 90123-4568','renata.freitas@email.com'),
    ('Leonardo Sampaio Cruz','031.234.567-89','(11) 91234-5671','leonardo.sampaio@email.com'),
    ('Claudia Borges Melo','042.345.678-90','(11) 92345-6781','claudia.borges@email.com'),
    ('Rodrigo Cavalcanti','053.456.789-01','(11) 93456-7892',NULL),
    ('Mariana Queiroz Duarte','064.567.890-12','(11) 94567-8903','mariana.queiroz@email.com'),
    ('Eduardo Batista Soares','075.678.901-23','(11) 95678-9014','eduardo.batista@email.com');

INSERT INTO Corretor (Nome_Corr, Creci, Tel_Corr, Email_Corr, Comissao)
VALUES
    ('Marcos Vinicius Prado','CRECI-SP-123456','(11) 99111-1111','marcos.prado@imob.com',6.00),
    ('Sandra Lima Fonseca','CRECI-SP-234567','(11) 99222-2222','sandra.fonseca@imob.com',5.50),
    ('Paulo Henrique Torres','CRECI-SP-345678','(11) 99333-3333','paulo.torres@imob.com',6.50),
    ('Aline Mendonca Costa','CRECI-SP-456789','(11) 99444-4444','aline.mendonca@imob.com',5.00),
    ('Rafael Andrade Matos','CRECI-SP-567890','(11) 99555-5555','rafael.andrade@imob.com',7.00),
    ('Cristina Vargas Neto','CRECI-SP-678901','(11) 99666-6666','cristina.vargas@imob.com',5.50),
    ('Flavio Braga Assuncao','CRECI-SP-789012','(11) 99777-7777','flavio.braga@imob.com',6.00),
    ('Isabela Figueiredo','CRECI-SP-890123','(11) 99888-8888','isabela.fig@imob.com',5.00),
    ('Henrique Moraes Paiva','CRECI-SP-901234','(11) 99999-9999','henrique.moraes@imob.com',6.50),
    ('Viviane Esteves Rocha','CRECI-SP-012345','(11) 99000-0000','viviane.esteves@imob.com',5.50);

INSERT INTO Cliente (Nome_Cliente, Cpf_Cliente, Tel_Cliente, Interesse)
VALUES
    ('Joao Pedro Almeida','111.222.333-44','(11) 98001-0001','Compra'),
    ('Maria Clara Nunes','222.333.444-55','(11) 98002-0002','Aluguel'),
    ('Pedro Augusto Viana','333.444.555-66','(11) 98003-0003','Compra'),
    ('Larissa Teles Muniz','444.555.666-77','(11) 98004-0004','Aluguel'),
    ('Gabriel Souza Leite','555.666.777-88','(11) 98005-0005','Compra'),
    ('Amanda Furtado Gomes','666.777.888-99','(11) 98006-0006','Compra'),
    ('Lucas Henrique Pires','777.888.999-00','(11) 98007-0007','Aluguel'),
    ('Natalia Couto Brandao','888.999.000-11','(11) 98008-0008','Compra'),
    ('Vitor Hugo Macedo','999.000.111-22','(11) 98009-0009','Aluguel'),
    ('Isabela Ramos Guedes','000.111.222-33','(11) 98010-0010','Compra'),
    ('Caio Fernandes Luz','112.223.334-45','(11) 98011-0011','Aluguel'),
    ('Beatriz Carmo Selva','223.334.445-56','(11) 98012-0012','Compra'),
    ('Matheus Oliveira Bueno','334.445.556-67','(11) 98013-0013','Aluguel'),
    ('Leticia Assis Negrao','445.556.667-78','(11) 98014-0014','Compra'),
    ('Andre Luiz Coutinho','556.667.778-89','(11) 98015-0015','Compra'),
    ('Priscila Maia Fontes','667.778.889-90','(11) 98016-0016','Aluguel'),
    ('Sergio Nogueira Vaz','778.889.990-01','(11) 98017-0017','Compra'),
    ('Tatiane Leao Braga','889.990.001-12','(11) 98018-0018','Aluguel'),
    ('Guilherme Paes Rangel','990.001.112-23','(11) 98019-0019','Compra'),
    ('Fernanda Brum Lacerda','001.112.223-34','(11) 98020-0020','Aluguel'),
    ('Igor Tavares Godoi','113.224.335-46','(11) 98021-0021','Compra'),
    ('Aline Pontes Siqueira','224.335.446-57','(11) 98022-0022','Aluguel'),
    ('Thales Borba Dantas','335.446.557-68','(11) 98023-0023','Compra'),
    ('Sabrina Melo Espindola','446.557.668-79','(11) 98024-0024','Aluguel'),
    ('Davi Correia Magalhaes','557.668.779-80','(11) 98025-0025','Compra');

INSERT INTO Imovel (Id_Prop, Id_Corr, Tipo_Imovel, Endereco, Cidade, Area_M2, Valor_Imovel, Status_Imovel, Finalidade)
VALUES
    (1,1,'Apartamento','Rua das Flores, 101, Apto 21','Sao Paulo',65.00,450000.00,'Disponivel','Venda'),
    (2,2,'Casa','Rua dos Pinheiros, 45','Osasco',120.00,380000.00,'Disponivel','Venda'),
    (3,3,'Apartamento','Av. Paulista, 2000, Apto 54','Sao Paulo',80.00,720000.00,'Vendido','Venda'),
    (4,4,'Terreno','Rua Ipe Amarelo, s/n','Barueri',300.00,210000.00,'Disponivel','Venda'),
    (5,5,'Casa','Alameda dos Anjos, 88','Carapicuiba',150.00,320000.00,'Alugado','Aluguel'),
    (6,6,'Sala Comercial','Av. Brasil, 500, Sala 12','Sao Paulo',45.00,180000.00,'Disponivel','Aluguel'),
    (7,7,'Apartamento','Rua Voluntarios, 310, Apto 8','Sao Paulo',55.00,390000.00,'Disponivel','Venda'),
    (8,8,'Casa','Rua Jasmim, 77','Cotia',200.00,480000.00,'Disponivel','Venda'),
    (9,9,'Apartamento','Rua Consolacao, 900, Apto 33','Sao Paulo',70.00,620000.00,'Disponivel','Venda'),
    (10,10,'Casa','Rua das Acacias, 15','Osasco',180.00,415000.00,'Vendido','Venda'),
    (11,1,'Terreno','Estrada das Palmeiras, km 3','Barueri',500.00,350000.00,'Disponivel','Venda'),
    (12,2,'Apartamento','Av. Santo Amaro, 1200, Apto 15','Sao Paulo',60.00,510000.00,'Disponivel','Venda'),
    (13,3,'Casa','Rua Cedro, 200','Carapicuiba',130.00,290000.00,'Disponivel','Aluguel'),
    (14,4,'Sala Comercial','Rua XV de Novembro, 80, Sala 5','Osasco',35.00,120000.00,'Alugado','Aluguel'),
    (15,5,'Apartamento','Rua Augusta, 450, Apto 72','Sao Paulo',90.00,850000.00,'Disponivel','Venda'),
    (16,6,'Casa','Rua das Orquideas, 33','Cotia',160.00,360000.00,'Disponivel','Venda'),
    (17,7,'Apartamento','Av. Reboucas, 750, Apto 41','Sao Paulo',75.00,670000.00,'Disponivel','Venda'),
    (18,8,'Terreno','Rua do Bosque, s/n','Barueri',400.00,280000.00,'Disponivel','Venda'),
    (19,9,'Casa','Rua Magnolia, 55','Osasco',140.00,340000.00,'Disponivel','Aluguel'),
    (20,10,'Apartamento','Rua Haddock Lobo, 320, Apto 9','Sao Paulo',85.00,780000.00,'Disponivel','Venda'),
    (21,1,'Sala Comercial','Av. Ibirapuera, 2100, Sala 30','Sao Paulo',50.00,220000.00,'Disponivel','Aluguel'),
    (22,2,'Casa','Rua Pereira Barreto, 18','Carapicuiba',110.00,265000.00,'Disponivel','Venda'),
    (23,3,'Apartamento','Rua Pamplona, 600, Apto 18','Sao Paulo',68.00,590000.00,'Vendido','Venda'),
    (24,4,'Casa','Estrada do Morro, 900','Cotia',250.00,520000.00,'Disponivel','Venda'),
    (25,5,'Apartamento','Av. Angelica, 1800, Apto 27','Sao Paulo',72.00,640000.00,'Disponivel','Venda');

INSERT INTO Visita (Id_Cliente, Id_Imovel, Id_Corr, Data_Visita, Status_Visita, Observacao)
VALUES
    (1,1,1,'2025-01-10 10:00:00','Realizada','Cliente gostou do apartamento'),
    (2,2,2,'2025-01-12 14:00:00','Realizada','Cliente pediu desconto no valor'),
    (3,3,3,'2025-01-15 09:00:00','Realizada','Negociacao em andamento'),
    (4,4,4,'2025-01-18 11:00:00','Cancelada','Cliente cancelou por motivo pessoal'),
    (5,5,5,'2025-01-20 15:00:00','Realizada','Aluguel confirmado apos visita'),
    (6,6,6,'2025-02-03 10:30:00','Realizada','Sala atende necessidades do cliente'),
    (7,7,7,'2025-02-05 14:30:00','Agendada',NULL),
    (8,8,8,'2025-02-08 09:30:00','Realizada','Cliente vai pensar e retornar'),
    (9,9,9,'2025-02-10 16:00:00','Realizada','Muito interesse, solicitou proposta'),
    (10,10,10,'2025-02-12 11:30:00','Realizada','Imovel vendido apos esta visita'),
    (11,11,1,'2025-02-15 10:00:00','Cancelada','Corretor nao pode comparecer'),
    (12,12,2,'2025-02-18 14:00:00','Realizada','Apartamento agradou bastante'),
    (13,13,3,'2025-03-01 09:00:00','Realizada','Aluguel negociado com sucesso'),
    (14,14,4,'2025-03-03 11:00:00','Realizada','Sala pequena para a necessidade'),
    (15,15,5,'2025-03-05 15:00:00','Realizada','Alto valor, cliente em analise'),
    (16,16,6,'2025-03-08 10:30:00','Agendada',NULL),
    (17,17,7,'2025-03-10 14:30:00','Realizada','Proposta enviada ao proprietario'),
    (18,18,8,'2025-03-12 09:30:00','Cancelada','Imovel em reformas no periodo'),
    (19,19,9,'2025-03-15 16:00:00','Realizada','Aluguel aprovado'),
    (20,20,10,'2025-03-18 11:30:00','Realizada','Cliente solicitou segunda visita'),
    (21,21,1,'2025-04-01 10:00:00','Realizada','Sala bem localizada, interesse alto'),
    (22,22,2,'2025-04-03 14:00:00','Realizada','Casa dentro do orcamento'),
    (23,23,3,'2025-04-05 09:00:00','Realizada','Contrato assinado apos visita'),
    (24,24,4,'2025-04-08 11:00:00','Agendada',NULL),
    (25,25,5,'2025-04-10 15:00:00','Realizada','Muita aptidao ao imovel');

INSERT INTO Contrato (Id_Imovel, Id_Cliente, Id_Corr, Tipo_Contrato, Valor_Contrato, Data_Assinatura, Data_Encerramento, Status_Contrato)
VALUES
    (3,3,3,'Venda',720000.00,'2025-01-20',NULL,'Ativo'),
    (5,5,5,'Aluguel',2800.00,'2025-01-25','2026-01-25','Ativo'),
    (10,10,10,'Venda',415000.00,'2025-02-15',NULL,'Ativo'),
    (14,14,4,'Aluguel',1500.00,'2025-03-05','2026-03-05','Ativo'),
    (23,23,3,'Venda',590000.00,'2025-04-10',NULL,'Ativo'),
    (19,19,9,'Aluguel',2200.00,'2025-03-20','2026-03-20','Ativo'),
    (2,2,2,'Venda',370000.00,'2025-05-01',NULL,'Encerrado'),
    (6,6,6,'Aluguel',3500.00,'2024-06-01','2025-06-01','Encerrado'),
    (1,1,1,'Venda',440000.00,'2025-06-15',NULL,'Ativo'),
    (13,13,3,'Aluguel',1800.00,'2025-03-05','2026-03-05','Ativo'),
    (9,9,9,'Venda',610000.00,'2025-07-01',NULL,'Ativo'),
    (7,7,7,'Venda',385000.00,'2025-07-10',NULL,'Cancelado'),
    (21,21,1,'Aluguel',4200.00,'2025-08-01','2026-08-01','Ativo'),
    (17,17,7,'Venda',660000.00,'2025-08-15',NULL,'Ativo'),
    (12,12,2,'Venda',500000.00,'2025-09-01',NULL,'Ativo');
