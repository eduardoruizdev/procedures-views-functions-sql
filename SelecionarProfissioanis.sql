/*Listar todos os profissionais Nome, especialidade, e qual o tipo de profissional que ele é*/

CREATE OR ALTER PROCEDURE sp_ListarProfissionais
AS
BEGIN
		SELECT
		P.nm_profissional AS Profissionais,
		E.ds_descricao as Especialidades,
		T.ds_tipo as Tipos_profissionais
		from profissionais P
		inner join especialidades E
		ON ds_descricao = E.ds_descricao
		Inner join tipos_profissionais T
		ON ds_tipo = T.ds_tipo
		where p.nm_profissional = P.nm_profissional

END
GO