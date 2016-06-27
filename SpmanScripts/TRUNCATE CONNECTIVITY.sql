

USE spaceman
GO


--EXEC sys.sp_MSforeachtable 'if (left(''?'',10) = ''[dbo].[ACN'') truncate table ?'
--'if (left(''?'',10) = ''[dbo].[SYS'') drop table ?'

-- disable all constraints
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

-- delete data in all tables
EXEC sp_MSForEachTable "DELETE FROM ?"

-- enable all constraints
exec sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"