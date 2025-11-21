/* Challenge Question: Find all patients who were admitted to services that had at least one week 
where patients were refused AND the average patient satisfaction for that service was below the 
overall hospital average satisfaction. Show patient_id, name, service, and their personal satisfaction score. */
SELECT patient_id, name, service, satisfaction FROM patients
WHERE service IN (
    SELECT service from services_weekly
	GROUP BY service
    HAVING MAX( CASE WHEN patients_refused > 0 THEN 1 ELSE 0 END) = 1 AND
    AVG( patient_satisfaction) < (
    SELECT AVG(patient_satisfaction) FROM services_weekly
    ));

USE hospital;
-- Find patients who are in services with above-average staff count.
SELECT * FROM patients
WHERE service IN (
	SELECT service FROM staff
	GROUP BY service
    HAVING COUNT(*) > (
			SELECT avg(staff_count) from (
				SELECT service, COUNT(*) AS staff_count FROM staff
                GROUP BY service
                )AS service_staff_count
			)
);

--  List staff who work in services that had any week with patient satisfaction below 70.
SELECT staff_name FROM staff
WHERE service IN(
	SELECT service FROM services_weekly
	WHERE patient_satisfaction < 70
    );
    
-- Show patients from services where total admitted patients exceed 1000.
SELECT * FROM patients
WHERE service IN (
		SELECT service FROM services_weekly
        GROUP BY service
        HAVING SUM(patients_admitted) > 1000
);
    
    
                
