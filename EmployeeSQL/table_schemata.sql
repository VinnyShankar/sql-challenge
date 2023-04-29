-- DROP TABLES IF THEY EXIST
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

-- CREATE TABLES

CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id varchar(5) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    sex varchar(15) NOT NULL,
    hire_date date NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4)   NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY NOT NULL,
    salary DEC NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- COPY CSV DATA INTO TABLES

-- Departments
COPY departments (
	dept_no,
	dept_name
)
FROM 'D:\data\departments.csv'
DELIMITER ','
CSV HEADER;

-- Titles
COPY titles (
	title_id,
	title
)
FROM 'D:\data\titles.csv'
DELIMITER ','
CSV HEADER;

-- Employees
COPY employees (
	emp_no,
	emp_title_id,
	birth_date,
	first_name,
	last_name,
	sex,
	hire_date
)
FROM 'D:\data\employees.csv'
DELIMITER ','
CSV HEADER;

-- Department employees
COPY dept_emp (
	emp_no,
	dept_no
)
FROM 'D:\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

-- Department managers
COPY dept_manager (
	dept_no,
	emp_no
)
FROM 'D:\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

-- Salaries
COPY salaries (
	emp_no,
	salary
)
FROM 'D:\data\salaries.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;
SELECT * FROM dept_manager;
SELECT * FROM salaries LIMIT 10;