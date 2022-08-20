/*A empresa XPD Ltda deseja desenvolver um sistema de ponto eletr�nico de forma a controlar os hor�rios de entrada 
e sa�da de seus funcion�rios. A captura de dados ser� biom�trica e logo ap�s os funcion�rios passarem seu polegar
direito, o sistema dever� registrar a matr�cula do funcion�rio e o hor�rio exato da entrada (ou sa�da) do funcion�rio.
Nenhum funcion�rio est� autorizado a "virar a noite" no trabalho e portanto todos os registros ir�o ocorrer no mesmo dia.
O primeiro registro naturalmente ser� uma "entrada". Os registros subseq�entes ser�o intercalados de forma que uma 
sa�da aparecer� ap�s uma entrada e caso haja uma nova entrada (t�pico do retorno ap�s o almo�o), a nova entrada ser� 
registrada logo ap�s a sa�da posterior. Se houver uma entrada sem uma sa�da respectiva, considerar-se-� que o hor�rio
de sa�da foi igual ao da �ltima entrada. 

H� duas possibilidades de modelagem aqui. Normalmente o n�mero de entradas e sa�das de um funcion�rio tende a ser 
baixo (ningu�m ir� entrar e sair na empresa muitas vezes ao dia). � poss�vel modelar de forma um pouco mais inflex�vel
a rela��o de entradas e sa�das deixando-as fixas (ex: at� quatro entradas e sa�das no dia) ou utilizar uma abordagem
um pouco mais flex�vel deixando esse n�mero vari�vel. N�o h� nenhum problema com nenhuma das abordagens mas � claro
que elas possuem vantagens e desvantagens associadas (inclusive em rela��o ao hor�rio). Utilizarei ambas.*/

CREATE TABLE tblRegistrosHorarios (
    Matricula CHAR(5),
    Data SMALLDATETIME,
    Entrada1 SMALLDATETIME, Saida1 SMALLDATETIME,
    Entrada2 SMALLDATETIME, Saida2 SMALLDATETIME,
    Entrada3 SMALLDATETIME, Saida3 SMALLDATETIME,
    Entrada4 SMALLDATETIME, Saida4 SMALLDATETIME) 

INSERT INTO tblRegistrosHorarios VALUES ('M0001','20090330',
'20090330 08:00','20090330 12:00','20090330 14:00','20090330 18:00',
NULL,NULL,NULL,NULL) 

INSERT INTO tblRegistrosHorarios VALUES ('M0001','20090331',
'20090331 08:00','20090331 12:00','20090331 14:00','20090331 16:00',
'20090331 16:45','20090331 19:00',NULL,NULL) 

INSERT INTO tblRegistrosHorarios VALUES ('M0001','20090401',
'20090401 08:00','20090401 10:13','20090401 11:45','20090401 12:45',
NULL,NULL,NULL,NULL) 

INSERT INTO tblRegistrosHorarios VALUES ('M0001','20090402',
'20090402 09:07','20090402 12:31','20090402 14:11','20090402 18:19',
NULL,NULL,NULL,NULL) 

INSERT INTO tblRegistrosHorarios VALUES ('M0001','20090403',
'20090403 07:43','20090403 12:37','20090403 13:28','20090403 15:03',
'20090403 17:14','20090403 20:38',NULL,NULL) 

INSERT INTO tblRegistrosHorarios VALUES ('M0002','20090330',
'20090330 08:30','20090330 12:17','20090330 13:32','20090330 16:21',
'20090330 17:53','20090330 18:30','20090330 19:30','20090330 20:30') 

INSERT INTO tblRegistrosHorarios VALUES ('M0002','20090331',
'20090331 07:51','20090331 12:03','20090331 13:58','20090331 18:00',
NULL,NULL,NULL,NULL) 

INSERT INTO tblRegistrosHorarios VALUES ('M0002','20090401',
'20090401 08:00','20090401 10:13','20090401 11:45','20090401 12:45',
NULL,NULL,NULL,NULL) 

