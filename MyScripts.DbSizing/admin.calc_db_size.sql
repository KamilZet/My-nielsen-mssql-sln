
SELECT
	database_name =		DB_NAME(database_id)
	,log_size_mb =		CAST(SUM(CASE
		WHEN type_desc = 'LOG' THEN size
	END) * 8. / 1024 AS DECIMAL(8,2))
	,row_size_mb =		CAST(SUM(CASE
		WHEN type_desc = 'ROWS' THEN size
	END) * 8. / 1024 AS DECIMAL(8,2))
	,total_size_mb =	CAST(SUM(size) * 8. / 1024 AS DECIMAL(8,2))
FROM
	sys.master_files WITH (NOWAIT)
--WHERE
--	database_id = DB_ID('mgn_spaceman')
GROUP BY database_id
ORDER BY
	database_name ASC
 --total_size_mb;

DBCC SQLPERF(logspace);

SELECT
	DB_NAME(database_id)
	,*
FROM
	sys.master_files WITH (NOWAIT)
--WHERE database_id = DB_ID('mgn_spaceman')
--GROUP BY database_id
--ORDER BY total_size_mb;


SELECT
	GETDATE()		AS [captureDate]
	,@@SERVERNAME	AS [serverName]
	,instance_name	AS [databaseName]
	,SUM(
	CASE
		WHEN counter_name = 'Data File(s) Size (KB)' THEN cntr_value
	END
	)				AS 'dataSizeInKB'
	,SUM(
	CASE
		WHEN counter_name = 'Log File(s) Size (KB)' THEN cntr_value
	END
	)				AS 'logSizeInKB'
FROM
	sys.dm_os_performance_counters
WHERE
	counter_name IN ('Data File(s) Size (KB)'
	,'Log File(s) Size (KB)')
	/* optional: remove _Total to avoid accidentally
	double-counting in queries */
	AND instance_name <> '_Total'
GROUP BY instance_name;