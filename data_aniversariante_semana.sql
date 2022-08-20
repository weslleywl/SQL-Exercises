--pegar aniversariante da semana
DECLARE @Aniversariantes TABLE (Nome Varchar(30), DtNasc SMALLDATETIME)

INSERT @Aniversariantes
SELECT 'SONIA MARIA DE MELLO'      ,'1949-11-27' UNION
SELECT 'CLEIDE NASCIMENTO DE SA'   ,'1964-11-28' UNION
SELECT 'ANDRÉ NASCIMENTO'          ,'1964-11-29' UNION
SELECT 'LEONARDO ARAÚJO'           ,'1964-11-30' UNION
SELECT 'SANDRA LOPES VIEIRA'       ,'1970-12-01' UNION
SELECT 'MARISTELA ANTONIA DA SILVA','1964-12-02' UNION
SELECT 'LUIZ ANTONIO DA SILVA'     ,'1962-12-05' UNION
SELECT 'JORGE CARLOS AROLDO'       ,'1949-12-06' UNION
SELECT 'LEANDRO GOMES'             ,'1949-12-07' 


SELECT	Nome, DtNasc 
FROM @Aniversariantes 
WHERE DATEPART(WEEK,DATEADD(YY,DATEDIFF(YY,DtNasc,GETDATE()),DtNasc)) = DATEPART(WEEK,GETDATE())
ORDER BY RIGHT(CONVERT(VARCHAR,DtNasc,112),4) 

-------------------------------------------------------------------------


--precisa de uma funcao porque quando vc. calcula a data precisa saber se a pessoa ja completou o aniversario.

Create Function Ufn_CurrentAge (@BirthDate As Datetime, @CurrentDate datetime) 
Returns Int
As
Begin
Declare @Age Int
Select @Age = Case 
             When Convert(datetime, Convert(Char(04),Year(@CurrentDate)) +  Right(Convert(char(10),@BirthDate,126),06)) >= 
       @CurrentDate then  DateDiff(Year, @BirthDate, @CurrentDate)-1 Else DateDiff(Year, @BirthDate, @CurrentDate) End 
Return @Age
End
