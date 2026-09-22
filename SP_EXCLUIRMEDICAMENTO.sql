CREATE OR ALTER PROCEDURE sp_ExcluirMedicamento
@idMedicamento int
AS
BEGIN
	if EXISTS (select 1 from medicamentos where id_medicamento = @idMedicamento)
		begin
			delete from medicamentos where id_medicamento = @idMedicamento
		end
	else 
	begin
		Print 'Medicamento não encontrado'
	end
END
GO