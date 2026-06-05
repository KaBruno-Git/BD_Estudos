USE T2_Imobiliaria;
GO

CREATE FUNCTION FN_Caculo_Comissao(
	@ValorContrato DECIMAL(15,2),
	@IdCorr INT
)
RETURNS DECIMAL (15,2) AS BEGIN
	DECLARE @Porcentagem DECIMAL (5,2);
	SELECT @Porcentagem = Comissao FROM Corretor WHERE Id_Corr = @IdCorr;
	RETURN (@ValorContrato*(@Porcentagem/100));
END;
GO

