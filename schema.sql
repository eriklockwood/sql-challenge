DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Department_Employees;
DROP TABLE IF EXISTS Department_Managers;
DROP TABLE IF EXISTS Titles;

CREATE TABLE Employee (
    emp_no INT   NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(255)   NOT NULL,
    dob DATE   NOT NULL,
    first_name VARCHAR(255)   NOT NULL,
    last_name VARCHAR(255)   NOT NULL,
    sex VARCHAR(255)   NOT NULL,
    hire_date DATE   NOT NULL
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL PRIMARY KEY,
    salary INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

CREATE TABLE Titles (
    title_id VARCHAR(255)   NOT NULL PRIMARY KEY,
    title VARCHAR(255)   NOT NULL UNIQUE
);

CREATE TABLE Departments (
    dept_no VARCHAR(255)   NOT NULL PRIMARY KEY,
    dept_name VARCHAR(255)   NOT NULL UNIQUE
);

CREATE TABLE Department_Employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(255)   NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

CREATE TABLE Department_Managers (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(255)   NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);