CREATE TABLE IF NOT EXISTS Department (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL, 
	chief VARCHAR (60)
); 

CREATE TABLE IF NOT EXISTS Employee (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	gender VARCHAR(1),
	id_manager INTEGER NOT NULL REFERENCES Employee(id)
); 

CREATE TABLE IF NOT EXISTS DepartmentEmployee  (
	id SERIAL PRIMARY KEY,
	department_id INTEGER NOT NULL REFERENCES Department(id),
	employee_id INTEGER NOT NULL REFERENCES Employee(id)
);