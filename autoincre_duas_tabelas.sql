/*1-tenho que criar um campo auto-incremento, ate ai tudo bem, porem, ele tem que se auto-incrementar de acordo com uma coluna, por exemplo
col1    col2
1        1
1        2
1        3
2        1
2        2
3        1

nesse caso a col2 seria auto-incremento, porem, ele vai adicionando valores na sequencia da col1.

2-qdo se cria uma coluna auto-incremento, qdo ocorre um erro, ele perde aquele numero do auto-incremento, por exemplo

col1
1
2
4
5
6
9
Nesse caso ocorreu um erro qdo foi feito o cadastro de 3,7,8 e por isso eles nao aparecem na listagem, como eu faco para que isso nao ocorra, e mesmo que ocorra um erro, o proximo nao pule o número*/
--A solução para o seu problema vai depender muito da quantidade de acessos que a sua aplicação possui, mas uma sugestão razoável seria criar uma trigger de insert como a parecida abaixo. Repito que não é a melhor solução, mas sem dúvida resolve teu problema.

Create Trigger Incrementa 
On dbo.SuaTabela
 For Insert as
begin
   Declare @int_valorinc int,
               @int_coluna1 int 

   Select @int_coluna1 = Select Col1 From Inserted
   Select @int_valorinc = Max(col2)+1 From dbo.SUATABELA Where Col1 = @int_coluna1
   Update dbo.SUATABELA Set Col2 = @int_valorinc Where Col1 = @int_coluna1
end
select * from #tabel_incremento

create trigger incrementa
on dbo.tabel_incremento
for insert
as
begin
declare @col1 int, @col2 int
--select @col1 = select col1 from inserted
select @col2 = Max(col2)+1 from dbo.tabel_incremento
where col1 = @col1
update dbo.tabel_incremento set col2 = @col1 where col1 = @col1
end

create table tabel_incremento
(
col1 int, col2 int )
insert into #tabel_incremento(col1)
values ('2','')
select * from #tabel_incremento


-- IDENTITYCOL(Mostra a coluna que tem a propriedade Identity e seus valores)
select identitycol from alunos
-- IDENT_SSED(Mostra qual foi o valor original atribuido a propriedade Identity na coluna da tabela)
select ident_seed ('alunos')
-- IDENT_INCR (Mostra qual foi o valor do incremento atribuido a propriedade Identity na coluna da tabela)
select ident_incr ('alunos')
-- SCOPE_IDENTITY (Informa o ultimo valor utilizado pelo Sql para uma coluna identity, de uma trigger ou procedure)
create procedure dbo.t_tes
as
insert tabela  values (.......)
select scope_identity() from alunos

-- @@IDENTITY É uma variavel global mantida pelo proprio sql que sempre mostrar o valor do ultimo registro
@@IDENTITY
-- Mostra o valor corrente do ultimo registro
select ident_current('alunos')

--	DBCC CHECKIDENT (servi para reconfigurar )
dbcc checkident('aabb',noreseed)
dbcc checkident('aabb',reseed,0)



select * from aabb