INSERT INTO tblRegistrosHorarios VALUES ('M0002','20090402',
'20090402 08:37','20090402 11:31','20090402 13:24','20090402 19:19',
NULL,NULL,NULL,NULL) 

INSERT INTO tblRegistrosHorarios VALUES ('M0002','20090403',
'20090403 09:32','20090403 12:49','20090403 13:51','20090403 17:00',
'20090403 17:45','20090403 19:38',NULL,NULL) 
select * from tblRegistrosHorarios

-- aqui vc pega a diferen�a de hora (hour=hh,minute =mi)
select datediff(hh,entrada1,saida1)  from tblRegistrosHorarios
where matricula = 'M0001'

-- aqui se vc quizer pega quando a dta � nula
select isnull(datediff(hh,entrada1,saida1),0)  from tblRegistrosHorarios
where matricula = 'M0001'

-- O primeiro passo seria calcular as diferen�as hor�rias para posteriormente fazer uma soma. Ex: 

;WITH MinutosDia As (
SELECT Matricula, Data,
    Entrada1, Saida1, Entrada2, Saida2,
    Entrada3, Saida3, Entrada4, Saida4,
    ISNULL(DATEDIFF(Mi,Entrada1,Saida1),0) As Dif1,
    ISNULL(DATEDIFF(Mi,Entrada2,Saida2),0) As Dif2,
    ISNULL(DATEDIFF(Mi,Entrada3,Saida3),0) As Dif3,
    ISNULL(DATEDIFF(Mi,Entrada4,Saida4),0) As Dif4
FROM tblRegistrosHorarios)
--select * from MinutosDia
/*SELECT Matricula, Data, Dif1 + Dif2 + Dif3 + Dif4 As TotalMinutos
FROM MinutosDia */
--ou
SELECT Matricula,data,  sum(Dif1 + Dif2 + Dif3 + Dif4) As TotalMinutos
FROM MinutosDia 
group by matricula,data
having matricula = 'M0001'

/*Chegamos a conclus�o de que no per�odo previsto, o empregado M0001 possui 2213 minutos e o empregado M0002 possui
 2208 minutos. Normalmente n�o � desej�vel exibir o total de minutos, mas sim a quantidade hor�ria em um formato
 hh:mm por exemplo. Sabendo que uma hora equivale a 60 minutos, podemos dividir o total em minutos e calcular o 
total de horas e a diferen�a ser� o total de minutos que sobraram. Ex: */

;WITH MinutosDia As (
SELECT Matricula,
    Entrada1, Saida1, Entrada2, Saida2,
    Entrada3, Saida3, Entrada4, Saida4,
    ISNULL(DATEDIFF(Mi,Entrada1,Saida1),0) As Dif1,
    ISNULL(DATEDIFF(Mi,Entrada2,Saida2),0) As Dif2,
    ISNULL(DATEDIFF(Mi,Entrada3,Saida3),0) As Dif3,
    ISNULL(DATEDIFF(Mi,Entrada4,Saida4),0) As Dif4
FROM tblRegistrosHorarios), 

Resumo As (
SELECT Matricula, SUM(Dif1 + Dif2 + Dif3 + Dif4) As TotalMinutos
FROM MinutosDia
GROUP BY Matricula) --obs: se quizer trazer diaria, basta incluir a data no group by

SELECT Matricula,
convert(varchar(2),(TotalMinutos / 60)) + ':'+
    --CAST((TotalMinutos / 60) As VARCHAR(2)) + ':' +
convert(varchar(2),(TotalMinutos % 60)) as CargaHoraria
   --CAST((TotalMinutos % 60) As VARCHAR(2)) As CargaHoraria(porque aqui vai mostrar o resto do dividendo)
FROM Resumo 



select * from tblRegistrosHorarios


create table #ts
(valor1 int, valor2 int)

insert into #ts
values('100','5')

select * from #ts

select (valor1 % valor2) as total  from #ts
