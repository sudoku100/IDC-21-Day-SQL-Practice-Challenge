### Practice Questions:
-- 1. Join patients, staff, and staff_schedule 
-- to show patient service and staff availability.
select
	patient_id, name as patient_name, staff_id, staff_name, 
    role, service, week, present
from patients
inner join staff_schedule using(service)
order by patient_id;

-- 2. Combine services_weekly with staff and 
-- staff_schedule for comprehensive service analysis.
select 
	sw.*, ss.staff_id, ss.staff_name, 
    ss.role, ss.service, ss.week, ss.present
from services_weekly sw
join staff_schedule ss on ss.week = sw.week 
and ss.service = sw.service;

-- 3. Create a multi-table report showing patient admissions with staff information.
select 
	p.*, s.staff_id, s.staff_name, s.role
from patients p
join staff s on p.service = s.service;

### Daily Challenge:
-- Create a comprehensive service analysis report for week 20 showing: 
-- service name, total patients admitted that week, total patients refused, 
-- average patient satisfaction, count of staff assigned to service, and 
-- count of staff present that week. Order by patients admitted descending.
select 
	sw.week, sw.service, sum(patients_admitted) cnt_patients_admitted, 
    sum(patients_refused) cnt_patients_refused, 
    avg(patient_satisfaction) avg_satisfaction,
    count(present) as cnt_staff, sum(present) as cnt_present
from services_weekly sw
join staff_schedule sc on sw.week = sc.week and sw.service = sc.service
where sw.week = 20
group by week, service
order by cnt_patients_admitted desc;