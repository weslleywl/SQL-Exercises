--Primeiro, criamos um database e a tabela que nos servir? de base de dados.


CREATE TABLE ##DATAS
(
DATA DATETIME
)
?
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:10.663' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:10.693' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:10.763' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:10.783' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:11.657' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:11.677' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:11.757' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:11.807' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:12.667' )
INSERT INTO #DATAS VALUES ( '2004-05-12 17:21:12.687' )
GO

Agora, criamos a fun??o:

CREATE FUNCTION CALCULAMEDIAENTRE#DATAS()
RETURNS DATETIME
AS
BEGIN
DECLARE @DATAINI DATETIME
SELECT TOP 1 @DATAINI = DATA FROM #DATAS ORDER BY DATA
RETURN ( SELECT DATEADD (MS, AVG(DATEDIFF (MS, @DATAINI, DATA )), @DATAINI) FROM #DATAS )
END
GO


E, finalmente:

SELECT DBO.CALCULAMEDIAENTRE#DATAS()
