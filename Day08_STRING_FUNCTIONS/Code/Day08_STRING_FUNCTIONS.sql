/* Daily Challenge: Create a patient summary that shows patient_id, full name in uppercase, 
service in lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), 
and name length. Only show patients whose name length is greater than 10 characters. */
SELECT patient_id, UPPER(name) AS Name_upper, LOWER(service) AS Service_lower,
CASE
WHEN age >=65 THEN 'Senior'
WHEN age >= 18 THEN 'Adult'
ELSE 'Minor'
END AS Age_category,
LENGTH(name) AS Name_length
FROM patients WHERE LENGTH(name) >10;

-- DAY 8 Practice question: 1. Convert all patient names to uppercase.
USE hospital;
select 
UPPER(name) AS Name_uppercase
FROM patients;

-- Practice question: 2. Find the length of each staff member's name.
SELECT staff_name,
LENGTH(staff_name) AS staffname_length
FROM staff;

-- practice question: 3. Concatenate staff_id and staff_name with a hyphen separator.
SELECT 
CONCAT(staff_id,' - ',staff_name) AS Staff_ID_Name
FROM staff;
