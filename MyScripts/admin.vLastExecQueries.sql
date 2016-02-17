USE tsql2012
GO

if (object_id('dbo.vLastExecQueries') is not null)
DROP VIEW dbo.vLastExecQueries
GO

create view dbo.vLastExecQueries
as

with sqlDbMap as
( SELECT
	plan_handle AS planHand
	,pvt.dbid AS dbId
	,pvt.sql_handle AS sqlHand
FROM (SELECT
	plan_handle
	,epa.attribute
	,epa.value
FROM sys.dm_exec_cached_plans
OUTER APPLY sys.dm_exec_plan_attributes(plan_handle) AS epa
WHERE cacheobjtype = 'Compiled Plan'
AND objtype = 'adhoc') AS ecpa
PIVOT (MAX(ecpa.value) FOR ecpa.attribute IN ("dbid","sql_handle")) AS pvt)

SELECT
	deqs.last_execution_time			AS execTime
	,deqs.sql_handle					AS sqlHand
	,dest.text							AS sqlText
	,x.dbid								AS dbId
	,DB_NAME(CONVERT(SMALLINT,x.dbid))	AS dbName
FROM
	sys.dm_exec_query_stats AS deqs
	CROSS APPLY sys.dm_exec_sql_text(deqs.sql_handle) AS dest
	INNER JOIN sqldbMap x ON deqs.sql_handle = x.sqlhand
GO


SELECT
	*
FROM
	dbo.vLastExecQueries
WHERE
	dbid = DB_ID()
	AND (sqltext LIKE '%insert%'
	OR sqltext LIKE '%update%')

ORDER BY
	exectime DESC

GO