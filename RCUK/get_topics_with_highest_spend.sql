-- query to get the topics from HW that have the most money spent on them
SELECT SUM(i.TotalGrantValue) as TotalMoneyXProportion, tg.TopicId, t.TopicLabel 
FROM vw_hw_grants i
INNER JOIN topicmap_grants_100 tg ON (i.ID = tg.ID)
INNER JOIN topics_100 t ON (tg.TopicId = t.TopicId)
GROUP BY tg.topicId
ORDER BY 1 desc
LIMIT 80;

-- query to get the count for topics in HW
SELECT COUNT(TopicId)
FROM vw_hw_topics_100;

-- to find out the limit for the next query 80 - result of previous query

-- query to get the topics to exclude
SELECT SUM(i.TotalGrantValue) as TotalMoneyXProportion, tg.TopicId, t.TopicLabel 
FROM vw_hw_grants i
INNER JOIN topicmap_grants_100 tg ON (i.ID = tg.ID)
INNER JOIN topics_100 t ON (tg.TopicId = t.TopicId)
GROUP BY tg.topicId
ORDER BY 1
LIMIT 20;

-- same query with ONLY TopicId selected
SELECT tg.TopicId
FROM vw_hw_grants i
INNER JOIN topicmap_grants_100 tg ON (i.ID = tg.ID)
INNER JOIN topics_100 t ON (tg.TopicId = t.TopicId)
GROUP BY tg.topicId
ORDER BY SUM(i.TotalGrantValue)
LIMIT 17;
