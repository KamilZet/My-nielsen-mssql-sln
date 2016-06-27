USE SPACEMAN
GO

SELECT
	b.PLN_ID
	,b.PLANOGRAM
	,a.fixel_id
	,a.FIXEL_NAME
	,a.TYPE	AS fixel_type
	,a.SEGMENT
	,a.SECTION_ID
FROM
	spaceman.dbo.ACN_FIXEL a
	,spaceman.dbo.ACN_PLANOGRAMS b
WHERE
	a.PLN_ID = b.PLN_ID
--AND b.PLANOGRAM = 'juice'
ORDER BY
	b.PLN_ID
	,a.SECTION_ID
	,a.SEGMENT
	,a.TYPE
	,a.fixel_id


;
WITH
	fixel2segment
	AS (SELECT
			*
		FROM (SELECT
			a.PLN_ID
			,a.FIXEL_ID
			,a.TYPE
			,a.SEGMENT AS segment__
		FROM spaceman.dbo.ACN_FIXEL a
		WHERE TYPE = 0) a
		RIGHT JOIN (SELECT
			fixel_name AS segment_name
			,fixel_id AS segment_id
			,SEGMENT AS segment_index
		FROM spaceman.dbo.ACN_FIXEL
		WHERE TYPE = 8
		AND FIXEL_ID NOT LIKE '%baseboard%'
		AND FIXEL_ID NOT LIKE '%back%') b
			ON a.segment__ = b.segment_index)

update
	fixel2segment
set segment_id = '__segment ' + convert(nvarchar(max),segment_index)
	,fixel_id = segment_id + '___polka 023'
WHERE pln_id = 3



--JOIN ACN_PLANOGRAMS p ON f2s.pln_id = p.PLN_ID

SELECT
			*
		FROM (SELECT
			a.PLN_ID
			,a.FIXEL_ID
			,a.TYPE
			,a.SEGMENT AS segment__
		FROM spaceman.dbo.ACN_FIXEL a
		WHERE TYPE = 0) a
		RIGHT JOIN (SELECT
			fixel_name AS segment_name
			,fixel_id AS segment_id
			,SEGMENT AS segment_index
		FROM spaceman.dbo.ACN_FIXEL
		WHERE TYPE = 8
		AND FIXEL_ID NOT LIKE '%baseboard%'
		AND FIXEL_ID NOT LIKE '%back%') b
			ON a.segment__ = b.segment_index
where a.PLN_ID = 3