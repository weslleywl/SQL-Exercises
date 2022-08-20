-- tabelas do sistema
select * from sysobjects
select * from sysindexes
select * from syscolumns
select * from systypes
select * from syscomments
select * from sysfiles
select * from sysusers
select * from sysfilegroups
select * from sysdatabases

-- Utilizando cusor p/ executar Dbcc em todas as bases
declare cr_Cursor cursor fast_forward
for 

     select name from master.dbo.SysDatabases

declare @database varchar(200)
declare @cmd varchar(200)
open cr_Cursor

fetch next from cr_Cursor into @database
while (@@fetch_status <> -1)
begin
          if (@@fetch_status <> -2)
          begin
               set @cmd = 'dbcc checkdb('+''''+@database+''''+')'
                         print ''
               print '-------------------------------------------'
               print '>>>> Database: '+ @database
               print '-------------------------------------------'
                         exec (@cmd)
          end
          fetch next from cr_Cursor into @database
end

close cr_Cursor
deallocate cr_Cursor

-- Utilizando a procedure sp_MSForEachDB, para realizar o mesmo procedimento
exec sp_MSForEachDB @command1="print '?'" ,
                                          @command2="DBCC CHECKDB ('?')"

DECLARE teste_Cursor CURSOR FOR
SELECT cod, descr FROM categoria
OPEN teste_Cursor
FETCH NEXT FROM teste_Cursor
WHILE @@FETCH_STATUS = 0
BEGIN
   FETCH NEXT FROM teste_Cursor
END
CLOSE teste_Cursor
DEALLOCATE teste_Cursor


-- procurando o serial do registro
xp_RegRead
Você instalou o SQL Server 2000 e perdeu aquele “papelzinho” onde estava anotado o CD Key (número de registro) do SQL Server 2000 ... Agora você está em apuros porque fez um upgrade de máquina e precisa realizar uma nova instalação ... E agora? Utilize a procedure xp_RegRead para ler informações do registry; basta informando a chave:

use master
exec xp_RegRead 
                  'HKEY_LOCAL_MACHINE',
                  'SOFTWARE\Microsoft\Microsoft SQL Server\80\registration\',
                  'CD_KEY'
-------------------------------------------------------------------------------

Value          Data
CD_KEY      M3XXD-KQ4K5-XYQ89-YT9P5-DAG6F

exec sp_Who2 active

 set Statistics IO on
select * from anexo


