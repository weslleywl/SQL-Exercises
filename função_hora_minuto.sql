-- função que pega hora e minuto
Create function Ufn_Formata_Horas (@Minutos Int)
Returns Varchar(10)
Begin
Declare @Hora Varchar(04)
Declare @Min  Varchar(02)

Select @Hora = @Minutos/60 , 
       @Min  = @Minutos%60 

Return (Select Case When Len(@Hora)=1 Then '0'+@Hora Else @Hora End + ':' + 
              Case When Len(@Min)=1 Then '0'+@Min Else @Min End)  
End

 Select dbo.Ufn_Formata_Horas(DateDiff(n,'22:58:10.000', '23:59:49.000'))

-- outra maneira de fazer a função
CREATE FUNCTION dbo.UdfCalculaIntervalos(
@Inicio SMALLDATETIME,
@Fim SMALLDATETIME,
@IntervaloMin TINYINT)
RETURNS TINYINT
AS
BEGIN
DECLARE @retorno TINYINT
SET @retorno = (SELECT DATEDIFF(Hour,@Inicio,@Fim)*60/@IntervaloMin)
RETURN (@retorno)
END
GO
SELECT dbo.UdfCalculaIntervalos('2008-02-07 09:30',getdate(),60)


-- mais uma outra maneira
CREATE function Ufn_Horas (@Start Datetime, @End   Datetime)
Returns Varchar(10)
Begin
Declare @Hora      Varchar(04)
Declare @Min       Varchar(02)
Declare @Segundos  Varchar(02)

Select @Hora     = DateDiff(n,@Start,@end)/60 , 
       @Min      = DateDiff(n,@Start,@end)/60


Return (Select Case When Len(@Hora)=1 Then '0'+@Hora Else @Hora End + ':' + 
               Case When Len(@Min)=1 Then '0'+@Min Else @Min End )

End

 

Select dbo.Ufn_horas('2007-07-10 10:00','2007-07-11 11:00')


-- mais maneira
CREATE  FUNCTION dbo.ApenasData (@data datetime = null)
RETURNS datetime AS 
BEGIN 
     return convert(datetime, convert(varchar, @data, 101))   

END
