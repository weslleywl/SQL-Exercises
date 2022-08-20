-- Funções escalares do SQL Server - MATEMÁTICAS 
ABS(numero) --1)Retorna o valor absoluto de um número qualquer
SELECT ABS(1)--1
SELECT ABS(-123)

SIGN(numero) --2)Retorna o sinal de positivo ou negativo do número
SELECT SIGN(1)--1 >>> POSITIVOSELECT
 SIGN(-123)-- -1 >>> NEGATIVO

CEILING(numero)--3)Retorna o menor inteiro que seja maior ou igual ao número fornecido à função
SELECT CEILING(1.23)--2SELECT CEILING(-1.23)

FLOOR(numero)--4)Retorna o maior inteiro que seja menor ou igual ao número fornecido à função
SELECT FLOOR(1.23)--1SELECT FLOOR(-1.23)

ROUND/*(numero, precisao, arredondarOuTruncar)
Arredonda ou trunca o número fornecido, de acordo com a precisão informada.
 Se o terceiro parâmetro não for passado para a função, o número é arredondado.
 Se quiser que o número seja truncado, deve-se fornecer o valor 1*/

SELECT ROUND(256.9994, 3)--256.9990


SQUARE(numero)--5)Retorna o quadrado de um número
SELECT SQUARE(3)--9.

POWER(numero, potencia)--Retorna o valor do número elevado à n-ésima potência
SELECT POWER(3, 2)--9

SQRT(numero)--Retorna a raíz quadrada de um numero
SELECT SQRT(3)--1.7320508075688772

-- função
CREATE FUNCTION UDF_RAND1(@MENOR INT, @MAIOR INT)
      RETURNS INT
AS
BEGIN
      RETURN (DATEPART(MS, GETDATE()) % (@MAIOR - @MENOR + 1) + @MENOR)
END
GO

select dbo.UDF_RAND1(2,6)



DECLARE @X VARCHAR(14)
SET @X = '1000'
SELECT @X AS 'VALOR', 
ISNUMERIC(@X) AS 'NUMÉRICO?', 
CONVERT(INT,
 @X) AS 'INTEIRO',
 CONVERT(FLOAT, @X) AS 'FLOAT'

SET @X = 'ABC'
SELECT @X AS 'VALOR', 
ISNUMERIC(@X) AS 'NUMÉRICO?', 
'NÃO CONVERTE' AS 'INTEIRO',
 'NÃO CONVERTE' AS 'FLOAT'


SET @X = '1D5'
SELECT @X AS VALOR', ISNUMERIC(@X) AS ‘NUMÉRICO?’, ‘NÃO CONVERTE’ AS ‘INTEIRO’, CONVERT(FLOAT, @X) AS ‘FLOAT’
SET @X = '2E2'
SELECT @X AS 'VALOR', ISNUMERIC(@X) AS ‘NUMÉRICO?’, ‘NÃO CONVERTE’ AS ‘INTEIRO’, CONVERT(FLOAT, @X) AS ‘FLOAT’
SET @X = '1.7E3'
SELECT @X AS 'VALOR', ISNUMERIC(@X) AS ‘NUMÉRICO?’, ‘NÃO CONVERTE’ AS ‘INTEIRO’, CONVERT(FLOAT, @X) AS ‘FLOAT’
SET @X = '2.1E-3'
SELECT @X AS 'VALOR', ISNUMERIC(@X) AS 'NUMÉRICO?', 'NÃO CONVERTE' AS 'INTEIRO', CONVERT(FLOAT, @X) AS 'FLOAT'