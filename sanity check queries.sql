-- first query to get the list of topics from HW based of Money spent on grants and proportion for topics
-- created a view to be able to run second query easily
-- can just query the view
SELECT * FROM meng_project.vw_hw_grants;

-- selects all of the projects under each topic found in the view created
SELECT tg.TopicId, t.TopicLabel, i.GrantTitle, i.HoldingDepartmentName, i.TotalGrantValue FROM meng_project.information i 
INNER JOIN meng_project.topicmap_grants tg ON (i.GrantRefNumber = tg.GrantRefNumber)
INNER JOIN meng_project.topics t ON (tg.TopicId = t.TopicId)
WHERE tg.TopicId IN (SELECT TopicId FROM meng_project.vw_hw_grants)
AND HoldingOrganisationName = 'Heriot-Watt University'
ORDER BY tg.TopicId;
