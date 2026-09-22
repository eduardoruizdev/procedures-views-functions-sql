/*Procedure para filtrar pacientes*/
CREATE OR ALTER PROCEDURE sp_classificarPacienteIdade
	@idPaciente int
AS
BEGIN
	DECLARE @Nome varchar(100);
	DECLARE @DataNascimento DATE;
	DECLARE @Idade INT;
	DECLARE @Classificacao VARCHAR(20);

		select 
			@Nome = nm_paciente,
			@DataNascimento = dt_nascimento
			from pacientes
			where id_paciente = @idPaciente

		set @Idade = DATEDIFF(YEAR, @DataNascimento, GETDATE());

		IF @Idade <= 12
			set @Classificacao = 'Infantil';
		ELSE IF @Idade <= 17
			SET @Classificacao = 'Adolescente';
		ELSE IF @Idade <= 59
			SET @Classificacao = 'Adulto';
		ELSE
			SET @Classificacao = 'Idoso';

SELECT
    @Nome AS Paciente,
    @Idade AS Idade,
    @Classificacao AS Classificacao;
END
GO