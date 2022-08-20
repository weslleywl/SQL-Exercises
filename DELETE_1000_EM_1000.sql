/*
VAI DELETANDO MIL EM MIL E COMITANDO

 DELETE FROM CORP_APOLICE_FORMA_PAGAMENTO_AUTORIZACAO WHERE id_corp_apolice_forma_pagamento_autorizacao IN (
select TOP 100000 id_corp_apolice_forma_pagamento_autorizacao 
from CORP_APOLICE_FORMA_PAGAMENTO_AUTORIZACAO cafpa WITH (nolock)  
WHERE CD_AUTORIZACAO = '3410000000000000000012295'
AND dv_ativo = 0)
GO 1000
*/


					  