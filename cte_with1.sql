sp_tables

select * from sfc_funcionario

select descricao,max(salario) as media from sfc_nivel
group by salario,descricao
go
select descricao,(select max(salario) as media from sfc_nivel ) from sfc_nivel
group by salario,descricao
-------------------------------------------------------------------------------------------------

with cte_data 
as
( 
select year(Dt_admissao) as dt_admin,nome_func from sfc_funcionario

)
select dt_admin, count(nome_func) from cte_data 
group by dt_admin
go
-----------------------------------------------------------------------------------------------
select dt_admin, count(nome_func) from (select year(Dt_admissao) as dt_admin,nome_func from sfc_funcionario) cte_data
group by dt_admin
-- criando um indice

create nonclustered index dt_adminssao
on sfc_funcionario (nome_func)INCLUDE (Dt_admissao)
