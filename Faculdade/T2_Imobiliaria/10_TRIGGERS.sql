USE T2_Imobiliaria;
GO

CREATE OR ALTER TRIGGER TRG_Auditar_Contrato ON Contrato
AFTER INSERT AS BEGIN
	INSERT INTO Auditoria(Tabela_Alterada, Operacao, Id_Registro, Observacao)
	SELECT 'Contrato', 'INSERT', Id_Contrato, 'contrato registrado com sucesso.'
	FROM inserted;
END;
GO

CREATE OR ALTER TRIGGER TRG_Bloqueio_Exclusao ON Corretor
INSTEAD OF DELETE AS BEGIN
	RAISERROR('Não é possível deletar corretores ativos!', 16, 1);
END;
GO