CREATE OR ALTER PROCEDURE sp_validarPreco
@idMedicamento int,
@Percentual float
AS
BEGIN
	DECLARE @Custo FLOAT;
	DECLARE @Venda FLOAT;
	DECLARE @NovaVenda float;
	SELECT
		@Custo = vl_custo,
		@Venda = vl_venda
	FROM medicamentos
	WHERE id_medicamento = @idMedicamento;
	IF @Custo IS NULL
	BEGIN
		PRINT 'MEDICAMENTO NÃO ENCONTRADO'
	END

	ELSE
	BEGIN
		SET @NovaVenda = @Venda + (@Venda * @Percentual /100)
		UPDATE medicamentos
		SET vl_venda = @NovaVenda
		WHERE id_medicamento = @idMedicamento

		IF @NovaVenda > (@Custo * 2)
		BEGIN
			PRINT 'Atualização feita com sucesso! Alerta: O valor de Venda ficou acima do dobro do custo!';
		END
		ELSE
		BEGIN
			PRINT 'Preço Atualizado com Sucesso'
		END
	END
END
GO