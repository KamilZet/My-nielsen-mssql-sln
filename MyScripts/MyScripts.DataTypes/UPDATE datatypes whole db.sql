use STOREID
GO

--generic
--SELECT 
--   'ALTER TABLE [' + Table_Schema+'].['+Table_Name 
--	 +'] Alter Column ['+Column_Name+'] varchar('
--	 +Convert(nvarchar(5),Character_Maximum_Length)+');'
--   + ' Update ['+ Table_Schema+'].['+Table_Name
--      + '] SET ['+Column_Name+']= Rtrim(['+Column_Name+']);'

SELECT
	'ALTER TABLE [' + Table_Schema + '].[' + Table_Name
	+ '] Alter Column [' + Column_Name + '] int;'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE DATA_TYPE = 'smallint'
