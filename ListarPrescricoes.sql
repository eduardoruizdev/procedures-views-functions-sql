/*Listar Prescrições dos pacientes*/

CREATE OR ALTER PROCEDURE sp_listarPrescricoes
AS
BEGIN
	SELECT
		C.nm_paciente AS Pacientes,
		P.nm_profissional as Profissionais,
		M.ds_descricao as Medicamentos,
		O.id_prescricao 
		from prescricoes O
		inner join pacientes C
		on nm_paciente = C.nm_paciente
		Inner join Profissionais P
		on nm_profissional = p.nm_profissional
		inner join medicamentos  M
			on ds_descricao = M.ds_descricao
END
GO