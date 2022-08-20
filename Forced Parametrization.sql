/*O seu raciocínio não está errado, mas é justamente essa crença que pode levar a algumas
armadilhas. Normalmente o SQL Server não tem um aproveitamento de planos de execução de 
consultas ADHOC como tem de Stored Procedures. Queries ADHOC muitas vezes tem de passar
pelas etapas normais de planos de execução e às vezes duas consultas irão produzir o mesmo
plano sem reutilizá-lo uma da outra.

Quando você ativa o recurso Force Parametrization, você está forçando que o reproveitamento
dos planos seja garantido quando as consultas forem as mesmas diminuindo a pressão na CPU
para gerar planos de execução e melhorando o aproveitamento dos planos de execução. Em todo
caso, embora isso pareça uma excelente idéia, existem situações que podem levar a problemas
sérios de desempenho.

Suponha que uma determinada tabela de clientes tenha um milhão de registros com a seguinte distribuição:

SP - 400.000 clientes
RJ - 350.000 clientes
RS - 100.000 clientes
PB - 80.000 clientes
MS - 30.000 clientes
RN - 20.000 clientes
PA - 9.000 clientes
AM - 1.000 clientes

Supondo a existência de um índice nonclustered sobre a coluna UF, se uma consulta fosse 
realizada para recuperar os clientes de SP, certamente esse índice seria ignorado, pois,
seria necessário recuperar 40% da tabela e provavelmente é mais barato varrê-la do que
varrer boa parte do índice para posteriormente recuperar os 40%. O plano então seria um
Table Scan.

Supondo a existência desse índice sobre a coluna UF, se uma consulta fosse realizada para
recuperar todos os clientes de AM, certamente esse índice será utilizado, pois, seria
necessário recuperar 0,1% da tabela e ele levaria a uma enorme economia de páginas e 
utilização de disco. O plano então seria um Index Seek.

Agora imagine só se a parametrização fosse forçada, ou seja, a mesma consulta fosse
obrigada a utilizar o plano que estivesse disponível. Nesse caso, se o plano fosse 
produzido com a pesquisa em SP, a pesquisa em AM iria utilizar um TABLE SCAN mesmo que
fosse mais barato fazer a busca pelo índice. Se o plano fosse produzido com a pesquisa
em AM, a pesquisa em SP iria utilizar um Index Seek mesmo que fosse mais barato fazer a
busca varrendo a tabela inteira. Você até irá economizar um pouco de memória e CPU por 
conta de ter um único plano, mais isso irá levar a consultas pouco performáticas, pois, 
nesse cenário nenhuma das duas irá produzir um plano eficiente.

Para que você possa se beneficiar do recurso de force parametrization você teria que ter
uma compreensão muito grande da distribuição dos seus dados, das consultas executadas e
ter comprovado gastos excessivos de memória e CPU por conta de recompilação. Para 
ambientes pequenos acho que isso é até possível, mas para esse tipo de ambiente esse 
recurso não fará diferença. Para ambientes críticos acho muito pouco provável que você 
consiga obter esse conhecimento a ponto de justificar o uso do recurso.

Por essas e outras que recomendo não habilitá-lo. Se você tem necessidade de reaproveitar
planos de execução e tem certeza de que isso irá levar a melhora, opte por stored 
procedures. Elas permitirão que você vá devagar e uma query por vez ao invés de se deparar
com uma situação 8 x 80
*/