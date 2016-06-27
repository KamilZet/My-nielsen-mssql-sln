USE SPACEMAN_SYS
GO


SELECT
	a.JOBID
	,d.DESCRIPTION as jobname
	,a.SELECTION as plnidc
	,c.CONTAINERID as plnids
FROM
	SYS_PUB_JOBUNITPLANOSELECTION a
	left JOIN spaceman.dbo.ACN_PLANOGRAMS b ON a.SELECTION = b.PLN_ID
	LEFT JOIN SYS_MYS_PLANOCONTAINER c
	ON a.SELECTION = c.PLANOID
	left join SYS_PUB_JOB d
	ON a.JOBID = d.JOBID
WHERE b.PLN_ID IS null
ORDER by a.JOBID desc