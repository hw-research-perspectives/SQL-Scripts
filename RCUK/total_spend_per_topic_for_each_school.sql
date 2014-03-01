SELECT TopicId, 
MAX(LifeSciences) as 'Sch of Life Sciences', 
MAX(EngineeringAndPhysical) as  'Sch of Engineering and Physical Science', 
MAX(BuiltEnvironment) as 'Sch of the Built Environment', 
MAX(ManagementAndLanguages) as 'Sch of Management and Languages', 
MAX(Petroleum) as 'Institute Of Petroleum Engineering', 
MAX(Macs) as 'S of Mathematical and Computer Sciences', 
MAX(TechRes) as 'Technology and Research Services', 
MAX(Textiles) as 'Sch of Textiles and Design', 
MAX(Other) as Other
FROM vw_hw_totalspendbyschool
GROUP BY TopicId;
