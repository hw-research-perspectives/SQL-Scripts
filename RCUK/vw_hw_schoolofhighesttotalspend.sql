-- view to get the school of the highest total spend per topic
create or replace VIEW `vw_hw_schoolofhighesttotalspend` AS
SELECT 
    TopicID,
    CASE
        WHEN
            LifeSciences > EngineeringAndPhysical
                AND LifeSciences > BuiltEnvironment
                AND LifeSciences > ManagementAndLanguages
                AND LifeSciences > Petroleum
                AND LifeSciences > Macs
                AND LifeSciences > TechRes
                AND LifeSciences > Textiles
                AND LifeSciences > Other
        THEN
            'Sch of Life Sciences'
        WHEN
            EngineeringAndPhysical > LifeSciences
                AND EngineeringAndPhysical > BuiltEnvironment
                AND EngineeringAndPhysical > ManagementAndLanguages
                AND EngineeringAndPhysical > Petroleum
                AND EngineeringAndPhysical > Macs
                AND EngineeringAndPhysical > TechRes
                AND EngineeringAndPhysical > Textiles
                AND EngineeringAndPhysical > Other
        THEN
            'Sch of Engineering and Physical Science'
        WHEN
            BuiltEnvironment > LifeSciences
                AND BuiltEnvironment > EngineeringAndPhysical
                AND BuiltEnvironment > ManagementAndLanguages
                AND BuiltEnvironment > Petroleum
                AND BuiltEnvironment > Macs
                AND BuiltEnvironment > TechRes
                AND BuiltEnvironment > Textiles
                AND BuiltEnvironment > Other
        THEN
            'Sch of the Built Environment'
        WHEN
            ManagementAndLanguages > LifeSciences
                AND ManagementAndLanguages > BuiltEnvironment
                AND ManagementAndLanguages > EngineeringAndPhysical
                AND ManagementAndLanguages > Petroleum
                AND ManagementAndLanguages > Macs
                AND ManagementAndLanguages > TechRes
                AND ManagementAndLanguages > Textiles
                AND ManagementAndLanguages > Other
        THEN
            'Sch of Management and Languages'
        WHEN
            Petroleum > LifeSciences
                AND Petroleum > BuiltEnvironment
                AND Petroleum > ManagementAndLanguages
                AND Petroleum > EngineeringAndPhysical
                AND Petroleum > Macs
                AND Petroleum > TechRes
                AND Petroleum > Textiles
                AND Petroleum > Other
        THEN
            'Institute Of Petroleum Engineering'
        WHEN
            Macs > LifeSciences
                AND Macs > BuiltEnvironment
                AND Macs > ManagementAndLanguages
                AND Macs > Petroleum
                AND Macs > EngineeringAndPhysical
                AND Macs > TechRes
                AND Macs > Textiles
                AND Macs > Other
        THEN
            'S of Mathematical and Computer Sciences'
        WHEN
            TechRes > LifeSciences
                AND TechRes > BuiltEnvironment
                AND TechRes > ManagementAndLanguages
                AND TechRes > Petroleum
                AND TechRes > Macs
                AND TechRes > EngineeringAndPhysical
                AND TechRes > Textiles
                AND TechRes > Other
        THEN
            'Technology and Research Services'
        WHEN
            Textiles > LifeSciences
                AND Textiles > BuiltEnvironment
                AND Textiles > ManagementAndLanguages
                AND Textiles > Petroleum
                AND Textiles > Macs
                AND Textiles > TechRes
                AND Textiles > EngineeringAndPhysical
                AND Textiles > Other
        THEN
            'Sch of Textiles and Design'
        ELSE 'Other'
    END AS SchoolofHighestTotalSpend
FROM
    vw_hw_totalspendbyschool_in_single_row;