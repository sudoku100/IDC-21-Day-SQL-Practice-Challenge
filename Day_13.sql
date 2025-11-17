### Practice Questions:
-- 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
select 
	distinct p.patient_id, 
    s.staff_id, 
    p.service
FROM patients as p
inner join staff as s on p.service = s.service;

-- 2. Join services_weekly with staff to show weekly service data with staff information.
select 
	distinct sw.week, sw.service,
    ss.staff_id, 
    ss.staff_name, 
    ss.role
from staff_schedule ss
join services_weekly sw on ss.week = sw.week and ss.service = sw.service
order by sw.week;

-- 3. Create a report showing patient information along with staff assigned to their service.
select 
	distinct p.patient_id, 
    p.name as patient_name, 
    s.staff_id, 
    s.staff_name, 
    p.service
from patients as p
inner join staff as s on p.service = s.service;

### Daily Challenge:
-- Create a comprehensive report showing patient_id, patient name, age, service, and the total number of 
-- staff members available in their service. Only include patients from services that have more than 
-- 5 staff members. Order by number of staff descending, then by patient name.
select 
	p.patient_id, 
    p.name as patient_name, 
    p.age, 
    p.service, 
    count(*) as total_staffs_available
from patients as p
inner join staff as s on p.service = s.service
group by 1, 2, 3, 4
having total_staffs_available > 5
order by total_staffs_available desc, patient_name;