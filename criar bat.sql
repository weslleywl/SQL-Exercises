/*veja o exemplo ótimo.. 
salve a instrução abaixo em um arquivo txt e coloque a extensão .bat no 
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

/*Uma outra alternativa seria vc fazer uma .bat para chamar o utilitário 
osql.exe e executar os scripts. 

Seria algo +- assim, 

--- arquivo .bat 
osql -SServerName -E -ddb_name -i<caminho>script1.sql 
-o<caminho>script1_out.txt 
osql -SServerName -E -ddb_name -i<caminho>script2.sql 
-o<caminho>script2_out.txt 
.. 
. 

Pronto, agora basta executar a .bat e todos os scripts serão executados.O 
trabalho é só criar a .bat pela primeira vez, depois é só adicionar novos 
scripts 
*/
