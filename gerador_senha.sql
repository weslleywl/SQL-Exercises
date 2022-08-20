-- Variables 
DECLARE @PassLen int;  
DECLARE @Pass varchar(50); 
DECLARE @LoopCt int; 
DECLARE @Rnd int; 

-- Password length (Comprimento Senha)
SET @PassLen = 10; 
-- Starting value of password (O valor inicial de senha)
SET @Pass = ''; 
-- Starting value of loop (O valor inicial do loop )
SET @LoopCt = 1;

-- Loop to generate the password (Loop para gerar a senha) 
WHILE @LoopCt <= @PassLen 
    BEGIN 
        -- Generate a random number to select a character (Gerar um número aleatório para seleccionar um carácter )
        SET @Rnd = Convert(int,(1 + RAND() * (9-1))); 

        -- Build the password using the selected character (Construir a senha usando o caractere selecionado)
        SELECT @Pass = @Pass + 
            CASE  
                -- This option is weighted (Esta opção é ponderado )
                WHEN @Rnd >=1 AND @Rnd <=3 THEN 
                    -- a-z   
                   CHAR(Convert(int,(97 + RAND() * (122-97)))) 
                 -- This option is weighted (Esta opção é ponderado)
                WHEN @Rnd >=4 AND @Rnd <=6 THEN 
                    -- A-Z  
                   CHAR(Convert(int,(65 + RAND() * (90-65)))) 
                WHEN @Rnd = 7 THEN 
                    -- 0-9  
                    CHAR(Convert(int,(48 + RAND() * (57-48)))) 
                ELSE 
                    -- #$%& (Special Character) 
                    CHAR(Convert(int,(35 + RAND() * (38-35)))) 
             END 

       -- Advance the loop     
        SET @LoopCt = @LoopCt + 1; 
    END             

-- Return the password ()
SELECT @Pass;

GO

