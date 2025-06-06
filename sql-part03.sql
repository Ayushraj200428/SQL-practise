 CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);
INSERT INTO employee (emp_id, first_name, last_name, department, salary, hire_date) 
VALUES
(1, 'John', 'Doe', 'HR', 50000.00, '2022-01-15'),
(2, 'Jane', 'Smith', 'Finance', 60000.00, '2021-03-22'),
(3, 'Michael', 'Johnson', 'IT', 75000.00, '2020-11-30'),
(4, 'Emily', 'Davis', 'Marketing', 55000.00, '2023-06-10'),
(5, 'William', 'Brown', 'Operations', 58000.00, '2022-09-05');
CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
INSERT INTO project (project_id, project_name, emp_id, start_date, end_date) 
VALUES
(101, 'Employee Management System', 1, '2024-01-01', '2024-06-30'),
(102, 'Financial Dashboard', 2, '2024-02-15', '2024-08-15'),
(103, 'Cloud Migration', 3, '2024-03-01', '2024-09-30'),
(104, 'Marketing Campaign', 3, '2024-04-01', '2024-07-31'),
(105, 'Logistics Optimization', 5, '2024-05-01', '2024-10-31');
SELECT * FROM employee;
SELECT * FROM project;

-- ENLIST ALL THE EMPLOYEE ID,NAME ALONG WITH THE PROJECT ALLOCATED TO THEM
-- INNER JOIN

SELECT e.emp_id,e.first_name,e.last_name ,p.project_id,p.project_name 
FROM EMPLOYEE AS e INNER JOIN PROJECT AS p 
ON e.emp_id = p.emp_id;

-- LIST ALL THE PROJECT ALONG WITH EMPLOYEE NAME AND THEIR DEPARTMENT
-- RIGHT JOIN

SELECT e.EMP_ID,e.first_name,e.last_name,p.project_id,p.project_name FROM EMPLOYEE AS e
RIGHT JOIN PROJECT AS p
ON e.emp_id = p.emp_id;

-- FETCH OUT EACH PROJECT ALLOCATED TO EACH EMPLOYEE
-- LEFT JOIN

SELECT e.EMP_ID,e.first_name,e.last_name,p.project_id,p.project_name FROM EMPLOYEE AS e
LEFT JOIN PROJECT AS p
ON e.emp_id = p.emp_id;

-- LIST DOWN ALL THE POSSIBLE COMBINATION FOR THE EMPLOYEE NAME AND PROJECT THAT CAN EXIST
-- CROSS JOIN

SELECT e.EMP_ID,e.first_name,e.last_name,p.project_id,p.project_name FROM EMPLOYEE AS e
CROSS JOIN PROJECT AS p;

-- VIEW

CREATE VIEW customer_view AS SELECT FIRST_NAME,SALARY FROM EMPLOYEE;
SELECT * FROM customer_view;

-- ALTER

ALTER  VIEW customer_view AS SELECT FIRST_NAME,SALARY,DEPARTMENT FROM EMPLOYEE;
DROP VIEW IF EXISTS customer_view;
