-- view to get a list of topic departments with total spend for the topic
CREATE OR REPLACE VIEW vw_topic_depts AS
SELECT tg.TopicId, SUM(TotalGrantValue) as DeptGrant, i.OrganisationDepartment FROm vw_hw_grants i
INNER JOIN topicmap_grants_100 tg on tg.ID = i.ID
WHERE Proportion > 0.04
GROUP BY tg.TopicId, i.OrganisationDepartment;
