/*Preciso somar de uma conta bancária os sandos anteriores de uma data passada pelo
 usuário, depois pego a movimentação da conta a partir desta mesma data até a data atual 
teria de ficar + ou - assim: 

SaldoAnterior    ValorTransação     DataTransação    
 

8234.90                          20.00      2008-01-05 00:00:00.000
NULL                             20.00      2008-01-06 00:00:00.000
NULL                             20.00      2008-01-07 00:00:00.000
NULL                             20.00      2008-01-08 00:00:00.000
NULL                             20.00      2008-01-09 00:00:00.000

Saldo atual
8314.90
*/


Create Table #Exemplo (conta int, data Datetime, Valor Numeric(19,2))

insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-01', 10)
insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-02', 10)
insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-03', 10)
insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-03', 10)

select * from #Exemplo

Declare @Data Datetime 
Select @Data = '2008-05-03'

Select * From #Exemplo 
inner join ( select conta, Sum(valor) As SaldoSanteior From #Exemplo 
Where Data < @Data Group By conta) Saldo On Saldo.Conta = #Exemplo.conta
Where Data >= @Data
ou
Declare @Data Datetime 
Select @Data = '2008-05-03'
Select 'Saldo Anterior' As Tipo, Sum(valor) As SaldoSanteior, null Data, 0 Valor 
From #Exemplo Where Data < @Data 
Union All 
Select '' As Tipo, 0, Data, Valor
From #Exemplo Where Data < @Data 

/* mas agora só mais uma pergunta, que lógica devo usar para que esse extrato saia como o 
de um banco da maneira como segue abaixo:

SaldoAnterior          Data      Documento            ValorDocumento      LançamentoNoDia   SaldoAtual

200.00           2008-01-01     1/5XXXXXXX 20.00    219.90                    -19.90                     386.95
200.00           2008-01-02     1/5XXXXXXX 20.00    250.00                     230.10                   386.95
200.00           2008-01-03     1/5XXXXXXX 20.00    156.85                    386.95                    386.95
Não entendendo a lógica da soma de cada dia, devo usar um FOR ???
*/

Create Table #Exemplo (conta int, data Datetime, Valor Numeric(19,2))

insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-01', 10)
insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-02', 10)
insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-03', 10)
insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-03', 10)
insert into #Exemplo (conta, data, Valor) Values (1,'2008-05-04', -10)
*/

Declare @Data Datetime 
Select @Data = '2008-05-03'
Declare @Result Table (Idx Int Identity(1,1), Saldo_Anterior Numeric(19,2), Conta Int, Data Datetime, Valor Numeric(19,2), SaldoDia Numeric(19,2))

Insert into @Result (Saldo_Anterior, conta, Data, Valor, SaldoDia) 
Select Saldo.SaldoSanteior , #Exemplo.*,  Valor As SaldoDia
From #Exemplo 
Inner Join ( select conta, Sum(valor) As SaldoSanteior, Max(Data) As MxData  From #Exemplo 
Where Data < @Data Group By conta) Saldo On Saldo.Conta = #Exemplo.conta
Where #Exemplo.Data >= Saldo.MxData

Declare @Start Int, @End Int, @AttSaldoDia Numeric(19,2)

Select @Start = 1, @End = Max(Idx), @AttSaldoDia = Max(Saldo_Anterior)  From @Result
select * from @Result
While @Start <= @end
Begin

 Select @AttSaldoDia = @AttSaldoDia+Valor
 From @Result Where Idx = @start

 Update @Result Set SaldoDia = @AttSaldoDia Where  Idx = @start

Select @start = @start + 1
End

Select * from @Result
