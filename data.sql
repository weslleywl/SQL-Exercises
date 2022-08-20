--1)Alguém saberia uma dica de como calcular a diferença entre datas levando-se 
consideração os fins de semana.
DECLARE @DATA1 DATETIME 
DECLARE @DATA2 DATETIME 
DECLARE @DIF INT 
DECLARE @DIASEMANA INT 
SELECT @DATA1='31/01/2008' 
SELECT @DATA2='31/12/2008' 
SELECT @DIF=0 

WHILE @DATA1<=@DATA2 
BEGIN 
SELECT @DIASEMANA=DATEPART(dw, @DATA1) 
IF((@DIASEMANA<>1) AND (@DIASEMANA<>7)) 
SELECT @DIF=@DIF+1 
SELECT @DATA1=@DATA1+1 
END 
PRINT @DIF 

--2)Como wu converto a string 4/11/2005 12:05:23 para type date usando o T-SQL ou o reporting services?
declare @data datetime 
select @data=convert(datetime,'5/11/2005 10:30',103) 

/*estou precisando de uma ajuda na seguinte situação: 
tenho uma tabela com a data de aniversário dos clientes, gostaria de 
selecionar apenas os aniversariantes de acordo com um período de data 
informado... por exemplo de uma semana*/
Create Table #Exemplo (aniversario datetime) 
insert into #Exemplo (aniversario) Values ('1975-08-12') 
insert into #Exemplo (aniversario) Values ('1974-06-12') 
insert into #Exemplo (aniversario) Values ('1973-09-12') 
insert into #Exemplo (aniversario) Values ('1975-10-12') 

declare @data datetime 
select @data=convert(datetime,'1974-06-12',103) 
from #Exemplo

Select * 
From #Exemplo 
Where convert(varchar(04),datepart(year,getdate())) + 
right(convert(char(10),aniversario,126),6) 
Between '1972-05-01' and'1975-11-30' 

/*Em um campo DateTime, como eu posso retornar somente o dia e o mês. 
Estou exibindo uma lista de aniversariantes e não quero mostrar o ano que a 
pessoa nasceu.*/

select * from #Exemplo
select right(convert(char(10),aniversario,103),7) 
from #Exemplo
select left(convert(char(10), aniversario, 103),5)
from #Exemplo


--5) Ddia mes e ano
Select * From ctluvas 
Where DatePart(Day, DataProducao)=20 
And DatePart(Month, DataProducao)=12 
And DatePart(Year, DataProducao)=2005 
Order by CodProduto

--6)

Declare @ValorMes Int,
            @Data DateTime

Set NoCount On
Set DateFormat DMY
Set @ValorMes=0
Set @Data='01/01/2006'

While @ValorMes <12
  Begin
   Print 'Data-->'+Convert(Char(11),DateAdd(Month,@ValorMes,@Data))
   Set @ValorMes=@ValorMes+1 
  End

/*estou tentando executar um UPDATE para aplicar 15% de reajuste na margem
 de lucro para menos, em um grupo de produtos. Quando eu executo no QA,
 nao da erro, mas tambem nao altera os dados. O que pode estar errado?*/
Declare @Lucro numeric(19,2)
Set @Lucro = 150.30
Select @Lucro As Sem_15_Porcento, @lucro + (@Lucro*0.15)

declare @valor numeric(10,2)
set @valor = 15 
 
UPDATE tabela 
SET valor =   (@valor* 1.15)
where cod = codprod 


/*Quando o nome está maiusculo e minusculo no ORACLE é "caracterset"  */
SELECT * FROM cliente 
WHERE nome collate SQL_Latin1_General_CP1_CI_AI = 'neStle'


-- calculando a idade e mes de uma pessoa
select datediff(mm, '1972/06/06', GETDATE()) / 12 anos,
 datediff(mm,'1972/06/06', GETDATE()) % 12 meses 

select * from adata

--apenas um teste de
select datediff(yy,'1999-05-12',getdate()) / 12 anos,
datediff(yy,'1999-05-12',getdate()) % 12 meses
from adata
where nome = 'legume'

-- Adicionado dias a uma Data
set dateformat dmy
select dateadd(day,1,fim_data)
from adata
 where nome = 'mar'


select * from adata
-- acrescenta dias, meses, anos
select dateadd(day,5,getdate()) from adata
where nome = 'legume'
go
-- retorna 
select datediff(year,'2003-02-02 00:00:00',getdate())/2 from adata
where nome = 'legume'
go
select inicio, nome from adata
where inicio between '2003-02-02 00:00:00' and '2003-07-05 00:00:00'

select day(inicio) from adata
where nome = 'legume'

-- calculando a idade e mes de uma pessoa
select datediff(mm, '1972/06/06', GETDATE()) / 12 anos,
 datediff(mm,'1972/06/06', GETDATE()) % 12 meses


select * from adata

alter procedure dbo.addat @xt varchar(30)
as
begin
select inicio,nome from adata
where nome = @xt
end

addat 'legume'

BEGIN TRANSACTION
UPDATE adata 
SET inicio = getdate()
WHERE nome = 'oceano'
IF @@ERROR <> 0
ROLLBACK
ELSE
COMMIT

-- iniciando o programa
BEGIN TRANSACTION TRAN_01
DELETE FROM TABELA1
IF @@ERROR <> 0
ROLLBACK TRANSACTION TRAN_01
ELSE
COMMIT TRANSACTION TRAN_01