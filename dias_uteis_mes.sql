--Contar a quantidade de dias úteis no mês Através desta dica, o leitor poderá obter a quantidade de dias úteis em um mês, veja a abaixo o exemplo:
 
Set DateFormat dmy
 
Declare @DiaFinal Int,@ContarDias Int
 
Set @DiaFinal = (Select DatePart(day,GetDate()))
Set @ContarDias=0
 
Set Datefirst 1
 
While @DiaFinal >= (Select DatePart(day,GetDate())) And @DiaFinal <=31
 Begin
  Set @ContarDias = @ContarDias + 1
  Set @DiaFinal=(Select DatePart(day,GetDate()+@ContarDias))
 End
 
SELECT @@DATEFIRST AS '1st Day',  DATEPART(dw,GetDate()+@ContarDias) AS 'Today', @ContarDias As 'Total de Dias'