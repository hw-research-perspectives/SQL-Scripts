-- first query to get the list of topics from HW based of Money spent on grants and proportion for topics
-- created a view to be able to run second query easily
-- USE meng_project; -- include this to select the table to use
-- can just query the view
SELECT * FROM meng_project.vw_hw_grants;

-- selects all of the projects under each topic found in the view created
SELECT tg.TopicId, t.TopicLabel, i.GrantTitle, i.HoldingDepartmentName, i.TotalGrantValue FROM information i 
INNER JOIN topicmap_grants tg ON (i.GrantRefNumber = tg.GrantRefNumber)
INNER JOIN topics t ON (tg.TopicId = t.TopicId)
INNER JOIN vw_hw_grants vw ON (vw.TopicId = tg.TopicId)
WHERE tg.TopicId IN (SELECT TopicId FROM vw_hw_grants)
AND HoldingOrganisationName = 'Heriot-Watt University'
ORDER BY vw.TotalMoneyXProportion desc;
