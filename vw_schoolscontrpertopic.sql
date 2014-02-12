-- View to get the percentage each school contributes to a topic (by number of grants)
CREATE OR REPLACE VIEW vw_schoolscontrpertopic as
SELECT (COUNT(i.GrantRefNumber)/gpt.GrantCount*100), tg.TopicId, i.HoldingDepartmentName, i.StartDate, i.EndDate
FROM information i
INNER JOIN topicmap_grants tg ON (i.GrantRefNumber = tg.GrantRefNumber)
INNER JOIN vw_totalgrantspertopic gpt ON (tg.TopicId = gpt.TopicId)
WHERE HoldingOrganisationName = 'Heriot-Watt University'
AND tg.TopicId IN (SELECT TopicId FROM vw_hw_grants)
GROUP BY tg.TopicId, i.HoldingDepartmentName
ORDER BY tg.TopicId;
