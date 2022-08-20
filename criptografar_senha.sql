CREATE TABLE tbl (NOME VARCHAR(20), HASH AS CHECKSUM(NOME))

DECLARE @iterador INT
SET @iterador = 0

WHILE @iterador < 1000
BEGIN
INSERT INTO tbl (NOME) VALUES ('Alberto')
INSERT INTO tbl (NOME) VALUES ('Jonas')
INSERT INTO tbl (NOME) VALUES ('Bianca')
INSERT INTO tbl (NOME) VALUES ('Odete')
INSERT INTO tbl (NOME) VALUES ('Edmilson')
INSERT INTO tbl (NOME) VALUES ('Adalberto')
end

SET @iterador = @iterador + 1 
END 

INSERT INTO tbl (NOME) VALUES ('Rildo') 

CREATE INDEX IX ON tbl (HASH)
SELECT NOME, HASH FROM tbl
WHERE HASH = CHECKSUM('Rildo')
 

DROP TABLE tbl

select * from senha_usuario
select * from senha_servico

select * from senha_usuario_servico
sp_help 'senha_usuario_servico'

--criptogrfando dados atraves da senha
insert into senha_usuario_servico
values('1','1','wagner',EncryptByPassPhrase('minhasenha','654321'),getdate())
go

select * from senha_usuario
select * from senha_servico

select * from senha_usuario_servico
-- descriptografando dados atraves de senha
select s.nome_servico,u.nome_usuario,us.login,
--cast(DecryptByPassPhrase('minhasenha',us.senha) as varchar)as 'senha'
convert(varchar,DecryptByPassPhrase('minhasenha',us.senha))
from senha_servico s
inner join senha_usuario_servico us
on s.cod_servico = us.cod_servico
inner join senha_usuario u
on u.cod_usuario = us.cod_usuario
where u.cod_usuario =1

-- procedure de criptografia
create PROCEDURE [dbo].[CRIPTOGRAFADADOS]
	@LOGUSUARIO VARCHAR(1000),
	@SENHA VARCHAR(1000) 
AS
	DECLARE @CRIPTOGRAFA VARBINARY(5000)
BEGIN
	SET @CRIPTOGRAFA = ENCRYPTBYPASSPHRASE(@SENHA, @LOGUSUARIO)
	--SELECT @CRIPTOGRAFA AS USUARIO
	return @CRIPTOGRAFA
END

-- procedure de descriptografia

create PROCEDURE [dbo].[DESCRIPTOGRAFADADOS]
	@SENHA VARCHAR(1000),
	@LOGUSUARIO VARCHAR(1000),
	@CODSISTEMA TINYINT
AS
	DECLARE @DESCRIPTA VARCHAR(5000)
	DECLARE @CRIPTOGRAFA VARCHAR(5000)
BEGIN
	SET @CRIPTOGRAFA =(
						SELECT SENHAUSUARIO FROM USUARIOS U 
							INNER JOIN PERMISSOES_USUARIOS PU
							ON U.CODUSUARIO = PU.CODUSUARIO
						WHERE LOGUSUARIO = @LOGUSUARIO AND CODSISTEMA = @CODSISTEMA
					  )
	SET @DESCRIPTA = DECRYPTBYPASSPHRASE( @SENHA, @CRIPTOGRAFA)
	SELECT @DESCRIPTA
END

-- Criando o dtabase Master key




