CREATE TABLE cohorts (
  id serial PRIMARY KEY NOT NULL,
  name varchar(255) NOT NULL,
  start_date date,
  end_date date
);

CREATE TABLE students (
  id serial PRIMARY KEY NOT NULL,
  name varchar(50) NOT NULL,
  age integer,
  email varchar(255),
  phone varchar(32),
  github varchar(255),
  start_date date,
  end_date date,
  cohort_id integer REFERENCES cohorts (id) ON DELETE CASCADE
);

