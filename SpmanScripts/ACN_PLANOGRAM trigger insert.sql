USE SPACEMAN
GO


CREATE trigger trNewPlnProcessing on acn_planograms
instead of insert,update
as
begin
SET NOCOUNT ON;

SELECT
	*
INTO
	#tmp
FROM
	inserted;
UPDATE #tmp
SET accesseddate = '1793-01-01';

INSERT INTO ACN_PLANOGRAMS
	SELECT
		*
	FROM
		#tmp;
DROP TABLE #tmp;


END