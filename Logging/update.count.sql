use tsql2012
go

set nocount on

begin transaction

declare @updCount int = 0;

declare @u table (opType varchar(100),opRowScope varchar(100))
declare @log table(op varchar(100))

insert @log VALUES ('de')


update mock
	set val = 3
	output 'updated' into @log



select @updCount = @@rowcount



insert into @u (opType,opRowScope) values ('update',@updCount)


rollback




select @updCount
select * from @u
select * from mock
select @@rowcount
select * from @log