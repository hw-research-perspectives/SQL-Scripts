SELECT scpt.*, dates.date1 FROM vw_schoolscontrpertopic scpt
JOIN (select 
m1 as date1

from
(
select 
((  SELECT MIN(StartDate) 
    FROM vw_schoolscontrpertopic) 
    - INTERVAL DAYOFMONTH((SELECT MAX(EndDate) FROM vw_schoolscontrpertopic))-1 DAY) 
+INTERVAL m MONTH as m1
from
(
select @rownum:=@rownum+1 as m from
(select 1 union select 2 union select 3 union select 4) t1,
(select 1 union select 2 union select 3 union select 4) t2,
(select 1 union select 2 union select 3 union select 4) t3,
(select 1 union select 2 union select 3 union select 4) t4,
(select @rownum:=-1) t0
) d1
) d2 
where m1<=(SELECT MAX(EndDate) FROM vw_schoolscontrpertopic)
order by m1) dates --ON (dates.date1 BETWEEN i.StartDate AND i.EndDate)
WHERE dates.date1 BETWEEN scpt.StartDate AND scpt.EndDate
ORDER BY scpt.TopicId, dates.date1;
