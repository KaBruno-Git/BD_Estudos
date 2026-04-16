CREATE DATABASE DB_Trabalho;

USE DB_Trabalho;

CREATE TABLE Cliente(
	IdCliente INT PRIMARY KEY AUTO_INCREMENT,
  	Nome VARCHAR(100) NOT NULL,
  	Email VARCHAR(100) NOT NULL UNIQUE,
  	Cidade VARCHAR(100) NOT NULL
);

CREATE TABLE Produto(
	IdProduto INT PRIMARY KEY AUTO_INCREMENT,
  	NomeProduto VARCHAR(200) NOT NULL,
  	Preco DECIMAL(10,2) NOT NULL,
    Estoque INT NOT NULL
);

CREATE TABLE Pedido(
	IdPedido INT PRIMARY KEY AUTO_INCREMENT,
  	IdCliente INT,
  	DataPedido DATE,
  	FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);

CREATE TABLE ItemPedido(
	IdItem INT PRIMARY KEY AUTO_INCREMENT,
  	IdPedido INT,
  	IdProduto INT,
  	Quantidade INT NOT NULL,
  	ValorUnitario DECIMAL(10,2) NOT NULL,
  	FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido),
  	FOREIGN KEY (IdProduto) REFERENCES Produto(IdProduto)
);

INSERT INTO Cliente (Nome, Email, Cidade) VALUES 
('Matheus','math@gmail.com', 'Osasco'),
('Elie','elie@hotmail.com', 'Barueri'),
('Kratos','bomdaguerra@outlook.com', 'Itapevi'),
('Bruce','wayne@corp.com', 'Niterói'),
('Clark','clarimdiario@gmail.com', 'São Paulo'),
('Peter','starkfan@outlook.com','São Paulo'),
('Connor','tk800@cyberlife.com','Carapicuíba'),
('Arnold','schwarzenegger@hotmail.com','Cotia'),
('Wile Coiote','wilec@acme.corp.br','Cotia'),
('Leon','leonkennedy@gmail.com','Carapicuíba');

INSERT INTO Produto (NomeProduto, Preco, Estoque) VALUES
('Leviathan Axe', 35000.00,1),
('Pólvora', 675.98,45),
('Câmera Canon',4356.00,8),
('TNT Acme', 899.99,100),
('Manual Pai do Ano', 123.09,4),
('Iron Man - Action Figure', 7600.90, 2),
('Android T800', 456900.09,1),
('Café 1KG', 167.90,8),
('Esteroides Equinos', 768.90, 56),
('Entendendo SQL', 876.98, 12);

INSERT INTO Pedido (IdCliente, DataPedido) VALUES
(1, '2026-05-01'),
(2, '2025-07-08'),
(3, '2021-12-25'),
(4, '1998-01-02'),
(5, '2023-08-25'),
(6, '2026-01-25'),
(7, '2001-11-14'),
(8, '1997-01-14'),
(9, '2011-08-09'),
(10,'2015-11-25');
