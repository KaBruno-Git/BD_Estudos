USE T2_Imobiliaria;
GO

CREATE PROCEDURE SP_AtualizarValorImovel
	@IdImovel INT,
	@NovoValor DECIMAL(5,2)
AS BEGIN UPDATE Imovel
	SET Valor_Imovel = @NovoValor
	WHERE Id_Imovel = @IdImovel;
END;
GO

CREATE PROCEDURE SP_AlterarStatusVisita
	@IdCliente INT,
	@IdImovel INT,
	@NovoStatus VARCHAR(20)
AS BEGIN UPDATE Visita
	SET Status_Visita = @NovoStatus
	WHERE Id_Cliente = @IdCliente AND Id_Imovel = @IdImovel;
END;
GO