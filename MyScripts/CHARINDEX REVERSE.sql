DECLARE @path nvarchar(20) = 'C:\abcabc\def.txt'

;with dat as
(select 
    @path as path
	,CHARINDEX('\',REVERSE(@path)) - 1 as charsToRemove
	,len(@path) as stringLen
)

select SUBSTRING(@path,1,stringlen - charstoremove) from
dat
