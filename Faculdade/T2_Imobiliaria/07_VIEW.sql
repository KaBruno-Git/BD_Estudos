USE T2_Imobiliaria;
GO

CREATE OR ALTER VIEW VW_Contrato AS
SELECT Co.Id_Contrato, I.Tipo_Imovel, I.Cidade, Cl.Nome_Cliente, Corr.Nome_Corr, Co.Valor_Contrato, Co.Status_Contrato
FROM Contrato Co
JOIN Imovel I ON Co.Id_Imovel = I.Id_Imovel
JOIN Cliente Cl ON Co.Id_Cliente = Cl.Id_Cliente
JOIN Corretor Corr ON Co.Id_Corr = Corr.Id_Corr;
GO

CREATE OR ALTER VIEW VW_Imovel AS
SELECT Id_Imovel, Tipo_Imovel, Endereco, Cidade, Valor_Imovel
FROM Imovel
WHERE Status_Imovel = 'Disponivel';
GO