declare @table table(id int,val sql_variant)

INSERT @table
	VALUES (1, 'abc'), (2, 'def')


declare @aud table(old_id int,new_id int,old_val sql_variant,new_val sql_variant)



UPDATE @table
SET val = 'zzz'
OUTPUT DELETED.id, INSERTED.id, DELETED.val, INSERTED.val INTO @aud(old_id,new_id,old_val,new_val)
WHERE id > 0


select * from @table
select * from @aud