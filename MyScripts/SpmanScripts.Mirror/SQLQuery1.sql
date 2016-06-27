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

update a

set segment_id = '__segment ' + convert(nvarchar(max),segment_index)
	,fixel_id = segment_id + '___polka 023'
from (SELECT
			a.FIXEL_ID
			,a.TYPE
			,a.SEGMENT AS segment__
			,
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


WHERE pln_id = 3
