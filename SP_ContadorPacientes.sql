CREATE OR ALTER PROCEDURE sp_ContadorPacientes
AS
BEGIN
	DECLARE @Nome varchar(100);
	DECLARE @Contador INT = 1;

	DECLARE cursorPacientes CURSOR FOR
		select nm_paciente from pacientes;

	OPEN cursorPacientes;

	FETCH NEXT FROM cursorPacientes
	INTO @Nome;
	
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT CAST (@Contador AS VARCHAR) +
			'º Paciente: ' + @Nome;
		set @Contador  = @Contador + 1;

		FETCH NEXT FROM cursorPacientes
		INTO @Nome;
	END
	CLOSE cursorPacientes;
	DEALLOCATE cursorPacientes;
END
GO