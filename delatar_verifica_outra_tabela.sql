--deletando dados em duas tabelas

delete tabela
where campo=(select campo from tabela2 where campo=1)