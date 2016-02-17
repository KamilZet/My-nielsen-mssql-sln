begin

declare
	@cmd nvarchar(max) = null
	,@file nvarchar(max) = 'C:\_DANE\_\Documents\Projekty\Klient\Zagranica\Sudameapteek\Data\ProdData_20150828.csv'



if object_id('#tempdb..csv') is not null
	DROP TABLE #csv

create table #csv(
	Pharmacy_ID nvarchar(512),
UPC nvarchar(512),
Name nvarchar(512),
Manufacturer nvarchar(512),
Tax_Code nvarchar(512),
KV nvarchar(512),
Category nvarchar(512),
Subcategory nvarchar(512),
DescriptionB nvarchar(512),
DescriptionC nvarchar(512),
Width nvarchar(512),
Height nvarchar(512),
Depth nvarchar(512),
Reg_Movement nvarchar(512),
Cost nvarchar(512),
Price nvarchar(512)
)


SET @cmd = 'BULK INSERT #csv
   FROM ''' + @file + '''
   WITH (FIELDTERMINATOR = '',''
         ,FIRSTROW =2
		 ,datafiletype=''widechar''
         ,ROWTERMINATOR = ''' + char(10) + ''')'

exec (@cmd)

select * from #csv

drop table #csv

select object_id('#tempdb..csv')

end