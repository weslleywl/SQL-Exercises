
update cht
set cht.matricula_analista = ct.distribuido
from CTPJ_HIST_TRAMITACAO cht
inner join  CTPJ_TRAMITACAO ct
on  cht.matricula_analista = ct.distribuido 
where ct.distribuido is  not null

select * from CTPJ_TRAMITACAO

-- aqui eu faço a atualização

update cht
set cht.matricula_analista = ct.distribuido
from CTPJ_TRAMITACAO ct
left join  CTPJ_HIST_TRAMITACAO cht
on ct.cod_tram_proc = cht.cod_tram_proc
where ct.distribuido is not null


select * from ctpj_tramitacao ct
inner join CTPJ_HIST_TRAMITACAO cht
on ct.cod_tram_proc = cht.cod_tram_proc
--on ct.distribuido = cht.matricula_analista
where ct.distribuido is  not null

select * from CTPJ_HIST_TRAMITACAO cht
right join ctpj_tramitacao ct
on ct.distribuido = cht.matricula_analista
where ct.distribuido is not null


select * from ccc


select top 10 * from CTPJ_HIST_TRAMITACAO
where matricula_analista = '0627116'
order by matricula_analista
go
select top 10* from CTPJ_TRAMITACAO 
where distribuido ='0627116'
order by distribuido

on cht.cod_tram_proc = ct.cod_tram_proc

select 
-- essa tabela não existe na produção, tem que ser criada na produção, depois pegar a coluna
--codigo de tramitação da tabela CTPJ_TRAMITACAO, e copiar para a CTPJ_HIST_TRAMITACAO.
--depois usar o update abaixo 
-- pegar o campo distribuido da tabela CTPJ_TRAMITACAO e passar para CTPJ_HIST_TRAMITACAO que esta no
--outro banco, o campo matricula_analista
select * from ctpj.dbo.CTPJ_HIST_TRAMITACAO
-- entre duas tabelas
update cht
set cht.matricula_analista = ''
from CTPJ_HIST_TRAMITACAO cht
inner join CTPJ_TRAMITACAO CT
on cht.cod_tram_proc =ct.cod_tram_proc
where ct.num_tram_proc = ''

update a
set a.nome_aluno = d.nome
from alunos a
inner join departamento d
on a.nome_aluno =d.nome
where a.nome_aluno = '000000DEBORA000000'

/*Preciso criar um UPDATE onde a coluna a ser atualizada é resultado de um select (SUM) em outra tabela.
Tem como fazer isto? Consegui fazer isso com INSERT, mas não com UPDATE não funciona.
Tentei algo semelhante a isto:*/
update #Teste
 set #Teste.codigo = (select Sum(pedidos.vlrTotal) from pedidos) -- porem está com erro



select * from empregado  num
select * from departamento  depnum

UPDATE empregado 
SET num = depnum 
FROM 
(SELECT nome, dataini, 
SUM(depnum) 
FROM departamento 
GROUP BY nome, dataini) d 
INNER JOIN empregado e
ON e.num = d.depnum
 

--Se a SOMA não está baseada em um valor de COLUNA, você, possa tentar

UPDATE #Teste 
SET codigo = (SELECT 
SUM(vlrTotal) 
FROM 
pedidos 
) 
WHERE 
 

Ou ainda poderia criar uma subquery:

UPDATE #Teste
 SET #Teste.codigo = (SELECT Sum(pedidos.vlrTotal) 
FROM pedidos 
WHERE #Teste. = pedidos. )

Onde deveria ser substituído por tudo que é o FK que uni as colunas entre as duas tabelas.

-- repara no exemplo que depois do igual vc coloca o select que quizer
UPDATE #Temp_Customer_IQ
SET Customer_Upper_Commission_Target = (
SELECT MIN(c.Calculated_Upper_Target)
FROM #Temp_Customer_Targets as c
WHERE c.Customer_Id = #Temp_Customer_IQ.Customer_Id
)


select * from ctpj_tramitacao

select * from ctpj_producao.dbo.ctpj_tramitcao

select * from CTPJ_HIST_TRAMITACAO

