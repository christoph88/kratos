select * 
from submissions a
inner join
  ( select user_id, max(tonnage) as max_tonnage
    from submissions
    group by user_id) b 
on
a.user_id = b.user_id and
a.tonnage = b.max_tonnage
order by tonnage desc
