/* Challenge question:  Create a comprehensive report showing patient_id, patient name, age, service, 
and the total number of staff members available in their service. 
Only include patients from services that have more than 5 staff members. 
Order by number of staff descending, then by patient name.*/
SELECT p.patient_id, p.name as patient_name, p.age, p.service, 
COUNT(staff_name) AS Total_staff FROM patients p
INNER JOIN staff s ON p.service = s.service
GROUP BY p.patient_id, p.name, p.age, p.service
HAVING Total_staff >5
ORDER BY Total_staff DESC, p.name;

-- practice question: 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
USE hospital;
SELECT  
p.name AS patient_name, 
s.staff_name
FROM patients p
INNER JOIN staff s ON p.service = s.service;

-- practice question: 2. Join services_weekly with staff to show weekly service data with staff information.
SELECT 
sw.*, 
s.staff_name
FROM services_weekly sw
INNER JOIN staff s
ON sw.service = s.service;

-- practice question: 3. Create a report showing patient information along with staff assigned to their service.
select 
p.*, 
s.staff_name 
from patients p
INNER JOIN staff s
ON p.service = s.service;
