CREATE OR ALTER PROCEDURE sp_ClassificarMedicamentos
AS
BEGIN
	DECLARE @NomeMedicamento varchar(100);
	DECLARE @Custo float;
	DECLARE @Venda float;
	DECLARE @Classificacao varchar(20);

	DECLARE cursorMedicamentos cursor for
		select ds_descricao, vl_custo, vl_venda from medicamentos;

	OPEN cursorMedicamentos;
	FETCH NEXT FROM cursorMedicamentos
	INTO @NomeMedicamento, @Custo, @Venda

	while @@FETCH_STATUS = 0 
	begin
		SET @Classificacao = 
		CASE
			WHEN @Custo <= 30 THEN 'Baixo Custo'
			WHEN @Custo <= 75 THEN 'Médio Custo'
			ELSE 'Alto Custo'
		END
PRINT 'Medicamento: ' + @NomeMedicamento +
      ' | Custo: R$ ' + CAST(@Custo AS VARCHAR(20)) +
      ' | Venda: R$ ' + CAST(@Venda AS VARCHAR(20)) +
      ' | Classificação: ' + @Classificacao;

		FETCH NEXT FROM cursorMedicamentos 
		INTO @NomeMedicamento, @Custo, @Venda
	end
	Close cursorMedicamentos;
	DEALLOCATE cursorMedicamentos;
END
GO