--1)Iniciando laço
WHILE @@FETCH_STATUS = 0
BEGIN

    IF (SELECT ProdQtdEst - @IVQtd FROM Produtos WHERE ProdCod = @ProdCod) >= 0

    UPDATE Produtos 

    SET ProdQtdEst = ProdQtdEst - @IVQtd 

    WHERE ProdCod = @ProdCod

    ELSE

    RAISERROR(‘Estoque insuficiente!’, 15, 1)

--Próxima linha do cursor
    FETCH NEXT FROM CurItens INTO @ProdCod, @IVQtd
END
--Fechando e desalocando cursor
CLOSE CurItens
DEALLOCATE CurItens

--2)Procedimento para finalização de uma venda

CREATE PROCEDURE finaliza_venda (@VenCod INTEGER) AS
  

--Declarando cursor

DECLARE CurItens --Nome do cursor
CURSOR FOR 

  

-- Select utilizado para o cursor

SELECT ProdCod, IVQtd FROM Itens WHERE VenCod = @VenCod
  

--Declarando variáveis

DECLARE @ProdCod INTEGER, @IVQtd MONEY
  

--Iniciando transação

BEGIN TRANSACTION
  

--Abrindo cursor

OPEN CurItens
  

--Atribuindo valores do select nas variáveis

FETCH NEXT FROM CurItens INTO @ProdCod, @IVQtd
  

--Iniciando laço

WHILE @@FETCH_STATUS = 0
BEGIN

    IF (SELECT ProdQtdEst - @IVQtd FROM Produtos WHERE ProdCod = @ProdCod) >= 0

    UPDATE Produtos 

    SET ProdQtdEst = ProdQtdEst - @IVQtd 

    WHERE ProdCod = @ProdCod

    ELSE

    BEGIN

  

--Desfazendo o que foi realizado anteriormente

    ROLLBACK TRANSACTION
  

--Levantando erro

    RAISERROR(‘Estoque insuficiente!’, 15, 1)

  

--Fechando e desalocando cursor aqui também, pois o return sairá do procedimento

    CLOSE CurItens

    DEALLOCATE CurItens

  

--Saindo do procedimento

    RETURN

    END

  

--Próxima linha do cursor

    FETCH NEXT FROM CurItens INTO @ProdCod, @IVQtd

END
  

--Fechando e desalocando cursor

CLOSE CurItens

DEALLOCATE CurItens

  

--Caso tudo tenha ocorrido OK, alterando a situação da venda

UPDATE Vendas

SET VenSit = 1

WHERE VenCod = @VenCod

  

--Confirmando transação

COMMIT TRANSACTION
