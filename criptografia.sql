CREATE TABLE cript
(
NOME_USUARIO VARCHAR(10),
SENHA_USUARIO VARBINARY(100))
--inserimos a senha MINHASENHA encriptada, para que n�o se tenha mais acesso � ela.
INSERT INTO cript VALUES ('wagner', PWDENCRYPT('123456'))
--selecionando os dados da tabela, vemos o novo valor para a senha
SELECT * FROM cript
--como a senha encriptada n�o pode ser mais ser revertida ao seu valor
--original, usamos a fun��o pwdcompare para comparar um valor digitado com a senha armazenada
--o retorno 1 indica que os valores s�o os mesmos e 0 indica que s�o diferentes
SELECT PWDCOMPARE('123456', SENHA_USUARIO) FROM USUARIO
�uma consulta de usu�rio pode ser essa:
SELECT PWDCOMPARE(�MINHASENHA�, SENHA_USUARIO) FROM USUARIO WHERE USUARIO = �AGNALDO�
