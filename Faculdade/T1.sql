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
('Klaus','klaus@outlook.com', 'Itapevi'),
('Bruce','wayne@corp.com', 'Niterói'),
('Clark','clarimd@gmail.com', 'São Paulo'),
('Peter','parker@outlook.com','São Paulo'),
('Connor','tk800@cyberlife.com','Carapicuíba'),
('Arnold','schwarzenegger@hotmail.com','Cotia'),
('Wile','wilec@acme.corp.br','Cotia'),
('Leon','leonkennedy@gmail.com','Carapicuíba');

INSERT INTO Produto (NomeProduto, Preco, Estoque) VALUES
('PlayStation® 5 Slim', 3800.00,45),
('PlayStation® 5 PRO', 6075.98,45),
('PlayStation® 4',2556.00,8),
('Alieware 16', 8999.99,100),
('Monitor AOC 120Hz', 823.09,4),
('Samsung S20+', 5600.90,2),
('Teclado Redragon Kumara', 900.09,11),
('Xbox One', 1767.90,8),
('Headset Pulse Elite', 768.90,56),
('Entendendo SQL', 126.98,12);

INSERT INTO Pedido (IdCliente, DataPedido) VALUES
(1, '2026-05-01'),
(2, '2025-07-08'),
(3, '2021-12-25'),
(4, '2022-01-02'),
(5, '2023-08-25'),
(6, '2026-01-25'),
(7, '2020-11-14'),
(8, '2020-01-14'),
(9, '2025-08-09'),
(10,'2025-11-25');

INSERT INTO ItemPedido (IdPedido, IdProduto, Quantidade, ValorUnitario) VALUES
(7, 8, 2, 1767.90),
(7, 2, 1,6075.98),
(8, 1, 2, 3800.00),
(8, 2, 3, 6075.98),
(3, 10, 2, 126.98),
(4, 4, 2, 8999.99),
(5, 3, 1, 2556.00),
(2, 6, 2, 5600.92),
(2, 4, 1, 8999.99),
(2, 5, 1, 823.00),
(9, 6, 1, 5600.00),
(10, 10, 5, 126.98),
(6, 7, 3, 900.90),
(1, 1, 3, 6075.90),
(1, 5, 1, 823.00);
