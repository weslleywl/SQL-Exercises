--4) convertendo a data pra string
select * 
FROM ESTOQUE_MOVIMENTACAO
WHERE CAST(CONVERT(CHAR,DATAMOVIMENTACAO,112)AS INT) BETWEEN 20050523 AND 20060325
ORDER BY DATAMOVIMENTACAO


--1)A sintax da Função DATEADD é
DATEADD ( datepart , number, date ) 

/*Onde datepart é o parametro especificado da parte da data que será adicionado
o numero. Como por exemplo Dia, Mês, Ano, Hora, Minuto e Milesegundo e Etc.*/
Veja a Tabela 

Datepart          Abbreviations 
Year                yy, yyyy 
quarter            qq, q 
Month             mm, m 
day of year        dy, y 
Day                dd, d 
Week              wk, ww 
Hour               hh 
minute             mi, n 
second             ss, s 
millisecond     ms 

--Number valor em inteiro que deseja adicionar a uma data. 
--date é a data especificada para ser adicionado um numero.

--Adicionando dias a uma Data.

SET DATEFORMAT DMY
SELECT DATEADD(day, 5, '15-02-2006')

select * from adata

set dateformat dmy
select nome,inicio,dateadd(day,02,getdate())from adata
order by inicio

--Nesse exemplo a Data é 15-02-2006 e foi adicionado 5 dias. 
O Resultado Obtido é 20-02-2006 

--Adicionando Meses a uma Data

SELECT DATEADD(month, 5, '15-02-2006')

Nesse exemplo a Data é 15-02-2006 e foi adicionado 5 meses.

O Resultado Obtido é 15-07-2006.
 
--Adicionando Anos a uma Data

SELECT DATEADD(year, 5, '15-02-2006')

--Adicionando Horas a uma Data

SELECT DATEADD(Hour, 5, getdate())from adata

--Adicionando Minutos a uma Data.

SELECT DATEADD(Minute, 5, getdate()) from adata


--Adicionando Segundos a uma Data.

SELECT DATEADD(hour, 5, '2003-02-02 00:00:00')from adata

--Adicionando Milesegundos a uma Data.

SELECT DATEADD(Millisecond, 600, '15-02-2006 00:00:00.000')

--Voce podera adicionar outros intervalos conforme tabela Datepart. 
--Agora vamos ver como Subtrair um valor de uma Data. Podemos subtrair 
--Dia, Mes, Ano, Hora, Minuto e Milesegundo.

 --Subtraindo dias de Data.
select * from adata

SELECT DATEpart(day, getdate())as dia,DATEpart(month, getdate())as mes from adata

--Subtraindo Meses de Data

SELECT DATEADD(year, -5, '02-02-2003') from adata

--Subtraindo Anos de uma Data

SELECT DATEADD(year,-5, '15-02-2006')

--Subtraindo Horas de uma Data

SELECT DATEADD(Hour, -5, '15-02-2006 00:00:00.000')

--Subtraindo Minutos de uma Data.

SELECT DATEADD(Minute, -5, '15-02-2006 00:00:00.000')

--Subtraindo Segundos de uma Data.

SELECT DATEADD(Second, -5, '15-02-2006 00:00:00.000')
--Subtraindo Milesegundos de uma Data.

SELECT DATEADD(Millisecond, -600, '15-02-2006 00:00:00.000')

SELECT Orderid, Customerid, Employeeid, Orderdate as Data_Pedido, DATEADD(day, 20, Orderdate)as Data_Pedido20dias FROM ORDERS

 

Orderid     Customerid     Employeeid  Data_Pedido                      Data_Pedido20dias                                      

-----------    ---------- ----------- -------------------------------- ------------------------ 

10248       VINET               5           1996-07-04 00:00:00.000          1996-07-24 00:00:00.000

10249       TOMSP             6           1996-07-05 00:00:00.000          1996-07-25 00:00:00.000

10250       HANAR            4           1996-07-08 00:00:00.000          1996-07-28 00:00:00.000

