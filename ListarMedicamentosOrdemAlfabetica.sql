/*Procedure para buscar todos os medicamentos em ordem alfabetica*/

CREATE OR ALTER PROCEDURE sp_ListarMedicamentos
AS
BEGIN
	select * from medicamentos order by ds_descricao ASC;
END
GO