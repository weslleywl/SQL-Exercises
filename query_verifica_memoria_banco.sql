SELECT * FROM v$sga;
select * from v$sgainfo;

SELECT object_type,COUNT(1)
  FROM DBA_OBJECTS  
 WHERE OBJECT_TYPE NOT IN ('TABLE','INDEX','VIEW','PROCEDURE','TRIGGER','INDEX PARTITION','INDEX SUBPARTITION','INDEXTYPE')
 group by object_type