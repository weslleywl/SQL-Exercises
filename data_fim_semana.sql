CREATE TABLE #tblDatas (DATA SMALLDATETIME)
INSERT INTO #tblDatas VALUES ('20080324')
INSERT INTO #tblDatas VALUES ('20080321')
INSERT INTO #tblDatas VALUES ('20080323')
INSERT INTO #tblDatas VALUES ('20080327')

 
-- Esse é o valor padrão (Domingo é o primeiro dia da semana)
-- Essa condição foi colocada apenas para garantia
SET DATEFIRST 7

-- Selecionar todas as datas e dizer se o dia anterior é sábado ou domingo

SELECT
DATA,
CASE WHEN DATEPART(dw,DATA) IN (1,2) THEN 'Dia Anterior é Sábado ou Domingo'
ELSE 'Dia Anterior não é sábado ou domingo'
END

FROM
#tblDatas
 
DROP TABLE #tblDatas

-- outra maneira
Select Case Datepart(weekday, GetDate()) 
When 1 Then 'Domingo'
When 2 Then 'Segunda - Feira'
When 3 Then 'Terça - Feira'
When 4 Then 'Quarta - Feira'
When 5 Then 'Quinta - Feira'
When 6 Then 'Sexta - Feira'
When 7 Then 'Sábado'
End As 'Dia da semana' 
