/* Daily Challenge: Retrieve the top 5 weeks with the highest patient refusals across all services, 
showing week, service, patients_refused, and patients_request. 
Sort by patients_refused in descending order. */

SELECT week, service, patients_refused, patients_request FROM services_weekly
ORDER BY patients_refused DESC
LIMIT 5;

-- DAY3 Practice question: 1. List all patients sorted by age in descending order.
USE hospital;
SELECT *FROM patients
ORDER BY age DESC;

-- Practice question 2: Show all services_weekly data sorted by week number ascending and patients_request descending.
SELECT *FROM services_weekly
ORDER BY week ASC, Patients_request DESC;

-- Practice question 3: Display staff members sorted alphabetically by their names.
SELECT *FROM staff
ORDER BY staff_name ASC;

