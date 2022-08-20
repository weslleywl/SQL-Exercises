/*Tenho 15 tabelas relacionada sendo que a maior tem um milhão e duzentos registros e a segunda maior tem umas 30 mil registros e o resto é poquinho. Tipos uns 100 registros cada.
A pergunta é a seguinte:
O que ficaria mais rápido para o meu caso levando em consideração que meu sistema é web (ASP)?
Um select lotado de inners e lefts joins?
Uma view?
Uma procedure que gera uma tabela temporária me retornando o select dessa tabela?
Ou é tudo a mesma coisa em relação a performance?
Gostaria de salientar alguns pontos para a resposta ter foco:
Não vou listar todos os registros na tela pois tem paginação;
Mesmo que a pesquisa seja total, eu trato com parametros para não trazer tudo;*/

select * from funcionario
sp_spaceused 'funcionario' 
DBCC UPDATEUSAGE (agora, alunos)


DBCC INPUTBUFFER(59)

Suas dúvidas são bem comuns quando se fala em grandes massas de dados , mas escondem alguns equívocos também comuns.
"a maior tem um milhão e duzentos registros e a segunda maior tem umas 30 mil registros"
 
Embora número de registros dê uma razão de grandeza, ele por si só não significa nada. Veja a seguinte comparação:

Situação 1
Codigo INT, Nome VARCHAR(50), CPF CHAR(11), Email VARCHAR(100), Telefone VARCHAR(15), UF CHAR(2)
Tamanho total da linha (aproximado): 4 + 50 + 2 + 11 + 100 + 2 + 15 + 2 = 186
Total de registros: 100.000
Total ocupado: 100.000 * 186 = 18.600.000 bytes = 18.6MB

Situação 2
IDFK1 INT, IDFK2 INT, Valor INT
Tamanho total da linha (aproximado): 4 + 4 + 4 = 12
Total de registros: 1.000.000
Total ocupado: 12.000.000 = 12MB

Observe que na primeira situação, mesmo havendo menos registros (razão de 1/10), a tabela ocupa um tamanho maior e que ainda assim esse tamanho não é grande coisa (gastar 18.6MB em memória é muito fácil). Isso só evidencia que o número de registros sozinho nada significa. Você deve olhar o tamanho das tabelas e não somente o número de registros (é possível verificar o tamanho da tabela usando a procedure sp_spaceused).
Entre SELECTs, Procedures e Views há uma diferença de desempenho. Em 99% das situações, as procedures ganham em virtude do plano pré-compilado (elas podem perder em situações especiais). No entanto, frente a sua situação, não saberia dizer se esse ganho seria tão significativo assim (embora não deva ser desprezado). Acredito que se você trabalhar a indexação, os resultados serão muito melhores independente de você usar ou não uma SP.
A idéia do Laércio é excelente para esse tipo de situação, mas podemos evoluir um pouco mais. Ao invés de criar essa tabela e populá-la de tempos em tempos, procure conhecer o recurso "View Indexada". Pode ser útil para esse tipo de situação. Se a quantidade de registros for muito grande e tornar a tabela muito grande tente utilizar o recurso de particionamento (SQL Server 2005) ou o de Partitioned Views (SQL Server 2000).
Acredito que se você utilizar SPs e tiver uma boa indexação o resultado já será satisfatório. Se ainda assim tiver problemas considere o uso de Views Indexadas e caso os problemas ainda se manifestem (pouco provável) procure utilizar o particionamento de tabelas (SQL Server 2005) ou o recurso de Views Particionadas (SQL Server 2000).
Do ponto de vista de desenvolvimento, tente diminuir o nível de normalização (15 joins denota um modelo altamente normalizado) e (ou) introduza algum nível de desnormalização em seu modelo (preagregações, colunas replicadas, etc)

 


