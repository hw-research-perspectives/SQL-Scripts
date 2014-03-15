-- heriot watt specific topics for 100 topic model
CREATE OR REPLACE VIEW vw_hw_topics_100 as 
SELECT SUM(i.TotalGrantValue) as TotalMoney, tg.TopicId, t.TopicLabel, min(StartDate) as TopicStart, max(EndDate) as TopicEnd
FROM vw_hw_grants i
INNER JOIN topicmap_grants_100 tg ON (i.ID = tg.ID)
INNER JOIN topics_100 t ON (tg.TopicId = t.TopicId)
GROUP BY tg.topicId
ORDER BY 1 desc;
