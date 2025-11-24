/*  Challenge Question: Create a comprehensive personnel and patient list showing: 
identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and associated service. 
Include only those in 'surgery' or 'emergency' services. Order by type, then service, then name. */
SELECT * FROM 
	(SELECT patient_id AS Identifier,
		name AS full_name, 'patients' AS 'type', service FROM patients
	WHERE service IN("surgery","emergency")
UNION ALL
	SELECT staff_id AS user_id, staff_name AS full_name, 'staff' AS 'type', service FROM staff
    WHERE service IN ("surgery", "emergency")) AS Details
ORDER BY 'type', service, full_name;

USE Hospital;
-- 1. Combine patient names and staff names into a single list.
SELECT name AS name_list FROM patients
UNION
SELECT staff_name AS name_list FROM staff;
-- 2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT patient_id, name AS patient_name, satisfaction AS patient_satisfaction, 'High Satisfaction' AS category
FROM patients WHERE satisfaction > 90
UNION ALL
SELECT patient_id, name AS patient_name, satisfaction AS patient_satisfaction, 'Low Satisfaction' AS category
FROM patients WHERE satisfaction < 50;
-- 3. List all unique names from both patients and staff tables.
SELECT DISTINCT name AS user_name, 'patient' AS 'type' FROM patients
UNION
SELECT DISTINCT staff_name AS user_name, 'staff' AS 'type' FROM staff;


