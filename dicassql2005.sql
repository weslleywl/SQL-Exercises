 /*1)A view sp_who2 no SQL Server 2000 funciona perfeitamente em minha
aplica��o mostrando todas as conex�es com a base de dados, mas no SQLServer 
2005 o mesmo comando n�o funciona corretamente, exibe somente uma conex�o sendo que possui varias. */   
R.No SQL Server 2005 o usuario da aplica��o precisa ter o direito "view server state",
caso contrario o sp_who2 exibir� somente as conexoes da sess�o atual. 
Depois de atribuido este direito, passou a visualizar todas as conex�es.

/*2)Para eu utilizar este utilit�rio o bando deve estar em modo misto de autentica��o */
R.sqlcmd -Snome_servidor -E 





