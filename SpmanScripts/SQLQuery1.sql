USE SPACEMAN
GO

if object_id('dbo.acn_planograms_del') is not null
	drop TABLE dbo.acn_planograms_del
GO

SELECT
	pln_id
	,planogram
	,CAST('a' AS NVARCHAR(1000))	AS attr1
	,CAST('a' AS NVARCHAR(1000))	AS attr2
	,CAST(getdate() as datetime)	AS dateti
	,CAST('a' AS NVARCHAR(1000))	AS attr4
	,CAST('a' AS NVARCHAR(1000))	AS attr6
	,CAST('a' AS NVARCHAR(1000))	AS attr7
	,CAST('a' AS NVARCHAR(1000))	AS attr8
INTO
	dbo.ACN_PLANOGRAMS_DEL
FROM
	ACN_PLANOGRAMS
WHERE
	1 = 0
GO



if object_id('dbo.trgOnPlnDelete') is not null
DROP TRIGGER dbo.trgOnPlnDelete
GO

create trigger trgOnPlnDelete on dbo.acn_planograms
for delete
as
begin

INSERT INTO acn_planograms_del
	SELECT
		DELETED.pln_id
		,deleted.planogram
		,APP_NAME()
		,@@spid
		,getdate()
		,'6'
		,'7'
		,'8'
		,'9'
	FROM
		DELETED

END