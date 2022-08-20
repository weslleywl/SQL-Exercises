/* Problemas de conectividades e Servi�os
Error:18456,Severity:14,State:8
Login failed for user '.........'.[CLIENT:192.168.0.0]

obs: Na aplica��o o erro do State ser� sempre 1, j� no log do SQL pode variar

State                     Descri��o
------                    -------------------------------------
2,5 ------------------ ID do usuario n�o � valido (User ID is not valid)
6   ------------------ Tentando usar login do Windows com SQL Server Authentication ((Trying to use Windows login to SQL Server Authentication)
7   ------------------ Login est� desabilitado (Login is disabled)
8   ------------------ A senha est� incorreta (The password is incorrect)
9   ------------------ Senha inv�lida (Invalid password)
18	------------------ A senha deve ser alterada (The password must be changed.)
*/

/*
1)Se o servidor encontra um erro que impede que o login de suceder, o cliente ir� exibir o mesage de erro.
If the server finds an error that prevents the login to succeed, the client will display the error mesage.*/


Msg 18456, Level 14, State 1, Server <name, Line 1
Login failed for User <user'nome>'
/*
Estado = 16 significa que o utilizador de entrada n�o tem permiss�o para entrar no banco de dados de destino. Assim,
 por exemplo, dizer que voc� criar um usu�rio foo e FOO conjunto de dados padr�o para dominar, mas FOO n�o tem 
permiss�es para entrar no master. 

Isso tamb�m pode acontecer se, por exemplo, o banco de dados padr�o para FOO usu�rio n�o est� online (por exemplo,
 o banco de dados est� marcado como suspeito). 

Assim, para verificar esta teoria, tente efetuar o usu�rio em algum outro banco de dados e em seguida, tente
 utilizar o comando USE DATABASE para mudar para o banco de dados destino, voc� receber� uma mensagem de erro como
 melhor para a causa da falha. */
