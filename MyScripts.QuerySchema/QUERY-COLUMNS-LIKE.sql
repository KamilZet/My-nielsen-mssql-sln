SELECT
	a.TABLE_NAME
	,a.COLUMN_NAME
	,a.ORDINAL_POSITION
	,b.pat	
FROM
	INFORMATION_SCHEMA.COLUMNS a
	JOIN (SELECT
		'%fixel_id%' UNION SELECT
		'%segment%') b (pat) ON a.COLUMN_NAME LIKE b.pat
		AND left(a.TABLE_NAME,3) = 'acn'
	order by b.pat,a.TABLE_NAME asc