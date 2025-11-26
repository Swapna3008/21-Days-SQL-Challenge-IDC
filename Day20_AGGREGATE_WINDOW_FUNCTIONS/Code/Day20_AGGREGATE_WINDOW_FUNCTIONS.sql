/* Challenge Question: Ceate a trend analysis showing for each service and week: 
week number, patients_admitted, running total of patients admitted (cumulative), 
3-week moving average of patient satisfaction (current week and 2 prior weeks), 
and the difference between current week admissions and the service average. Filter for weeks 10-20 only. */
SELECT service, week, patients_admitted, 
SUM(patients_admitted) OVER( partition by service order by week) AS Total_patients_admitted,
ROUND(AVG(patient_satisfaction) OVER(partition by service order by week
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS 3week_avg_patient_sat,
patients_admitted - ROUND(AVG(patients_admitted) OVER(partition by service),2) AS diff_service_avg
FROM services_weekly
WHERE week BETWEEN 10 AND 20;

-- practice question: 1. Calculate running total of patients admitted by week for each service.
SELECT service, week, patients_admitted,
SUM(patients_admitted) OVER( partition by service ORDER BY week) AS Total_patients_admitted
FROM services_weekly;

--  practice question: 2. Find the moving average of patient satisfaction over 4-week periods.
SELECT service, week, patient_satisfaction,
ROUND(AVG(patient_satisfaction) OVER( PARTITION BY service ORDER BY WEEK
ROWS BETWEEN 3 PRECEDING AND CURRENT ROW),2) AS Avg_patient_sat
from services_weekly;

-- practice question: 3. Show cumulative patient refusals by week across all services.
SELECT service, week, patients_refused,
SUM(patients_refused) OVER(ORDER BY week) AS cum_patient_refusals
from services_weekly;
