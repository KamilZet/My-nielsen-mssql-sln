if object_id('dbo.vSegmentToPln') is not null
DROP VIEW dbo.vSegmentToPln;
GO

create view dbo.vSegmentToPln 
as
SELECT
	planogram				AS pln_name
	,acn_planograms.pln_id	AS pln_id
	,fixel_id				AS segment_id
	,SEGMENT				AS segment_ordinal
	,CREATIONDATE			AS created_on
	,MODIFIEDdate			AS modified_on
FROM
	ACN_FIXEL
	,ACN_PLANOGRAMS
WHERE
	ACN_FIXEL.PLN_ID = ACN_PLANOGRAMS.PLN_ID
	AND type = 8
	AND SEGMENT > 0