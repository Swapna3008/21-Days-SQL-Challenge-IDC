/* DAY 1 Practice Questions
1. Retrieve all columns from the patients table. */

SELECT * FROM hospital.patients;

-- 2. Select only the patient_id, name, and age columns from the patients table.

SELECT patient_id, name, age FROM patients;

 -- 3. Display the first 10 records from the services_weekly table.

 SELECT *FROM services_weekly
 LIMIT 10;

/* DAY 1 CHALLENGE 
List all unique hospital services available in the hospital */

USE hospital;
SELECT * FROM services_weekly;
SELECT distinct service AS services_available FROM services_weekly;
