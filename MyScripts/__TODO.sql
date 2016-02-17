Na podstawie otrzymanej od kogo� kwerendy, stworzy� wszystkie u�yte w niej obiekty, �eby mo�na by�o sprawdzi� jej poprawno��,
np dostaj�:

SELECT
	cl.id,
	CASE
		WHEN cl.id IS NOT NULL THEN (SELECT
				c.value
			FROM client_consents c
			JOIN consent_definitions cd2
				ON c.consent_definition_id = cd2.id
				AND cd2.name = 'Zgoda na doradztwo i po�rednictwo finansowe'
			WHERE cl.id = c.client_id
			AND NOT EXISTS (SELECT
				*
			FROM client_consents cs
			WHERE c.consent_definition_id = cs.consent_definition_id
			AND cs.client_id = c.client_id
			AND c.updated_at < cs.updated_at))
	END AS "ZnDiPF",
	CASE
		WHEN cl.id IS NOT NULL THEN (SELECT
				c.value
			FROM client_consents c
			JOIN consent_definitions cd2
				ON c.consent_definition_id = cd2.id
				AND cd2.name = 'Zgoda na marketing'
			WHERE cl.id = c.client_id
			AND NOT EXISTS (SELECT
				*
			FROM client_consents cs
			WHERE c.consent_definition_id = cs.consent_definition_id
			AND cs.client_id = c.client_id
			AND c.updated_at < cs.updated_at))
	END AS "ZnM",
	CASE
		WHEN cl.id IS NOT NULL THEN (SELECT
				c.value
			FROM client_consents c
			JOIN consent_definitions cd2
				ON c.consent_definition_id = cd2.id
				AND cd2.name = 'Zgoda na otrzymywanie informacji handlowej'
			WHERE cl.id = c.client_id
			AND NOT EXISTS (SELECT
				*
			FROM client_consents cs
			WHERE c.consent_definition_id = cs.consent_definition_id
			AND cs.client_id = c.client_id
			AND c.updated_at < cs.updated_at))
	END AS "ZnOIH"
FROM clients cl
WHERE cl.id = '3bb654b3-7a56-4bc4-9d2d-42ffd092d443'

i na podstawie tego tworz� wszystkie obiekty, po czym jestem w stanie kompilowa� kwerend� i pracowa� nad jej udoskonaleniem