### Practice Questions:

-- 1. Count the number of patients by each service.
select 
	service, 
	count(*) as cnt_patients 
from patients
group by service;

-- 2. Calculate the average age of patients grouped by service.
select 
	service, 
    avg(age) as avg_age
from patients group by service;

-- 3. Find the total number of staff members per role.
select 
	role, 
	count(*) as cnt_role 
from staff group by role;

### Daily Challenge:
-- For each hospital service, calculate the total number of patients admitted, total patients refused, 
-- and the admission rate (percentage of requests that were admitted). Order by admission rate descending.
select 
	service, 
	sum(patients_admitted) as cnt_patients_admitted, 
	sum(patients_refused) as cnt_patients_refused,
    round(100*sum(patients_admitted)/sum(patients_request), 2) as admission_rate
from services_weekly
group by service;
