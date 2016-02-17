use TSQL2012
go

declare @t table (c varchar(10))
declare @p varchar(1000) = ''

INSERT @t
	VALUES ('a'), ('a'), ('a'), ('a'), ('b'), ('b'), ('b'), ('b')

SELECT
	c,
	COUNT(*) AS cnt
FROM @t
GROUP BY c



EXEC dbo.spDummyProc @arg1 = (select top 1 x.c + ':' + CAST(x.cnt AS VARCHAR(10)) + ' '
FROM (SELECT
	c,
	COUNT(*) AS cnt
FROM @t
GROUP BY c) x)


select @p = @p + x.c + ':' + CAST(x.cnt AS VARCHAR(10)) + ' '
FROM (SELECT
	c,
	COUNT(*) AS cnt
FROM @t
GROUP BY c) x

SELECT
	@p


