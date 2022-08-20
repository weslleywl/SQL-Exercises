DECLARE @Palavra VARCHAR(1000)
SET @Palavra = 'CRIPTOGRAFIA'
DECLARE @Hash VARCHAR(1000)
SET @Hash = 'AGOSTO'
DECLARE @Criptografa VARBINARY(5000)
SET @Criptografa = ENCRYPTBYPASSPHRASE(@Palavra, @Hash)

--print @Criptografa

DECLARE @Descripta VARCHAR(5000)
SET @Descripta = DECRYPTBYPASSPHRASE(@Palavra, @Criptografa)

SELECT @Palavra,@Hash,@Criptografa,@Descripta


--1o Passo : Criar a master key com uma senha
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '23987hxJ#KL95234nl0zBe';
--2o Passo : Criar o certificado digital



CREATE CERTIFICATE c_departamento
WITH SUBJECT = 'CertificadoDepartamento'


--3o Passo : Criar a chave

create symmetric key sk_departamento with algorithm = Triple_DES encryption 
by certificate c_departamento

--4o Passo : Incluir uma coluna para a criptografia
alter table departamento
 add departtamentoEnc varbinary(300)
select * from departamento
--5o Passo : Abrir a chave 
Open Symmetric key sk_departamento decryption by certificate c_departamento

--6o Passo : Criptografar os dados
Update departamento 
set nome=encryptbykey(key_guid('sk_departamento'),nome)

Update departamento 
set nome=encryptbykey(key_guid('sk_departamento'),nome,1,departtamentoEnc) 

--7o Passo : Teste o resultado
select * from departamento

--8o Passo : Teste a descriptografia 

select nome, 
convert(nvarchar, decryptbykey(nome)) as nome
from departamento

select num,nome, 
convert(nvarchar, decryptbykey(nome,1,departtamentoEnc)) as dep
from departamento

create view vv_departamento
as 
select num,nome, 
convert(nvarchar, decryptbykeyautocert(cert_id('departamento'),null,departtamentoEnc)) as Produto
from departamento

select * from vv_departamento

sp_addlogin 'isaque_aranha','12345'