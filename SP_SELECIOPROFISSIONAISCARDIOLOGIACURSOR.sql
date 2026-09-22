CREATE OR ALTER PROCEDURE sp_selecionarProfissioanaisCardiologia
AS
BEGIN
	DECLARE @Nome varchar(100);
	DECLARE @Especialidade varchar(50);
	DECLARE @Contador INT = 0;

	DECLARE cursorProfissionais cursor for
		select 
			P.nm_profissional AS Profissionais,
			E.ds_descricao as Especialidades
			FROM profissionais P
			inner join especialidades E
			on P.id_especialidade = E.id_especialidade

	OPEN cursorProfissionais;

	FETCH NEXT FROM cursorProfissionais INTO @Nome, @Especialidade

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @Especialidade = 'CARDIOLOGIA'
		BEGIN
		SET @Contador = @Contador + 1;
		PRINT 'Nome Profissional: ' + @Nome +
		'||Especialidade: ' + @Especialidade
		END

		FETCH NEXT FROM cursorProfissionais INTO @Nome, @Especialidade
	END
	CLOSE cursorProfissionais ;
	DEALLOCATE cursorProfissionais;

	PRINT 'Total de Profissionais de Cardiologia:' + CAST (@Contador AS VARCHAR(10))
END
GO