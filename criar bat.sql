/*veja o exemplo �timo.. 
salve a instru��o abaixo em um arquivo txt e coloque a extens�o .bat no 
lugar de .txt. 

osql -S nomedoservidor -U usuario -P senha -i c:\testeosql.txt 

no arquivo testeosql.txt vai conter o seu script que vai rodar quando 
executar o bat. 
salve neste arquivo um simples select * em uma tabela e veja o que acontece. 
tambem veja no dos os parametros adicionais do utilitario osql. 
*/

/*cria um arquivo .bat assim 

copy con exemplo.bat 
osql -Sseuservidor -E -Q"select top 1 * from banco.dbo.tabela where campo 
= %1" 

ctrl+z -- para salvar 

depois rode 

exemplo 100 
ele vai usar o %1 como 100, vc. pode usar %2, %3, etc.; 
*/

/*Uma outra alternativa seria vc fazer uma .bat para chamar o utilit�rio 
osql.exe e executar os scripts. 

Seria algo +- assim, 

--- arquivo .bat 
osql -SServerName -E -ddb_name -i<caminho>script1.sql 
-o<caminho>script1_out.txt 
osql -SServerName -E -ddb_name -i<caminho>script2.sql 
-o<caminho>script2_out.txt 
.. 
. 

Pronto, agora basta executar a .bat e todos os scripts ser�o executados.O 
trabalho � s� criar a .bat pela primeira vez, depois � s� adicionar novos 
scripts 
*/
