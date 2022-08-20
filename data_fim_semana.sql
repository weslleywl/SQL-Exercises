CREATE TABLE #tblDatas (DATA SMALLDATETIME)
INSERT INTO #tblDatas VALUES ('20080324')
INSERT INTO #tblDatas VALUES ('20080321')
INSERT INTO #tblDatas VALUES ('20080323')
INSERT INTO #tblDatas VALUES ('20080327')

 
-- Esse � o valor padr�o (Domingo � o primeiro dia da semana)
-- Essa condi��o foi colocada apenas para garantia
SET DATEFIRST 7

-- Selecionar todas as datas e dizer se o dia anterior � s�bado ou domingo

SELECT
DATA,
CASE WHEN DATEPART(dw,DATA) IN (1,2) THEN 'Dia Anterior � S�bado ou Domingo'
ELSE 'Dia Anterior n�o � s�bado ou domingo'
END

FROM
#tblDatas
 
DROP TABLE #tblDatas

-- outra maneira
Select Case Datepart(weekday, GetDate()) 
When 1 Then 'Domingo'
When 2 Then 'Segunda - Feira'
When 3 Then 'Ter�a - Feira'
When 4 Then 'Quarta - Feira'
When 5 Then 'Quinta - Feira'
When 6 Then 'Sexta - Feira'
When 7 Then 'S�bado'
End As 'Dia da semana' 
