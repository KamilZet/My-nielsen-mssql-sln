EXEC sp_who
EXEC sys.sp_who2
SELECT
	DB_NAME(dbid) AS DBName,
	COUNT(dbid) AS NumberOfConnections,
	loginame AS LoginName
FROM sys.sysprocesses
WHERE dbid > 0
GROUP BY	dbid,
			loginame
;