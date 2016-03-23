USE STOREID
GO





SELECT
	a.pln_id	AS st_pid
	,a.store_id	AS st_sid
	,b.pln_id	AS pr_pid
	,b.store_id	AS pr_sid
FROM
	ACN_STORE a
	FULL OUTER JOIN ACN_PRN b ON a.STORE_ID = b.STORE_ID
		AND a.PLN_ID = b.PLN_ID
GO