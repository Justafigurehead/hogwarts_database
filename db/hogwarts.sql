DROP TABLE houses CASCADE;
DROP TABLE students CASCADE;

CREATE TABLE houses (
id SERIAL4 PRIMARY KEY,
house_name VARCHAR(255) not null
);

CREATE TABLE students (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) not null, 
  last_name VARCHAR(255) not null,
  house_id INT4 references houses(id) ON DELETE CASCADE,
  age INT4
)
