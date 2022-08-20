
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

Os parâmetros mais usados do BULK INSERT são:

CODEPAGE - define a página de códigos a ser usada na importação - e, por conseqüência, se os caracteres vêm acentuados ou não; 
MAXERRORS - define a quantidade máxima de erros que pode ocorrer numa importação de dados; 
FIELDTERMINATOR - caractere usado para separar uma coluna da outra (o default é o caractere [TAB], representado por \t; 
ROWTERMINATOR - caractere usado para separar uma linha (registro) da outra (o default é o [ENTER], representado por \n; 
FIRE_TRIGGERS - se informado, dispara as triggers na execução do comando (por default o BULK INSERT não dispara triggers); 
KEEP_IDENTITY - se informado, impede que a numeração automática (coluna identity da tabela) seja usada - vai “obedecer” os códigos informados; 
FORMATFILE - define qual o arquivo de formato será usado na importação; 
FIRSTROW - define qual será a primeira linha importada; 
LASTROW - define qual será a última linha importada. 
Por exemplo:

BULK INSERT PRODUTO 
FROM ‘C:\PRODUTOSTAB.TXT’
WITH 
(
FORMATFILE=‘C:\PRODUTOSTAB.FMT’, 
CODEPAGE=‘ACP’,
MAXERRORS = 0,
FIRE_TRIGGERS,
FIRSTROW = 1,
LASTROW = 10
)


