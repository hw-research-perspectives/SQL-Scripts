-- view to get the total spend per topic for each school in a single row
create or replace VIEW vw_hw_totalspendbyschool_in_single_row AS
select TopicID,
sum(LifeSciences) AS LifeSciences,
sum(EngineeringAndPhysical) AS EngineeringAndPhysical,
sum(BuiltEnvironment) AS BuiltEnvironment,
sum(ManagementAndLanguages) AS ManagementAndLanguages,
sum(Petroleum) AS Petroleum,
sum(Macs) AS Macs,
sum(TechRes) AS TechRes,
sum(Textiles) AS Textiles,
sum(Other) AS Other
from vw_hw_totalspendbyschool
group by TopicID
