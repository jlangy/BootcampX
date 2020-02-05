const { Pool } = require('pg');
const args = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  host: 'localhost',
  database: 'bootcampx',
  password: '123'
});

pool.query(`
SELECT DISTINCT
  teachers.name AS teacher,
  cohorts.name AS cohort
FROM
  cohorts
  JOIN students ON cohorts.id = cohort_id
  JOIN assistance_requests ON student_id = students.id
  JOIN teachers ON teachers.id = teacher_id
WHERE
  cohorts.name like '%${process.argv[2] || 'FEB12'}%'
ORDER BY
  teacher;
`)
  .then(data => console.log(data.rows))
  .catch(err => console.error('query error', error.stack));