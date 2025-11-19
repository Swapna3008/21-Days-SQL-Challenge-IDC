/* Challenge Question: Create a comprehensive service analysis report for week 20 showing: 
service name, total patients admitted that week, total patients refused, average patient satisfaction, count of staff assigned to service, 
and count of staff present that week. Order by patients admitted descending. */

SELECT sw.service,
MAX(sw.patients_admitted) AS Total_patients_admitted,
MAX(sw.patients_refused) AS Total_patients_refused,
ROUND(AVG(sw.patient_satisfaction),2) AS avg_patient_satisfaction,
COUNT(DISTINCT s.staff_id) AS staff_assigned,
COUNT(DISTINCT CASE WHEN ss.present = 1 THEN s.staff_id END) AS staff_present
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id AND sw.week=ss.week
WHERE sw.week = 20
GROUP BY sw.service
ORDER BY Total_patients_admitted DESC;
