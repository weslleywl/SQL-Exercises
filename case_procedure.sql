/*tenho uma stored procedure q recebe um parametro do tipo char(1), cada valor q esse
parametro recebe, ele equivale a um campo na tabela.
na clausula where eu tenho q fazer uma condicao para verificar em ql campo eu devo
comparar com o valor do parametro.

Por exempo. se o valor do parametro for 'A' entao devo comparar o campo1 com o parametro
se for 'B', entao devo comparar com o campo2
se for 'C' entao devo comparar com o campo3
se for 'D' entao devo comparar com o campo4
 
estou com dúvidas de como montar essa condição na clausula where ou montar uma clausula
where dinamica verificando o valor do parametro recebido pela stored procedure.*/

declare @data_inicial datetime,
declare @data_final datetime,
declare @parametro_data char (1)

set @data_inicial = '2007-01-01'
set @data_final = '2007-12-31'
set @parametro_data = 2

select * from alunos
where 
 @p_dta_inicial <= 
CASE
 WHEN @p_tipo_data LIKE 'dta_pedido' THEN DTA_PEDIDO
     WHEN @p_tipo_data LIKE 'dta_pedido' THEN DTA_CAD
END  
AND
p_dta_final >=
 CASE
 WHEN @p_tipo_data LIKE 'dta_cad' THEN DTA_PEDIDO
     WHEN @p_tipo_data LIKE 'dta_cad' THEN DTA_CAD
END  

--ou poderia ter usado
p_dta_inicial <= 
CASE 
WHEN p_tipo_data LIKE 'dta_pedido' THEN DTA_PEDIDO
     ELSE DTA_CAD
END AS DATA_INICIAL
AND
p_dta_final >= CASE WHEN p_tipo_data LIKE 'dta_cad' THEN DTA_PEDIDO
     ELSE DTA_CAD
END AS DATA_FINAL



