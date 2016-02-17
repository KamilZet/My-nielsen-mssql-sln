use [EURO-S]
go

/************************************************************
Settings from the system database
************************************************************/

SELECT
	c.name		username
	,a.keyid
	,a.name		settname
	,b.setting	settvalue
FROM
	SYS_MYS_USERSETTINGKEYS a
	left JOIN SYS_MYS_USERSETTINGSSTRING b ON a.KEYID = b.KEYID
	left JOIN SYS_MYS_USERS c ON b.USERID = c.USERID
ORDER BY
	username ASC,a.KEYID asc
GO

/************************************************************
Settings from the registry
************************************************************/
