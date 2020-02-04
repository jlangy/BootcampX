SELECT
  cohorts.name as cohort,
  sum(completed_at - started_at) AS total_duration
FROM
  assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohort_id = cohorts.id
group by cohort
order by total_duration;