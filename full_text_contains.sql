/*Estou com o seguinte problema: Tenho uma pesquisa utilizando as funcionalidades de FTS, por�m, surgiu a necessidade de realizar a pesquisa em FTS utilizando 2 campos, ou seja, 2 colunas!!!
Para explicar melhor � o seguinte:
Select * From Tabela WHERE CONTAINS (campo1, "'testes'")
Este foi um exemplo de FTS utilizando apenas uma coluna para par�metro.*/

Select * From Tabela
 WHERE CONTAINS (campo1, '"testes"')
 AND CONTAINS (campo2, '"idteste"') 