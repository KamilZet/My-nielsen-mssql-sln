

SELECT
	*
FROM (SELECT
	COLUMN_NAME,
	'a' AS dummy
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'acn_planograms') s
PIVOT
(MAX(dummy) FOR column_name IN ([modifiedby], [owner])) p
WHERE 1 = 0


create table #orig (id int);

declare @sql nvarchar(255)
= 'SELECT 
	1 AS action,' + 
	dbo.tbl_fields_wi_alias('#orig','ins','ins_') + ',' +
	dbo.tbl_fields_wi_alias('#orig','del','del_') + 
	' INTO #ins
FROM #orig as ins,#orig as del
WHERE 1 = 0'

select @sql

exec (@sql)

select * from #ins;

drop table #orig;
drop table #ins;