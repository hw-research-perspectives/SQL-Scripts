CREATE 
VIEW `vw_hw_topicmap_grants_100` AS
 
select `topicmap_grants_100`.`ID` AS `ID`,
        `topicmap_grants_100`.`Proportion` AS `Proportion`,
        `topicmap_grants_100`.`TopicID` AS `TopicID`
    from
        (`topicmap_grants_100`
        join `information`)
    where
        ((`topicmap_grants_100`.`ID` = `information`.`ID`)
            and (`information`.`OrganisationName` = 'Heriot-Watt University'))