CREATE OR ALTER PROCEDURE sp_listar
AS
BEGIN
	SELECT
		P.nm_profissional as Profissionais,
		E.ds_descricao as Especialidades,
		T.ds_tipo  as Tipo_Profissionais
		from profissionais P
		inner join especialidades E
			on ds_descricao = E.ds_descricao
		inner join tipos_profissionais T
			on ds_tipo = T.ds_tipo
			WHERE nm_profissional  LIKE 'E%'
END
GO