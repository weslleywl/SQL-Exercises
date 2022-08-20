/*1)PARA FAZER UMA CHECKAGEM EM VÁRIAS TABELAS(substitui o cursor)?
Analogicamente a Stored Procedure sp_Msforeachdb permite a execução de uma tarefa para todos os bancos de dados. 
*/
sp_MSforeachtable @command1="print '?' dbcc checktable ('?')" 

select * from anexo
--2)(substitui cursor) quantos numeros tem neste campo menor que seis
select sum(case when quantidade <= 6
then 1 else 0 end) as 'de 1 a 5 unidades',
sum(CASE WHEN quantidade BETWEEN 11 AND 20 THEN 1 ELSE 0 END) 
AS 'DE 11 A 20 UNIDADES' 
from anexo

select * from instu
truncate table instu
DBCC SQLPERF (LOGSPACE) (agora)
CHECKPOINT
select * from instu
-- criando um loop de insert de dados
DECLARE @CONT INT
SET @CONT = 1
WHILE @CONT <= 4
BEGIN
	INSERT INTO instu VALUES('15')
	SET @CONT = @CONT + 1
END
-- Diferença de apagar os dados pelo delete e truncate
delete instu from instu (com o delete vc diz qual é o campo a ser apagado)
truncate table instu (com o truncate ele apaga a tabela toda)

select * from instu
-- dessa maneira atualiza tudo
update instu
 set codinssau = 8
where codinssau = 15
-- atualiza que pede
select * from itens
UPDATE itens
SET idvenda = 13
FROM itens It1
WHERE It1.idvenda = 1 AND
It1.idproduto = 1

-- usando inner join para atualiza
select * from pai
select * from filho

UPDATE pai
   SET nome = remedio
   FROM pai 

INNER JOIN filho 
      ON pai.nome = filho.nome 
      INNER JOIN filho
      ON pai.cod_filho = filho.cod
   WHERE pai.nome = 'B'
      AND filho.nome = 'F_A_2'

