-- Monitorando quanto de memória cada banco de dados está consumindo
WITH Consumo_Pool_Buffer
AS
(
    SELECT Database_id,    BuffersPorPagina = COUNT_BIG(*) 
               FROM sys.dm_os_buffer_descriptors
                GROUP BY database_id
)
SELECT
                Database_id as DatabaseID,
                CASE Database_id WHEN 32767

               THEN 'Recurso interno do SQL SERVER'
             ELSE DB_NAME(Database_id) END AS DatabaseName,
                BuffersPorPagina,
                (CONVERT(NUMERIC(10,2),BuffersPorPagina*8)/1024) AS BuffersPorMB
FROM Consumo_Pool_Buffer
ORDER BY BuffersPorPagina DESC, BuffersPorMB DESC
GO

-- Monitorando quanto de memória cada objeto está consumindo
SELECT  DB_NAME(db_id()) DatabaseName,  Result.ObjectName, COUNT(*) AS cached_pages_count, index_id
FROM sys.dm_os_buffer_descriptors A
INNER JOIN
(SELECT OBJECT_NAME(object_id) as ObjectName, A.allocation_unit_id,type_desc,index_id, rows
    FROM sys.allocation_units A, sys.partitions B
                WHERE A.container_id = B.hobt_id
                AND (A.type = 1 or A.type = 3)
                UNION ALL
  SELECT  OBJECT_NAME(object_id) as ObjectName,  allocation_unit_id, type_desc,  index_id, rows
                FROM sys.allocation_units AS au
                INNER JOIN sys.partitions AS p
                ON au.container_id = p.partition_id
                AND au.type = 2
                    ) as Result
On A.allocation_unit_id = Result.allocation_unit_id
WHERE database_id = db_id()
GROUP BY
                Result.ObjectName,
                index_id
ORDER BY cached_pages_count DESC
GO

-- quanto esta utilizando de memoria por sessão

select session_id,granted_memory_kb,granted_memory_kb /1024 as granted_memory_mb,
used_memory_kb, used_memory_kb / 1024 as used_memory_mb,
ideal_memory_kb,ideal_memory_kb / 1024 as ideal_memory_mb from sys.dm_exec_query_memory_grants
where session_id <> @@SPID
