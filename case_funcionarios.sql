-- inserir 0 a direita
update funcionarios
set matricula=case
when len(matricula)=7
then '00'+ matricula
end
where len(matricula)=7

select * from funcionarios where matricula='002211258'

select case
when email_aluno = tel_aluno
then 'certo'
else 'errado'
end
from alunos

SELECT * from adata
Select Case 
When fim_data  > inicio 
Then 'Inativo'
 Else 'Ativo' End as 'Situação' 
FROM adata

/*Neste select ocorre o seguinte está vericando os dados com entrada até 31/01/2008.
Agora preciso do seguinte que as vendas(me_dtsai) quem forem após 31/01/2008 fique com 
campo null para que eu possa somá-los.*/

SELECT VEC_VEE.VE_NR,GER_NFE.NF_NR, GER_VE.VE_CHASSI, GER_NFE.NF_VLTOT,
ME_DTENT,ME_DTSAI,
CASE 
WHEN ME_DTSAI > '2008-01-31 00:00:00.000' 
THEN 
ME_DTSAI = NULL
END AS VENDA
FROM VEC_VEE 
JOIN GER_NFEV ON VEC_VEE.VE_NR = GER_NFEV.VE_NR
JOIN GER_VE ON GER_VE.VE_NR = VEC_VEE.VE_NR
JOIN GER_NFE ON GER_NFE.NF_LANC = GER_NFEV.NF_LANC 
WHERE ME_DTENT >= '2000-01-01 00:00:00.000' 
AND ME_DTENT <= '2008-01-31 00:00:00.000' AND
((ME_DTSAI >= '2008-01-01 00:00:00.000' 
AND 
ME_DTSAI <= '2008-01-31 00:00:00.000')
OR ME_DTSAI IS NULL)
AND VEC_VEE.EST_CD = 'VN' AND GER_NFEV.EST_CD = 'VN' 



-- assim funciona
SELECT VEC_VEE.VE_NR,GER_NFE.NF_NR, GER_VE.VE_CHASSI, GER_NFE.NF_VLTOT,ME_DTENT,ME_DTSAI,
CASE 
 WHEN ME_DTSAI > '2008-01-31 00:00:00.000' 
THEN  NULL  -- o erro era aqui
ELSE ME_DTSAI -- e aqui
 END AS VENDA
FROM VEC_VEE 
JOIN GER_NFEV ON VEC_VEE.VE_NR = GER_NFEV.VE_NR
JOIN GER_VE ON GER_VE.VE_NR = VEC_VEE.VE_NR
JOIN GER_NFE ON GER_NFE.NF_LANC = GER_NFEV.NF_LANC 
WHERE ME_DTENT >= '2000-01-01 00:00:00.000' 
AND ME_DTENT <= '2008-01-31 00:00:00.000' AND
((ME_DTSAI >= '2008-01-01 00:00:00.000' 
AND 
ME_DTSAI <= '2008-01-31 00:00:00.000')
OR ME_DTSAI IS NULL)
AND VEC_VEE.EST_CD = 'VN' AND GER_NFEV.EST_CD = 'VN' 

-- usando case no where
 create table #exemplo (campo char(10))

 insert into #exemplo (campo) Values ('20060606')
 insert into #exemplo (campo) Values ('20060706')
 insert into #exemplo (campo) Values ('20060806')
 insert into #exemplo (campo) Values ('20063306') -- para dar erro
 insert into #exemplo (campo) Values ('') -- para dar erro

select * from #exemplo

 Select convert(datetime,campo,113) campo
 From #exemplo
 where 
case when isdate(campo) = 1 then
 campo else '19000101' End = '20060606'

select campo(datetime,campo,113) campo
from #exemplo
where 
case when isdate(campo)=1
then data
else '19000101' End = '20060606'

