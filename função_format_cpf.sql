-- função formatar cpf, função escalar
create function dbo.formatarcpd (@cpf char(20))
returns char(15)
as
begin
return 
substring(@cpf,1,3) + '.'+ substring(@cpf,4,3)+ '.'+ substring(@cpf,7,3)+ '-'+ substring(@cpf,9,2)
end 
go

select dbo.formatarcpd ('23435454656')