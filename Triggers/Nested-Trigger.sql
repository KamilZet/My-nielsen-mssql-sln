USE TSQL2012
GO

if exists (SELECT
	1
FROM sys.triggers
WHERE name = 'trgNestedTrigger') DROP TRIGGER trgNestedTrigger
GO

if exists(SELECT 1 from sys.tables where name = 'NestedTrigger') DROP TABLE NestedTrigger
GO

create table NestedTrigger (runId datetime2)
GO

CREATE trigger trgNestedTrigger on dbo.NestedTrigger
for insert,update
as
begin

if (@@nestlevel > 1) return

insert INTO NestedTrigger values(getdate())

end 

EXEC sp_configure 'nested triggers',0
go

ALTER database tsql2012 set recursive_triggers off
GO
