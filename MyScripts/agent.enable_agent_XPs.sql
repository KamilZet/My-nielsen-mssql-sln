--kamil zien
--an initial launch of ss 2014 enterprise has ss agent not configured properly

--below script turns agens eXtented Procedures ON

exec sys.sp_configure 'show advanced options',1
GO
RECONFIGURE
GO

exec sys.sp_configure 'agent xps',1
GO
RECONFIGURE
GO



