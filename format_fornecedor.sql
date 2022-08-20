--cara nao e legal trazer do banco assim o melhor e tratar pela aplicacao mais ai vai. 
Create Function Ufn_Fornecedor (@Num int(4)) 
Returns Varchar(18) 
AS 
Begin 
Return Left(Replicate('0',18-(Len(@Num)))+Convert(Varchar(18),@Num),3)+'.'+ 
Substring(Replicate('0',18-(Len(@Num)))+Convert(Varchar(18),@Num),4,3) +'.'+ 
Substring(Replicate('0',18-(Len(@Num)))+Convert(Varchar(18),@Num),7,3)+'-'+ 
Right(Replicate('0',18-(Len(@Num)))+Convert(Varchar(18),@Num),2) 

select convert(int, numeric(18))

End 
--rode a funcao assim 
Select dbo.Ufn_Fornecedor(id_fornecedor)

	
	--  Altera a Marca

	UPDATE  MARCA SET DESMARCA = @DESCRICAO WHERE CODMARCA = @CODMARCA
	

	IF( @@ERROR <> 0)	
	    BEGIN 		  
	       RAISERROR ('Falha na Alteração da Descrição da Marca.', 16, -1)
	       ROLLBACK TRANSACTION
	       SET NOCOUNT OFF	
	    END
	ELSE
	    BEGIN
	      COMMIT TRANSACTION
	      SET NOCOUNT OFF	
	    END
GO

DBCC CHECKDB ('agora', NOINDEX) 'REPAIR_FAST'

DBCC CHECKALLOC ('agora')
