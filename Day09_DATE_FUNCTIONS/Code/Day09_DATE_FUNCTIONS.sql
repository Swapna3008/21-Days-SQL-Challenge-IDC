/* Challenge Question: Calculate the average length of stay (in days) for each service, 
showing only services where the average stay is more than 7 days. 
Also show the count of patients and order by average stay descending. */

SELECT service, COUNT(patient_id) AS patient_count, 
ROUND(AVG(DATEDIFF(departure_date, arrival_date)),2) AS Avg_stay
-- another way Round(avg(timestampdiff(day, arrival_date,departure_date)),2) as avg_stay
FROM patients
GROUP BY service
HAVING Avg_stay > 7
ORDER BY Avg_stay DESC;

-- DAY 9 Practice question: 1. Extract the year from all patient arrival dates.
USE hospital;
SELECT arrival_date, 
EXTRACT(YEAR FROM arrival_date) AS arrival_year
-- another way YEAR(arrival_date) AS arrival_year
FROM patients;

-- Practice question: 2. Calculate the length of stay for each patient (departure_date - arrival_date).
Select arrival_date, departure_date, 
DATEDIFF(departure_date, arrival_date) AS Length_of_stay 
-- another way departure_date - arrival_date AS Length_of_stay 
-- another way TIMESTAMPDIFF(day, arrival_date, departure_date) AS Length_of_stay 
From patients;

-- practice question: 3. Find all patients who arrived in a specific month.
SELECT * FROM patients
WHERE MONTH(arrival_date)= 12;
-- another method WHERE EXTRACT(MONTH FROM arrival_date) = 12;
