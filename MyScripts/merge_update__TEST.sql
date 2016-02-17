
if object_id('tempdb..#orig')is not null DROP TABLE #orig
if object_id('tempdb..#new')is not null DROP TABLE #orig

SELECT
	k,
	f1 INTO #orig
FROM (VALUES (1, 99), (2, 2), (3, 3), (NULL, NULL)) s (k, f1);
SELECT
	k,
	f1 INTO #new
FROM (VALUES (1, 2), (2, 2), (3, 3), (44, 1),(666,0)) s (k, f1);



-- log all inserted records
SELECT
	CONVERT(NVARCHAR(32), 'action') AS act_type
	--a.*,
	--b.*
	,a.k	as orig_k
	,a.f1	as new_k
	,b.k	as orig_f1
	,b.f1	as new_f1
INTO #ins
FROM #orig a,#new b
--,#orig as b
WHERE 1 = 0;

alter table #ins alter column orig_k int null
alter table #ins	alter column new_k int null
alter table #ins	alter column orig_f1 int null
alter table #ins	alter column new_f1 int null

merge into #orig o
using #new n
on o.k = n.k
when matched and o.f1 <> n.f1
	 then
		update set f1 = n.f1
when not matched by source and o.k is not null then
	delete
when not matched by target then
	insert (k,f1)
	values (n.k,n.f1)

--output $action,inserted.k,deleted.f1,inserted.f1 into #ins
output 
$action
,deleted.k
,inserted.k
,deleted.f1
,inserted.f1
--,deleted.* --use just deleted, 
--,inserted.*
into #ins 
--(act_type,orig_k,orig_f1,new_k,new_f1)
;

select * from #ins
--where orig_k <> new_k
--or orig_f1 <> new_f1

SELECT
	*
FROM #orig a
LEFT JOIN #ins b
	ON a.k = b.orig_k or a.k = b.new_k



DROP TABLE #orig
DROP TABLE #new
DROP TABLE #ins