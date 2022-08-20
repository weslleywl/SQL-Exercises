create function t_treta2(@varchar(14))
DECLARE @X VARCHAR(14)
SET @X = '1000'
SELECT @X AS 'VALOR',
 ISNUMERIC(@X) AS 'NUMÉRICO?',
 CONVERT(INT, @X) AS 'INTEIRO',
 CONVERT(FLOAT, @X) AS 'FLOAT'
returns 
as
begin
  return(@x)
end 
go