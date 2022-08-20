
create table #relo
(
nome char(20))
insert into #relo
values('edurada minha filha')
select * from #relo

bulk insert sao.dbo.server2012 from 'c:\asp\teste.txt'

BULK INSERT server2012
 FROM 'c:\asp\teste.txt'
 WITH (FIELDTERMINATOR = ',', CODEPAGE ='ACP', ROWTERMINATOR='\n')

 select * from  server2012

--dessa forma eu importo os acentos
BULK INSERT produto21 
FROM 'C:\produtosTab.txt'
WITH (CODEPAGE='ACP') 

Os par�metros mais usados do BULK INSERT s�o:

CODEPAGE - define a p�gina de c�digos a ser usada na importa��o - e, por conseq��ncia, se os caracteres v�m acentuados ou n�o; 
MAXERRORS - define a quantidade m�xima de erros que pode ocorrer numa importa��o de dados; 
FIELDTERMINATOR - caractere usado para separar uma coluna da outra (o default � o caractere [TAB], representado por \t; 
ROWTERMINATOR - caractere usado para separar uma linha (registro) da outra (o default � o [ENTER], representado por \n; 
FIRE_TRIGGERS - se informado, dispara as triggers na execu��o do comando (por default o BULK INSERT n�o dispara triggers); 
KEEP_IDENTITY - se informado, impede que a numera��o autom�tica (coluna identity da tabela) seja usada - vai �obedecer� os c�digos informados; 
FORMATFILE - define qual o arquivo de formato ser� usado na importa��o; 
FIRSTROW - define qual ser� a primeira linha importada; 
LASTROW - define qual ser� a �ltima linha importada. 
Por exemplo:

BULK INSERT PRODUTO 
FROM �C:\PRODUTOSTAB.TXT�
WITH 
(
FORMATFILE=�C:\PRODUTOSTAB.FMT�, 
CODEPAGE=�ACP�,
MAXERRORS = 0,
FIRE_TRIGGERS,
FIRSTROW = 1,
LASTROW = 10
)


