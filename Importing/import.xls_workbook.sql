use TSQL2012
GO

if object_id('import.xls_workbook') is not null
	drop function import.xls_workbook
go


declare @srcWkb as nvarchar(512) = ''

select @srcWkb = 'C:\_DANE\_\Documents\Projekty\Klient\Zagranica\Sudameapteek\Data\Sudameapteek_storelist_contentrcv_dat_2.xlsx'

declare @tmpId int

Declare @sql nvarchar(max)
Set @sql='SELECT * into #tmp
FROM OPENROWSET(
               ''Microsoft.ACE.OLEDB.12.0'',
               ''Excel 8.0;Database=' + @srcWkb + ''',
               ''Select * from [Arkusz1$]'');select @tmpId = object_id(''tempdb..#tmp'')'

select object_id('tempdb..#tmp')

-- Print @sql
 Exec(@sql)


 select * from #tmp
 GO



select * from tempdb.sys.columns where object_id = OBJECT_ID('tempdb..#tmp')

select * 
from tempdb.INFORMATION_SCHEMA.COLUMNS
where table_name =
    object_name(
        object_id('tempdb..#tmp'),
        (select database_id from sys.databases where name = 'tempdb'))

select * from #tmp

drop table #tmp