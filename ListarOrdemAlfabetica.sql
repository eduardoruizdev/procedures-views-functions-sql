/*Procedure para listar pacientes em ordem alfabetica*/

CREATE OR ALTER PROCEDURE sp_ListarPacientes
AS
BEGIN
	select id_paciente, nm_paciente, cd_sexo, ds_cidade, dt_nascimento from pacientes order by nm_paciente ASC;
END
GO