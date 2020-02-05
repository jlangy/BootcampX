const { Pool } = require('pg');
const args = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  host: 'localhost',
  database: 'bootcampx',
  password: '123'
});

pool.query(`
  select students.id as id, students.name as name, cohorts.name as cohort_name
  from students 
  join cohorts on cohort_id = cohorts.id
  where cohorts.name like $1
  limit $2;
`, [`%${args[0]}%`, args[1]])
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has id ${user.id} and is in cohort ${user.cohort_name}`);
  })
})
.catch(err => console.error('query error', err.stack));