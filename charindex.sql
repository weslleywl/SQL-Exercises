--tirando uma letra da frase
Create Table #Exemplo (campo Varchar(100))
Insert into #Exemplo (campo) Values ('Hospital AAA - Arquitectura - Plano A')
Insert into #Exemplo (campo) Values ('Hospital AAA - Engenharia - Plano B')
Insert into #Exemplo (campo) Values ('Hospital BBB - Arquitectura - Plano A')
Insert into #Exemplo (campo) Values ('Hospital AAA - Engenharia - Plano B')

select * from #Exemplo

Select left(Campo,charindex('-',campo)-1)
From #Exemplo

Select substring(campo,1,3)
From #Exemplo

go
Select left(campo,charindex('-',campo)-6)
From #Exemplo


go
Select left(campo,(charindex(campo,'-')))
From #Exemplo


select SUBSTRING(campo,(charindex('-',campo)),6) from #Exemplo

-- outra maneira
SELECT LEFT(Actividade, CHARINDEX('-', Actividade) - 2) AS hospital, 
 COUNT(1) AS qtde
FROM Tabela 
GROUP BY LEFT(Actividade, CHARINDEX('-', Actividade) - 2)



-- mais uma maneira

declare @end varchar(100)
set @end = 'Rua XV de novembro, 123 - Bloco 02 ap 3'

select 
    substring(@end, 1, charindex(',', @end)-1) as Endereco,
    substring(@end, charindex(',', @end)+2, charindex('-', @end)-charindex(',', @end)-2) as Numero,
    substring(@end, charindex('-', @end)+2, charindex(',', @end)) as Complemento

-- outro exemplo

Create Table #tabela (nome varchar(80)) 

drop table #tabela
select * from #tabela

Insert Into #tabela (nome) Values ( 'leo@bol.com.br' ) 

Declare @Var Binary(16) 
Declare @Position Int 

Select @Var = TextPtr(nome), @Position = PATINDEX('%edurda_santiago%', 
nome)-1 From #tabela Where PATINDEX('%edurda_santiago%', nome) <> 0 
UpdateText CampoText.Campo @Var @Position 13 'joao' 
go 
Select * From #tabela 

SELECT REPLACE(nome, LEFT(nome, patindex('%@%', nome)), '@') AS 
Dominio FROM #tabela 


select replace(nome,left(nome,patindex()))


SELECT CHARINDEX(' ', nome_aluno)
FROM alunos
WHERE matricula = '20'

select * from alunos
order by nome_aluno 


-- o charindex, assim que ele acha o primeiro espaço em branco ele elima tudo, exeto
Select  SUBSTRING(endereco_aluno, 1, CHARINDEX(',', endereco_aluno))  from alunos
order by nome_aluno


-- usando o case, com o charindex
Create Table #exemplo (nome varchar(20))

 insert into #exemplo (nome) Values ('wagner nogueira')
 insert into #exemplo (nome) Values ('edurda baia santiago')

 Select substring(nome,1, 
          case when charindex(' ',nome,1)=0
                then len(nome) 
                  else charindex(' ',nome,1) end) 
                    from #exemplo

-- faz a mesma coisa
declare @var varchar(100)
set @var = 'Microsoft Brasil LTDA.'
Select Substring(@var,1,charindex(' ',@var,1))


--mais um exemplo
select * from mytable
where substring ( controlvalue, ( charindex (',', controlvalue ) + 1 ), 1 ) = '6'

---------------------------------------------------------------------------------

DECLARE @T TABLE (ENDERECO VARCHAR(100))
INSERT INTO @T VALUES ('AV. CEL ANTONIO DUARTE, 255')
INSERT INTO @T VALUES ('R. PROJETADA S/N - LEITAO DA SILVA , 4.075')
INSERT INTO @T VALUES ('RUA ANA BENEDITA, 07')
INSERT INTO @T VALUES ('AV CEL ANTONIO DUARTE , s/n')


-- Solução 2000 Based
SELECT LEFT(ENDERECO,CHARINDEX(',',ENDERECO)-2) AS Parte1,
RIGHT(ENDERECO,LEN(ENDERECO)-CHARINDEX(',',ENDERECO)-1) AS Parte2 FROM @T
 

-- Solução 2005 Based
SELECT
CAST('<E><e>' + REPLACE(ENDERECO,', ','</e><e>') + '</e></E>' AS XML).value('(/E/e)[1]','nvarchar(50)'),
CAST('<E><e>' + REPLACE(ENDERECO,', ','</e><e>') + '</e></E>' AS XML).value('(/E/e)[2]','nvarchar(5)')
FROM @T

