/* Daily Challenge:  For each hospital service, 
calculate the total number of patients admitted, total patients refused, and the admission rate 
(percentage of requests that were admitted).Order by admission rate descending. */
SELECT service,
SUM(patients_admitted) AS Total_patients_admitted,
SUM(patients_refused) AS Total_patients_refused,
ROUND((SUM(patients_admitted)/SUM(patients_request))*100,2) AS Admission_rate
FROM services_weekly 
GROUP BY service
ORDER BY admission_rate DESC;

-- DAY 6 Practice question: 1. Count the number of patients by each service.
USE hospital;
SELECT service,
COUNT(patient_id) AS Total_patients
FROM patients
GROUP BY service;

-- Practice question 2: Calculate the average age of patients grouped by service.
SELECT service,
ROUND(AVG(age)) as Avg_age
FROM patients
GROUP BY service;

-- practice question:3. Find the total number of staff members per role.
SELECT role,
COUNT(staff_id) AS Total_staff
FROM staff
GROUP BY role;
