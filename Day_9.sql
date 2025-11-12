### Practice Questions:

-- 1. Extract the year from all patient arrival dates.
select 
	year(arrival_date) as arrival_year 
from patients;

-- 2. Calculate the length of stay for each patient (departure_date - arrival_date).
select 
	datediff(departure_date, arrival_date) as interval_of_stay 
from patients;

-- 3. Find all patients who arrived in a specific month.
select * from patients where month(arrival_date) = 12;			# I have taken December as an example


### Daily Challenge:
-- Calculate the average length of stay (in days) for each service, showing only services where the average stay is more 
-- than 7 days. Also show the count of patients and order by average stay descending.
select
	service, 
    round(avg(datediff(departure_date, arrival_date)), 2) as avg_interval_of_stay
from patients
group by service
having avg_interval_of_stay > 7;