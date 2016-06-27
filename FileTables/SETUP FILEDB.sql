EXEC sys.sp_configure filestream_access_level,2
RECONFIGURE WITH override
GO

CREATE DATABASE FileTableDB
ON PRIMARY
(Name = FileTableDB,
FILENAME = 'C:\_DANE\_\Documents\Projekty\_Lab\Nielsen\ImageDatabase\FTDB.mdf'),

FILEGROUP FTFG CONTAINS FILESTREAM
(NAME = FileTableFS,
FILENAME='C:\_DANE\_\Documents\Projekty\_Lab\Nielsen\ImageDatabase\FS')
LOG ON
(Name = FileTableDBLog,
FILENAME = 'C:\_DANE\_\Documents\Projekty\_Lab\Nielsen\ImageDatabase\FTDBLog.ldf')
WITH FILESTREAM (NON_TRANSACTED_ACCESS = FULL,
DIRECTORY_NAME = N'FileTableDB');
GO

USE FileTableDB
GO

CREATE TABLE FileTableTb AS FileTable
WITH
(FileTable_Directory = 'FileTableTb_Dir');
GO