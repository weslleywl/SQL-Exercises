
-- para trazer nomes usando "aspas"
SET QUOTED_IDENTIFIER off
GO
select * from funcionario
where  Nom_Funcionario like "%ANNA MARTINS%"


-- aonde eu uso o substring
select Nom_Funcionario,SUBSTRING(Nom_Funcionario,20,7) from funcionario
where Nom_Funcionario = "LUIZA DE SANT'ANNA MARTINS"

go
select Nom_Funcionario,charindex(Nom_Funcionario,'m') from funcionario
where Nom_Funcionario = "LUIZA DE SANT'ANNA MARTINS"




DECLARE

SELECT @document = 'Reflectors are vital safety' +
                   ' components of your bicycle.';
SELECT CHARINDEX('bicycle', @document);



substring
replace
replicate
variavel






















CREATE TABLE tblClientes1 (Nome VARCHAR(80), UF CHAR(2)) 

-- Popula a tabela de Clientes
INSERT INTO tblClientes1 VALUES ('Aline','SP')
INSERT INTO tblClientes1 VALUES ('Lívia','DF')
INSERT INTO tblClientes1 VALUES ('Jaqueline','DF')
INSERT INTO tblClientes1 VALUES ('Cecília','MG')
INSERT INTO tblClientes1 VALUES ('Marana','RS')
INSERT INTO tblClientes1 VALUES ('Ronaldo','DF')
INSERT INTO tblClientes1 VALUES ('Gilvan','PR')
INSERT INTO tblClientes1 VALUES ('Dayane','DF')
INSERT INTO tblClientes1 VALUES ('Victor','RJ')
INSERT INTO tblClientes1 VALUES ('Vinicius','PR')
INSERT INTO tblClientes1 VALUES ('Marana','RS') 




-- Faz uma ineficaz tentativa de pesquisa
DECLARE @Estados VARCHAR(20)
SET @Estados = 'SP,RJ,RS'

SELECT Nome FROM tblClientes1 WHERE UF IN (@Estados) 

select * from tblClientes1

-- dessa forma substitui o Array
DECLARE @Estados VARCHAR(20), @cmdSQL NVARCHAR(200)
SET @Estados = 'SP,RJ,RS'
SET @Estados = CHAR(39) + REPLACE(@Estados,',',CHAR(39) + ',' + CHAR(39)) + CHAR(39)  
SET @cmdSQL = 'SELECT Nome, UF FROM tblClientes1 WHERE UF IN (' + @Estados + ')'
--print @cmdSQL
EXEC sp_executesql @cmdSQL 


select * from departamento

SET QUOTED_IDENTIFIER OFF

declare @xi varchar(25),@xt nvarchar(200)
set @xi = 'gerencial'
set @xt ='SELECT Nome, num FROM departamento WHERE nome IN ("' + @xi + '")' -- passar as " simples
select @xt
exec sp_executesql @xt


-------------------------------------------------------------------------------------


DECLARE @StringDaAplicacao VARCHAR(1000)
SET @StringDaAplicacao = '"jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"'
 

DECLARE @xml XML, @Var VARCHAR(1000) 

-- Retirar as aspas duplas e espaços
SET @Var = REPLACE(@StringDaAplicacao,'"','')
SET @Var = REPLACE(@Var,' ','')
print @var

-- Substituir o separador por uma tag
SET @Var = REPLACE(@Var,',','</i><i>') 

-- Colocar as tags iniciais
SET @Var = '<e><i>' + @Var + '</i></e>' 

-- Converte para XML
SET @xml = CAST(@Var AS XML) 

-- Retorna os valores em formato tabular
SELECT t.c.value('.','char(3)') 
FROM @xml.nodes('/e/i') T(c)



