/*PROCEDURE PARA BUSCAR PACIENTE POR CPF*/
CREATE OR ALTER PROCEDURE sp_BuscarPacienteCPF
@CPF varchar(20)
AS
begin
	select * from pacientes where nr_CPF = @CPF;
end
go