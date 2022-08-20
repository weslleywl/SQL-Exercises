-- formatação de uma consulta
CREATE TABLE tbgerapdf (texto NVARCHAR(1000))
GO
-- formatação
INSERT tbgerapdf(texto) SELECT SPACE(50) +'MCDBABRASIL'
INSERT tbgerapdf(texto) SELECT SPACE(50)+'O Portal dos DBAs SQL Server'
INSERT tbgerapdf(texto) SELECT SPACE(50)+ 'http://www.mcdbabrasil.com.br'

INSERT tbgerapdf(texto) SELECT ' '

INSERT tbgerapdf(texto) SELECT ' '

INSERT tbgerapdf(texto) SELECT SPACE(28) + 'RELATÓRIO DE PUBLISHERS'

INSERT tbgerapdf(texto) SELECT ' '

INSERT tbgerapdf(texto) SELECT ' '

INSERT tbgerapdf(texto) SELECT 'Pub_ID' + SPACE(5) + 'Pub_Name'

+ SPACE(20) + 'City' + SPACE(10) + 'State' + SPACE(5) + 'Country'

INSERT tbgerapdf(texto) SELECT REPLACE(SPACE(70), ' ', '_')

--insere registros da tabela publishers

INSERT tbgerapdf(texto) 

SELECT p1.pub_id+ SPACE(7) 

+ p1.pub_name + SPACE(8) + p1.city+ SPACE(6)

+p1.state+ SPACE(8) +p1.country

FROM publishers p1,publishers p2

where p1.state in ('CA','IL')

GO

SELECT * FROM tbgerapdf

Qualquer coisa veja op artigo http://www.mcdbabrasil.com.br/modules.php?name=News&file=article&sid=256

