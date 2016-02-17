USE TSQL2012
GO

SELECT
	/* main attributes */
	t.name AS tbl_name,
	p.name AS prop_name,
	p.value as prop_val,
	/* all other shit */
	p.*,
	t.*
FROM sys.extended_properties p
INNER JOIN sys.tables t
	ON p.major_id = t.object_id
WHERE class = 1