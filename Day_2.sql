### Practice Questions:
-- 1. Find all patients who are older than 60 years.
select * from patients where age > 60;

-- 2. Retrieve all staff members who work in the 'Emergency' service.
select staff_id, staff_name, service from staff where service = "Emergency";

-- 3. List all weeks where more than 100 patients requested admission in any service.
select distinct week from services_weekly where patients_request > 100;

### Daily Challenge:

-- **Question:** Find all patients admitted to 'Surgery' service with a satisfaction score below 70, 
-- showing their patient_id, name, age, and satisfaction score.
select 
	distinct patient_id, 
    name, age, 
    satisfaction as satisfaction_score
from services_weekly join patients using(service) 
where service = "Surgery" and satisfaction < 70;