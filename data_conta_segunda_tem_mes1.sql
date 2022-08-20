DECLARE @T TABLE (Data SmallDateTime)

-- Cadastra os 100 primeiros dias do ano de 2009
;WITH Nums (Num) AS (SELECT 0 UNION ALL
SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL
SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL
SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) 

INSERT INTO @T
SELECT DATEADD(D,(N1.Num * 10) + N2.Num,'20090101')
FROM Nums AS N1 CROSS JOIN Nums AS N2 

-- Conta quantas segundas-feiras existem em janeiro por exemplo
SELECT SUM(
CASE WHEN DATEPART(weekday, Data + @@DATEFIRST) = 2 THEN 1 ELSE 0 END)
FROM
@T
WHERE Data >= '20090101' AND Data < '20090201'