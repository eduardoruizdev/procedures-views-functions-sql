CREATE OR ALTER PROCEDURE sp_relatoriosMedicamentos
AS
BEGIN
	select IdMedicamento,Nome,Estoque, Valor,
	  Estoque * Valor AS ValorTotalEstoque,
	CASE
		WHEN Valor <= 30 THEN 'Baixo Custo'
		WHEN Valor <= 150 THEN 'Medio Custo'
		ELSE 'ALTO CUSTO'
		END AS Classificacao
		from Medicamentos
		where cd_status = 'A'
    SELECT
        SUM(CASE WHEN Valor <= 30 THEN 1 ELSE 0 END) AS TotalBaixoCusto,
        SUM(CASE WHEN Valor > 30 AND Valor <= 150 THEN 1 ELSE 0 END) AS TotalMedioCusto,
        SUM(CASE WHEN Valor > 150 THEN 1 ELSE 0 END) AS TotalAltoCusto
    FROM Medicamentos
	where cd_status = 'A';
END 
GO