CREATE OR REPLACE VIEW vw_hw_topicwords_100 AS
SELECT TopicId, GROUP_CONCAT(TopicWord) as Words
FROM topicwords_100
WHERE TopicId IN (SELECT TopicId FROM vw_hw_topics_100)
GROUP BY TopicId;
