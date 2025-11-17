/* Challenge question: Create a service performance report showing service name, total patients admitted, 
and a performance category based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, 
otherwise 'Needs Improvement'. Order by average satisfaction descending. */
SELECT service, 
SUM(patients_admitted) AS Total_patients_admitted,
ROUND(AVG(patient_satisfaction)) AS avg_satisfaction,
CASE
WHEN AVG(patient_satisfaction)>=85 THEN 'Excellent'
WHEN AVG(patient_satisfaction)>=75 THEN 'Good'
WHEN AVG(patient_satisfaction)>=65 THEN 'Fair'
ELSE 'Needs Improvement'
END AS performance_category
FROM services_weekly
GROUP BY service ORDER BY AVG(patient_satisfaction) DESC;

-- Practice question: 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
USE hospital;
SELECT name, satisfaction,
CASE
WHEN satisfaction >= 90 THEN 'High'
WHEN satisfaction >=70 THEN 'Medium'
ELSE 'Low'
END AS Satisfaction_category
FROM patients;

-- practice question: 2. Label staff roles as 'Medical' or 'Support' based on role type.
SELECT staff_name, role,
CASE
WHEN role IN ('doctor','nurse') THEN 'Medical'
ELSE 'Support'
END AS role_classification
FROM staff;

-- practice question: 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT name, age,
CASE 
WHEN age <=18 THEN 'Child'
WHEN age BETWEEN 19 AND 40 THEN 'Adult'
WHEN age BETWEEN 41 AND 65 THEN 'Middle-aged'
ELSE 'Senior'
END AS age_groups
FROM patients;

