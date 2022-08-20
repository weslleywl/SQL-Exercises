create table #data_relato
(
dt_entrada  smalldatetime
)
set dateformat dmy
insert into #data_relato
values('13/7/2009')
select * from #data_relato


-- compara dimanicamente a data do dia atual
select dt_entrada from #data_relato
where 
dt_entrada >= CONVERT(CHAR(8),GETDATE(),112) AND  
dt_entrada < CONVERT(CHAR(8),GETDATE() + 1,112)

-- calculando os 7 dias anteriores
SELECT dt_entrada FROM #data_relato   
 WHERE  
dt_entrada <= DATEADD(Day,-7,CAST((CONVERT(CHAR(8),GETDATE(),112)) AS SMALLDATETIME)) AND  
dt_entrada < CONVERT(CHAR(8),GETDATE(),112)  


--15 Dias - Registros a 15 dias (excluindo-se os de hoje e os de 7 dias).   
 SELECT dt_entrada FROM #data_relato   
 WHERE  
     dt_entrada <= DATEADD(D,-15,CAST((CONVERT(CHAR(8),GETDATE(),112)) AS SMALLDATETIME)) AND  
     dt_entrada < DATEADD(D,-7,CAST((CONVERT(CHAR(8),GETDATE(),112)) AS SMALLDATETIME))   
   
 --30 Dias - Registro a 30 dias (excluido-se os de hoje, 7 dias e 15 dias).   
 SELECT dt_entrada FROM #data_relato   
 WHERE  
     dt_entrada <= DATEADD(D,-30,CAST((CONVERT(CHAR(8),GETDATE(),112)) AS SMALLDATETIME)) AND  
     dt_entrada < DATEADD(D,-15,CAST((CONVERT(CHAR(8),GETDATE(),112)) AS SMALLDATETIME))   

 

