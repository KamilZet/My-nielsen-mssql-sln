USE TSQL2012
GO

IF object_id('dbo.fnSplitStringToTable') is not null
DROP FUNCTION dbo.fnSplitStringToTable
GO

create function dbo.fnSplitStringToTable
    (
        @List NVARCHAR(MAX),
        @Delim VARCHAR(255)
    )
    RETURNS TABLE
    AS
        RETURN (SELECT
	[Value]
	,substringIndex
FROM (SELECT
	[Value] = LTRIM(RTRIM(SUBSTRING(@List,[Number],CHARINDEX(@Delim,@List + @Delim,[Number]) - [Number])))
	,ROW_NUMBER() OVER (ORDER BY x.Number ASC) AS substringIndex
FROM (SELECT
	Number = ROW_NUMBER() OVER (ORDER BY name)
FROM sys.all_objects) AS x
WHERE Number <= LEN(@List)
AND SUBSTRING(@Delim + @List,[Number],LEN(@Delim)) = @Delim) AS y
);
GO


IF object_id('dbo.fnExtractSubstring') is not null
DROP FUNCTION dbo.fnExtractSubstring
GO


create function dbo.fnExtractSubstring
(
	@list nvarchar(max)
	,@delim nvarchar(255)
	,@substringIndex as smallint
)
returns nvarchar(max)
as
begin
return (SELECT TOP 1
	value
FROM dbo.fnSplitStringToTable(@list,@delim)
WHERE substringIndex = @substringIndex);
END
GO




declare @t table(l1 nvarchar(max),l2 nvarchar(max),l3 nvarchar(max),l4 nvarchar(max))
declare @List NVARCHAR(MAX) = '111.222.33'

INSERT @t
VALUES
	(
		'1. - a'
		,'1.2. - ab'
		,'1.2.3. - abc'
		,'1.2.3.4 - abcd'
	)

;
WITH
	base
		(
			l1
			,l2
			,l3
			,l4
		)
	AS (SELECT
			LEFT(l1,PATINDEX('%[^0-9.]%',l1))
			,LEFT(l2,PATINDEX('%[^0-9.]%',l2))
			,LEFT(l3,PATINDEX('%[^0-9.]%',l3))
			,LEFT(l4,PATINDEX('%[^0-9.]%',l4))
		FROM @t)

SELECT
	*
FROM
	base
	CROSS APPLY dbo.fnSplitStringToTable(l4,'.')


SELECT
	dbo.fnExtractSubstring(@list,'.',1) UNION SELECT
	dbo.fnExtractSubstring(@list,'.',2) UNION SELECT
	dbo.fnExtractSubstring(@list,'.',3)