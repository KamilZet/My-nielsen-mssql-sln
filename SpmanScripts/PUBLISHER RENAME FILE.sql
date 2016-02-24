USE [EURO-S]
GO

if object_id('dbo.trgOnNewPublisherFile') is not null drop trigger dbo.trgOnNewPublisherFile
GO

create trigger dbo.trgOnNewPublisherFile on dbo.SYS_PUB_JOBRESULTFILE
for insert
as
begin try
begin tran



create table #NewFiles (jobId int,oldUrl nvarchar(1000),plnName nvarchar(1000),parentDir nvarchar(512),commandText varchar(4000))

INSERT INTO #NewFiles (
	jobId
	,oldUrl
	,plnName
	,parentDir
)
	SELECT
		i.JOBID
		,i.URL
		,pk.Planogram
		,SUBSTRING(i.URL,1,LEN(i.URL) - CHARINDEX('\',REVERSE(i.url)) + 1)
	FROM
		INSERTED i
		JOIN SYS_PUB_JOBUNITPLANOSELECTION jups ON i.JOBID = jups.JOBID
		JOIN [EURO-C].dbo.PLANO_KEY pk ON jups.SELECTION = pk.Key_id
	WHERE len(i.URL) = 216

UPDATE #NewFiles
--SET commandText = 'MOVE /Y "' + oldUrl + '" "' + left(parentDir + plnName,250) + '.pdf"'
SET commandText = 'MOVE /Y "' + oldUrl + '" "' + parentDir + plnName + '.pdf"'

DECLARE @var VARCHAR(4000) = (select top 1 left(parentDir + plnName,250) + '.pdf' from #NewFiles);
print @var
PRINT len(@var)


DECLARE @command VARCHAR(4000);

DECLARE commandsCursor CURSOR FOR SELECT
	commandText
FROM #NewFiles
OPEN commandsCursor
FETCH NEXT FROM commandsCursor INTO @command
WHILE @@fetch_status = 0 BEGIN
print @command
EXEC master.dbo.xp_cmdshell @command
FETCH NEXT FROM commandsCursor INTO @command
END

CLOSE commandsCursor
DEALLOCATE commandsCursor

COMMIT TRAN
END TRY BEGIN CATCH

declare @errMsg varchar(1000) = ERROR_MESSAGE();

RAISERROR (@errMsg,10,1)

ROLLBACK TRAN

END CATCH

--INSERT SYS_PUB_JOBRESULTFILE
--	SELECT
--		21951
--		,11
--		,2
--		,109
--		,1
--		,2107
--		,1
--		,111
--		,'C:\next-long-filename\0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889.pdf'
--		,1