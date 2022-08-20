/*Compactando e Descompactando Arquivos pelo SQL Server
Postado em Segunda-feira, 10 de Setembro de 2007 (20:33:00) por niltonpinheiro   
    
   Uma dúvida muito comum nos fóruns tem sido sobre a possibilidade de se compactar o arquivo de backup gerado pelo SQL Server. Veja a dica desta semana e saiba como usar as extended stored procedures xp_makecab e xp_unpackcab para compactar e descompactar um arquivo pelo SQL Server.

É muito comum encontrar nos fóruns perguntas sobre a possibilidade de e compactar o backup realizado pelo SQL Server. Infelizmente o SQL Server não possui nativamente uma maneira de gerar seus backup já compactados. No entando na dica desta semana mostro como você pode usar duas extended stored procedures não documentadas para fazer o trabalho de compactação e descompactação de um arquivo. 
O SQL Server possui duas extended stored procedures não documentadas chamadas xp_makecab e xp_unpackcab que você pode usar para respectivamente compactar e descompactar um arquivo pelo SQL Server. A utilização destas xps é bastante simples e o melhor é que você pode usá-las para compactar/descompactar não apenas um arquivo de backup do SQL Server, mas com qualquer outro arquivo.

No exemplo abaixo mostro como você pode usar a xp_makecab para compactar o arquivo de backup DBTESTE_BKP.BAK que está localizado 
no diretório E:/Backup. Ao final da compactação o arquivo terá o nome de DBTESTE_BKP.cab. Fique atento à extensão .cab pois ela é obrigatória.*/

-- Compacta o arquivo de backup DBTESTE_BKP.BAK
EXEC master.dbo.xp_makecab
@cabfilename = 'E:/Backup/DBTESTE_BKP.cab',
@compression_mode = 'mszip',
@verbose_level = 0,
@filename1 = 'E:/Backup/DBTESTE_BKP.BAK'

-- Nota: Não esqueça de alterar a barra (/). Este deve ser a mesma usada para separação de diretórios.

-- Uma vez tendo um arquivo compactado, você pode usar a xp_unpackcab para descompactar o arquivo. Veja abaixo um exemplo de como usar a xp_unpackcab. Vale destacar que o arquivo será descompactado mantendo seu nome original DBTESTE_BKP.BAK

--Descompactando o arquivo DBTESTE_BKP.cab
EXEC master.dbo.xp_unpackcab
@cabfilename = 'E:/Backup/DBTESTE_BKP.cab', 
@destination_folder= 'E:/Backup',
@verbose_level=0


/*Vantagens

1. Excelente taxa de compactação, compactou um arquivo de 463.76MB para apenas 13.8MB
2. A compactação do arquivo de 463.76 foi feita em menos de 1 minuto em um P4 HT 3.0GHz com 1GB RAM

Desvantagens

1. Em uma máquina P4 HT 3.0GHz com 1GB RAM, durante a compactação o consumo médio de CPU ficou constantemente em 53% de utilização. Este pode ser um problema caso pensem em usar esta xp em um ambiente de produção.
2. Durante a compactação é utilizada a área temporária da conta de usuário que inicia o serviço do SQL Server. Isso significa que você pode precisar de um bom espaço libre no disco C:
3. Estas xps não existem no SQL Server 2005.*/

 
