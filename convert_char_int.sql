
/*QUERY para converter CAMPO NO BANCO de varchar para int 
Nesse caso não estamos falando de uma atualização de conteúdo (DML) e sim de estrutura 
(DDL). É por isso que a instrução UPDATE é ineficaz nesse caso.
 O correto é utilizar o ALTER TABLE. Ex:*/

CREATE TABLE #tblTeste (COLUNA VARCHAR(20)) 

INSERT INTO #tblTeste VALUES ('1')
INSERT INTO #tblTeste VALUES ('2')
INSERT INTO #tblTeste VALUES ('3')

ALTER TABLE #tblTeste ALTER COLUMN COLUNA INT
select * from #tblTeste


--No entanto, se algum registro não puder ser convertido, a alteração irá falhar. Ex:


CREATE TABLE #tblTeste (COLUNA VARCHAR(20))

INSERT INTO #tblTeste VALUES ('1')
INSERT INTO #tblTeste VALUES ('2')
INSERT INTO #tblTeste VALUES ('x')

ALTER TABLE #tblTeste ALTER COLUMN COLUNA INT

--Nesse caso, você terá que buscar os registros não numéricos e tratá-los. Ex:
SELECT COLUNA FROM #tblTeste WHERE ISNUMERIC(COLUNA) = 0

/*O número 00094368 é igual ao número 94368 uma vez que zeros a esquerda não fazem nenhuma 
diferença para dados numéricos. Se você realmente precisa desses zeros você terá que fazer uma de duas escolhas:
Utilizar o tipo texto
Nesse caso, volte a usar o tipo VARCHAR (ou CHAR se for fixo) e armazene as posições
Formatar o resultado
Nesse caso recupere o número, converta-o para texto e acrescente zeros caso seja necessário. Ex:*/


DECLARE @Num1 INT, @Num2 INT, @Num3 INT
SET @Num1 = 60094303
SET @Num2 = 00094368
SET @Num3 = 1

SELECT
RIGHT('00000000' + CAST(@Num1 AS VARCHAR(8)),8) As Num1,
RIGHT('00000000' + CAST(@Num2 AS VARCHAR(8)),8) As Num2,
RIGHT('00000000' + CAST(@Num3 AS VARCHAR(8)),8) As Num3

/*Minha recomendação é armazenar no formato texto. 
Embora esse formato utilize mais espaço (tanto nos dados quantos nos índices),
ele evitará dispêndio de CPU e memória com a conversão dos dados. Se você já precisa 
trabalhar nesse formato, é melhor armazená-lo dessa forma do que realizar essa conversão em diversos SELECTs.*/
