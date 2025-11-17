/* Challenge Question: Find all unique combinations of service and event type from the services_weekly table 
where events are not null or none, along with the count of occurrences for each combination. Order by count descending. */

SELECT service, event, COUNT(*) AS count
FROM services_weekly
WHERE event <> 'none' AND event IS NOT NULL
GROUP BY service, event
ORDER BY count DESC;

-- Practice question: 1. List all unique services in the patients table.
USE hospital;
SELECT DISTINCT service FROM patients;

-- practice question: 2. Find all unique staff roles in the hospital.
SELECT DISTINCT role FROM staff;

--  practice question: 3. Get distinct months from the services_weekly table.
SELECT DISTINCT month FROM services_weekly;
