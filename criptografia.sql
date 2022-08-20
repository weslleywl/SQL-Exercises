CREATE TABLE cript
(
NOME_USUARIO VARCHAR(10),
SENHA_USUARIO VARBINARY(100))
--inserimos a senha MINHASENHA encriptada, para que não se tenha mais acesso à ela.
INSERT INTO cript VALUES ('wagner', PWDENCRYPT('123456'))
--selecionando os dados da tabela, vemos o novo valor para a senha
SELECT * FROM cript
--como a senha encriptada não pode ser mais ser revertida ao seu valor
--original, usamos a função pwdcompare para comparar um valor digitado com a senha armazenada
--o retorno 1 indica que os valores são os mesmos e 0 indica que são diferentes
SELECT PWDCOMPARE('123456', SENHA_USUARIO) FROM USUARIO
–uma consulta de usuário pode ser essa:
SELECT PWDCOMPARE(‘MINHASENHA’, SENHA_USUARIO) FROM USUARIO WHERE USUARIO = ‘AGNALDO’
