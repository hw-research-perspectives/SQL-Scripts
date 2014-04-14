-- heriot watt specific topics for 100 topic model
CREATE OR REPLACE VIEW vw_hw_topics_100 as 
SELECT SUM(i.TotalGrantValue) as TotalMoney, tg.TopicId, t.TopicLabel, min(StartDate) as TopicStart, max(EndDate) as TopicEnd, s.SchoolofHighestTotalSpend as OrganisationDepartment
FROM vw_hw_grants i
INNER JOIN topicmap_grants_100 tg ON (i.ID = tg.ID)
INNER JOIN topics_100 t ON (tg.TopicId = t.TopicId)
INNER JOIN vw_hw_schoolofhighesttotalspend s ON (`tg`.`TopicID` = `s`.`TopicID`)
GROUP BY tg.topicId
ORDER BY 1 desc;

CREATE TABLE `tmp_vw_hw_topics_100` (
  `TotalMoney` decimal(32,0) DEFAULT NULL,
  `TopicId` int(11) NOT NULL,
  `TopicLabel` longtext,
  `TopicStart` datetime DEFAULT NULL,
  `TopicEnd` datetime DEFAULT NULL,
  `OrganisationDepartment` longtext,
  `connection` int(11) NOT NULL,
  PRIMARY KEY (`TopicId`,`connection`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1