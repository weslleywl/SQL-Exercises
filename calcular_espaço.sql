-- calcular a qtd de espa�o por registro
set NoCount on 
declare @i Int 
set @i = 0 
while @i < 5000 
begin 
  insert into testeA(ID, Nome, Data, Ano, Mes)

  values(@i, �Fabiano � � + Convert(VarChar, @i), GetDate(), Year(GetDate()), Month(GetDate())) 
  insert into testeB(ID, Nome, Data, Ano, Mes) 

  values(@i, �Fabiano � � + Convert(VarChar, @i), GetDate(), Year(GetDate()), Month(GetDate())) 

  set @i = @i + 1 

end 

  

� Repare que o SQL alocou 122 paginas para a tabela 

DBCC SHOWCONTIG(TesteA) 

� Pages Scanned����������..: 122 

  

� Podemos fazer a seguinte conta para verificar qual o tamanho da tabela 

� 122 p�ginas vezes o tamanho ocupado por cada pagina / 1024 para converter o tamanho em Kb 

select (122 * 8192) / 1024 � 976 

� Confirmando o tamanho da tabela 

sp_spaceUsed TesteA � Data = 976 

  

�Vamos fazer um select na tabela TesteA e verificar quantos IOs s�o feitos para retornar 1/5 da tabela. 

set statistics io on 

select * from testeA 

where ID < 1000 

� Table �testeA�. Scan count 1, logical reads 26, physical reads 0, read-ahead reads 0. 

  

� Vamos verificar o mesmo select na tabela TesteB, 

� Observe que o Select na tabela testeB fez bem menos leitura para retornar os dados 

� obtendo assim ganho de performance. 

select * from testeB 

where ID < 1000 

� Table �testeB�. Scan count 1, logical reads 14, physical reads 0, read-ahead reads 0. 

  

A escolha dos data types s�o muito importantes para evitar IOs desnecess�rios e evitar que seu banco de dados se torne muito grande rapidamente. 

No projeto REAL da Microsoft, a equipe de desenvolvimento opotu por definir os campos do tipo Data como Int para poder ganhar 4 bytes de diferen�a entre o DateTime e o Int, a data � gravada no formato �yyyymmdd�. 

  

Vale lembrar tambem que no SQL Server 2005 Enterprise service pack 2 existe o campo VarDecimal que vem para substituir os campos Decimal e Numeric. Voc� pode ler mais sobre ele no link vardecimalStorage.docx
 





  

Fica a seguinte regra: �Quanto mais dados em menos p�ginas, menos leitura para retornar mais dados�. J 
