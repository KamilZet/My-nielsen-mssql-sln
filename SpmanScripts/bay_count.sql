USE SPACEMAN
GO



With BayCount
as
(
SELECT
	pln_id,
	MAX(segment) AS Bay_Count
FROM dbo.acn_FIXEL
GROUP BY pln_id)

SELECT
	pln.pln_id,
	pln.planogram,
	bc.bay_count
FROM baycount bc
INNER JOIN ACN_PLANOGRAMS pln
	ON bc.pln_id = pln.pln_id
GO


if object_id('dbo.calcBayCountForPln') is not null
	drop FUNCTION dbo.calcBayCountForPln
GO

create function dbo.calcBayCountForPln(@plnId int)
returns varchar(2)
as
begin
declare @ret varchar(2)=0;

SELECT
	@ret = MAX(segment)
FROM ACN_FIXEL
WHERE PLN_ID = @plnid

return @ret

end
GO


