CREATE OR ALTER VIEW vw_painelTriagemAtendimento
AS
	SELECT 
	 P.id_paciente,
	 P.nm_paciente,
	 E.nm_profissional as enfermeiro_responsavel,
	 M.nm_profissional as medico_responsavel,
	 T.ds_sintomas as triagem

	 from pacientes P

	 inner join triagem T
		on P.id_paciente = t.id_paciente
		
	Inner join atendimentos A
		on T.id_triagem = A.id_triagem

	inner join profissionais E
		on t.id_enfermeiro = E.id_profissional

	inner join profissionais M
		on A.id_medico = M.id_profissional
GO