select * from pai
go
select * from filho

CREATE FUNCTION dbo.fnConcatenaFilhos ( 
@pai_id INT
)
RETURNS VARCHAR(1000) AS
BEGIN
DECLARE @result VARCHAR(1000)
SELECT @result = ISNULL(@result + ' / ', '') + fil_nome
FROM filho
WHERE pai_id = @pai_id
RETURN @result
END

--// obtendo os resultados
SELECT pai_nome, dbo.fnConcatenaFilhos(pai_id) as list_fil_nome
FROM pai


-- criando uma função entre pai e filho
select * from pai
go
select * from filho
create function dbo.asd
(
@cod_pai int
)
returns varchar(500)
as
begin
declare @ret varchar(500)
select @ret=isnull(@ret + '/','')+campo
from filho
where cod_pai=@cod_pai
return(@ret)
end


Select
 Case When isDate(Cast(Substring(inicio, 4, 2) + '/'+ Substring(inicio, 1, 2)+'/'+Substring(fim_data, 7, 4) as Varchar(10))) = 0 
Then null Else Convert(SmallDateTime, inicio, 103) End as Dt_Inclusao 
from adata

select year(inicio),count(*),nome from adata
group by inicio,nome

select * from adata