-- retirar espe�o em branco
SELECT REPLACE('Rua       Tal            ,   34','  ','' )
-- VARI�VEL COM A STRING 
(MAX) = 'Rua       Tal            ,   34' 

DECLARE @Rua VARCHAR
-- CONSULTA
-- est� fun��o � do oracle
CREATE OR REPLACE FUNCTION F_REMOVE_BRANCOS(wString VarChar)
RETURN Char
IS
wRetorno VarChar(2000);
BEGIN
   wRetorno := Ltrim(rTrim(wString));
   While InStr(wRetorno,'  ') > 0 Loop
      wRetorno := Replace(wRetorno,'  ', ' ');
   End Loop;
   return wRetorno;
END F_REMOVE_BRANCOS;SELECT REPLACE(@Rua,'  ','') 



