USE model
GO

if (object_id('dbo.get_temp_tab_info') is not null)
DROP FUNCTION dbo.get_temp_tab_info
GO

create function dbo.get_temp_tab_info(
	@tab_name nvarchar(255)
)
returns @temp_tab_info table (
	coll_name nvarchar(255)
)
as
begin
INSERT @temp_tab_info
	SELECT
		name
	FROM tempdb.sys.columns
	WHERE object_id = OBJECT_ID('tempdb..' + @tab_name);
RETURN;
END
GO