-- View for total amount of grants in each topic
CREATE OR REPLACE VIEW vw_totalgrantspertopic as
SELECT tg.TopicId, COUNT(tg.TopicId) as GrantCount, SUM(i.TotalGrantValue) as TotalGrant
FROM information i
INNER JOIN topicmap_grants tg ON (i.GrantRefNumber = tg.GrantRefNumber)
WHERE HoldingOrganisationName = 'Heriot-Watt University'
AND tg.TopicId IN (SELECT TopicId FROM vw_hw_grants)
GROUP BY tg.TopicId
ORDER BY tg.TopicId;
