CREATE VIEW `vw_number_of_rows_same_TopicID` AS
    select 
        `topicmap_grants_100`.`TopicID` AS `TopicID`,
        count(0) AS `count(*)`
    from
        `topicmap_grants_100`
    group by `topicmap_grants_100`.`TopicID`