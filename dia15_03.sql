-- saber a quantidade de colunas
select @@spid 'classe'

-- conta a quantidade linhas afetadas dentro de uma tabela
select count(*) from pai

-- fazendo a mesma coisa mais pela tabela sysindex
SELECT ROWS AS TOTAL FROM SYSINDEXES
WHERE ID = object_ID('pai')
AND INDID < 2

-- Através do Spdid, sabenos o hostname
exec sp_who 5

-- saber nome do proprietario, banco e servidor
select user_name(), db_name(), @@servername

-- saber tudo do banco
exec sp_helpdb agora
exec sp_helpfile centro_custo

-- localizando indices duplicados
select numlic, count(numlic) as total
 from anexo
  group by numlic
   having count(numlic)>1
    order by numlic

-- Você deve informar ao SQL que irá fazer um update em uma tabela de sistema. 

EXEC sp_configure 'allow updates', 1 
Reconfigure with override 

/*Criei um banco de dados novo e estou tentando executar a stored procuder sp_add_job e da o seguinte erro. 

Server: Msg 2812, Level 16, State 62, Line 1 
Could not find stored procedure 'sp_add_job'. 

Esse erro ocorre pq essa SP fica dentro do database MSDB. 
Assim se vc executar 
EXEC MSDB..sp_add_job 
o erro não deverá ocorrerá mais. 
*/

-- clonar tabelas
SET @TABELA = 'SELECT INTO ' + @NOMETABELA + ' FROM TBTABELAS' 
EXEC(@TABELA)
-- segunda maneira de clonar as tabelas
SELECT * INTO novatabela FROM tabela 
select * from pai

create table paiteste
(
cod int,  nome char(40)
)

select * into paites from pai
drop table paiteste