10251       VICTE                3           1996-07-08 00:00:00.000          1996-07-28 00:00:00.000

10252       SUPRD              4           1996-07-09 00:00:00.000          1996-07-29 00:00:00.000

10253       HANAR             3           1996-07-10 00:00:00.000          1996-07-30 00:00:00.000

10254       CHOPS              5           1996-07-11 00:00:00.000          1996-07-31 00:00:00.000

10255       RICSU                9           1996-07-12 00:00:00.000          1996-08-01 00:00:00.000

10256       WELLI               3           1996-07-15 00:00:00.000          1996-08-04 00:00:00.000

10257       HILAA              4           1996-07-16 00:00:00.000          1996-08-05 00:00:00.000

10258       ERNSH              1           1996-07-17 00:00:00.000          1996-08-06 00:00:00.000

10259       CENTC              4           1996-07-18 00:00:00.000          1996-08-07 00:00:00.000

 

 

Para adicionar outras partes como Meses, Anos, Horas e Etc veja os exemplos acima e troque o Datepart em sua query. 

 

 

Agora vou falar da Função DATEDIFF. Com essa função você podera saber a diferença entre duas datas, o valor poderá ser retornado em 

Dias, meses, anos, horas, minutos, milesegundos e Etc. 

 

A Sintax da Função DATEDIFF é 

 

DATEDIFF ( datepart , startdate , enddate ) 

 

Onde datepart é o parametro especificado da parte da data que

será adicionado o numero. Como por exemplo Dia, Mes, Ano, Hora, Minuto e Milesegundo e Etc.

Veja a Tabela 

 

Datepart                    Abbreviations 

Year                          yy, yyyy 

quarter                       qq, q 

Month                        mm, m 

dayofyear                  dy, y 

Day                           dd, d 

Week                        wk, ww 

Hour                          hh 

minute                        mi, n 

second                       ss, s 

millisecond                 ms 

--Duas Datas foram informadas e agora iremos ver a diferença entre essas datas em Dias.

SELECT DATEDIFF(day, '2003-02-02', getdate())AS DIAS
select * from adata 

 
Duas Datas foram informadas e agora iremos ver a diferença entre essas datas em Meses.

SELECT DATEDIFF(month, '15-01-2006', '25-06-2006')AS MESES

O Resultado é 5  meses.

 

Duas Datas foram informadas e agora iremos ver a diferença entre essas datas em Anos.

SELECT DATEDIFF(year, '15-01-2000', '15-06-2006')AS ANOS

O Resultado é 5  anos.

 

Duas Datas foram informadas e agora iremos ver a diferença entre essas datas em Horas

SELECT DATEDIFF(hour, '15-01-2006 00:00:00.000', '15-01-2006 05:00:00.000')AS Horas

O Resultado é 5  Horas.

 

Duas Datas foram informadas e agora iremos ver a diferença entre essas datas em Minutos

SELECT DATEDIFF(minute, '15-01-2006 00:00:00.000', '15-01-2006 00:30:00.000')AS Minutos

O Resultado é 30 Minutos

 

Duas Datas foram informadas e agora iremos ver a diferença entre essas datas em Segundos

SELECT DATEDIFF(second, '15-01-2006 00:00:00.000', '15-01-2006 00:00:45.000')AS Segundos

O Resultado é 45 Segundos

Duas Datas foram informadas e agora iremos ver a diferença entre essas datas em Milisegundos

SELECT DATEDIFF(millisecond, '15-01-2006 00:00:00.000', '15-01-2006 00:00:00.600')AS Milisegundos

O Resultado é 600 Milisegundos

 

Bom agora que você já sabe como trabalhar com a função DATEDIFF, vamos ver um exemplo utilizando 

uma tabela 

 

Vamos ver um exemplo de quantos anos fazem que o Funcionário foi Contratado

SELECT firstname, lastname, DATEDIFF(year, HireDate, Getdate())AS 'Data'  FROM employees

 

 

firstname  lastname             Anos de Empresa 

