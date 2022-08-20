-- O index � criado automaticamente nas primary key, e UNIQUE   
-- somente um pode ser ordenado
CREATE CLUSTERED INDEX index_nome
    ON alunos (matricula_aluno);
-- pode ordenar todas os campos, e criando um index nonclustered
CREATE NONCLUSTERED INDEX in_priv_msgs
    ON alunos (nome_aluno, endereco,tel_aluno);

-- Dropando um index � so passar o nome da tabela e do index
drop index alunos.index_nome
-- criando uma UNIQUE
CREATE UNIQUE NONCLUSTERED INDEX U_CustID
ON customers(CustomerID)

-- localizando registros duplicados
SELECT coluna_de_�ndice, COUNT (coluna_de_�ndice)
FROM nome_da_tabela
GROUP BY coluna_de_�ndice
HAVING COUNT(coluna_de_�ndice)>1 ORDER BY coluna_de_�ndice

-- execute esta instru��o para descartar o �ndice criado :
EXEC nome_index alunos
/*Como � poss�vel determinar se o aumento no tamanho do n�vel folha �
proporcional ao fator de preenchimento de 25%?
Usando um fator de preenchimento igual a 0 (padr�o), voc� pode
colocar 308 registros por p�gina do n�vel folha. Multiplique 308 por
25%, e o resultado ser� 77 registros. Esse � o n�mero de registros*/

EXEC sp_spaceused alunos



