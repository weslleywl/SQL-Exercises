-- convert update coluna computada


CREATE TABLE #T2
(
col1 char(5),
col2 AS CONVERT(money, col1)  -- criando uma coluna computada que recebe o valor da outra
)
insert into #t2 (col1) values ('55,93')
select * from #T2

-- outra maneira
UPDATE #t2 
SET col2 = CONVERT(MONEY, REPLACE(col1, ',', '.'))

go
