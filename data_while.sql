
/*1)Bem, eu tenho uma tabela de reservas com data de chegada e data de saída dos 
hospedes. 

Por vezes uma reserva começa em um mês e termina em outro. Algumas vezes até 
mesmo atravessando 3, 4 meses. 

Gostaria de saber, apenas com a data de chegada e saída dos hospedes, saber, 
em uma única consulta, quantos dias tem aquela reserva naquele mês. 

Eu tenho como parametro o código da reserva e o mês, e gostaria de saber 
naquela mês, naquela reserva, quantos dias ela tem. */

Create Table #Exemplo (Reserva int, Arrival datetime, Departure datetime) 
insert into #Exemplo (Reserva, Arrival, Departure ) Values (2374, 
'2005-12-26', '2006-01-04') 

Select * From #Exemplo 
*/ 

Declare @MonthStart Datetime 
Declare @MonthEnd Datetime 
Declare @Months Table (Idx Int Identity(1,1), RangeStart Datetime, RangeEnd 
Datetime) 

Select @MonthStart = 
Min(DateAdd(Day,-1,DateAdd(month,1,(convert(char(07),Arrival,126) + '- 
01')))), 
@MonthEnd = Max(convert(char(07),Departure,126)+ '- 01') 
From #Exemplo 

While @MonthStart <= @MonthEnd 
Begin 
Insert into @Months (RangeStart, RangeEnd) Values (@MonthStart, @MonthEnd) 
Set @MonthStart = DateAdd(Month,1,@MonthStart) 
End 

Select Reserva, DateDiff(Day,Arrival,RangeStart), 
DateDiff(Day,RangeEnd,Departure) 
From #Exemplo inner join @Months M On Departure > M.RangeStart 

select * From @Months 

/*2)Mês sem prenchimento :Tenho uma tabela com os seguintes campos: 
PK - CD_EMPRESA 
PK - CD_LOJA 
PK - CD_CLIENTE 
PK - MES_REFERENCIA (MM/YYYY) 
VALOR 

No formulário tem um período para o usuário selecionar o início e o fim da 
procura pelo MES_REFERENCIA, então, eu queria retornar todos os clientes que 
nesse período, não tivesse efetuado uma compra no mês. 

Por exemplo: 
--------------- 

O usuário especificou: 
Início do período: 01/2005 
Fim do período: 08/2005 

O Cliente 1 efetuou compras em todos os meses, exceto em 04/2005, logo, esse 
mês seria retornado. 
O Cliente 2 efetuou compras em todos os meses, exceto em 07/2005 e 08/2005, 
logo, esses dois meses seriam retornados. 
*/

drop table #Meses 
Create Table #Meses (Data Datetime, Valor Int) 
insert into #Meses (Data,Valor) Values ('2005-01-01',10) 
insert into #Meses (Data,Valor) Values ('2005-03-01',20) 
insert into #Meses (Data,Valor) Values ('2005-06-01',30) 
insert into #Meses (Data,Valor)Values ('2005-07-01',40) 

Set nocount on 
Declare @DateStart DateTime 
Declare @DateEnd DateTime 

Declare @Dates Table (DateValue DateTime) 

Set @DateStart = '2005-01-01' -- data inicial 
Set @DateEnd = '2006-01-01' -- data Final 

While @DateStart <= @DateEnd 
Begin 
Insert Into @Dates (DateValue) Values (@DateStart) 
Set @DateStart = DateAdd(Month,1,@DateStart) 
End 

Select TableDate.DateValue, Isnull(#MEses.Valor,0) 
From #Meses Right Join @Dates TableDate On #Meses.Data = TableDate.DateValue 


/*3)Preciso de um help dos amigos DBAs .... 
Cenário : Tenho uma tabela chamada Atestados , com os seguintes campos : 
CodigoFuncionario - DataInicio - DataFim 
Exemplos de registros: 
0001 - 10/11/2005 - 25/11/2005 ( esse cara parou 16 dias no Mes 11) 
0002 - 28/10/2005 - 05/11/2005 (esse, 4 dias no Mes 10 e 5 dias no Mes 11 ) 
0003 - 26/10/2005 - 10/12/2005 (esse, 6 dias no Mes 10, 30 dias no Mes 11 e 
11 dias no Mes 12 ) 

Eu tenho que montar um relatório, ou melhor uma página ASP que pode ser 
impressa, com o seguinte layout ( vou usar esses 3 registros pra facilitar o 
entendimento ) : 

Mes - Dias de Atestados 
... 
... 
Setembro - 0 
Outubro - 10 dias ( soma dos registros 2 e 3 referentes a Outubro ) 
Novembro - 51 dias ( somes dos 3 registros referentes a Novembro ) 
Dezembro - 11 dias ( registro 3, pois os outros não tem atestados em 
Dezembro ) 
*/

select sum(cast(datediff(dd,hist_entrada,hist_saida)as integer)) as diferenca 
from testes 
where month(hist_entrada) = 04 and year(hist_entrada) = 2004 

espero que isso te ajude o hist entrada seria a data inicial e hist saida a 
data final. 
De uma olhada na estrutura desse select ele resolve seu problema 


