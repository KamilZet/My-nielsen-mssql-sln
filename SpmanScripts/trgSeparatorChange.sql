USE [EURO-S]
GO


CREATE trigger trgSeparatorChange
on sys_pub_namingrule
for insert,update
as
begin

UPDATE SYS_PUB_NAMINGRULE
SET SEPARATOR = ';'

END
GO


UPDATE SYS_PUB_NAMINGRULE
SET SEPARATOR = ';'
GO