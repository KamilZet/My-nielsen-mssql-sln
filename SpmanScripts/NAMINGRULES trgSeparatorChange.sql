--USE SPACEMAN
--GO

IF exists (SELECT
	1
FROM sys.triggers
WHERE name = 'trgSeparatorChange') DROP TRIGGER trgSeparatorChange
GO




CREATE TRIGGER trgSeparatorChange ON sys_pub_namingrule FOR INSERT,UPDATE AS BEGIN

UPDATE SYS_PUB_NAMINGRULE
SET SEPARATOR = ';'
WHERE RECEIVERTYPE = 'store'

END


SELECT
	separator
FROM
	SYS_PUB_NAMINGRULE
WHERE
	RECEIVERTYPE = 'store'
GO