DECLARE @t table(k int,v numeric(3,2))

INSERT @t
	VALUES (1,1),(1,0.9),(2,0.9)


/************************************************************
All data from union
************************************************************/

SELECT
	k
	,'roh'			AS t
	,IIF(v = 1,v,0)	AS v
FROM
	@t UNION ALL SELECT
	k
	,'out'
	,IIF(v <= 1,v,0)
FROM
	@t

/************************************************************
Solution with union set operator
************************************************************/

SELECT
	k
	,t
	,SUM(v)
FROM
	(SELECT
		k
		,'roh' AS t
		,IIF(v = 1,v,0) AS v
	FROM @t UNION ALL SELECT
		k
		,'out'
		,IIF(v <= 1,v,0)
	FROM @t) x
GROUP BY	k
			,t
ORDER BY
	k
	,t


/************************************************************
WriteHere
************************************************************/

SELECT
	k
	,t
	,SUM(v)
FROM
	(SELECT
		k
		,'roh' AS t
		,ISNULL(v,0) AS v
	FROM @t
	WHERE v = 1 UNION ALL SELECT
		k
		,'out'
		,ISNULL(v,0)
	FROM @t
	WHERE v <= 1) x
GROUP BY	k
			,t


/************************************************************
WriteHere
************************************************************/
--SELECT
--	*
--	,CASE
--		WHEN a.v = 1 THEN 1
--		WHEN a.v <= 1 THEN 2
--	END
--FROM
--	@t a
--	cross JOIN (SELECT
--		1 AS v UNION ALL SELECT
--		2) 

/************************************************************
WriteHere
************************************************************/
SELECT
	x.k
	,x.t
	,SUM(x.v)
FROM
	(SELECT
		k
		,'roh' AS t
		,v
	FROM @t
	WHERE v = 1 UNION ALL SELECT
		k
		,'out' AS t
		,v
	FROM @t
	WHERE v <= 1) x
GROUP BY	x.k
			,x.t
ORDER BY
	x.k
	,x.t