create or alter function fnc_gerarSenhaAtendimento
(
	@id_triagem int,
	@dt_atendimento date
)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @UltimoSequencial INT;
	DECLARE @NovoSequencial INT;
	DECLARE @Senha VARCHAR(10);

	 SELECT @UltimoSequencial =
        MAX(CAST(RIGHT(vl_senha, 8) AS INT))
    FROM triagem;

	IF @UltimoSequencial IS NULL OR @UltimoSequencial <0
	BEGIN
		SET	@NovoSequencial = 1;
	END
	ELSE
	BEGIN
		SET @NovoSequencial = @UltimoSequencial + 1
	END
	SET @Senha = 'AT' + RIGHT('0000000' + CAST(@NovoSequencial AS VARCHAR(8)), 8);

	Return @Senha;
END
GO