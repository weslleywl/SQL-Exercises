-- exemplo de aribuir valor a variavel
Declare @String varchar(1000)
Set @String = 'Select * From anexo ' 
Set @String = @String + ' Where numlic = 12' + --@Variavel 
Exec(@String) 
select * from anexo
 -- uma view é executada da seguinte maneira
select * from nome daview

-- Descobrindo o tipo de modelo do backup
SELECT DATABASEPROPERTYEX('agora', 'Recovery')

-- alterando o modelo
alter database agora
set recovery simples

-- somente usuarios sysadmin(servidor), db_owner(db) e db_backupoperator(db)
/* sem um backup atualizado do master, vc devera recriar todos os db do sistema
usando o utilitário REBUILDM.
E:\80\TOOLS\BINN\REBUILDM.EXE
*/
EXEC sp_spaceused 'anexo'
EXEC sp_spaceused 'instituicao'
-- Criando arquivo de backup permanente
EXEC sp_addumpdevice 'disk', 'meuagora', 'c:\turma\agora.bak'

-- criando arquivo de backup temporario
backup database agora
to disk = 'c:\temp\meubackup.bak'
/*
opção INIT - sobrescreve um arquivo de backup
 NOINIT- acrescenta um arquivo de backup (é o padrão)
FORMAT - sobrescreve o conteudo de um arquivo de backup e dividi
o conjunto de resultado
*/

-- exemplo
backup database agora to nomebackup with init
-- criando outro exemplo
exec sp_addumpdevice 'disk', 'nebackup',
 'c:\turma\nebackup'
with differential
backup database agora to mubackup










-- fazendo o bachukp do log

BACKUP LOG [RH] TO  DISK = N'F:\Logs_Bancos\RH\novolog' WITH  INIT ,  NOUNLOAD ,  NAME = N'RH backup',  NOSKIP ,  STATS = 10,  NOFORMAT 

-- fazendo backup diferencial
BACKUP DATABASE [RH] TO [RH_Full_Dif] WITH  NOINIT ,  NOUNLOAD ,  DIFFERENTIAL ,  NAME = N'BD_RH backup',  SKIP ,  STATS = 10,  NOFORMAT

--fazendo o backup do full

BACKUP DATABASE [RH] TO [RH_Full_Dif] WITH  INIT ,  NOUNLOAD ,  NAME = N'BD_RH backup',  SKIP ,  STATS = 10,  NOFORMAT


