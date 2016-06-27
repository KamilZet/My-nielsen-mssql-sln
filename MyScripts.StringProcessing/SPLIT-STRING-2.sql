
declare @List NVARCHAR(MAX) = '111.222.33',
        @Delim VARCHAR(255) = '.'

SELECT
	@List
	,x.Number																						AS number
	,CHARINDEX(@Delim,@List + @Delim,[Number])														AS chrindex
	,CHARINDEX(@Delim,@List + @Delim,[Number]) - x.Number											AS chrindex__
	,SUBSTRING(@List,[Number],CHARINDEX(@Delim,@List + @Delim,[Number]) - [Number])					AS value__
	,@Delim + @List																					AS whereArg
	,SUBSTRING(@Delim + @List,[Number],LEN(@Delim))													AS wherePredicate
	,@Delim																							AS delim
	,LTRIM(RTRIM(SUBSTRING(@List,[Number],CHARINDEX(@Delim,@List + @Delim,[Number]) - [Number])))	AS value
	,ROW_NUMBER() OVER (ORDER BY x.number ASC)														AS partnumber
FROM
	(SELECT
		Number = ROW_NUMBER() OVER (ORDER BY name)
	FROM sys.all_objects) AS x
WHERE
	Number <= LEN(@List)
	AND SUBSTRING(@Delim + @List,[Number],LEN(@Delim)) = @Delim


SELECT
	[Value]
FROM
	(SELECT
		LTRIM(RTRIM(SUBSTRING(@List,[Number],CHARINDEX(@Delim,@List + @Delim,[Number]) - [Number]))) AS [value]
	FROM (SELECT
		Number = ROW_NUMBER() OVER (ORDER BY name)
	FROM sys.all_objects) AS x
	WHERE Number <= LEN(@List)
	AND SUBSTRING(@Delim + @List,[Number],LEN(@Delim)) = @Delim) AS y