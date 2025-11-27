/* Challenge Question: Create a comprehensive hospital performance dashboard using CTEs. 
Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 
2) Staff metrics per service (total staff, avg weeks present), 
3) Patient demographics per service (avg age, count). 
Then combine all three CTEs to create a final report showing service name, all calculated metrics, 
and an overall performance score (weighted average of admission rate and satisfaction). Order by performance score descending. */
Use hospital;
WITH service_metrics AS (
SELECT service, SUM(patients_admitted) AS Total_admissions, SUM(patients_refused) AS Total_refusals, ROUND(AVG(patient_satisfaction),2) AS avg_satisfaction 
FROM services_weekly GROUP BY service),
staff_metrics AS ( 
SELECT service, COUNT(DISTINCT staff_id) AS total_staff, ROUND(SUM(present)/(COUNT(DISTINCT staff_id)), 2) AS avg_weeks_present
FROM staff_schedule GROUP BY service),

patient_demographics AS (
SELECT service, ROUND(AVG(age),2) AS avg_age, COUNT(patient_id) AS Total_patients FROM patients GROUP BY service)
SELECT sm.service, sm.Total_admissions, sm.Total_refusals, sm.avg_satisfaction, stm.Total_staff, stm.avg_weeks_present,pd.avg_age,
pd.Total_patients, 
ROUND((0.7 * (CASE
WHEN (sm.total_admissions + sm.total_refusals) = 0 THEN 0.0 ELSE (sm.total_admissions * 1.0) / (sm.total_admissions + sm.total_refusals)
END)+ 0.3 * (COALESCE(sm.avg_satisfaction, 0) / 100.0)), 2) AS performance_score
FROM service_metrics sm
LEFT JOIN staff_metrics stm ON sm.service = stm.service
LEFT JOIN patient_demographics pd ON sm.service = pd.service
ORDER BY performance_score DESC;
