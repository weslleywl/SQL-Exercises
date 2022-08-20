/*Tenho 15 tabelas relacionada sendo que a maior tem um milh�o e duzentos registros e a segunda maior tem umas 30 mil registros e o resto � poquinho. Tipos uns 100 registros cada.
A pergunta � a seguinte:
O que ficaria mais r�pido para o meu caso levando em considera��o que meu sistema � web (ASP)?
Um select lotado de inners e lefts joins?
Uma view?
Uma procedure que gera uma tabela tempor�ria me retornando o select dessa tabela?
Ou � tudo a mesma coisa em rela��o a performance?
Gostaria de salientar alguns pontos para a resposta ter foco:
N�o vou listar todos os registros na tela pois tem pagina��o;
Mesmo que a pesquisa seja total, eu trato com parametros para n�o trazer tudo;*/

select * from funcionario
sp_spaceused 'funcionario' 
DBCC UPDATEUSAGE (agora, alunos)


DBCC INPUTBUFFER(59)

Suas d�vidas s�o bem comuns quando se fala em grandes massas de dados , mas escondem alguns equ�vocos tamb�m comuns.
"a maior tem um milh�o e duzentos registros e a segunda maior tem umas 30 mil registros"
 
Embora n�mero de registros d� uma raz�o de grandeza, ele por si s� n�o significa nada. Veja a seguinte compara��o:

Situa��o 1
Codigo INT, Nome VARCHAR(50), CPF CHAR(11), Email VARCHAR(100), Telefone VARCHAR(15), UF CHAR(2)
Tamanho total da linha (aproximado): 4 + 50 + 2 + 11 + 100 + 2 + 15 + 2 = 186
Total de registros: 100.000
Total ocupado: 100.000 * 186 = 18.600.000 bytes = 18.6MB

Situa��o 2
IDFK1 INT, IDFK2 INT, Valor INT
Tamanho total da linha (aproximado): 4 + 4 + 4 = 12
Total de registros: 1.000.000
Total ocupado: 12.000.000 = 12MB

Observe que na primeira situa��o, mesmo havendo menos registros (raz�o de 1/10), a tabela ocupa um tamanho maior e que ainda assim esse tamanho n�o � grande coisa (gastar 18.6MB em mem�ria � muito f�cil). Isso s� evidencia que o n�mero de registros sozinho nada significa. Voc� deve olhar o tamanho das tabelas e n�o somente o n�mero de registros (� poss�vel verificar o tamanho da tabela usando a procedure sp_spaceused).
Entre SELECTs, Procedures e Views h� uma diferen�a de desempenho. Em 99% das situa��es, as procedures ganham em virtude do plano pr�-compilado (elas podem perder em situa��es especiais). No entanto, frente a sua situa��o, n�o saberia dizer se esse ganho seria t�o significativo assim (embora n�o deva ser desprezado). Acredito que se voc� trabalhar a indexa��o, os resultados ser�o muito melhores independente de voc� usar ou n�o uma SP.
A id�ia do La�rcio � excelente para esse tipo de situa��o, mas podemos evoluir um pouco mais. Ao inv�s de criar essa tabela e popul�-la de tempos em tempos, procure conhecer o recurso "View Indexada". Pode ser �til para esse tipo de situa��o. Se a quantidade de registros for muito grande e tornar a tabela muito grande tente utilizar o recurso de particionamento (SQL Server 2005) ou o de Partitioned Views (SQL Server 2000).
Acredito que se voc� utilizar SPs e tiver uma boa indexa��o o resultado j� ser� satisfat�rio. Se ainda assim tiver problemas considere o uso de Views Indexadas e caso os problemas ainda se manifestem (pouco prov�vel) procure utilizar o particionamento de tabelas (SQL Server 2005) ou o recurso de Views Particionadas (SQL Server 2000).
Do ponto de vista de desenvolvimento, tente diminuir o n�vel de normaliza��o (15 joins denota um modelo altamente normalizado) e (ou) introduza algum n�vel de desnormaliza��o em seu modelo (preagrega��es, colunas replicadas, etc)

 


