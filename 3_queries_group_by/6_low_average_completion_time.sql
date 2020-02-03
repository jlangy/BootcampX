SELECT
  students.name AS student,
  avg(assignment_submissions.duration) AS average_assignment_duration,
  avg(assignments.duration) as average_estimated_duration
FROM
  students
  JOIN assignment_submissions ON students.id = student_id
  join assignments on assignments.id = assignment_submissions.assignment_id
  where students.end_date is null
GROUP BY
  students.name
Having  avg(assignment_submissions.duration) < avg(assignments.duration)
order by avg(assignment_submissions.duration);

