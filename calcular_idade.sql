/* Criando a Fun��o de calculo de idade, n�o aceita getdate() dentro da fun��o */
alter Function FC_DataNasc
(@DataNasc smalldatetime, @DtHoje smalldatetime)
returns int
as
begin
	return datediff(dd, @datanasc, @dthoje) /365
end 

/* executando a fun��o calculo da idade */
declare @dthoje smalldatetime
set @dthoje = getdate()
select dbo.fc_datanasc ('06/20/1966', @dthoje)
