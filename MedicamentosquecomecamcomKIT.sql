/*Procedure para listar medicamentos que comecem com DIP*/
CREATE OR ALTER PROCEDURE sp_ListarKIT
AS 
BEGIN
	select * from medicamentos where ds_descricao LIKE 'KIT%'
END 
GO