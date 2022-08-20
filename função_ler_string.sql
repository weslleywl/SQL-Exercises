/*como retornar a parte num�rica existente em uma string. Para realizar este procedimento,
 criemos uma fun��o definida pelo usu�rio, com a finalidade de l�r o conte�do da string
 e retornar somente os n�meos. */
Create Function F_NUMEROS (@STRING varchar(100)) 
Returns varchar(100) As
 Begin
  Declare @MAX int, @CARAC char(1), @NUM varchar(100)
 
  Set @MAX = (Select Len(@STRING))
  Set @NUM = ''
  While @MAX > 0
   Begin
   
     Set @CARAC = (Select Right(Left(@STRING, Len(@STRING) - @MAX + 1), 1))
    
     If @CARAC <> ''
      Begin
       If IsNumeric(@CARAC) = 1
        Begin
         Set @NUM = @NUM + @CARAC
        End
     End
     
   Set @MAX = @MAX - 1
  End
 Return @NUM
End