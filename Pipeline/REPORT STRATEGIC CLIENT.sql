USE DATA_SAMPLES
GO


SELECT
	CLIENT_NAME
	,COMPLETION_TYPE
	,COALESCE([1],0.0)			AS JANUARY
	,COALESCE([2],0.0)			AS FEBRUARY
	,COALESCE([3],0.0)			AS MARCH
	,COALESCE([4],0.0)			AS APRIL
	,COALESCE([5],0.0)			AS MAY
	,COALESCE([6],0.0)			AS JUNE
	,COALESCE([7],0.0)			AS JULY
	,COALESCE([8],0.0)			AS AUGUST
	,COALESCE([9],0.0)			AS SEPTEMBER
	,COALESCE([10],0.0)			AS OCTOBER
	,COALESCE([11],0.0)			AS NOVEMBER
	,IIF([12] IS NULL,0.0,[12])	AS DECEMBER
FROM
	(SELECT
		[Client Name] AS CLIENT_NAME
		,[month]
		,CASE
			WHEN probablity = 1 THEN 'ROH'
			WHEN probablity <= 1 THEN 'OUTLOOK'
		END AS COMPLETION_TYPE
		,SUM(COALESCE([Weighted Revenue],0.0)) AS TOTAL
	FROM pipedata
	where [Industry Group] = 'strategic'
	GROUP BY	[Client Name]
				,[month]
				,CASE
					WHEN probablity = 1 THEN 'ROH'
					WHEN probablity <= 1 THEN 'OUTLOOK'
				END

--do³¹czamy rekordy symuluj¹ce roh i outlook gdzie ich nie ma
				
	--UNION ALL

	--select 
				
				)
				
				 AS a
	PIVOT (SUM(a.TOTAL)
	FOR [month] IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS p
ORDER BY
	p.CLIENT_NAME	ASC
	,p.COMPLETION_TYPE	ASC;