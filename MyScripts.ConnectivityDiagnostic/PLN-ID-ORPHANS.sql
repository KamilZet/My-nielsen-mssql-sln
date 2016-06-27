USE [Spaceman Connectivity]
GO

SELECT
	a.pln_id
	,b.pln_id
	,c.pln_id
	,d.pln_id
	,e.pln_id
	,f.pln_id
	,g.pln_id
FROM
	acn_store a
	LEFT JOIN acn_planograms b ON a.pln_id = b.pln_id
	LEFT JOIN acn_fixel c ON a.pln_id = c.pln_id
	LEFT JOIN acn_position d ON a.pln_id = d.pln_id
	LEFT JOIN acn_prn e ON a.pln_id = e.pln_id
	LEFT JOIN acn_product_pln f ON a.pln_id = f.pln_id
	LEFT JOIN acn_section g ON a.pln_id = g.pln_id
WHERE
	(b.pln_id IS NULL)
	OR (c.pln_id IS NULL)
	OR (d.pln_id IS NULL)
	OR (e.pln_id IS NULL)
	OR (f.pln_id IS NULL)
	OR (g.pln_id IS NULL)