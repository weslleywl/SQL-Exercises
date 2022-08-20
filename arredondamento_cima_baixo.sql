--Como faço para que o resultado de um calculo arredonde sempre para cima, por exemplo se o resultado for 126,2 ele vá para 127 algum teria uma dica???

Declare @Valor numeric(10,2)
Set @Valor = 126.2
select 
Case 
when @Valor-convert(int,@Valor) <=5 
Then convert(int,@Valor)+1 
else convert(int,@valor)
 end

Alter Function Ufn_ArredondaMaior (@Valor numeric(20,2))
Returns int
Begin
 Return 
 Case
 when @Valor-convert(int,@Valor) <=5 
Then convert(int,@Valor)+1 else convert(int,@Valor) 
end
End

Select dbo.Ufn_ArredondaMaior(126.2)

 
Abs; 

--Para arredondar para cima use a funcção CEILING

SELECT CEILING (124.2)
select floor (124.2)

Resultado: 125

--Para arredondar para baixo é usado o FLOOR

--   arredondamento com sum
SELECT Year(Apont.dtApontamento) As Ano, 
Sum (CEILING(Apont.Horas)) As Horas, -- entrando dentro do SUM 
Count(Usr.idUsuario) AS NroUsuarios 
FROM hr_Apontamentos Apont , Usuario Usr 
WHERE Apont.idUsuario = Usr.idUsuario 
AND Apont.idProjeto IN ( 24,49,53,68,69,70,586,588,589,590,591,592,593,594,595,599,603 ) 
AND Apont.dtApontamento >= '2007/04/01' AND Apont.dtApontamento <= '2007/04/30' 
group by Apont.dtApontamento, Apont.Horas, Usr.idUsuario
 
 
 
 
 
