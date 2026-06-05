USE T2_Imobiliaria;

SELECT P.Nome_Prop FROM Proprietario P
WHERE EXISTS(SELECT 1 FROM Imovel I WHERE I.Id_Prop = P.Id_Prop);

SELECT * FROM Imovel
WHERE Cidade IN ('Osasco', 'Barueri');

SELECT Tipo_Imovel, Cidade, Valor_Imovel FROM Imovel
WHERE Valor_Imovel > ANY(SELECT Valor_Imovel FROM Imovel WHERE Cidade = 'Carapicuiba');

SELECT Tipo_Imovel, Cidade, Valor_Imovel FROM Imovel
WHERE Valor_Imovel > ALL(SELECT  Valor_Imovel FROM Imovel WHERE Cidade = 'Cotia');

GO