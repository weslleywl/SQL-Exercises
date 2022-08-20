select 	case 
		when DAY(c.dt_solicitacao) between 1 and 15 then 1
		else 2
	end as semana, 
	month(c.dt_solicitacao) mes, 
	year(c.dt_solicitacao) ano,	
	c.dt_solicitacao, 
	sum(s.id_setor) as soma, 
	s.DESC_SETOR,s.RESP_SETOR
from CHAMADO c
join SETORES s
on c.ID_SETOR = s.ID_SETOR
where c.SOLICITANTE is not null
group by C.solicitante,C.dt_solicitacao,s.DESC_SETOR,s.RESP_SETOR -- , 
/*fazendo por outro campo
	case 
		when DAY(c.DT_CHEGADA_REAL) between 1 and 15 then 1
		else 2
	end, 
	month(c.DT_CHEGADA_REAL), 
	year(c.DT_CHEGADA_REAL)	*/
		order by ano, mes


select * from CHAMADO
-- saber a data de solicitação dos setores por quinzena

select C.solicitante,c.dt_solicitacao,s.DESC_SETOR,s.RESP_SETOR from CHAMADO c
join SETORES s
on c.ID_SETOR = s.ID_SETOR
where s.ID_SETOR = 25
group by C.solicitante,C.dt_solicitacao,s.DESC_SETOR,s.RESP_SETOR 

