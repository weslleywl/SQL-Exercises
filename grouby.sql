/*a parada era q eu estava passando tdo antes do count
tdos os campos q eu keria selecionar eu estava passando antes do count*/
-- a quantidade está num total só
select right(convert(char(10),o.data_atendimento,103),7)as data,o.id_setor,o.tipo,count(o.id_setor)as qtd 
     from ordem_servico o
     inner join instituicao i
     on o.id_localizacao = i.id_instituicao
     and o.tipo = 'Software' and o.id_localizacao= '1'
     and o.id_setor = '3'
     group by  right(convert(char(10),o.data_atendimento,103),7),o.id_setor,o.tipo

--outro query

select right(convert(char(10),o.data_atendimento,103),7)as data,o.id_setor,o.tipo,
count(o.id_setor)as qtd 
 from ordem_servico o
 inner join instituicao i
 on o.id_localizacao = i.id_instituicao
 and o.tipo = 'Software' and o.id_localizacao= '2'
 and o.id_setor = '6' 
 group by  right(convert(char(10),o.data_atendimento,103),7),o.id_setor,o.tipo
-- aqui ele coloca a quantidade desmembrada
select i.id_instituicao,o.id_setor,count(o.id_setor) as qtde,s.setor,o.tipo,i.descricao from ordem_servico o
inner join setor s 
on o.id_setor = s.id_setor
inner join instituicao i 
on i.id_instituicao = o.id_localizacao
where i.id_instituicao= '2' and s.id_setor = '1' 
group by i.id_instituicao,o.id_setor,s.setor,o.tipo,i.descricao
order by s.setor