DECLARE mat_siape_cursor  scroll  -- se ele n�o for especificado o padr�o � next e n�o vai poder usar o  FAST_FORWARD se ele for especificado
CURSOR 
for

SELECT MAT_SIAPE, NOME_SERVIDOR, CPF_SERVIDOR, CONVERT(CHAR(10),DATA_PUBLICACAO,103) AS DATA_PUBLICACAO 
FROM GC_PUBLICACAO_SERVIDOR PS
INNER JOIN GC_PUBLICACAO P ON P.ID_PUBLICACAO = PS.ID_PUBLICACAO
INNER JOIN GC_SERVIDOR S ON S.ID_SERVIDOR = PS.ID_SERVIDOR

/*
DECLARE @mat Int
DECLARE @nome_servidor VarChar(100)
declare @cpf varchar(20)
declare @dt_pub datetime*/

OPEN mat_siape_cursor
WHILE @@FETCH_STATUS = 0
   BEGIN
      FETCH NEXT FROM mat_siape_cursor;
   END;
CLOSE mat_siape_cursor;
DEALLOCATE mat_siape_cursor;
GO


-------------------------------



--// aqui eu declaro uma (ou v�rias vari�veis), que posso us�-las dentro do cursor  

 

DECLARE @variavelDeParametro INT 

 

SET @variavelDeParametro = 1  

 

 

 

DECLARE @coluna = INT --// esta vari�vel � utilizada pelo cursor  

 

 

 

DECLARE MyCursor CURSOR FAST_FORWARD FOR --// dependendo do que vc estiver fazendo no seu cursor, esta op��o FAST_FORWARD dever� ser alterada

 

SELECT Coluna FROM Tabela   

 

WHERE Coluna = @variavelDeParametro --// veja que aqui uso a vari�vel declarada l� em cima  

 

 

 

OPEN MyCursor  

 

FETCH NEXT FROM MyCursor   

 

INTO @coluna  

 

 

 

WHILE @@FETCH_STATUS = 0  

 

BEGIN 

 

 

 

    --// aqui voc� usa as informa��es do cursor para fazer o que precisar  

 

 

 

FETCH NEXT FROM MyCursor   

 

INTO @coluna  

 

END 

 

 

 

CLOSE MyCursor  

 

DEALLOCATE MyCursor

