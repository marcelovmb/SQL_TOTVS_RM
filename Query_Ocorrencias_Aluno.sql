/*Consulta ira retornar os alunos com ocorrência e observações*/
SELECT 
/*DISTINCT */
SO.RA,
PP.NOME,
SO.RECCREATEDON DT_CRIACAO,
SO.OBSERVACOES

FROM SOCORRENCIAALUNO SO
INNER JOIN SALUNO SA ON (SO.RA = SA.RA)
INNER JOIN PPESSOA PP ON (SA.CODPESSOA = PP.CODIGO)

WHERE SO.CODOCORRENCIAGRUPO = 6523  /*codigo grupo da ocorrência q estou filtrando, consulta via sistema*/
AND SO.CODOCORRENCIATIPO = 2249   /*codigo tipo da ocorrência q estou filtrando, consulta via sistema*/
AND SO.IDPERLET IN (3,4) /* periodo letivo desejado*/

ORDER BY SO.RECCREATEDON, SO.RA DESC