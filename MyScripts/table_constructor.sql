select k,f1 into #new from  (values(1,2),	(2,2),	(3,3)) s(k,f1);

select convert(nvarchar(32),'a') as 'act_type',* into #change 
from #new 
--cross join (values('a')) 
where 1=0;


select * from #change

drop table #new;
drop table #change;