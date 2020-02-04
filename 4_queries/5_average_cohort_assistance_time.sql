SELECT
  cohorts.name AS name,
  avg(completed_at - started_at) AS average_assistance_time
FROM
  assistance_requests
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
GROUP BY
  cohorts.name
  order by average_assistance_time;
