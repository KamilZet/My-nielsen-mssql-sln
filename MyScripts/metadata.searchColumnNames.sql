USE [myspaceman v20 training C]
GO



with keyWords(keyWord) as
(
SELECT
	'fillpattern' UNION ALL SELECT
	'totalunits' UNION ALL SELECT
	'product_id')

SELECT
	a.TABLE_CATALOG
	,a.TABLE_SCHEMA
	,a.TABLE_NAME
	,a.COLUMN_NAME
	,a.DATA_TYPE
	,b.keyword
	

FROM
	INFORMATION_SCHEMA.COLUMNS a
	JOIN keyWords b ON a.column_name LIKE '%' + b.keyword + '%'