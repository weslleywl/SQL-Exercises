sp_tables
select * from AG_CONSULTA
select * from AG_paciente

with cts_consulta( c_id_consulta,c_data,c_razao)
as
(
select  id_paciente,YEAR(data_consulta)as data_consult , razao  from AG_CONSULTA
)
select c_data,count(distinct(c_razao)) as razao from cts_consulta  ct
inner join AG_PACIENTE ap
on CT.c_id_consulta = ap.id_paciente
group by c_data

go
select data_consult,count(distinct(rr)) from 
(select id_consulta as c_id_consulta ,YEAR(data_consulta)as data_consult , razao as rr  from AG_CONSULTA)q
left join AG_PACIENTE ap
on q.c_id_consulta = ap.id_paciente
group by data_consult






declare @xt int
set @xt = (select COUNT(*) from AG_ESTADO_CIVIL)

select 
(select COUNT(*) from AG_ESPECIALIDADE ),(select COUNT(*) from AG_ARTIGO),(select COUNT(*) from AG_JUNTA)
,@xt

--

with cts_consulta(c_id_consulta, c_data,c_razao)
as
(
select id_consulta, YEAR(data_consulta)as data_consult , razao  from AG_CONSULTA
),
cts_parente
as
( select ap.nome_parente as parente,ap.dt_nascimento as nascimento ,at.desc_parentesco as parentesco
from AG_PARENTE ap
join AG_PARENTESCO at
on ap.id_parentesco = at.id_parentesco
)
select c_id_consulta,c_data,count(distinct(c_razao)) as razao from cts_consulta ct
where c_data not in (select nascimento from cts_parente)
group by c_id_consulta,c_data

--  vamos substituir

go
with cts_consulta(c_id_consulta, c_data,c_razao)
as
(
select id_consulta, YEAR(data_consulta)as data_consult , razao  from AG_CONSULTA
),
cts_parente
as
( select ap.nome_parente as parente,ap.dt_nascimento as nascimento ,at.desc_parentesco as parentesco
from AG_PARENTE ap
join AG_PARENTESCO at
on ap.id_parentesco = at.id_parentesco
)
select c_id_consulta,c_data,count(distinct(c_razao)) as razao from cts_consulta ct
where  not exists (select nascimento from cts_parente  where nascimento = c_data )
group by c_id_consulta,c_data
order by c_id_consulta desc , c_data asc
