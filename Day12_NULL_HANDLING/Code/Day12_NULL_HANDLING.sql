/* Challenge Question: Analyze the event impact by comparing weeks with events vs weeks without events. 
Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. 
Order by average patient satisfaction descending. */

Select CASE 
WHEN event IS NULL OR event =' ' OR event ='none' THEN 'No event'
ELSE 'With event'
END AS event_status,
Count(week) AS no_of_weeks,
round(avg(patient_satisfaction),2) AS avg_patient_satisfaction,
round(avg(staff_morale),2) AS avg_staff_morale
From services_weekly
GROUP BY event_status
Order by avg_patient_satisfaction DESC;

-- practice question: 1. Find all weeks in services_weekly where no special event occurred.
USE hospital;
SELECT week,service, event from services_weekly
WHERE event='none' OR event IS NULL OR event = ' ';

-- practice question: 2.Count how many records have null or empty event values.
SELECT count(*) AS No_event
FROM services_weekly
WHERE event IS NULL OR event=' ';

-- practice question:3. List all services that had at least one week with a special event.
select service,week From services_weekly
where event<>'none' AND event IS NOT NULL AND event!=' ';

