SELECT * FROM (
   SELECT DISTINCT ON (user_id) * 
   FROM   submissions
   WHERE contest_id = ?
   ORDER  BY user_id, tonnage DESC NULLS LAST
   ) as sub
ORDER  BY tonnage DESC NULLS LAST;
