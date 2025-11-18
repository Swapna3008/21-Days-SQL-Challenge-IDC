/* Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) 
and the count of weeks they were present (from staff_schedule). 
Include staff members even if they have no schedule records. Order by weeks present descending. */

select s.staff_id, s.staff_name,s.role,s.service,
COALESCE(COUNT(ss.week),0) AS weeks_present FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id= ss.staff_id AND ss.present =1
GROUP BY s.staff_id, s.staff_name,s.role,s.service
ORDER BY weeks_present DESC;

-- practice question:1. Show all staff members and their schedule information (including those with no schedule entries).
USE hospital;
SELECT 
s.staff_id, s.staff_name,
COUNT(ss.week) as Total_weeks,
SUM(COALESCE(ss.present,0)) AS present  FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY s.staff_id, s.staff_name;

/* practice question: 2.List all services from services_weekly and their corresponding staff 
(show services even if no staff assigned) */
SELECT sw.week,sw.month,sw.service, sw.available_beds,s.staff_name, s.role FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service;

-- practice question: 3. Display all patients and their service's weekly statistics (if available).
SELECT p.patient_id,p.name,p.satisfaction,sw.week, sw.month, sw.service,sw.event FROM patients p
LEFT JOIN services_weekly sw ON p.service = sw.service

