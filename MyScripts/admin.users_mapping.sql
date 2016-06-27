


declare @preferredLogin nvarchar(255) = SUSER_NAME()
--N'idea\srdjang'

CREATE TABLE #tempww (
    LoginName nvarchar(max),
    DBname nvarchar(max),
    Username nvarchar(max), 
    AliasName nvarchar(max)
)

INSERT INTO #tempww
EXEC master..sp_msloginmappings

-- display results
SELECT
	*
FROM
	#tempww
ORDER BY
	CASE
		WHEN LoginName = @preferredLogin THEN 0
		ELSE 1
	END
	,LoginName
	,DBname
	,username

-- cleanup
DROP TABLE #tempww
GO