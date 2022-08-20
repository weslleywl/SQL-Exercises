/* Criando a Função de calculo de idade, não aceita getdate() dentro da função */
alter Function FC_DataNasc
(@DataNasc smalldatetime, @DtHoje smalldatetime)
returns int
as
begin
	return datediff(dd, @datanasc, @dthoje) /365
end 

/* executando a função calculo da idade */
declare @dthoje smalldatetime
set @dthoje = getdate()
select dbo.fc_datanasc ('06/20/1966', @dthoje)
