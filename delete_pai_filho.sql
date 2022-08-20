--Para realizar essa operação através da forma declarativa,
-- Cria a tabela Pai
CREATE TABLE tblPai (IDPai INT PRIMARY KEY, NomePai VARCHAR(50) NOT NULL) 

-- Insere registros na tabela Pai
INSERT INTO tblPai VALUES (1, 'Pai 1')
INSERT INTO tblPai VALUES (2, 'Pai 2')

-- Cria a tabela Filho
CREATE TABLE tblFilho (IDFilho INT PRIMARY KEY, IDPai INT, NomeFilho VARCHAR(50) NOT NULL)

-- Coloca uma Foreign Key para a tabela Pai
ALTER TABLE tblFilho ADD CONSTRAINT FK_Pai_Filho FOREIGN KEY (IDPai)
REFERENCES tblPai (IDPai) ON DELETE CASCADE

-- Insere registros na tabela Filho
INSERT INTO tblFilho VALUES (1, 1, 'Filho 1 do Pai 1')
INSERT INTO tblFilho VALUES (2, 1, 'Filho 2 do Pai 1')
INSERT INTO tblFilho VALUES (3, 1, 'Filho 3 do Pai 1')
INSERT INTO tblFilho VALUES (4, 2, 'Filho 1 do Pai 2')
INSERT INTO tblFilho VALUES (5, 2, 'Filho 2 do Pai 2')
 
-- Exclui o registro do Pai 1
DELETE FROM tblPai WHERE NomePai = 'Pai 1' 

-- Os registros na tabela Filho foram automaticamente excluídos
SELECT IDFilho, IDPai, NomeFilho FROM tblFilho

---------------------------------------------------------------------------
-- para fazer isto pela forma procedural
CREATE TABLE tblPai (IDPai INT PRIMARY KEY, NomePai VARCHAR(50) NOT NULL) 

-- Insere registros na tabela Pai
INSERT INTO tblPai VALUES (1, 'Pai 1')
INSERT INTO tblPai VALUES (2, 'Pai 2') 

-- Cria a tabela Filho
CREATE TABLE tblFilho (IDFilho INT PRIMARY KEY, IDPai INT, NomeFilho VARCHAR(50) NOT NULL)

-- Coloca uma Foreign Key para a tabela Pai
ALTER TABLE tblFilho ADD CONSTRAINT FK_Pai_Filho
FOREIGN KEY (IDPai) REFERENCES tblPai (IDPai)
 
-- Insere registros na tabela Filho
INSERT INTO tblFilho VALUES (1, 1, 'Filho 1 do Pai 1')
INSERT INTO tblFilho VALUES (2, 1, 'Filho 2 do Pai 1')
INSERT INTO tblFilho VALUES (3, 1, 'Filho 3 do Pai 1')
INSERT INTO tblFilho VALUES (4, 2, 'Filho 1 do Pai 2')
INSERT INTO tblFilho VALUES (5, 2, 'Filho 2 do Pai 2')

-- Tenta excluir o registro do Pai 1 (um erro será gerado)
DELETE FROM tblPai WHERE NomePai = 'Pai 1'

-- Exclui primeiro os registros filhos
DELETE FROM tblFilho
WHERE IDPai IN (
SELECT IDPai FROM tblPai WHERE NomePai = 'Pai 1')

-- Exclui o registro do Pai 1
DELETE FROM tblPai WHERE NomePai = 'Pai 1'
