/*Listar Triagem Pacientes*/
CREATE OR ALTER PROCEDURE sp_listarTriagem
AS
BEGIN
		SELECT 
		P.nm_paciente As Pacientes,
		E.nm_profissional as Profissionais,
		T.vl_PA as Triagem,
		T.vl_pulso as Triagem
		from triagem t 
		inner join  pacientes P
		on T.id_paciente = p.id_paciente
		inner join profissionais E
		on t.id_enfermeiro = e.id_profissional
END
GO