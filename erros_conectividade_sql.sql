/* Problemas de conectividades e Serviços
Error:18456,Severity:14,State:8
Login failed for user '.........'.[CLIENT:192.168.0.0]

obs: Na aplicação o erro do State será sempre 1, já no log do SQL pode variar

State                     Descrição
------                    -------------------------------------
2,5 ------------------ ID do usuario não é valido (User ID is not valid)
6   ------------------ Tentando usar login do Windows com SQL Server Authentication ((Trying to use Windows login to SQL Server Authentication)
7   ------------------ Login está desabilitado (Login is disabled)
8   ------------------ A senha está incorreta (The password is incorrect)
9   ------------------ Senha inválida (Invalid password)
18	------------------ A senha deve ser alterada (The password must be changed.)
*/

/*
1)Se o servidor encontra um erro que impede que o login de suceder, o cliente irá exibir o mesage de erro.
If the server finds an error that prevents the login to succeed, the client will display the error mesage.*/


Msg 18456, Level 14, State 1, Server <name, Line 1
Login failed for User <user'nome>'
/*
Estado = 16 significa que o utilizador de entrada não tem permissão para entrar no banco de dados de destino. Assim,
 por exemplo, dizer que você criar um usuário foo e FOO conjunto de dados padrão para dominar, mas FOO não tem 
permissões para entrar no master. 

Isso também pode acontecer se, por exemplo, o banco de dados padrão para FOO usuário não está online (por exemplo,
 o banco de dados está marcado como suspeito). 

Assim, para verificar esta teoria, tente efetuar o usuário em algum outro banco de dados e em seguida, tente
 utilizar o comando USE DATABASE para mudar para o banco de dados destino, você receberá uma mensagem de erro como
 melhor para a causa da falha. */
