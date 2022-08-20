--Count de uma tabela em uma variavel 
--A construção abaixo captura o retorno e joga em uma variável. Se parecer complexo, você pode obter o resultado em um ResultSet apenas. Ex:

declare @QT_TOTAL_LINHAS int -- Quantidade total de linhas 
declare @STG_NAME varchar(50) -- Nome da tabela 
declare @cmdSQL nvarchar(100) -- String SQL para execução
declare @Def nvarchar(50) -- Definição dos parâmetros 

 
set @STG_NAME = 'STG_CIDADE' 
set @Def = N'@qtd_linhas int OUTPUT'
set @cmdSQL = 'SELECT @qtd_linhas = COUNT(*) FROM ' + @STG_NAME

 
exec sp_executesql @stmt = @cmdSQL, @params = @Def, @qtd_linhas = @QT_TOTAL_LINHAS OUTPUT
SELECT @QT_TOTAL_LINHAS


/*
A construção acima captura o retorno e joga em uma variável. Se parecer complexo, 
você pode obter o resultado em um ResultSet apenas. Ex: */


declare @STG_NAME varchar(50) -- Nome da tabela 
declare @cmdSQL nvarchar(100) -- String SQL para execução 

set @cmdSQL = 'SELECT COUNT(*) FROM ' + @STG_NAME
exec sp_executesql @stmt = @cmdSQL

 
