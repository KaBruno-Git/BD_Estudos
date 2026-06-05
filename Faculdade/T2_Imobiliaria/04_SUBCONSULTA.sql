USE T2_Imobiliaria;

SELECT Tipo_Imovel, Endereco, Valor_Imovel
FROM Imovel
WHERE Valor_Imovel > (SELECT AVG(Valor_Imovel) FROM Imovel);

SELECT Nome_Cliente, Tel_Cliente
FROM Cliente
WHERE Id_Cliente IN (SELECT Id_Cliente FROM Visita WHERE Status_Visita = 'Realizada');

SELECT Nome_Corr, Creci
FROM Corretor
WHERE Id_Corr IN (SELECT Id_Corr FROM Contrato WHERE Valor_Contrato > 500000.00);

SELECT Tipo_Imovel, Endereco
FROM Imovel
WHERE Id_Prop IN (SELECT Id_Prop FROM Proprietario WHERE Email_Prop LIKE '%@gmail.com');

SELECT Endereco, Valor_Imovel
FROM Imovel
WHERE Cidade = 'Osasco' AND Valor_Imovel = (SELECT MAX(Valor_Imovel) FROM Imovel WHERE Cidade = 'Osasco');

GO