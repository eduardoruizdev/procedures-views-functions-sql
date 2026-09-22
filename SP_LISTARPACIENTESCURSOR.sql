create or alter PROCEDURE sp_listarPacientesCursor
as 
begin
	DECLARE @Nome VARCHAR(100);
	DECLARE @DataNascimento DATE;
	DECLARE @Idade int

	DECLARE cursorPacientes CURSOR FOR
		select nm_paciente, dt_nascimento from pacientes;

	Open cursorPacientes;

	FETCH NEXT FROM cursorPacientes
	INTO @Nome, @DataNascimento

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Idade = DATEDIFF(YEAR, @DataNascimento, GETDATE());

		PRINT 'Paciente' + @Nome +
		'| Idade:' + Cast(@idade as VARCHAR);

		fetch next from cursorPacientes
		INTO @Nome, @DataNascimento;
	END;
	CLOSE cursorPacientes;
	DEALLOCATE cursosPacientes
end
go