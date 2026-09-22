CREATE OR ALTER VIEW vw_profissionais
AS
	SELECT
	P.nm_profissional AS Profissional,
    E.ds_descricao AS Especialidade,
    T.ds_tipo AS TipoProfissional
FROM profissionais P
INNER JOIN especialidades E
    ON P.id_especialidade = E.id_especialidade
INNER JOIN tipos_profissionais T
    ON P.id_tipo_profissional = T.id_tipo;
GO