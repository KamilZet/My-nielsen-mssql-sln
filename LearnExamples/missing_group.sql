DECLARE @t table(k int,v numeric(3,2))

INSERT @t
	VALUES (1,1),(1,0.9),(2,0.9)


SELECT
	k
	,t
	,sum(v)
FROM
(SELECT
	k,'roh' as t,iif(v = 1,v,0) as v
	FROM @t
	union all
select
	k,'out',iif(v <= 1,v,0)
	from @t
) x
group BY k,t
order by k,t


/************************************************************
WriteHere
************************************************************/

SELECT
	k
	,t
	,sum(v)
FROM
(SELECT
	k,'roh' as t,isnull(v,0) as v
	FROM @t
	where v = 1
	union all
select
	k,'out',isnull(v,0)
	from @t
	where v <= 1
) x
group BY k,t


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
	x.k,x.t