---------- -------------------- --------------- 

Nancy      Davolio              14

Andrew     Fuller                14

Janet      Leverling              14

Margaret   Peacock           13

Steven     Buchanan            13

Michael    Suyama              13

Robert     King                   12

Laura      Callahan              12

Anne       Dodsworth          12

 

Para adicionar outras partes como Dias, Meses, Horas e Etc veja os exemplos acima e troque o Datepart em sua query. 

 

Vamos falar da função DATENAME

 

A função DATENAME é Utilizada para mostrar nomes por extenso de pertes de datas. 

 

A sintax da Função DATENAME é

 

DATENAME ( datepart , date )

Onde datepart é o parametro especificado da parte da data que

será adicionado o numero. Como por exemplo Dia, Mes, Ano, Hora, Minuto e Milesegundo e Etc.

Veja a Tabela 

 

Datepart     Abbreviations 

year             yy, yyyy 

quarter        qq, q 

month          mm, m 

dayofyear    dy, y 

day              dd, d 

week            wk, ww 

weekday      dw 

hour             hh 

minute          mi, n 

second         ss, s 

millisecond    ms 


--Vamos pegar dois exemplos mais utilizados com a Função DATENAME que é Mês, dia da Semana.

 

SELECT DATENAME(weekday, '31-12-2004') A Função ira retornar o dia da semana da Data que foi passada.

O Resultado é Friday

SELECT DATENAME(weekday, '30-12-2004') from adata   
select datename(weekday,getdate()) from adata

SELECT DATENAME(Month, '31-12-2004') A Função ira retornar o nome do mês da Data que foi passada.

O resultado é December. 

 

Vamos Visulizar um exemplo utilizando uma Tabela 

 

Select Firstname, lastname, BirthDate, DATENAME(Month, BirthDate)AS Data FROM employees

 

Firstname  lastname             BirthDate                   Data                           

---------- -------------------- --------------------------- ------------------------------ 

Nancy      Davolio              1948-12-08 00:00:00.000     December

Andrew     Fuller               1952-02-19 00:00:00.000     February

Janet      Leverling            1963-08-30 00:00:00.000     August

Margaret   Peacock              1937-09-19 00:00:00.000     September

Steven     Buchanan             1955-03-04 00:00:00.000     March

Michael    Suyama               1963-07-02 00:00:00.000     July

Robert     King                 1960-05-29 00:00:00.000     May

Laura      Callahan             1958-01-09 00:00:00.000     January

Anne       Dodsworth            1966-01-27 00:00:00.000     January

 

 

Se quiser utilizar outras partes de datas modique a função conforme tabela acima.

 

Agora vamos falar  da função DATEPART

 

A Função DATEPART é utilizada para pegar partes de uma data como Dia, Mês, Ano e Etc. 

 

A sintax da Função DATEPART é

 

DATEPART ( datepart , date ) 

 

Onde datepart é o parametro especificado da parte da data que

será adicionado o numero. Como por exemplo Dia, Mes, Ano, Hora, Minuto e Milesegundo e Etc.

 

Veja a Tabela 

 

Datepart              Abbreviations 

year                  yy, yyyy 

quarter               qq, q 

month                 mm, m 

dayofyear             dy, y 

day                   dd, d 

week                  wk, ww 

weekday               dw 

hour                  hh 

minute                mi, n 

second                ss, s 

millisecond           ms 

 

 

Exemplos:

 

Nesse exemplo vamos pegar a parte do dia da Data que foi informada.

Select DATEPART(day,'15-02-2006')as Dia

Resultado é  Dia 15 

 

 

Nesse exemplo vamos pegar a parte do Mês da Data que foi informada.

Select DATEPART(month,'15-02-2006')as Mês

Resultado é  Mês 2 

 

 

Nesse exemplo vamos pegar a parte do Ano da Data que foi informada.

Select DATEPART(year,'15-02-2006')as Ano

Resultado é  Ano 2006 

 

