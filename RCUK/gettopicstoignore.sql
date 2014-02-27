-- Query to find topics from Heriot Watt to ignore (no hw related topics seem to need to be ignored)
SELECT TopicId
FROM topicmap_grants_100 tg
JOIN information i ON (i.ID = tg.ID)
WHERE tg.TopicID IN (SELECT TopicId FROM vw_hw_topics_100)
AND i.OrganisationName = 'Heriot-Watt University'
GROUP BY tg.TopicId
HAVING COUNT(tg.ID) > (SELECT (COUNT(*)*0.75) FROM vw_hw_grants);
