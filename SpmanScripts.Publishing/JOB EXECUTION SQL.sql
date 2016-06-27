use SPACEMAN
GO




WITH c (t)
AS (SELECT
	CONVERT(NVARCHAR(MAX),textdata) AS t
FROM kamiltracedev)


SELECT
	*
INTO
	#t
FROM
	(SELECT
		SUBSTRING(t
		,1
		,CASE
			WHEN (CHARINDEX('where',t) > 0) THEN CHARINDEX('where',t) - 2
			WHEN (CHARINDEX('values',t) > 0) THEN CHARINDEX('values',t) - 2
			ELSE LEN(t)
		END) AS tt
	FROM c) y


SELECT
	tt
FROM
	#t



DROP TABLE #t