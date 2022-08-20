--1) Tem alguma forma de identificar quais os servidores e instâncias existem em uma rede? 

create table #Temp (lista varchar(1000))
Insert into #temp exec master..xp_cmdshell 'osql -L'

Select * from #Temp


2) Tentei criar uma view dentro de um stored procedures com o código a seguir:

CREATE PROCEDURE sp_relatorio_estoque 

@CodigoFornecedor INT,
@CodigoLinha INT,
@CodigoProduto INT

 
AS

Declare @Comand varchar(1000)
Select @Command = ´CREATE VIEW RelatorioEstoque AS SELECT CodProduto, CodLente, CodFornecedor, CodLinha, Descricao, EstoqueMinimo, NivelEstoque, PrecoUnitarioCusto, PrecoUnitarioVenda, DataCadastro FROM PRODUTOS ORDER BY Descricao´

Exec (@Command)







 
