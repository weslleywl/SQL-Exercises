
set statistics io off
go
SET SHOWPLAN on
go
select * from cliente
where cli_nome = 'fabio'
order by cli_nome

-- função de critptografia
CREATE FUNCTION fn_dencrypt(@str varchar(255),@EncryptedPIN varbinary(255) )
 RETURNS bit
begin
	return (SELECT pwdcompare(@str, @EncryptedPIN, 0)  )

end


CREATE FUNCTION fn_encrypt(@str varchar(255))
 RETURNS varbinary(255)
begin
	
	DECLARE @EncryptedPIN varbinary(255) 
	
	SELECT @EncryptedPIN = CONVERT(varbinary(255), pwdencrypt(@str)) 
	
	return (@EncryptedPIN)

end
