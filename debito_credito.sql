/*
Por favor eu tenho uma tabela de cart�o de cr�dito onde eu eu sei o que � d�bito e o que � credito atrav�s de uma flag com a letra C ou D, 
por�m como eu fa�o para somar o que for cr�dito e somar que for d�bito e achar o saldo. N�o estou conseguindo por que filtro por C, por�m
 se  eu n�o filtrar a soma da errado.*/

 

SELECT     dbo.MilhasCartoesCredito.CartaoCreditoID, dbo.MilhasCartoesCredito.Empresa, dbo.MilhasCartoesCredito.Bandeira, SUM(dbo.MilhasMovimentacao.Valor) AS Saldo, 
                      dbo.MilhasCartoesCredito.ResgateMaxMes, dbo.MilhasMovimentacao.Tipo, dbo.MilhasMovimentacao.Ativo
FROM         dbo.MilhasCartoesCredito INNER JOIN
                      dbo.MilhasMovimentacao ON dbo.MilhasCartoesCredito.CartaoCreditoID = dbo.MilhasMovimentacao.CartaoCreditoId
GROUP BY dbo.MilhasCartoesCredito.CartaoCreditoID, dbo.MilhasCartoesCredito.Empresa, dbo.MilhasCartoesCredito.Bandeira, dbo.MilhasCartoesCredito.ResgateMaxMes, 
                      dbo.MilhasMovimentacao.Tipo, dbo.MilhasMovimentacao.Ativo
HAVING      (dbo.MilhasMovimentacao.Ativo = 1) AND (dbo.MilhasMovimentacao.Tipo = 'c')

---
resposta:
/*
  Os conceitos de normaliza��o servem para evitar este tipo de problema.
A Resposta r�pida para o seu problema � que a sua base de dados n�o est� respeitando a 3FN (Terceira forma normal) pois um campo 
(MilhasMovimentacao.Valor) � dependente de um outro campo que n�o faz parte da chave da tabela MilhasMovimentacao.Tipo). Desta forma,
 os valores se tornam redundantes e podem causar um erro, pois, basta que algu�m inadvertidamente altere o campo tipo de "D" para "C" e a
  empresa tomar� um belo preju�zo de milhas que deveriam ser debitadas mas que foram acrescentadas ao saldo do usu�rio. Este � o mesmo
   problema que acontece quando voc� tem em uma tabela os campos Quantidade, ValorUnitario e ValorTotal. O campo ValorTotal est� ali contendo
    uma redund�ncia, j� que ele � conseguido multiplicando-se Quantidade x ValorUnitario e tamb�m pode causar erros, j� que se algu�m alterar
     a quantidade ou o valor unit�rio, a coluna de ValorTotal ficar� errada.
 1-Se o seu projeto est� no in�cio, reveja o desenho da sua base de dados para evitar este problema.
 2-Se o projeto j� est� no ar e n�o h� como alterar a base, (sabendo que voc� pagar� um pre�o alto em rela��o � performance da sua query)
  utilize a recomenda��o do Fausto, mas lembrando que sua query ter� menos performance por conta do case que ter� que ser processado para 
  cada linha do seu resultado
 3-Retire o HAVING da sua query pois ele tamb�m afeta a performance da query, conforme exemplo abaixo:*/

SELECT dbo.MilhasCartoesCredito.CartaoCreditoID, 
    dbo.MilhasCartoesCredito.Empresa, 
    dbo.MilhasCartoesCredito.Bandeira, 
    Sum(Case When dbo.MilhasMovimentacao.Tipo = 'D' then dbo.MilhasMovimentacao.Valor * -1 Else dbo.MilhasMovimentacao.Valor End) AS Saldo, 
    dbo.MilhasCartoesCredito.ResgateMaxMes, 
    dbo.MilhasMovimentacao.Ativo
FROM     dbo.MilhasCartoesCredito INNER JOIN
           dbo.MilhasMovimentacao ON dbo.MilhasCartoesCredito.CartaoCreditoID = dbo.MilhasMovimentacao.CartaoCreditoId 
WHERE   (dbo.MilhasMovimentacao.Ativo = 1)
GROUP BY dbo.MilhasCartoesCredito.CartaoCreditoID, dbo.MilhasCartoesCredito.Empresa, dbo.MilhasCartoesCredito.Bandeira,
 dbo.MilhasCartoesCredito.ResgateMaxMes
 
 HAVING      (dbo.MilhasMovimentacao.Ativo = 1) -- retira o having daqui e  passa ele para cima dentro do where
 
 

