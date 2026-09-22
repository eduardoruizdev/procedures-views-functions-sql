CREATE OR ALTER PROCEDURE sp_InserirEspecialidade
@ds_especialidade varchar(100)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM especialidades where ds_descricao = @ds_especialidade)
		begin 
			PRINT 'Atenção: Esta especialidade já está cadastrada'
		end
	ELSE
		BEGIN
		INSERT INTO especialidades(ds_descricao) values (@ds_especialidade);

		print 'Especialidade cadastrada com sucesso'
		end

END
GO