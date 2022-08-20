/*O seu racioc�nio n�o est� errado, mas � justamente essa cren�a que pode levar a algumas
armadilhas. Normalmente o SQL Server n�o tem um aproveitamento de planos de execu��o de 
consultas ADHOC como tem de Stored Procedures. Queries ADHOC muitas vezes tem de passar
pelas etapas normais de planos de execu��o e �s vezes duas consultas ir�o produzir o mesmo
plano sem reutiliz�-lo uma da outra.

Quando voc� ativa o recurso Force Parametrization, voc� est� for�ando que o reproveitamento
dos planos seja garantido quando as consultas forem as mesmas diminuindo a press�o na CPU
para gerar planos de execu��o e melhorando o aproveitamento dos planos de execu��o. Em todo
caso, embora isso pare�a uma excelente id�ia, existem situa��es que podem levar a problemas
s�rios de desempenho.

Suponha que uma determinada tabela de clientes tenha um milh�o de registros com a seguinte distribui��o:

SP - 400.000 clientes
RJ - 350.000 clientes
RS - 100.000 clientes
PB - 80.000 clientes
MS - 30.000 clientes
RN - 20.000 clientes
PA - 9.000 clientes
AM - 1.000 clientes

Supondo a exist�ncia de um �ndice nonclustered sobre a coluna UF, se uma consulta fosse 
realizada para recuperar os clientes de SP, certamente esse �ndice seria ignorado, pois,
seria necess�rio recuperar 40% da tabela e provavelmente � mais barato varr�-la do que
varrer boa parte do �ndice para posteriormente recuperar os 40%. O plano ent�o seria um
Table Scan.

Supondo a exist�ncia desse �ndice sobre a coluna UF, se uma consulta fosse realizada para
recuperar todos os clientes de AM, certamente esse �ndice ser� utilizado, pois, seria
necess�rio recuperar 0,1% da tabela e ele levaria a uma enorme economia de p�ginas e 
utiliza��o de disco. O plano ent�o seria um Index Seek.

Agora imagine s� se a parametriza��o fosse for�ada, ou seja, a mesma consulta fosse
obrigada a utilizar o plano que estivesse dispon�vel. Nesse caso, se o plano fosse 
produzido com a pesquisa em SP, a pesquisa em AM iria utilizar um TABLE SCAN mesmo que
fosse mais barato fazer a busca pelo �ndice. Se o plano fosse produzido com a pesquisa
em AM, a pesquisa em SP iria utilizar um Index Seek mesmo que fosse mais barato fazer a
busca varrendo a tabela inteira. Voc� at� ir� economizar um pouco de mem�ria e CPU por 
conta de ter um �nico plano, mais isso ir� levar a consultas pouco perform�ticas, pois, 
nesse cen�rio nenhuma das duas ir� produzir um plano eficiente.

Para que voc� possa se beneficiar do recurso de force parametrization voc� teria que ter
uma compreens�o muito grande da distribui��o dos seus dados, das consultas executadas e
ter comprovado gastos excessivos de mem�ria e CPU por conta de recompila��o. Para 
ambientes pequenos acho que isso � at� poss�vel, mas para esse tipo de ambiente esse 
recurso n�o far� diferen�a. Para ambientes cr�ticos acho muito pouco prov�vel que voc� 
consiga obter esse conhecimento a ponto de justificar o uso do recurso.

Por essas e outras que recomendo n�o habilit�-lo. Se voc� tem necessidade de reaproveitar
planos de execu��o e tem certeza de que isso ir� levar a melhora, opte por stored 
procedures. Elas permitir�o que voc� v� devagar e uma query por vez ao inv�s de se deparar
com uma situa��o 8 x 80
*/