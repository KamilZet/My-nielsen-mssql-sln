create trigger dbo.trgOnStoreToPlnChange on USR_CR_CONTENTRECVRPLANOGRAMS
for update
as
begin

declare @t table(conplnid int,storeid nvarchar(200),storename nvarchar(200));

INSERT @t
	(
		conplnid
		,storeid
		,storename
	)
	SELECT
		syspln.PLANOID
		,ass.storeid
		,ass.storename
	FROM
		INSERTED i
		JOIN SYS_MYS_PLANOCONTAINER syspln ON i.PLANOCONTAINERID = syspln.CONTAINERID
		CROSS APPLY dbo.udfAssociatedStore(i.PLANOCONTAINERID) AS ass



UPDATE st
	SET	STORE_ID = c.storeid
		,STORE_NAME = c.storename
FROM [Spaceman Connectivity].dbo.acn_store st
JOIN @t c
	ON st.PLN_ID = c.conplnid

UPDATE prn
	SET STORE_ID = c.storeid
FROM [Spaceman Connectivity].dbo.acn_prn prn
JOIN @t c
	ON prn.PLN_ID = c.conplnid


END