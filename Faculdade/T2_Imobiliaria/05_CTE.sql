USE T2_Imobiliaria;

WITH FaturamentoporCidade AS(
	SELECT Cidade, SUM(Valor_Imovel) AS Total_Inventario, COUNT(*) AS Qtd_Imoveis
	FROM Imovel
	GROUP BY Cidade
)
SELECT Cidade, Total_Inventario, Qtd_Imoveis
FROM FaturamentoporCidade
WHERE Qtd_Imoveis > 2;

WITH MetaCorr AS(
	SELECT Id_Corr, SUM(Valor_Contrato) AS Total_Vendas, COUNT(*) AS Contratos_Fechados
	FROM Contrato
	WHERE Status_Contrato = 'Ativo'
	GROUP BY Id_Corr
)
SELECT C.Nome_Corr, M.Total_Vendas, M.Contratos_Fechados
FROM Corretor C
JOIN MetaCorr M ON C.Id_Corr = M.Id_Corr;

GO