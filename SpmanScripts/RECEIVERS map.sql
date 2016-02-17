USE SPACEMAN
GO

SELECT
	*
FROM
	USR_CR_CONTENTRECVRPLANOGRAMS

;
with c(plnid,plnname,mysplnid,storeid,storename,rn) as ( SELECT
	pln.PLN_ID
	,pln.PLANOGRAM
	,myspln.PLANOID
	,rec.CONTENTRECEIVERID
	,r.name
	,ROW_NUMBER() over (partition by myspln.PLANOID ORDER BY rec.CONTENTRECEIVERID asc) as rn
FROM ACN_PLANOGRAMS pln
JOIN SYS_MYS_PLANOCONTAINER myspln
	ON pln.PLN_ID = myspln.PLANOID
JOIN USR_CR_CONTENTRECVRPLANOGRAMS rec
	ON myspln.CONTAINERID = rec.PLANOCONTAINERID
JOIN USR_CR_CONTENTRECVR r
	ON rec.CONTENTRECEIVERID = r.ID)


SELECT
*
,plnname+'___'+storename as newname
FROM
	c
where rn = 1





--;WITH cte AS
--(
--   SELECT *,
--         ROW_NUMBER() OVER (PARTITION BY DocumentID ORDER BY DateCreated DESC) AS rn
--   FROM DocumentStatusLogs
--)
--SELECT *
--FROM cte
--WHERE rn = 1


-- select d.DocumentID, ds.Status, ds.DateCreated
-- from Documents as d 
-- cross apply 
--     (select top 1 Status, DateCreated
--      from DocumentStatusLogs 
--      where DocumentID = d.DocumentId
--      order by DateCreated desc) as ds