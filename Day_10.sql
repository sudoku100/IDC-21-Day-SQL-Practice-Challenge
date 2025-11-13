### Practice Questions:
-- 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
with cte as 
(select 
	min(satisfaction) m1, 			# Minimum satisfaction score
	avg(satisfaction) as m2, 		# Median value
    max(satisfaction) as m3 		# Maximum satisfaction score
 from patients),
 cte2 as(
 select
	m1,								# Minimum satisfaction score
	round((m1+m2)/2) as m2,			# One third maximum satisfaction score
    round((m2+m3)/2) as m3, 		# Two third maximum satisfaction score
    m3 as m4						# Maximum satisfaction score
from cte
)
select 
	satisfaction, m1, m2, m3, m4,
	case 
		when m1 <= satisfaction and satisfaction < m2 then "Low"
		when m2 <= satisfaction and satisfaction < m3 then "Medium"
		when m3 <= satisfaction and satisfaction <= m4 then "High"
	end as score
from patients join cte2;

-- 2. Label staff roles as 'Medical' or 'Support' based on role type.
select 
	role, 
    case 
		when role = "doctor" then "Medical" 
		else "Support" end as role_type
from staff;

-- 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
select
	age,
    case 
		when age < 19 then "Young"
		when age < 41 then "Middle aged"
		when age < 66 then "Old aged"
		else "Very Old aged"
    end as age_category
from patients;

### Daily Challenge:
-- Create a service performance report showing service name, total patients admitted, and a performance category 
-- based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. 
-- Order by average satisfaction descending.

select
	service,
    sum(patients_admitted) as total_patients_admitted,
    round(avg(patient_satisfaction)) as avg_satisfaction,
    case 
		when round(avg(patient_satisfaction)) >= 85 then "Excellent"
		when round(avg(patient_satisfaction)) >= 75 then "Good"
		when round(avg(patient_satisfaction)) >= 65 then "Need Improvement"
		else "Need Improvemnet"
	end as satifaction_tag
from services_weekly
group by service
order by avg_satisfaction desc;
