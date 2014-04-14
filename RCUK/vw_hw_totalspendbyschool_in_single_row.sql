-- view to get the total spend per topic for each school
create or replace VIEW `vw_hw_totalspendbyschool_in_single_row` AS
select 
`vw_hw_totalspendbyschool`.`TopicId` AS `TopicID`,
sum(`vw_hw_totalspendbyschool`.`LifeSciences`) AS `sum(LifeSciences)`,
sum(`vw_hw_totalspendbyschool`.`EngineeringAndPhysical`) AS `sum(EngineeringAndPhysical)`,
sum(`vw_hw_totalspendbyschool`.`BuiltEnvironment`) AS `sum(BuiltEnvironment)`,
sum(`vw_hw_totalspendbyschool`.`ManagementAndLanguages`) AS `sum(ManagementAndLanguages)`,
sum(`vw_hw_totalspendbyschool`.`Petroleum`) AS `sum(Petroleum)`,
sum(`vw_hw_totalspendbyschool`.`Macs`) AS `sum(Macs)`,
sum(`vw_hw_totalspendbyschool`.`TechRes`) AS `sum(TechRes)`,
sum(`vw_hw_totalspendbyschool`.`Textiles`) AS `sum(Textiles)`,
sum(`vw_hw_totalspendbyschool`.`Other`) AS `sum(Other)`
from
`vw_hw_totalspendbyschool`
group by `vw_hw_totalspendbyschool`.`TopicId`