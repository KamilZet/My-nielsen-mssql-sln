DECLARE @t table (k int,someval numeric(4,2))

INSERT @t
	VALUES (1,0.99),(2,1.0),(2,0.11)

SELECT
	*
FROM
	(SELECT
		*
		,CASE
			WHEN someval = 1.0 THEN 'ready'
			WHEN someval <= 1.0 THEN 'all'
		END AS comp
	FROM @t) a
	RIGHT OUTER JOIN (SELECT
		'ready' UNION SELECT
		'all') b (comp) ON a.comp = b.comp

ORDER BY
	a.k
GO