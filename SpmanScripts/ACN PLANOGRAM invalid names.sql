USE [EURO-C]
GO


WITH plnDups as(
SELECT
	key_id
	,planogram
	,ROW_NUMBER() OVER (PARTITION BY Planogram ORDER BY Key_id ASC) AS rn
FROM PLANO_KEY),
plnDupsAndNulls
AS (SELECT
	*,case when rn > 1 THEN 'duplicate' ELSE 'null' END as diseaseType
FROM plnDups
WHERE rn > 1
OR planogram IS null)

update plnDupsAndNulls
	SET PLANOGRAM = CASE diseaseType
		WHEN 'duplicate' then PLANOGRAM + '_DUPLICATE_NR_' + convert(varchar(3),rn - 1)
		WHEN 'null' then 'PLANOGRAM_NULL_NR_' + convert(varchar(4),key_id)
		end
