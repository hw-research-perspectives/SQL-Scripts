-- DO NOT RUN ME. I AM A WORK IN PROGRESS.

EXPLAIN
SELECT REPLACE(
	REPLACE(
		REPLACE( query, "stw_temp", "(SELECT scpt.*, dates.date1 FROM vw_schoolscontrpertopic scpt JOIN (select m1 as date1 from (select ((SELECT MIN(StartDate) FROM vw_schoolscontrpertopic) - INTERVAL DAYOFMONTH((SELECT MAX(EndDate) FROM vw_schoolscontrpertopic))-1 DAY) +INTERVAL m MONTH as m1 from (select @rownum:=@rownum+1 as m from (select 1 union select 2 union select 3 union select 4) t1, (select 1 union select 2 union select 3 union select 4) t2, (select 1 union select 2 union select 3 union select 4) t3, (select 1 union select 2 union select 3 union select 4) t4, (select @rownum:=-1) t0) d1) d2 where m1<=(SELECT MAX(EndDate) FROM vw_schoolscontrpertopic) order by m1) dates WHERE dates.date1 BETWEEN scpt.StartDate AND scpt.EndDate ORDER BY scpt.TopicId, dates.date1) ##ALIAS##"),
		"date1",
		"ignoreColumn"
	),
	"##ALIAS##",
	CONCAT("a", FLOOR(10 + (RAND() * 90)))
 ) 
 FROM
(
SELECT 
    CONCAT("SELECT * FROM (SELECT DISTINCT date1 AS date FROM stw_temp) d ", group_concat(queryPart SEPARATOR ' '), ";") AS query 
FROM 
(
	SELECT 
        CONCAT('INNER JOIN (SELECT date1, Percentage AS \'', dept.HoldingDepartmentName, '\' FROM stw_temp where HoldingDepartmentName = \'', dept.HoldingDepartmentName, '\') t', @rownum:=@rownum + 1, ' ON d.date = t', @rownum, '.date1') as queryPart
    FROM 
	(
		SELECT DISTINCT 
			HoldingDepartmentName
		FROM 
			stw_temp
	) dept
    JOIN (SELECT @rownum:=0) r
) q
) rq;
