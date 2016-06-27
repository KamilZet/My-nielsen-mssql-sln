declare @changedLinks table (plnid int,storeid int ,storename nvarchar(max))

INSERT @changedLinks VALUES (
		1
		,1
		,'a'
	),(
		1
		,2
		,'b'
	),(
		2
		,1
		,'zz'
	),(
		3
		,NULL
		,NULL
	)

SELECT
	*
FROM
	@changedLinks

;
WITH
	gr
	AS (SELECT
			plnid
			,COUNT(storeid) AS linkedStoreCount
		FROM @changedLinks
		GROUP BY plnid)

SELECT
	plnid
	,CASE
		WHEN linkedStoreCount = 0 THEN '-1'
		WHEN linkedStoreCount = 1 THEN (SELECT TOP 1
				storeid
			FROM @changedlinks
			WHERE plnid = a.plnid)
		WHEN linkedStoreCount > 1 THEN '-2'
	END
	,CASE
		WHEN linkedStoreCount = 0 THEN 'general'
		WHEN linkedStoreCount = 1 THEN (SELECT TOP 1
				storename
			FROM @changedlinks
			WHERE plnid = a.plnid)
		WHEN linkedStoreCount > 1 THEN 'multiple'
	END
FROM
	gr a