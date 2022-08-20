/*Compactando e Descompactando Arquivos pelo SQL Server
Postado em Segunda-feira, 10 de Setembro de 2007 (20:33:00) por niltonpinheiro   
    
   Uma d�vida muito comum nos f�runs tem sido sobre a possibilidade de se compactar o arquivo de backup gerado pelo SQL Server. Veja a dica desta semana e saiba como usar as extended stored procedures xp_makecab e xp_unpackcab para compactar e descompactar um arquivo pelo SQL Server.

� muito comum encontrar nos f�runs perguntas sobre a possibilidade de e compactar o backup realizado pelo SQL Server. Infelizmente o SQL Server n�o possui nativamente uma maneira de gerar seus backup j� compactados. No entando na dica desta semana mostro como voc� pode usar duas extended stored procedures n�o documentadas para fazer o trabalho de compacta��o e descompacta��o de um arquivo. 
O SQL Server possui duas extended stored procedures n�o documentadas chamadas xp_makecab e xp_unpackcab que voc� pode usar para respectivamente compactar e descompactar um arquivo pelo SQL Server. A utiliza��o destas xps � bastante simples e o melhor � que voc� pode us�-las para compactar/descompactar n�o apenas um arquivo de backup do SQL Server, mas com qualquer outro arquivo.

No exemplo abaixo mostro como voc� pode usar a xp_makecab para compactar o arquivo de backup DBTESTE_BKP.BAK que est� localizado 
no diret�rio E:/Backup. Ao final da compacta��o o arquivo ter� o nome de DBTESTE_BKP.cab. Fique atento � extens�o .cab pois ela � obrigat�ria.*/

-- Compacta o arquivo de backup DBTESTE_BKP.BAK
EXEC master.dbo.xp_makecab
@cabfilename = 'E:/Backup/DBTESTE_BKP.cab',
@compression_mode = 'mszip',
@verbose_level = 0,
@filename1 = 'E:/Backup/DBTESTE_BKP.BAK'

-- Nota: N�o esque�a de alterar a barra (/). Este deve ser a mesma usada para separa��o de diret�rios.

-- Uma vez tendo um arquivo compactado, voc� pode usar a xp_unpackcab para descompactar o arquivo. Veja abaixo um exemplo de como usar a xp_unpackcab. Vale destacar que o arquivo ser� descompactado mantendo seu nome original DBTESTE_BKP.BAK

--Descompactando o arquivo DBTESTE_BKP.cab
EXEC master.dbo.xp_unpackcab
@cabfilename = 'E:/Backup/DBTESTE_BKP.cab', 
@destination_folder= 'E:/Backup',
@verbose_level=0


/*Vantagens

1. Excelente taxa de compacta��o, compactou um arquivo de 463.76MB para apenas 13.8MB
2. A compacta��o do arquivo de 463.76 foi feita em menos de 1 minuto em um P4 HT 3.0GHz com 1GB RAM

Desvantagens

1. Em uma m�quina P4 HT 3.0GHz com 1GB RAM, durante a compacta��o o consumo m�dio de CPU ficou constantemente em 53% de utiliza��o. Este pode ser um problema caso pensem em usar esta xp em um ambiente de produ��o.
2. Durante a compacta��o � utilizada a �rea tempor�ria da conta de usu�rio que inicia o servi�o do SQL Server. Isso significa que voc� pode precisar de um bom espa�o libre no disco C:
3. Estas xps n�o existem no SQL Server 2005.*/

 
