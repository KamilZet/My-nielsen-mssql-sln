DECLARE @t table(k int,v int)

declare @ref table(k int,f int)

INSERT @t
	VALUES (1,11),(3,33),(4,44)

INSERT @ref
	VALUES (1,1111),(2,2222)

SELECT
	[@t].k
	,COALESCE([@ref].k,666)
FROM
	@t
	LEFT JOIN @ref ON [@t].k = [@ref].k


SELECT
	[@t].k
	,COALESCE([@ref].k,666)
FROM
	@t
	full  JOIN @ref ON [@t].k = [@ref].k