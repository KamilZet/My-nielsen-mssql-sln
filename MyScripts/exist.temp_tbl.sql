USE model
GO


IF OBJECTPROPERTY (object_id('dbo.tmpTableExists'), 'IsScalarFunction') = 1 
	DROP FUNCTION dbo.tmpTableExists
go

create function dbo.tmpTableExists(@inTblName as sysname)
returns bit 
as
begin
declare @tblName nvarchar(255) = (select 
									case 
										when (left(@inTblName,1)) = '#' then 'tempdb..'+@inTblName
										else '#' + @inTblName
									end);


return (select case when object_id(@tblName) is not null then 1 else 0 end)
end