 /*1)A view sp_who2 no SQL Server 2000 funciona perfeitamente em minha
aplicação mostrando todas as conexões com a base de dados, mas no SQLServer 
2005 o mesmo comando não funciona corretamente, exibe somente uma conexão sendo que possui varias. */   
R.No SQL Server 2005 o usuario da aplicação precisa ter o direito "view server state",
caso contrario o sp_who2 exibirá somente as conexoes da sessão atual. 
Depois de atribuido este direito, passou a visualizar todas as conexões.

/*2)Para eu utilizar este utilitário o bando deve estar em modo misto de autenticação */
R.sqlcmd -Snome_servidor -E 





