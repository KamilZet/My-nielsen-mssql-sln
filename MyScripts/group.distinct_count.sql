USE [Spaceman Connectivity]
GO


--cte filtering all untitled planograms imported to conn

SELECT
	CAST(pln_id AS NVARCHAR(255)) AS pln_id INTO #invPln
FROM (SELECT
	pln_id
FROM ACN_PLANOGRAMS
WHERE PLANOGRAM = N'<Untitled>') src

SELECT
	*
FROM #invPln


SELECT
	COUNT(*) AS ref_obj_count,
	'planogram' AS obj_name
FROM	ACN_PLANOGRAMS a,
		#invPln
WHERE a.pln_id = #invPln.pln_id UNION ALL SELECT
	COUNT(*) AS ref_obj_count,
	'fixel' AS obj_name
FROM	ACN_FIXEL a,
		#invPln
WHERE a.pln_id = #invPln.pln_id UNION ALL SELECT
	COUNT(*),
	'font'
FROM	ACN_FONT a,
		#invPln
WHERE a.pln_id = #invPln.pln_id UNION ALL SELECT
	COUNT(*),
	'position'
FROM	ACN_POSITION a,
		#invPln
WHERE a.pln_id = #invPln.pln_id UNION ALL SELECT
	COUNT(*),
	'prn'
FROM	ACN_PRN a,
		#invPln
WHERE a.pln_id = #invPln.pln_id UNION ALL SELECT
	COUNT(*),
	'prodpln'
FROM	ACN_PRODUCT_PLN a,
		#invPln
WHERE a.pln_id = #invPln.pln_id UNION ALL SELECT
	COUNT(*),
	'section'
FROM	ACN_SECTION a,
		#invPln
WHERE a.pln_id = #invPln.pln_id UNION ALL SELECT
	COUNT(*),
	'store'
FROM	ACN_SECTION a,
		#invPln
WHERE a.pln_id = #invPln.pln_id

DROP TABLE #invPln