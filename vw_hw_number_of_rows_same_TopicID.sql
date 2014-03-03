create view vw_hw_number_of_rows_same_TopicID as 
select TopicID,count(*)

from meng_rcuk.topicmap_grants_100, information 
where topicmap_grants_100.ID = information.ID 
and OrganisationName = "Heriot-Watt University"

Group by TopicID;