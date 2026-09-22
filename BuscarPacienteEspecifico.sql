/*Procedure para listar todos os dados de um paciente em especifico atraves do ID dele*/
CREATE OR ALTER PROCEDURE sp_BuscarPaciente
@IdPaciente int
AS
BEGIN
	select * from pacientes where id_paciente = @IdPaciente;
END;
GO