-- view for grants from heriot watt
CREATE OR REPLACE VIEW `meng_rcuk`.`vw_hw_grants` AS
    select 
        `i`.`ID` AS `ID`,
        `i`.`GrantRefNumber` AS `GrantRefNumber`,
        `i`.`GrantTitle` AS `GrantTitle`,
        `i`.`GrantCategory` AS `GrantCategory`,
        (case `i`.`OrganisationDepartment`
            when '' then 'Other'
            else `i`.`OrganisationDepartment`
        end) AS `OrganisationDepartment`,
        `i`.`TotalGrantValue` AS `TotalGrantValue`,
        `i`.`StartDate` AS `StartDate`,
        `i`.`EndDate` AS `EndDate`,
        `i`.`Funder` AS `Funder`
    from
        `meng_rcuk`.`information` `i`
    where
        (`i`.`OrganisationName` = 'Heriot-Watt University');