/* Challenge Question: For each service, rank the weeks by patient satisfaction score (highest first). 
Show service, week, patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service. */

SELECT * FROM( SELECT service, week, SUM(patient_satisfaction) AS satisfaction_score , SUM(patients_admitted) AS Total_admitted,
ROW_NUMBER() OVER( PARTITION BY service ORDER BY SUM(patient_satisfaction) DESC) AS rnk
FROM services_weekly
GROUP BY service, week ) AS A
WHERE rnk <=3;

-- practice question: 1. Rank patients by satisfaction score within each service.
SELECT patient_id, name, service,satisfaction,
RANK() OVER( PARTITION BY service ORDER BY satisfaction DESC) AS Rnk
FROM patients;

-- practice question: 2. Assign row numbers to staff ordered by their name.
SELECT staff_id, staff_name, service,
ROW_NUMBER() OVER(ORDER BY staff_name) AS rn
FROM staff;

-- practice question: 3. Rank services by total patients admitted.
SELECT service, SUM(patients_admitted) AS Total_admitted,
RANK() OVER(ORDER BY SUM(patients_admitted) DESC) AS rnk
FROM services_weekly
GROUP BY service;
