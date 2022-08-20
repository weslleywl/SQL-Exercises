--Implementing Full Text Search with T-SQL stored Procedures / Eli Leiba

Enabeling Full Text search in T-SQL is usually not so "popular" as doing it with the EnterPrize Manager

So Here are the T-SQL steps you have to do in order to implement FTS in T-SQL

--1 Enabling full text on the database
EXEC sp_fulltext_database  'enable' 

--2 Create the Catalog (if does not exist)
EXEC sp_fulltext_catalog   'MyCatalog','create'  
EXEC sp_fulltext_catalog   'batatinha','tttt'  

select * from atexto
--3 add a full text index on a Table
EXEC sp_fulltext_table     'atexto', 'create', 'MyCatalog', 'PK_AA_Texto'
EXEC sp_fulltext_table     'Categories', 'create', 'MyCatalog', 'pk_categories'

--4 add a column to the full text Index
EXEC sp_fulltext_column    'Products', 'ProductName', 'add' 
EXEC sp_fulltext_column    'Categories', 'Description', 'add' 

--5 activate the index
EXEC sp_fulltext_table     'Products','activate'
EXEC sp_fulltext_table     'Categories','activate'

--6 start full population
EXEC sp_fulltext_catalog   'MyCatalog', 'start_full' 

-- usage in T-SQL (CONTAINS and FREETEXT predicates)
-- Using the index in T-SQL 
USE Northwind
GO
SELECT ProductId, ProductName, UnitPrice
FROM Products
WHERE CONTAINS(  
                                   ProductName, ' "sasquatch " OR "stout" '
                                )
GO

USE Northwind
GO
SELECT CategoryName
FROM Categories
FREETEXT (
                    Description, 'sweetest candy bread and dry meat'
                   )
GO

-------------------------------------------------------------------------------


 Enabeling Pesquisa de texto completo em T-SQL normalmente não é tão "popular" como fazê-lo com o Gestor Enterprize 

 Então aqui estão os passos T-SQL que você precisa fazer a fim de implementar STF em T-SQL 

 - Texto 1 habilitação plena na base de dados 
 EXEC sp_fulltext_database 'enable' 

 - 2 criar o catálogo (se não existir) 
 MyCatalog EXEC sp_fulltext_catalog ',' criar ' 

 - 3 criou um índice de texto completo em uma tabela 
 EXEC sp_fulltext_table 'Produtos', 'criar', 'MyCatalog', 'pk_products' 
 EXEC sp_fulltext_table 'Categorias', 'criar', 'MyCatalog', 'pk_categories' 

 - 4 adicionar uma coluna para o texto completo Index 
 EXEC sp_fulltext_column 'Produtos', 'ProductName', 'Adicionar' 
 EXEC sp_fulltext_column 'Categorias', 'Descrição', 'Adicionar' 

 - 5 activar o índice 
 EXEC sp_fulltext_table 'Produtos', 'activate' 
 EXEC sp_fulltext_table 'Categorias', 'activate' 

 - A população começar a faixa 6 
 MyCatalog EXEC sp_fulltext_catalog ',' start_full ' 

 - Uso em T-SQL (CONTAINS e FREETEXT predicados) 
 - Usando o índice em T-SQL 
 USE Northwind 
 GO 
 SELECT ProductID, ProductName, UnitPrice 
 FROM Produtos 
 WHERE CONTAINS ( 
                                    ProductName, "Sasquatch" ou robusto "" ' 
                                 ) 
 GO 

 USE Northwind 
 GO 
 SELECT CategoryName 
 FROM Categories 
 FREETEXT ( 
                     Descrição: "pão doce doces e carne seca ' 
                    ) 
 GO



