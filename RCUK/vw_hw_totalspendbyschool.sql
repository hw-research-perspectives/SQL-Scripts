-- view to get the total spend per topic for each school
create or replace view vw_hw_totalspendbyschool as
select t.TopicId,
(case i.OrganisationDepartment when 'Sch of Life Sciences' then sum(i.TotalGrantValue) else 0 end) AS LifeSciences,
(case i.OrganisationDepartment when 'Sch of Engineering and Physical Science' then sum(i.TotalGrantValue) else 0 end) AS EngineeringAndPhysical,
(case i.OrganisationDepartment when 'Sch of the Built Environment' then sum(i.TotalGrantValue) else 0 end) AS BuiltEnvironment,
(case i.OrganisationDepartment when 'Sch of Management and Languages' then sum(i.TotalGrantValue) else 0 end) AS ManagementAndLanguages,
(case i.OrganisationDepartment when 'Institute Of Petroleum Engineering' then sum(i.TotalGrantValue) else 0 end) AS Petroleum,
(case i.OrganisationDepartment when 'S of Mathematical and Computer Sciences' then sum(i.TotalGrantValue) else 0 end) AS Macs,
(case i.OrganisationDepartment when 'Technology and Research Services' then sum(i.TotalGrantValue) else 0 end) AS TechRes,
(case i.OrganisationDepartment when 'Sch of Textiles and Design' then sum(i.TotalGrantValue) else 0 end) AS Textiles,
(case i.OrganisationDepartment when 'Other' then sum(i.TotalGrantValue) else 0 end) AS Other 
from vw_hw_grants i 
join topicmap_grants_100 t on(i.ID = t.ID) 
where Proportion > 0.04
group by t.TopicID,i.OrganisationDepartment;
