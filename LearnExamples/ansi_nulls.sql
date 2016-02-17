declare @t table(val int null)

INSERT @t
	VALUES (NULL), (1), (2)

SET ANSI_NULLS OFF

SELECT
	'ansi_nulls off' = COUNT(*)
FROM @t
WHERE val = NULL

SET ANSI_NULLS ON

SELECT
	'ansi_nulls on' = COUNT(*)
FROM @t
WHERE val = NULL


GO