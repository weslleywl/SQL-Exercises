/* Eu tenho um campo smallmoney e quando faço um select para pegar os valores com 2 casas decimais, ele me retorna o seguinte:
Select CONVERT(Varchar(15), QtdSrvAutorizado, 1) as QtdSrvAutorizado From Tabela1 Retorno: 10,000.00
O problema é que está no formato americano(vírgula para o milhar e ponto para a fração de unidade) e gostaria que fosse no formato Brasileiro(10.000,00)*/

/*Você pode tirar a vírgula, passando p parâmetro "0" para o método CONVERT.
CONVERT(Varchar(15), QtdSrvAutorizado, 0)
que é o valor padrão, pode tanto colocar 0 quanto deixar sem esse parãmetro.
Na sua aplicação, se tiver setada para uiculture pt-BR, ele faz a conversão pra vírgula automaticamente creio, no Sql acho que não será possível.
A não ser que faça uma funçãozinha e dê replace e retorno o valor alterado. ai toda vez que fazer um select num campo dataTime você executa essa funçãozinha passando o campo como parâmetro.
Ou então utilizar o método FormatString...set language brazilian*/


Update #teste
Set dinheiro=(select min(valor) from #tre)
Where dine= '23,76'

select * from #teste

select * from #tre
select min(valor) from #tre
Select top 2 CONVERT(Varchar(11),avg(valor), 1) as media From #tre

create table #tre
(
valor varchar(13))

insert into #tre
values('4.53,00')

drop table #teste
create table #teste
(  dinheiro money, dine varchar(20)  )

insert into #teste
values ('4324,00','21')

select top 2* from #teste

select dine from #teste
where isnumeric(dine)=1

Select top 2 ('R$:'+CONVERT(Varchar(15), dinheiro, 1)) as QtdSrvAutorizado From #teste

Select top 2 CONVERT(Varchar(15), dinheiro, 0) as QtdSrvAutorizado From #teste
declare @xt money
set @xt = '16.00'
while @xt < 199
begin
insert into #teste
values('1.00,99','23.76')
set @xt = @xt+1
end


