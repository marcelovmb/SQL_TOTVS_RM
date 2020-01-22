--consulta que verifica a quantidade de disciplinas nas turmas.

SELECT MA.RA,TD.CODTURMA,HA.NOME,PL.CODFILIAL, COUNT(*) QTD 
FROM SMATRICULA MA
INNER JOIN STURMADISC TD ON (MA.CODCOLIGADA=TD.CODCOLIGADA AND MA.IDTURMADISC=TD.IDTURMADISC)
INNER JOIN SPLETIVO PL ON (MA.CODCOLIGADA=PL.CODCOLIGADA AND MA.IDPERLET=PL.IDPERLET)
INNER JOIN SHABILITACAOFILIAL HF  ON (MA.CODCOLIGADA=HF.CODCOLIGADA AND MA.IDHABILITACAOFILIAL=HF.IDHABILITACAOFILIAL)
INNER JOIN SHABILITACAO HA ON (HF.CODCOLIGADA=HA.CODCOLIGADA AND HF.CODCURSO=HA.CODCURSO AND HF.CODHABILITACAO=HA.CODHABILITACAO)
WHERE MA.CODSTATUS = 16
AND PL.CODPERLET = '2019'
--AND TD.CODTURMA = ''
AND HA.NOME LIKE '%9%'
GROUP BY RA,TD.CODTURMA,HA.NOME,PL.CODFILIAL
ORDER BY PL.CODFILIAL,QTD