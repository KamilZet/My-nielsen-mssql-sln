use spaceman
GO

if (object_id('#rawdat') is not null) drop TABLE #rawdat
GO


declare @source_file_ref nvarchar(512) = 
'C:\Users\zienka01\Documents\SQL Server Management Studio\Solutions\MyScripts.BulkInsert\in.csv'

CREATE TABLE #rawdat
(
numVal decimal(4,2)
)

DECLARE @bulkCmd VARCHAR(1000) =
'BULK INSERT 
#rawdat  
FROM 
''' + @source_file_ref + ''' 
WITH (
codepage=''acp''
,FIELDTERMINATOR = '';''
,ROWTERMINATOR = ''' + CHAR(10) + '''
,firstrow = 1
,maxerrors = 0
)';

EXEC (@bulkCmd)

SELECT * from #rawdat

drop TABLE #rawdat