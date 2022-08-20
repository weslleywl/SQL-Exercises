-- O index é criado automaticamente nas primary key, e UNIQUE   
-- somente um pode ser ordenado
CREATE CLUSTERED INDEX index_nome
    ON alunos (matricula_aluno);
-- pode ordenar todas os campos, e criando um index nonclustered
CREATE NONCLUSTERED INDEX in_priv_msgs
    ON alunos (nome_aluno, endereco,tel_aluno);

-- Dropando um index é so passar o nome da tabela e do index
drop index alunos.index_nome
-- criando uma UNIQUE
CREATE UNIQUE NONCLUSTERED INDEX U_CustID
ON customers(CustomerID)

-- localizando registros duplicados
SELECT coluna_de_índice, COUNT (coluna_de_índice)
FROM nome_da_tabela
GROUP BY coluna_de_índice
HAVING COUNT(coluna_de_índice)>1 ORDER BY coluna_de_índice

-- execute esta instrução para descartar o índice criado :
EXEC nome_index alunos
/*Como é possível determinar se o aumento no tamanho do nível folha é
proporcional ao fator de preenchimento de 25%?
Usando um fator de preenchimento igual a 0 (padrão), você pode
colocar 308 registros por página do nível folha. Multiplique 308 por
25%, e o resultado será 77 registros. Esse é o número de registros*/

EXEC sp_spaceused alunos



