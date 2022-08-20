CREATE TABLE TESTE
(
 CODiGO INT  NOT NULL,
 NOME VARCHAR (50) ,

 CONSTRAINT CK_VERIFICA CHECK ( CASE LEN(CODSEQUENCIAL)

WHEN 1 THEN REPLICATE('0',3)+CONVERT(CHAR(1),CODSEQUENCIAL)+'/'+SUBSTRING(CONVERT(CHAR(10),DATACONTROLE,103),9,2)

WHEN 2 THEN REPLICATE('0',2)+CONVERT(CHAR(2),CODSEQUENCIAL)+'/'+SUBSTRING(CONVERT(CHAR(10),DATACONTROLE,103),9,2)

WHEN 3 THEN REPLICATE('0',1)+CONVERT(CHAR(3),CODSEQUENCIAL)+'/'+SUBSTRING(CONVERT(CHAR(10),DATACONTROLE,103),9,2)

END As
) 
)
GO 

select * from alunos
sp_helpindex alunos

SELECT  cgcfor, razsoc, endfor 
From fornecedor WITH(INDEX = pk_fornecedor)
 Where cgcfor = '00008354000182'

SELECT REPLACE('1238768768768678','favelado','321')
from alunos
go

SELECT  upper(REPLICATE(nome_aluno,1))+ '' +space(1)+ upper(nome_aluno) as nome
FROM alunos
ORDER BY nome_aluno

SELECT SUBSTRING((UPPER(au_lname) + ',' + SPACE(1) + au_fname), 1, 35) 
   AS Name, phone AS Phone, REPLICATE(phone,1) AS Fax
FROM authors
ORDER BY au_lname, au_fname
GO



CREATE TABLE TESTE8
(
 CODiGO INT  NOT NULL,
 NOME VARCHAR (50) ,

 CONSTRAINT CK_VERIFICA CHECK (codigo>100))

insert into teste8
values('999','wagner')
drop table teste8

--dessa forma vai funcinar

UPDATE F
SET F.CODINSSAU = R.CODINSSAU
from funcionarios f
inner join recadastramento r
on r.matricula = f.matricula
WHERE R. matricula IN (
SELECT R.matricula FROM funcionarios f
inner join recadastramento r
on r.matricula = f.matricula
where r.codinssau = '20'
and f.codinssau = '5'
)




-- QRY DE VERIFICAÇÃO A QTDADE DE FUNCIONARIOS RECADASTRADOS
-- HCF=2, HSE=46, HGL=4, HGB=20, HGI=21, HGA=45, INCL=6, INTO=44, NERJ=1, OUTROS= 5 E 3
-- OBS.: HSE, INCL, INTO, NERJ E OUTROS, NÃO PRECISA EXECUTAR NO CAMPO R.CODINSSAU.
select r.matricula, r.codinssau, f.matricula, f.codinssau 
from funcionarios f
inner join recadastramento r
on r.matricula = f.matricula
where r.codinssau = '20' and f.codinssau = '5'

-- QRY DE UPDATE
-- EXECUTAR ESSA QUERY QDO O SELECT ACIMA ENCONTRAR REGISTROS!
-- SUBSTITUIR OS CAMPOS NA MESMA ORDEM DOS CAMPOS QUE APARECEM NO RESULTADO DO SELECT.
UPDATE F
SET F.CODINSSAU=R.CODINSSAU
from funcionarios f
inner join recadastramento r
on r.matricula = f.matricula
where r.codinssau = '20' and f.codinssau = '5'

-- VERIFICAÇAO DE QTD
select * from recadastramento where codinssau = 45
select * from funcionarios where codinssau = 45 

-- TAVA SE FAZENDO NA MÃO O UPD
select * from recadastramento r
inner join pessoal p
on p.matricula = r.matricula
where p.matricula in ('001182787','001493172','001088297')

select * from funcionarios where matricula in ('001182787','001493172','001088297')

update funcionarios
set codinssau = 2
where matricula = '002403566'

-- QRY PARA COMPARAR SE TD QUE ESTÁ EM PESSOAL ESTÁ EM RECADASTRAMENTO
select * from recadastramento r
left join pessoal p
on r.matricula = p.matricula
where p.matricula is null

-- QRY PARA A CONTAGEM DOS RECADASTRAMENTOS DIÁRIOS
select * from pessoal p
inner join recadastramento r
on p.matricula = r.matricula
where p.data_cadast = '2006-07-26' and r.codinssau = '1'





-- QRY DE VERIFICAÇÃO A QTDADE DE FUNCIONARIOS RECADASTRADOS
-- HCF=2, HSE=46, HGL=4, HGB=20, HGI=21, HGA=45, INCL=6, INTO=44, NERJ=1, OUTROS= 5 E 3
-- OBS.: HSE, INCL, INTO, NERJ E OUTROS, NÃO PRECISA EXECUTAR NO CAMPO R.CODINSSAU.
select r.matricula, r.codinssau, f.matricula, f.codinssau 
from funcionarios f
inner join recadastramento r
on r.matricula = f.matricula
where r.codinssau = '45' and f.codinssau = '5'

UPDATE F
SET F.CODINSSAU=R.CODINSSAU
from funcionarios f
inner join recadastramento r
on r.matricula = f.matricula
where r.codinssau = '45' and f.codinssau = '3'




select * from automoveis

SELECT t.CDRPCO, sum(t.TotalOPS) FROM(
SELECT
A .CDRPCO,
(CASE WHEN C. IDNIVEL = 'D' THEN SUM( F.VLDIRIGENTE )
WHEN C. IDNIVEL = 'C' THEN SUM( F.VLCONSULTOR )
END) AS TotalOPS
FROM
TB_RPCO A
INNER JOIN TB_OPS B ON A. CDRPCO = B .CDRPCO
INNER JOIN TB_CLIENTE C ON B. CDCLIENTE = C .CDCLIENTE
INNER JOIN TB_OPSPRODUTO D ON B. CDOPS = D .CDOPS
INNER JOIN TB_PRODUTOCADERNO E ON D.CDPRODUTOCADERNO = E. CDPRODUTOCADERNO
INNER JOIN TB_PRECO F ON E. CDPRECO = F .CDPRECO
GROUP BY
A .CDRPCO,
C .IDNIVEL
) t
Group by t.CDRPCO

select * from departamento

UPDATE departamento 
SET num = CASE 
WHEN len(num) = 1 then '0' + num 
WHEN len(num) = 2 then '00' + num 
END 
WHERE len(num) >1

UPDATE departamento 
SET nome = CASE 
WHEN len(nome) = 3 then 'é mais um teste' + nome 
WHEN len(nome) = 7 then 'outro teste' + nome 
END 
WHERE len(nome) >1

UPDATE F
SET F.CODINSSAU = R.CODINSSAU
from funcionarios f
inner join recadastramento r
on r.matricula = f.matricula
WHERE R. matricula IN (
SELECT R.matricula FROM funcionarios f
inner join recadastramento r
on r.matricula = f.matricula
where r.codinssau = '20'
and f.codinssau = '5'
)





