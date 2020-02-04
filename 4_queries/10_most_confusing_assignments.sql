SELECT
  assignments.id,
  assignments.day,
  assignments.chapter,
  assignments.name,
  count(assignment_id) as total_requests
FROM
  assignments
  JOIN assistance_requests ON assignments.id = assignment_id
  GROUP BY assignments.id
  order by total_requests DESC;

