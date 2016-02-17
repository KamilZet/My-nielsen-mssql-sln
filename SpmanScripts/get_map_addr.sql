if object_id('dbo.get_map_addr') is not null drop function dbo.get_map_addr
GO

/*
get value of current map file property

preserved handle constants:
HKEY_CLASSES_ROOT
HKEY_CURRENT_USER
HKEY_LOCAL_MACHINE
HKEY_USERS

!!! when sql service is using local system account, it could be insufficietly priviled with a right to read registry

*/
create function [dbo].[get_map_addr]()
returns varchar(255)
as
begin
declare 
	@dsn varchar(255)
	,@ret varchar(255)

SELECT
	@dsn = 'Software\VB and VBA Program Settings\SPACEMAN Connectivity\' + DBIdentifier
FROM mySpacemanDBInfo


EXECUTE master.dbo.xp_instance_regread	@rootkey = 'HKEY_CURRENT_USER',
										@key = @dsn,
										@value_name = 'MappingFile',
										@value = @ret OUTPUT

return @ret
end
go


select dbo.get_map_addr();