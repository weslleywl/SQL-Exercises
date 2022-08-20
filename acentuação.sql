/* Por favor algu�m sabe como ignorar acento no SQL Server, 
ou seja, em uma tabela tenho um campo com o conte�do "�gua" em outro "Agua", mas gostaria
 de fazer o join entre esses campos, ser� que entenderam?*/

create table #exemplo1 (campo varchar(10))
create table #exemplo (campo varchar(10))

insert into #exemplo (campo) Values ('�gua')
insert into #exemplo1 (campo) Values ('agua')


Select * From #exemplo 
inner join #exemplo1
 on #exemplo1.campo 
collate Latin1_General_CI_AI = #exemplo.campo collate Latin1_General_CI_AI


-- retirando acento
update #exemplo
set campo = replace(campo,'"','')
-- achando palavra com asp simples'
SET QUOTED_IDENTIFIER off
GO
select * from funcionario
where  Nom_Funcionario = "LUIZA DE SANT'ANNA MARTINS"

/*Quando voc� estiver com problemas de acentua��o com os seus dados, voc� poder� utiliza a fun��o abaixo para 
amenizar a situa��o. 
Informando a frase inteira com acentua��o a fun��o ir� retirar todos os acentos existentes e te retornar 
a mesma  frase, por�m, agora sem acentua��o.
*/
CREATE FUNCTION F_ACENTO(@Texto varchar(8000))
returns varchar(8000)  

AS  
BEGIN
         declare @SemAcento varchar(300)  
         select @SemAcento = replace(@Texto,'�','a') 
         select @SemAcento = replace(@SemAcento,'�','a')
         select @SemAcento = replace(@SemAcento,'�','a')  
         select @SemAcento = replace(@SemAcento,'�','a')   
         select @SemAcento = replace(@SemAcento,'�','e')  
         select @SemAcento = replace(@SemAcento,'�','e')  
         select @SemAcento = replace(@SemAcento,'�','e')  
         select @SemAcento = replace(@SemAcento,'�','i') 
         select @SemAcento = replace(@SemAcento,'�','i')   
         select @SemAcento = replace(@SemAcento,'�','i')   
         select @SemAcento = replace(@SemAcento,'�','o')   
         select @SemAcento = replace(@SemAcento,'�','o')   
         select @SemAcento = replace(@SemAcento,'�','o')   
         select @SemAcento = replace(@SemAcento,'�','o')   
         select @SemAcento = replace(@SemAcento,'�','u')   
         select @SemAcento = replace(@SemAcento,'�','u')   
         select @SemAcento = replace(@SemAcento,'�','u')   
         select @SemAcento = replace(@SemAcento,'�','u')   
         select @SemAcento = replace(@SemAcento,'�','c')   
         return (UPPER(@SemAcento))  
END
--chamada da fun��o
select dbo.F_ACENTO ('avia��o-av�-av� �"z')




----------------------


select u.Nome
, u.CPF
, u.DTNascimento
, u.Login, a.Email
, p.Title as 'Perfil'
, p.Id, po.Title as 'Portal'
, pa.Veiculo
, u.TipoAutenticacao
, gu.Title as 'Grupo de Acesso'
, u.GuidUsuario
, a.GACUSUARIO_Id
, co.CpfCnpj as 'Cpf/Cnpj Corretor'
, co.Title as 'Nome Corretora'
, a.CodAut
from Portal_ControleAcesso..USUARIO u 
      inner join Portal_ControleAcesso..ACESSO a  on a.USUARIO_Id = u.Id
      inner join Portal_ControleAcesso..PERFIL p on a.PERFIL_Id = p.Id
      inner join Portal_ControleAcesso..EMPRESA e on e.Id = a.EMPRESA_Id
      inner join Portal_ControleAcesso..PARCERIA pa on pa.Id = e.PARCERIA_Id
      inner join Portal_ControleAcesso..PORTAL po on po.Id = pa.PORTAL_Id
      inner join Portal_ControleAcesso..GACUSUARIO gu on gu.Id = a.GACUSUARIO_Id
      left join Portal_ControleAcesso..CORRETORA co on co.GuidCorretora = a.GuidCorretora
where u.Login like '%�%'




