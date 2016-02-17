declare @t table(dateval char(10));

INSERT @t
	VALUES ('2015-09-27'),
	('2015-09-11'),
	('08-03-2015'),
	('11-03-2015'),
	('31-12-2016'),
	('11-12-2015'),
	('11.06.2018'),
	('30-06-2017'),
	('09.05.2015')

SELECT
	dateval,
	TRY_CONVERT(DATE, dateval, 103),
	TRY_CONVERT(DATE, dateval, 111),
	CONVERT(DATE, dateval, CASE WHEN (dateval LIKE '[0-9][0-9][0-9][0-9]%' /*yyyy|mm|dd*/) THEN 
									111
								ELSE /* all other formatting patterns, especially dd|mm|yyyy*/
									103
								END)

FROM @t