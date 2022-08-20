
/*QUERY para converter CAMPO NO BANCO de varchar para int 
Nesse caso n�o estamos falando de uma atualiza��o de conte�do (DML) e sim de estrutura 
(DDL). � por isso que a instru��o UPDATE � ineficaz nesse caso.
 O correto � utilizar o ALTER TABLE. Ex:*/

CREATE TABLE #tblTeste (COLUNA VARCHAR(20)) 

INSERT INTO #tblTeste VALUES ('1')
INSERT INTO #tblTeste VALUES ('2')
INSERT INTO #tblTeste VALUES ('3')

ALTER TABLE #tblTeste ALTER COLUMN COLUNA INT
select * from #tblTeste


--No entanto, se algum registro n�o puder ser convertido, a altera��o ir� falhar. Ex:


CREATE TABLE #tblTeste (COLUNA VARCHAR(20))

INSERT INTO #tblTeste VALUES ('1')
INSERT INTO #tblTeste VALUES ('2')
INSERT INTO #tblTeste VALUES ('x')

ALTER TABLE #tblTeste ALTER COLUMN COLUNA INT

--Nesse caso, voc� ter� que buscar os registros n�o num�ricos e trat�-los. Ex:
SELECT COLUNA FROM #tblTeste WHERE ISNUMERIC(COLUNA) = 0

/*O n�mero 00094368 � igual ao n�mero 94368 uma vez que zeros a esquerda n�o fazem nenhuma 
diferen�a para dados num�ricos. Se voc� realmente precisa desses zeros voc� ter� que fazer uma de duas escolhas:
Utilizar o tipo texto
Nesse caso, volte a usar o tipo VARCHAR (ou CHAR se for fixo) e armazene as posi��es
Formatar o resultado
Nesse caso recupere o n�mero, converta-o para texto e acrescente zeros caso seja necess�rio. Ex:*/


DECLARE @Num1 INT, @Num2 INT, @Num3 INT
SET @Num1 = 60094303
SET @Num2 = 00094368
SET @Num3 = 1

SELECT
RIGHT('00000000' + CAST(@Num1 AS VARCHAR(8)),8) As Num1,
RIGHT('00000000' + CAST(@Num2 AS VARCHAR(8)),8) As Num2,
RIGHT('00000000' + CAST(@Num3 AS VARCHAR(8)),8) As Num3

/*Minha recomenda��o � armazenar no formato texto. 
Embora esse formato utilize mais espa�o (tanto nos dados quantos nos �ndices),
ele evitar� disp�ndio de CPU e mem�ria com a convers�o dos dados. Se voc� j� precisa 
trabalhar nesse formato, � melhor armazen�-lo dessa forma do que realizar essa convers�o em diversos SELECTs.*/
