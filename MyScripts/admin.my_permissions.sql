use connectivity_dat
GO


EXECUTE AS 
--CALLER
LOGIN = 'enterprise\zienka01'
GO

SELECT
	*,SUSER_NAME() as login
FROM
	fn_my_permissions(NULL,'server')
union all
SELECT
	*,SUSER_NAME() as login
FROM
	fn_my_permissions(NULL,'database')
GO