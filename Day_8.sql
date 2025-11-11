### Practice Questions:
-- 1. Convert all patient names to uppercase.
select 
	upper(name) as upper_name
from patients;

-- 2. Find the length of each staff member's name.
select 
	length(staff_name) as staff_name_length
from staff;

-- 3. Concatenate staff_id and staff_name with a hyphen separator.
select 
	concat(staff_id,'-',staff_name) as staff_id_staff_name
from staff;

### Daily Challenge:
-- Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category 
-- (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. Only show patients whose 
-- name length is greater than 10 characters.

select 
	patient_id, 
	upper(name) as full_name_upper,
	lower(service) as service_lower,
    case 
		when age >= 65 then "Senior"
		when age >= 18 then "Adult"
		else "Minor"
	end as age_category,
    length(name) as name_length
from patients
where length(name) > 10;
