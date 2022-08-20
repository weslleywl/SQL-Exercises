/*Pessoal, preciso fazer uma consulta que me retorne o numero total de clientes por estado
e cidade, inclusive o numero de clientes que não possuem cidades cadastras (null).
Consigo visualizar bem com faria isso separadamente:

select count(sg_uf) as 'Minas Gerais'
from tb_cliente
where sg_uf = 'MG'

select count(id_cidade) as 'Belo Horizonte'
from tb_cliente
where id_cidade = 1

A minha dificuldade está em varrer a tabela, contar o total de cada estado e de cada
 cidade e separar essas informações no resultado. O resultado precisa ser mais ou menos 
assim:

Total por estado                                                                        

MG                            SP              RS                                             

2                             4                 3                                                
                                                                                                         

Total por cidade                                                                

Uberlândia              Tambaú   São Paulo   Porto Alegre   Erechim

2                                  2                 2                    1                          2

                                                                                                         

Total Null                                                                                      

4 */
SELECT * FROM ESTADO
SELECT * FROM LOCALIDADE
select * from clientes

SELECT localidade, localidade, COUNT(*) FROM LOCALIDADE
GROUP BY localidade, localidade
WITH ROLLUP


select count(sigla_uf) as 'Minas Gerais'
from ESTADO
where sigla_uf = 'MG'

select count(id_cidade) as 'Belo Horizonte'
from tb_cliente
where id_cidade = 1

select * from estado
select row_number() over(order by id_estado) as id_estado,sigla_uf,estado 


from estado
-- loop normal
Declare @contador tinyint
Set @contador = 0
While @Contador <=27
Begin
select @contador, from estado
End

declare @xt varchar(100)
set @xt= select row_number() over(order by id_estado) from estado
 
update estado
set id_estado= @xt

select * from estado
where id_estado = 1
select row_number() over(order by id_estado) from estado

/*É simples a interpretação. Peguemos o trecho abaixo:

 

SP                1                   2

SP                2                   2

SP                NULL           4

 

Significa que a cidade "1" do estado de São Paulo tem uma contagem igual a 2, a cidade
 "2" tem uma contagem igual a dois e que o total do Estado de São Paulo tem uma contagem 
igual a 4 (dois da cidade "1" e dois da cidade "2"). Como 4 é o total, a cidade vem nula.
 Na última linha é a somatória de todas as contagens. Se você desejar, pode fazer o 
seguinte:

SELECT ISNULL(UF,'Total') AS Estado, ISNULL(CIDADE,'Total') AS Localidade
FROM (
SELECT UF, CIDADE, COUNT(*) AS TOTAL FROM Tabela

WHERE UF IS NOT NULL AND CIDADE IS NOT NULL

GROUP BY UF, CIDADE

WITH ROLLUP) AS Contagem
*/



                                                                                    
