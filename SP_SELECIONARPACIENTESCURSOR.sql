CREATE OR ALTER PROCEDURE sp_selecionarPacientes
AS
BEGIN
	DECLARE @Nome VARCHAR(100);
	Declare @DataNascimento DATE;
	Declare @Idade int
	Declare @Classificacao VARCHAR(20);

	DECLARE cursorPacientes cursor for
		select nm_paciente, dt_nascimento from pacientes

	OPEN cursorPacientes

	FETCH NEXT FROM cursorPacientes
	into @Nome, @DataNascimento

	WHILE @@FETCH_STATUS = 0
	begin
		set @Idade = DATEDIFF(YEAR, @DataNascimento, GETDATE())

		SET @Classificacao = 
		CASE
			WHEN @Idade <=12 THEN 'Criança'
			WHEN @Idade <=17 THEN 'Adolescente'
			WHEN @Idade <= 59 THEN 'Adulto'
			ELSE 'IDOSO'
		END
		PRINT 'Paciente:  ' + @Nome +
			  '|Idade : ' + CAST(@Idade AS VARCHAR(3)) +
			  '|Classificação: ' + @Classificacao
		FETCH NEXT FROM cursorPacientes
	into @Nome, @DataNascimento
	end
	CLOSE cursorPacientes;
END
GO