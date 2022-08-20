SELECT data_junta,aj.id_junta, 'junta' = CASE 
WHEN AM2.NOME_MEDICO IS NOT NULL AND AM3.NOME_MEDICO IS NOT NULL THEN 
left(AM.NOME_MEDICO,15)+'--'+left(AM2.NOME_MEDICO,15)+'--'+left(AM3.NOME_MEDICO,15)+'--'+upper(desc_especialidade) +' / '+ convert(char(10), ISNULL(ttt.TOTAL_CONSULTAS,(0))) 
WHEN AM2.NOME_MEDICO IS NOT NULL  AND AM3.NOME_MEDICO IS NULL THEN 
left(AM.NOME_MEDICO,15)+'--'+left(AM2.NOME_MEDICO,15)+'--'+upper(desc_especialidade) +' / '+ convert(char(10), ISNULL(ttt.TOTAL_CONSULTAS,(0))) 
WHEN AM2.NOME_MEDICO IS NULL  AND AM3.NOME_MEDICO IS NULL THEN 
left(AM.NOME_MEDICO,15)+'--'+upper(desc_especialidade)+' / '+ convert(char(10), ISNULL(ttt.TOTAL_CONSULTAS,(0))) 
END
FROM AG_JUNTA AJ 
INNER JOIN AG_MEDICO AM ON AM.ID_MEDICO = AJ.MEDICO1 	     
LEFT JOIN AG_MEDICO AM2 ON AM2.ID_MEDICO = AJ.MEDICO2  
LEFT JOIN AG_MEDICO AM3 ON AM3.ID_MEDICO = AJ.MEDICO3  
INNER JOIN AG_ESPECIALIDADE AE ON AE.ID_ESPECIALIDADE = AJ.ID_ESPECIALIDADE  
FULL OUTER JOIN(SELECT COUNT(CT.ID_CONSULTA)AS TOTAL_CONSULTAS,jt.id_junta FROM AG_CONSULTA CT
INNER JOIN AG_JUNTA JT ON CT.ID_JUNTA = JT.ID_JUNTA
group by jt.id_junta) ttt
on ttt.id_junta = aj.id_junta
where convert(char(10),data_junta,103) = '10/06/2009'

-------------------------------------------

SELECT * FROM ag_junta  WHERE DateDIFF(dd,data_junta,GETDATE()) < 30
go

declare @ff datetime
set @ff = (getdate()-5)
print @ff
select DateDIFF(dd,GETDATE(),@ff) from ag_junta



select data_junta,al.id_junta,'junta'=case
from ag_junta aj
join ag_medico am on am.id_medico = aj.id_medico
left join ag_meidico am2 on am2.id_medico = aj.id_medico
left join ag_medico am3 on am3.id_medico = aj.id_medico
inner join ag_especialidade ae on ae.id_especialidade = aj.id_especialidade


select * from ag_junta
select * from ag_medico
select * from ag_consulta
select * from ag_especialidade
