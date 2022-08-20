-- trazendo as datas mais recentes
declare @t TABLE (USID INT, SALDO DECIMAL(6,2), DATA DATETIME)

insert into @t VALUES (21,2.0,'2008-09-30 13:01:29.000')
insert into @t VALUES (21,2.0,'2008-10-31 13:42:59.000')
insert into @t VALUES (21,4.0,'2008-11-28 12:38:51.000')
insert into @t VALUES (21,0.0,'2008-12-29 12:09:11.000')
insert into @t VALUES (41,2.0,'2008-08-30 13:01:29.000')
insert into @t VALUES (41,2.0,'2008-10-31 13:42:59.000')

select * from t
select * into t from @t

-- Abordagem 2000 (Subqueries)

SELECT T.USID, T.SALDO, T.Data
FROM T AS T
INNER JOIN
(SELECT USID, MAX(Data) As UltimaData FROM T GROUP BY USID) As U
ON T.USID = U.USID AND T.Data = U.UltimaData

--Abordagem 2005 ou superior(CTE 2005)
WITH U AS (SELECT USID, MAX(Data) As UltimaData FROM @T GROUP BY USID)
SELECT T.USID, T.SALDO, T.Data
FROM @T AS T
INNER JOIN U ON T.USID = U.USID AND T.Data = U.UltimaData
