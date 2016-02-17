declare @t table(f1 int)

insert @t values(1)

RAISERROR ('msg',15,1)


select * from @t

GO


