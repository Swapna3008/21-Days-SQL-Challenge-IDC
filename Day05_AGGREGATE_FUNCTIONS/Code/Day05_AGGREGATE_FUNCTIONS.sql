/* Daily Challenge:Calculate the total number of patients admitted, total patients refused
 and the average patient satisfaction across all services and weeks. 
 Round the average satisfaction to 2 decimal places. */
 
 SELECT 
 SUM(patients_admitted) AS Total_patients_admitted,
 SUM(patients_refused) AS Total_patients_refused,
 ROUND(AVG(patient_satisfaction),2) AS Average_patient_satisfaction
 FROM services_weekly;

-- DAY 5 Practice question: 1. Count the total number of patients in the hospital.
USE hospital;
SELECT COUNT(*) AS Total_patients FROM patients;

-- Practice question 2: Calculate the average satisfaction score of all patients.
SELECT AVG(satisfaction) AS Averageg_patient_satisfaction FROM patients;

-- Practice question 3: Find the minimum and maximum age of patients.
SELECT 
MIN(age) AS Minimum_age,
MAX(age) AS Maximun_age 
FROM patients;
