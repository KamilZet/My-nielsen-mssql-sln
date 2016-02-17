
/*
publishing information by Kamil Zien
*/
SELECT TOP 1
   j.JOBID,
   jq.SERVICENAME,
   jq.STATUS,
   ju.PUBLISHINGDECKID,
   pd.BUSINESSISSUE,
   pd.NAME as deckname
 
FROM  SYS_PUB_JOBQUEUE jq,
      SYS_PUB_JOB j,
      SYS_PUB_JOBUNIT ju,
      SYS_OTP_PUBLISHINGDECK pd,
      SYS_OTP_PLTDISTRIBUTITEM pdi
WHERE jq.JOBID = j.JOBID
AND jq.JOBID = ju.JOBID
AND ju.PUBLISHINGDECKID = pd.PUBLISHINGDECKID
AND pdi.PUBLISHINGDECKID = pd.PUBLISHINGDECKID
 
ORDER BY jq.ORDERTIMESTAMP DESC 




/*
publishing information by Peter Hicklin
*/
SELECT DISTINCT
TOP (100) PERCENT
	Halls_C.dbo.PLANO_KEY.Key_id,
	Halls_C.dbo.PLANO_KEY.Planogram,
	SPJRF.URL,
	dbo.SYS_MYS_PLANOCONTAINER.CONTAINERID,
	SPJRF.JOBID,
	dbo.SYS_PUB_DISTRIBUTIONJOBFILE.DISTRIBUTEDFILENAME
FROM Halls_C.dbo.PLANO_KEY
INNER JOIN dbo.SYS_MYS_PLANOCONTAINER
	ON Halls_C.dbo.PLANO_KEY.Key_id = dbo.SYS_MYS_PLANOCONTAINER.PLANOID
INNER JOIN dbo.SYS_PUB_JOBRESULTFILE AS SPJRF
	ON dbo.SYS_MYS_PLANOCONTAINER.CONTAINERID = SPJRF.PLANOCONTAINERID
INNER JOIN dbo.SYS_PUB_DISTRIBUTIONJOBFILE
	ON SPJRF.URL = dbo.SYS_PUB_DISTRIBUTIONJOBFILE.ORIGINALFILEPATH + '\' + dbo.SYS_PUB_DISTRIBUTIONJOBFILE.ORIGINALFILENAME
	AND SPJRF.JOBID = dbo.SYS_PUB_DISTRIBUTIONJOBFILE.JOBID
WHERE (SPJRF.JOBID * 10000 + SPJRF.PLANOCONTAINERID = (SELECT
	MAX(JOBID * 10000 + PLANOCONTAINERID) AS Expr1
FROM dbo.SYS_PUB_JOBRESULTFILE AS SPJRF2
WHERE (PLANOCONTAINERID = SPJRF.PLANOCONTAINERID))
)
ORDER BY Halls_C.dbo.PLANO_KEY.Key_id