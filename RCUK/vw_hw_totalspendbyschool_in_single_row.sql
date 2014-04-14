-- view to get the total spend per topic for each school in a single row
create or replace VIEW `vw_hw_totalspendbyschool_in_single_row` AS
select 
`vw_hw_totalspendbyschool`.`TopicId` AS `TopicID`,
sum(`vw_hw_totalspendbyschool`.`LifeSciences`) AS `LifeSciences`,
sum(`vw_hw_totalspendbyschool`.`EngineeringAndPhysical`) AS `EngineeringAndPhysical`,
sum(`vw_hw_totalspendbyschool`.`BuiltEnvironment`) AS `BuiltEnvironment`,
sum(`vw_hw_totalspendbyschool`.`ManagementAndLanguages`) AS `ManagementAndLanguages`,
sum(`vw_hw_totalspendbyschool`.`Petroleum`) AS `Petroleum`,
sum(`vw_hw_totalspendbyschool`.`Macs`) AS `Macs`,
sum(`vw_hw_totalspendbyschool`.`TechRes`) AS `TechRes`,
sum(`vw_hw_totalspendbyschool`.`Textiles`) AS `Textiles`,
sum(`vw_hw_totalspendbyschool`.`Other`) AS `Other`
from
`vw_hw_totalspendbyschool`
group by `vw_hw_totalspendbyschool`.`TopicId`