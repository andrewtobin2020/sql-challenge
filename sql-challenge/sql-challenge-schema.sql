-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
    dept_no VARCHAR   PRIMARY KEY,
    dept_name VARCHAR   NOT NULL,
    --CONSTRAINT pk_Departments PRIMARY KEY (
        --dept_no
     --)
	UNIQUE (dept_name)
);

CREATE TABLE employees (
    emp_no INT   PRIMARY KEY,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL
    --CONSTRAINT pk_Employees PRIMARY KEY (
        --emp_no
     --)
	
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR   NOT NULL,
    --CONSTRAINT pk_Dept_emp PRIMARY KEY (
        --emp_no
     --)
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)

);

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT,
    --CONSTRAINT pk_Dept_manager PRIMARY KEY (
        --emp_no
     --)
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);



CREATE TABLE salaries (
    emp_no INT   PRIMARY KEY,
    salary INT   NOT NULL,
    --CONSTRAINT pk_Salaries PRIMARY KEY (
        --emp_no
     --)
	UNIQUE (emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR   PRIMARY KEY,
    title VARCHAR   NOT NULL
    --CONSTRAINT pk_Titles PRIMARY KEY (
        --title_id
     --)
	--UNIQUE (title_id)
);


ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

 