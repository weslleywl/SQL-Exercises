select * from clientes
select * from pedidos
select * from ItensPedido 

-- quais clientes que não fizeram pedidos por subquey

select * from clientes
where clientecodigo  not in (select clientecodigo from pedidos)

select * from clientes c
where  not exists (select clientecodigo from pedidos p  )
--select * from pedidos where  clientecodigo in (select clientecodigo from clientes)
-- fazendo pelo exists
select * from clientes c
where not exists (select clientecodigo from pedidos p where p.clientecodigo = c.clientecodigo)



if not in (
select * from clientes c)
(select * from pedidos)
print 'existe sim'




--
if  exists (select * from clientes c
left join pedidos p
on c.clientecodigo = p.clientecodigo
where p.clientecodigo is null)
update clientes
set ClienteNome = UPPER(ClienteNome)

