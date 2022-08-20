/*
Por favor eu tenho uma tabela de cartão de crédito onde eu eu sei o que é débito e o que é credito através de uma flag com a letra C ou D, 
porém como eu faço para somar o que for crédito e somar que for débito e achar o saldo. Não estou conseguindo por que filtro por C, porém
 se  eu não filtrar a soma da errado.*/

 

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
  Os conceitos de normalização servem para evitar este tipo de problema.
A Resposta rápida para o seu problema é que a sua base de dados não está respeitando a 3FN (Terceira forma normal) pois um campo 
(MilhasMovimentacao.Valor) é dependente de um outro campo que não faz parte da chave da tabela MilhasMovimentacao.Tipo). Desta forma,
 os valores se tornam redundantes e podem causar um erro, pois, basta que alguém inadvertidamente altere o campo tipo de "D" para "C" e a
  empresa tomará um belo prejuízo de milhas que deveriam ser debitadas mas que foram acrescentadas ao saldo do usuário. Este é o mesmo
   problema que acontece quando você tem em uma tabela os campos Quantidade, ValorUnitario e ValorTotal. O campo ValorTotal está ali contendo
    uma redundância, já que ele é conseguido multiplicando-se Quantidade x ValorUnitario e também pode causar erros, já que se alguém alterar
     a quantidade ou o valor unitário, a coluna de ValorTotal ficará errada.
 1-Se o seu projeto está no início, reveja o desenho da sua base de dados para evitar este problema.
 2-Se o projeto já está no ar e não há como alterar a base, (sabendo que você pagará um preço alto em relação à performance da sua query)
  utilize a recomendação do Fausto, mas lembrando que sua query terá menos performance por conta do case que terá que ser processado para 
  cada linha do seu resultado
 3-Retire o HAVING da sua query pois ele também afeta a performance da query, conforme exemplo abaixo:*/

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
 
 

