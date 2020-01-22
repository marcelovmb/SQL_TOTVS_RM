/*CONSULTA DISPONIBILIDADE PROFESSOR*/

Select 
	 X.NOME, X.TURNO, X.CODPROF, X.CHAPA, MAX(X.SEG) As Segunda, MAX(X.TER) As Terca, MAX(X.QUA) As Quarta, MAX(X.QUI) As Quinta, MAX(X.SEX) As Sexta, MAX(X.SAB) As Sabado, MAX(X.DOM) As Domingo
	
From (
	SELECT
		dbo.SPROFESSOR.CODPROF,
		dbo.SPROFESSOR.CHAPA,
		dbo.PPESSOA.NOME,
		dbo.STURNO.NOME AS TURNO,
		dbo.SDISPDIASEMANA.HORINI,
		case when dbo.SDISPDIASEMANA.DIASEMANA = 2 THEN dbo.SDISPDIASEMANA.HORINI + ' - ' + dbo.SDISPDIASEMANA.HORFIM End AS SEG,
		case when dbo.SDISPDIASEMANA.DIASEMANA = 3 THEN dbo.SDISPDIASEMANA.HORINI + ' - ' + dbo.SDISPDIASEMANA.HORFIM End AS TER,
		case when dbo.SDISPDIASEMANA.DIASEMANA = 4 THEN dbo.SDISPDIASEMANA.HORINI + ' - ' + dbo.SDISPDIASEMANA.HORFIM End AS QUA,
		case when dbo.SDISPDIASEMANA.DIASEMANA = 5 THEN dbo.SDISPDIASEMANA.HORINI + ' - ' + dbo.SDISPDIASEMANA.HORFIM End AS QUI,
		case when dbo.SDISPDIASEMANA.DIASEMANA = 6 THEN dbo.SDISPDIASEMANA.HORINI + ' - ' + dbo.SDISPDIASEMANA.HORFIM End AS SEX,
		case when dbo.SDISPDIASEMANA.DIASEMANA = 7 THEN dbo.SDISPDIASEMANA.HORINI + ' - ' + dbo.SDISPDIASEMANA.HORFIM End AS SAB,
		case when dbo.SDISPDIASEMANA.DIASEMANA = 1 THEN dbo.SDISPDIASEMANA.HORINI + ' - ' + dbo.SDISPDIASEMANA.HORFIM End AS DOM
	FROM
		dbo.SPROFESSOR (NOLOCK) 
		INNER JOIN dbo.PPESSOA (NOLOCK) ON (dbo.SPROFESSOR.CODPESSOA = dbo.PPESSOA.CODIGO)
		INNER JOIN dbo.SDISPPROFESSOR (NOLOCK) ON (dbo.SDISPPROFESSOR.CODCOLIGADA = dbo.SPROFESSOR.CODCOLIGADA) AND (dbo.SDISPPROFESSOR.CODPROF = dbo.SPROFESSOR.CODPROF)
		INNER JOIN dbo.SDISPDIASEMANA (NOLOCK) ON (dbo.SDISPPROFESSOR.CODCOLIGADA = dbo.SDISPDIASEMANA.CODCOLIGADA) AND (dbo.SDISPPROFESSOR.IDDISPPROFESSOR = dbo.SDISPDIASEMANA.IDDISPPROFESSOR)
		INNER JOIN dbo.STURNO (NOLOCK) ON (dbo.STURNO.CODCOLIGADA = dbo.SDISPPROFESSOR.CODCOLIGADA) AND (dbo.STURNO.CODTURNO = dbo.SDISPPROFESSOR.CODTURNO)
	WHERE  
		dbo.SPROFESSOR.CODCOLIGADA = 1
) As X

Group By
	X.CODPROF, X.CHAPA, X.NOME, X.TURNO

	ORDER BY X.NOME