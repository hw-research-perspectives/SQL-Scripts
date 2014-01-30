-- view of ordered topics based on Money for grants in each topic
CREATE OR REPLACE VIEW vw_hw_grants as 
SELECT SUM(i.TotalGrantValue*tg.Proportion) as TotalMoneyXProportion, tg.TopicId, t.TopicLabel 
FROM information i
INNER JOIN topicmap_grants tg ON (i.GrantRefNumber = tg.GrantRefNumber)
INNER JOIN topics t ON (tg.TopicId = t.TopicId)
WHERE HoldingOrganisationName = 'Heriot-Watt University'
GROUP BY tg.topicId
ORDER BY 1 desc
LIMIT 80;
