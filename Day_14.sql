### Practice Questions:
-- 1. Show all staff members and their schedule information (including those with no schedule entries).
select 
	s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    COUNT(ss.week) AS weeks_scheduled,
    SUM(COALESCE(ss.present, 0)) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service;

-- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
select 
	sw.service,
    COUNT(staff_id) AS staff_count
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service
GROUP BY sw.service;

-- 3. Display all patients and their service's weekly statistics (if available).
select
	sw.service,
    sw.week,
    COUNT(p.patient_id) AS patient_count
FROM services_weekly sw
LEFT JOIN patients p ON sw.service = p.service
GROUP BY sw.service, sw.week;

### Daily Challenge:
-- Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and the 
-- count of weeks they were present (from staff_schedule). Include staff members even if they have no 
-- schedule records. Order by weeks present descending.

-- All staff with their schedule (including staff with no schedule)SELECT
select
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    COUNT(ss.week) AS weeks_scheduled,
    SUM(COALESCE(ss.present, 0)) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service;



