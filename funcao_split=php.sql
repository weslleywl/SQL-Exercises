IF OBJECT_ID('dbo.Split') IS NOT NULL
    DROP FUNCTION dbo.Split

GO
CREATE FUNCTION dbo.Split(@data NVARCHAR(MAX), @delimiter NVARCHAR(5))
RETURNS @t TABLE (data NVARCHAR(max))
AS
BEGIN
    
    DECLARE @textXML XML;
    SELECT    @textXML = CAST('<d>' + REPLACE(@data, @delimiter, '</d><d>') + '</d>' AS XML);

    INSERT INTO @t(data)
    SELECT  T.split.value('.', 'nvarchar(max)') AS data
    FROM    @textXML.nodes('/d') T(split)
    
    RETURN
END
GO

DECLARE @text NVARCHAR(max)
SELECT @text = REPLICATE('ab,', 300) + 'ab'

SELECT * FROM dbo.Split(@text, ',')