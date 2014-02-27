CREATE OR REPLACE VIEW vw_hw_topics_1000 as 
SELECT SUM(i.TotalGrantValue*tg.Proportion) as TotalMoneyXProportion, tg.TopicId, t.TopicLabel
FROM information i
INNER JOIN topicmap_grants_1000 tg ON (i.ID = tg.ID)
INNER JOIN topics_1000 t ON (tg.TopicId = t.TopicId)
WHERE OrganisationName = 'Heriot-Watt University'
GROUP BY tg.topicId
ORDER BY 1 desc;
