select count(*) as Quantidade,s.setor, s.id_setor from setor s
inner join ordem_servico o on s.id_setor = o.id_setor
where o.data_atendimento>='2007-06-18 00:00:00'
and o.data_atendimento<='2007-06-19 00:00:00'
and o.id_localizacao='2'
group by s.setor,s.id_setor order by s.setor


