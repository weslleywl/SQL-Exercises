
--Como retornar a N ocorrências relacionadas a um conjunto de registros
 
-- Cria a tabela de Clientes para exemplificar o TOP 2 para cada cliente
CREATE TABLE tblClientes (
    CodigoCli INT,
    NomeCli VARCHAR(50))
 
-- Insere os registros
INSERT INTO tblClientes VALUES (1,'Amanda')
INSERT INTO tblClientes VALUES (2,'Ângela')
 
-- Cria a tabela de Pedidos para exemplificar o TOP 2 para cada cliente
CREATE TABLE tblPedidos (
    CodigoCli INT,
    NumPedido INT,
    DataPedido SMALLDATETIME)
 
-- Insere os registros
INSERT INTO tblPedidos VALUES (1,3310,'20080620')
INSERT INTO tblPedidos VALUES (1,5340,'20080624')
INSERT INTO tblPedidos VALUES (1,6723,'20080628')
INSERT INTO tblPedidos VALUES (2,4456,'20080621')
INSERT INTO tblPedidos VALUES (2,5219,'20080625')
INSERT INTO tblPedidos VALUES (2,5780,'20080630')
 
-- O operador CROSS APPLY é indicado para situações TOP "N"
SELECT CLI.NomeCli, PED.NumPedido, PED.DataPedido
FROM tblClientes AS CLI
CROSS APPLY (
    SELECT TOP 2 NumPedido, DataPedido FROM tblPedidos
    WHERE CodigoCli = CLI.CodigoCLI
    ORDER BY DataPedido) AS PED