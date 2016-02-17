DECLARE @GetInstances TABLE(
	Value nvarchar(100),
	InstanceNames nvarchar(100),
	Data nvarchar(100)
)

INSERT INTO @GetInstances
EXECUTE xp_regread	@rootkey = 'HKEY_LOCAL_MACHINE',
					@key = 'SOFTWARE\Microsoft\Microsoft SQL Server',
					@value_name = 'InstalledInstances'

SELECT
	InstanceNames
FROM @GetInstances