-- view for grants from heriot watt
CREATE OR REPLACE VIEW vw_hw_grants_100 as
SELECT tg.TopicId, i.GrantTitle, CASE i.OrganisationDepartment WHEN '' THEN 'Other' ELSE i.OrganisationDepartment END as OrganisationDepartment, i.TotalGrantValue FROM information i 
INNER JOIN topicmap_grants_100 tg ON (i.ID = tg.ID)
INNER JOIN topics_100 t ON (tg.TopicId = t.TopicId)
INNER JOIN vw_hw_topics_100 vw ON (vw.TopicId = tg.TopicId)
WHERE tg.TopicId IN (SELECT TopicId FROM vw_hw_topics_100)
AND OrganisationName = 'Heriot-Watt University'
ORDER BY vw.TotalMoneyXProportion desc;
