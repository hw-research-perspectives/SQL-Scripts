-- view for grants from heriot watt
CREATE OR REPLACE VIEW vw_hw_grants as
SELECT i.GrantTitle, CASE i.OrganisationDepartment WHEN '' THEN 'Other' ELSE i.OrganisationDepartment END as OrganisationDepartment, i.TotalGrantValue FROM information i
WHERE OrganisationName = 'Heriot-Watt University';
