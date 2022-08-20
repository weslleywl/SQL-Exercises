alter table asx
with nocheck
add constraint c_nome
check (nome = 'lili')

alter table asx
DROP constraint c_nome

alter table asx
nocheck
add constraint c_nome
PRIMARY KEY (COD)

-- mostra a coluna que tem a propriedade Identy e seus valores
select identitycol from tabela
 
-- mostra qual foi o valor original atribuido a propriedade identity na coluna da tabela
select ident_seed ('tabela')

-- mostra qual foi o valor do incremento atribuido a propriedade .......
select ident_incr ('tabela')

-- Informa o ultimo valor utilizado para uma coluna identity, de qualquer tabela dentro de um escopo de uma procedure ou trigger
select scope_identity() from tabela
-- mostra o ultimo valor inserido
@@identity
-- mostra o valor corrente
select ident_current ('tabela')
-- recuperando error
dbcc checkident ('tabela')