Nesse exemplo vamos pegar a parte da Hora da Data que foi informada.

Select DATEPART(hour,'15-02-2006 12:00:00.000')as  'Hora(s)' 

Resultado é 12 Hora(s)

 

 

Nesse exemplo vamos pegar a parte do Minuto da Data que foi informada.

Select DATEPART(minute,'15-02-2006 00:34:00.000')as 'Minuto(s)'

Resultado é 34 Minuto(s)

 

 

Nesse exemplo vamos pegar a parte dos Segundos da Data que foi informada.

Select DATEPART(second,'15-02-2006 00:00:40.000')as 'Segundo(s)'

Resultado é 34 Segundo(s)

 

Nesse exemplo vamos pegar a parte dos Milisegundos da Data que foi informada.

Select DATEPART(millisecond,'15-02-2006 00:00:00.700')as Milesegundos

Resultado é  700 Milesegundos.

 

 

Vamos Visulizar um exemplo utilizando uma Tabela 

 

Select Firstname, lastname, BirthDate, DATEPART(Month, BirthDate)AS Data FROM employees

 

Firstname  lastname             BirthDate                                              Mêses       

---------- -------------------- ------------------------------------------------------ ----------- 

Nancy      Davolio              1948-12-08 00:00:00.000                                12

Andrew     Fuller               1952-02-19 00:00:00.000                                   2

Janet      Leverling            1963-08-30 00:00:00.000                                     8

Margaret   Peacock              1937-09-19 00:00:00.000                                9

Steven     Buchanan             1955-03-04 00:00:00.000                                 3

Michael    Suyama               1963-07-02 00:00:00.000                                  7

Robert     King                 1960-05-29 00:00:00.000                                     5

Laura      Callahan             1958-01-09 00:00:00.000                                    1

 

 

 

 

 

 

 

Função DAY pega a parte do dia. de uma data especificada.

 

DAY ( date ) 

 

Exemplo: 

 

Foi informado uma data e com a função DAY iremos pegar somente a parte do dia dessa data.

SELECT DAY('03/12/1998') AS 'Day Number'

Resultado é 03 

 

SELECT firstname, lastname, DAY(hiredate)as DIA FROM employees

 

firstname  lastname             DIA         

---------- -------------------- ----------- 

Nancy      Davolio                1

Andrew     Fuller                 14

Janet      Leverling                1

Margaret   Peacock              3

Steven     Buchanan             17

Michael    Suyama               17

 

 

 

Função MONTH pega a perte do Mês de uma Data especificada.

 

a Sintax da Função MONTH é 

 

MONTH ( date )

 

Exemplo:

 

Foi informado uma data e com a função MONTH iremos pegar somente a parte do Mês dessa data.

SELECT  MONTH('03/12/1998')AS Mês

O resultado é 12

 

SELECT firstname, lastname, MONTH(hiredate)as MÊS FROM employees

 

firstname  lastname             MÊS         

---------- -------------------- ----------- 

Nancy         Davolio                 5

Andrew       Fuller                    8

Janet            Leverling               4

Margaret      Peacock               5

Steven         Buchanan             10

Michael       Suyama                 10

Robert         King                      1

Laura          Callahan                 3

 

 

Função YEAR pega a perte do Mês de uma Data especificada.

 

a Sintax da Função YEAR é 

 

YEAR ( date )

 

Exemplo:

 

Foi informado uma data e com a função YEAR iremos pegar somente a parte do Ano dessa data.

SELECT  YEAR('03/12/1998')AS Ano

O resultado é 1998

 

SELECT firstname, lastname, YEAR(hiredate)as ANO FROM employees

 

firstname      lastname             ANO         

----------    -------------------- ----------- 

Nancy         Davolio               1992

Andrew       Fuller                  1992

Janet           Leverling              1992

Margaret     Peacock               1993

Steven         Buchanan             1993

Michael       Suyama                1993

Robert         King                     1994

Laura           Callahan               1994

Anne            Dodsworth           1994

 


 
  
 
  
 
 
    

