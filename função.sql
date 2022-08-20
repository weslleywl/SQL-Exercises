-- criando uma procuedure para recriar as statisticas.
select * from revendedoras
CREATE PROCEDURE pro_statis (@ContoName varchar(30))
as 
begin
select cgc, nome, proprietario, estado, cidade
from revendedoras
where cgc = @ContoName
end

exec pro_statis '10020'

SP_UPDATESTATS 'resample'
EXEC sp_autostats empregado
EXEC sp_updatestats 
pro_statis '2'

/* Tenho uma coluna (EMAILS) onde preciso pegar apenas do arroba (@) pra 
frente.. 

Ex.: 
sergio@sergio.com.br 
teste@teste.com.br 
joao@joao.com.br 
outro_teste@teste.com.br 

Os resultados da query seriam: 
1 - @sergio.com.br 
2 - @teste.com.br 
3 - @joao.com.br */
SELECT Email, REPLACE(Email, LEFT(Email, PATINDEX('%@%', Email)), '@') AS 
Dominio FROM tbEmails 

create table #fa
(
nome nchar(10) primary key,
Email nchar(20) 
)
select * from #fa
insert into #fa(nome,email)
values('ricardo','ricardo@yahoo.com')

SELECT Email, REPLACE(Email, LEFT(Email, PATINDEX('%@%', Email)), '@') AS 
Dominio FROM #fa

SELECT REPLACE(Email, LEFT(Email, PATINDEX('%@%', Email)), '@') AS 
Dominio FROM #fa

SELECT *, CHARINDEX('yahoo', email)
from #fa

SELECT REPLICATE(nome, 2) 
FROM #fa
ORDER BY nome
--
SELECT SUBSTRING((UPPER(email) + ',' + SPACE(1) + email), 1, 35) 
   AS Name, nome AS Phone, REPLICATE(email,1) AS Fax, CHARINDEX('yahoo', email),
REPLACE(Email, LEFT(Email, PATINDEX('%@%', Email)), '@') AS 
Dominio
FROM #fa
ORDER BY email

/* 
Conversão de letras para nomes, com a 1a maiuscula e as demais minusculas 
por: Antonio Rodrigues dos Santos Filho - antonio.rsf@gmail.com 

Instruções 
1- Execute a função chamando-a com uma string entre parenteses 
2- Pode ser chamado um campo de uma tabela 
Exemplos: 
1- 
select dbo.ConverteNomes('SÃO JOÃO DO MERITI DA SERRA') 

2- 
use pubs 
select dbo.ConverteNomes(au_fname+' '+au_lname) as nomes 
from authors 
order by nomes 
*/ 


alter function ConverteNomes 
(@nome as varchar(1000)) 
returns varchar(1000) 
as begin 
declare @pos as int, 
@posini as int, 
@nomefinal as varchar(1000), 
@palavra as varchar(1000) 

set @pos = 1 
set @posini = 1 
set @nome = ltrim(rtrim(@nome)) 
set @nomefinal = '' 
if @nome<>'' begin 
while @pos <> len(@nome)+1 begin 
set @pos = charindex(' ',@nome,@pos+1) 
if @pos = 0 set @pos=len(@nome)+1 
set @palavra = 
upper(Substring(@nome,@posini,1))+lower(Substring(@nome,@posini+1,@pos-@posini-1)) 
if lower(@palavra) in ('da','de','di','do','du','das','dos','e') begin 
set @palavra = lower(@palavra) 
end 
if lower(@palavra) in 
('i','ii','iii','iv','v','vi','vii','vii','ix','x','xi','xii','xiii','xiv','xv','xvi','xvii','xviii','xix','xx') begin 
set @palavra = upper(@palavra) 
end 
set @nomefinal = @nomefinal + @palavra + ' ' 
set @posini = @pos + 1 
end 
end 
return @nomefinal 
end 

/* Recuperar todos os empregados que possuem o gerente Pedro em
qualquer nivel  da hirarquia e salario >=10.000*/
 select * from empregado
select top 30 * from funcionario

with teste(nome, sal) 
(select nome, sal from empregado
where nome = 'Gal Costa'

update empregado
set sal = sal * 
(case when nome = 'Roberto Carlos'
then 123000.0001
then sexo = 'm' then 1.90
else 1.50
end
)

-- mais uma vez usnado case
SELECT   Category = 
      CASE type
         WHEN 'popular_comp' THEN 'Popular Computing'
         WHEN 'mod_cook' THEN 'Modern Cooking'
         WHEN 'business' THEN 'Business'
         WHEN 'psychology' THEN 'Psychology'
         WHEN 'trad_cook' THEN 'Traditional Cooking'
         ELSE 'Not yet categorized'
      END,
   CAST(title AS varchar(25)) AS 'Shortened Title',
   price AS Price
FROM titles
WHERE price IS NOT NULL
ORDER BY type, price
COMPUTE AVG(price) BY type
GO

select  @@version

-- teste de msdnbril
'SqlSelectCommand1 
' 
Me.SqlSelectCommand1.CommandText = "SELECT CustomerID, CompanyName, 
ContactName, ContactTitle, Address, City, Region," & _ 
" PostalCode, Country, Phone, Fax FROM Customers WHERE (Country = 
'Brazil')" 
Me.SqlSelectCommand1.Connection = Me.SqlConnection2 
' 


'SqlConnection2 
' 
Me.SqlConnection2.ConnectionString = 
"SERVER=(local);database=Northwind;user id=sa;password=ric01;" 
-- 
set quoted_identifier off
Declare @Word1 varchar (100)
Declare @Word2 varchar (100)
set @Word1 = 'password'
set @Word2 = 'PassWord'
if @Word1 = @Word2
begin
Print 'Both "' + @Word1 + '" 
	and "' + @Word2+'" are same.'
end
else
begin
Print '"' + @Word1 + '" 
	and "' + @Word2+'" are not same.'
end

Boa tarde a todos.
Preciso montar essa query, para que me retorne o data mais recente, porque quando seu dou esse select, me retorna dois valores, porem iguais, dai que eu tenho que diferenciar pela data mais recente

SELECT   max(PRC.DATAINCLUSAO),PRC.COD_REGISTRO, PRC.DIAGNOSTICO1, PRC.DIAGNOSTICO2, PRC.DIAGNOSTICO3, PRC.DIAGNOSTICO4
FROM         PROCEDIMENTOMEDICO PRC
INNER JOIN (select max(DATAINCLUSAO) as DATAINCLUSAO ,COD_REGISTRO FROM         PROCEDIMENTOMEDICO group by COD_REGISTRO)pr on
pr.DATAINCLUSAO =pr.DATAINCLUSAO 
AND pr.COD_REGISTRO = pr.COD_REGISTRO
group by  PRC.COD_REGISTRO, PRC.DIAGNOSTICO1,, PRC.DIAGNOSTICO2, PRC.DIAGNOSTICO3, PRC.DIAGNOSTICO4
ORDER BY PRC.COD_REGISTRO
