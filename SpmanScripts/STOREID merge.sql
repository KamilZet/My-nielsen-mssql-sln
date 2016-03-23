
USE STOREID
GO


--wyczysc store z wszystkich

merge into acn_store a
using acn_prn b
on a.pln_id = b.pln_id and a.store_id = b.store_id and b.store_id != N'*Store*'
when not matched by target then 
	insert (pln_id,store_id) values (b.pln_id,b.store_id)
when not matched by source and a.store_id != N'*Store*' then 
	delete;