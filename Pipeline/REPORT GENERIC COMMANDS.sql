USE DATA_SAMPLES
GO



SELECT
	[industry group]			AS INDUSTRY_GROUP
	,CASE
		WHEN probablity = 1 THEN 'OUTLOOK'
		WHEN probablity <= 1 THEN 'ROH'
	END							AS COMPLETION_TYPE
	,SUM([Weighted Revenue])	AS TOTAL
FROM
	pipedata
GROUP BY	[industry group]
			,CASE
				WHEN probablity = 1 THEN 'OUTLOOK'
				WHEN probablity <= 1 THEN 'ROH'
			END
ORDER BY
	[industry group] ASC



SELECT
	INDUSTRY_GROUP
	,COMPLETION_TYPE
	,COALESCE([1],0.0)	AS JANUARY
	,COALESCE([2],0.0)	AS FEBRUARY
	,COALESCE([3],0.0)	AS MARCH
	,COALESCE([4],0.0)	AS APRIL
	,COALESCE([5],0.0)	AS MAY
	,COALESCE([6],0.0)	AS JUNE
	,COALESCE([7],0.0)	AS JULY
	,COALESCE([8],0.0)	AS AUGUST
	,COALESCE([9],0.0)	AS SEPTEMBER
	,COALESCE([10],0.0)	AS OCTOBER
	,COALESCE([11],0.0)	AS NOVEMBER
	,COALESCE([12],0.0)	AS DECEMBER
FROM
	(SELECT
		[industry group] AS INDUSTRY_GROUP
		,[month]
		,CASE
			WHEN probablity = 1 THEN 'ROH'
			WHEN probablity <= 1 THEN 'OUTLOOK'
		END AS COMPLETION_TYPE
		,SUM(COALESCE([Weighted Revenue],0.0)) AS TOTAL
	FROM pipedata
	GROUP BY	[industry group]
				,[month]
				,CASE
					WHEN probablity = 1 THEN 'ROH'
					WHEN probablity <= 1 THEN 'OUTLOOK'
				END) AS a
	PIVOT (SUM(a.TOTAL)
	FOR [month] IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS p
ORDER BY
	p.INDUSTRY_GROUP	ASC
	,p.COMPLETION_TYPE	ASC;