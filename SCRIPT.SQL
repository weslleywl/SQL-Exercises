SELECT * FROM V$SGA
SELECT size_for_estimate,
       buffers_for_estimate,
       estd_physical_read_factor,
       estd_physical_reads
  FROM V$DB_CACHE_ADVICE
 WHERE name = 'DEFAULT'
   AND block_size =
       (SELECT value FROM V$PARAMETER WHERE name = 'db_block_size')
   AND advice_status = 'ON'
   
Select name, value from v$sysstat where name like '%workarea%'

Select to_char(round(value,4),'999.99') || '%' "PGA Hit Ratio" From sys.v_$pgastat Where name = 'cache hit percentage'; 

show parameter sga;
show parameter pga;

ALTER SYSTEM SET PGA_AGGREGATE_TARGET=3G SCOPE=SPFILE;  
ALTER SYSTEM SET SGA_MAX_SIZE=10G SCOPE=SPFILE;  
ALTER SYSTEM SET SGA_TARGET=9G SCOPE=SPFILE;  
ALTER SYSTEM RESET MEMORY_TARGET SCOPE=SPFILE;  
ALTER SYSTEM RESET MEMORY_MAX_TARGET SCOPE=SPFILE;  
  
SHU IMMEDIATE  
STARTUP  