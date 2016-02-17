SELECT
	*
FROM
	[myspaceman v20 training S].dbo.SYS_MYS_USERSETTINGKEYS
WHERE
	NAME LIKE '%m%'


DECLARE @licenseFileDir varchar(1000) = quotename((SELECT
	SETTING
FROM SYS_MYS_USERSETTINGSSTRING
WHERE KEYID = 1)
,'"')

SELECT @licenseFileDir

--EXEC sys.xp_cmdshell @licenseFileDir

EXEC sys.xp_cmdshell 'start "C:\Program Files (x86)\Nielsen\myspaceman\License"'