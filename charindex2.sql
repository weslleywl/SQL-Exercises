--tirando uma letra da frase
Create Table #Exemplo (campo Varchar(100))
Insert into #Exemplo (campo) Values ('Hospital AAA - Arquitectura - Plano A')
Insert into #Exemplo (campo) Values ('Hospital AAA - Engenharia - Plano B')
Insert into #Exemplo (campo) Values ('Hospital BBB - Arquitectura - Plano A')
Insert into #Exemplo (campo) Values ('Hospital AAA - Engenharia - Plano B')

select * from #Exemplo

Select left(Campo,charindex('-',campo)-1)
From #Exemplo

Select charindex('-',campo)-1
From #Exemplo



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
 insert into #exemplo (nome) Values ('edurda')

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

/*Tem como eu fazer uma select de um número de caracteres específico antes e depois de uma string?
Quero encontrar uma string no meio de um texto e qdo encontra-la quero trazer 10 caracters pra tras dela e 10 pra frente.
Vou dar um exemplo no texto abaixo: 
From SUVs to sedans, which 2006 model year autos experienced the biggest recalls?
 Even some reliable auto makers have been caught in the fray. Are you driving a lemon?
Quero encontrar a palavra auto que está em negrito e quero retornar na select  "reliable auto makers ha"
*/

SELECT substring(Campo, charindex('palavra_procurada', Campo) - 10, len('palavra_procurada') + 20) FROM Tabela

--Peguei o indice inicial da "palavra_procurada" subtraí por 10 para achar desde onde devo 
--capturar os valores, e o terceiro parâmetro eu informei que o parâmetro deve ser os 10 caracteres
-- antes + 10 caracteres depois da palavra + o tamanho da palavra.

--Aproveitando o mesmo exemplo e se eu quiser fazer a mesma coisa que perguntei e além disso
--no resultado da select substiutuir a palavra "trabalho" por outra, dá pra fazer isso?
SELECT replace(substring(Campo, charindex('palavra_procurada', Campo) - 10, len('palavra_procurada') + 20),'trabalho','outra') FROM Tabela


