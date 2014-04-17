-- heriot watt specific topics for 100 topic model
CREATE OR REPLACE VIEW `meng_rcuk`.`vw_hw_topics_100` AS select sum((`i`.`TotalGrantValue` * `tg`.`Proportion`)) AS `TotalMoney`,`tg`.`TopicID` AS `TopicId`,`t`.`TopicLabel` AS `TopicLabel`,min(`i`.`StartDate`) AS `TopicStart`,max(`i`.`EndDate`) AS `TopicEnd` from ((`meng_rcuk`.`vw_hw_grants` `i` join `meng_rcuk`.`topicmap_grants_100` `tg` on((`i`.`ID` = `tg`.`ID`))) join `meng_rcuk`.`topics_100` `t` on((`tg`.`TopicID` = `t`.`TopicID`))) group by `tg`.`TopicID` order by 1 desc;


CREATE TABLE `tmp_vw_hw_topics_100` (
  `TotalMoney` decimal(32,0) DEFAULT NULL,
  `TopicId` int(11) NOT NULL,
  `TopicLabel` longtext,
  `TopicStart` datetime DEFAULT NULL,
  `TopicEnd` datetime DEFAULT NULL,
  `connection` int(11) NOT NULL,
  PRIMARY KEY (`TopicId`,`connection`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
