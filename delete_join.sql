declare @compras table (nome varchar(10))
insert into @compras values ('Raul')
insert into @compras values ('Pedro')
insert into @compras values ('João')
 
declare @cadastro table (nome varchar(10))

insert into @cadastro values ('Raul')
insert into @cadastro values ('João')

select * from @compras

delete @compras 
from @compras co
inner join @cadastro ca
on co.nome = ca.nome

select * from @compras


DELETE FROM Compras WHERE Nome IN
(SELECT Nome FROM Cadastro WHERE Nome = 'UmNome') 

-- Via Join (Sintaxe Proprietária)

DELETE FROM Compras
FROM Compras INNER JOIN Cadastro
ON Compras.Nome = Cadastro.Nome
WHERE Nome = 'UmNome'



