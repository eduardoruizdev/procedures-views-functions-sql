/*Procedure para buscar cidade do paciente*/
CREATE OR ALTER PROCEDURE sp_BuscarCidade
@cidade varchar(30)
AS
BEGIN
	select * from pacientes where ds_cidade = @cidade;
END
GO