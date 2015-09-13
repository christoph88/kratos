SELECT * FROM (
   SELECT DISTINCT ON (user_id) * 
   FROM   submissions
   WHERE contest_id = ?
   ORDER  BY user_id, tonnage DESC NULLS LAST
   LIMIT 5
   ) as sub
ORDER  BY created_at DESC NULLS LAST;
