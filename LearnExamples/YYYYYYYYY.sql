
--current
declare @storePlnMap table (sysplnid int,syssid int)
--change
declare @inserted table (sysplnid int,syssid int)
declare @refStoreDict table (syssid int,sid int)
declare @refPlnDict table(sysplnid int,plnid int)


-- rodzaje asocjacji:
	--przypisane wszystkie sklepy -> po stronie sys {pe³na lista || wpis 'general} -> po stronie pln wpis 'general'
	--przypisane niewszystkie sklepy -> po stronie sys pe³na lista -> po stronie pln wpis'multiple'
	--przypisany dok³adnie jeden sklep -> po stronie sys jeden wpis -> po stronie pln wpis <dane sklepu z sys>
	--brak sklepów -> po stronie sys NULL -> po stronie pln wpis <no store>

-- oddzielna procedury aktualizacji, dodania, usuniêcia

insert @storePlnMap values (1,1),(1,2),(3,1)

INSERT @inserted
	VALUES (1),(2),(3)

SELECT
	*
FROM @changedLinks

;
WITH gr
AS (SELECT
		plnid
		,COUNT(storeid) AS linkedStoreCount
	FROM @changedLinks
	GROUP BY plnid)

SELECT
	plnid
	,CASE
		WHEN linkedStoreCount = 0 THEN '-1'
		WHEN linkedStoreCount = 1 THEN (SELECT TOP 1
					storeid
				FROM @changedlinks
				WHERE plnid = a.plnid)
		WHEN linkedStoreCount > 1 THEN '-2'
	END
	,CASE
		WHEN linkedStoreCount = 0 THEN 'general'
		WHEN linkedStoreCount = 1 THEN (SELECT TOP 1
					storename
				FROM @changedlinks
				WHERE plnid = a.plnid)
		WHEN linkedStoreCount > 1 THEN 'multiple'
	END
FROM gr a