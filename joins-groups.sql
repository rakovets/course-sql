CREATE DATABASE employees;
USE employees;

CREATE TABLE employees (id INT AUTO_INCREMENT, name VARCHAR(32), PRIMARY KEY (id));
CREATE TABLE salaries (id INT AUTO_INCREMENT, amount INT, employee_id INT, 
				PRIMARY KEY(id), FOREIGN KEY (employee_id) REFERENCES employees(id));
                
INSERT INTO employees (name) VALUES ('Anna');
INSERT INTO employees (name) VALUES ('Max');
INSERT INTO employees (name) VALUES ('Alex');

INSERT INTO salaries (amount, employee_id) VALUES (2000, 1);
INSERT INTO salaries (amount, employee_id) VALUES (3000, 1);
INSERT INTO salaries (amount, employee_id) VALUES (2000, 2);
INSERT INTO salaries (amount, employee_id) VALUES (2500, 2);
INSERT INTO salaries (amount, employee_id) VALUES (2500, 3);
INSERT INTO salaries (amount, employee_id) VALUES (1000, 3);
INSERT INTO salaries (amount, employee_id) VALUES (1500, 3);

SELECT * FROM employees
		JOIN salaries ON salaries.employee_id = employees.id;

SELECT employees.name, SUM(salaries.amount) FROM employees
		JOIN salaries ON salaries.employee_id = employees.id
        GROUP BY employees.name HAVING SUM(salaries.amount) > 4600;
        
SELECT employees.name, SUM(salaries.amount) FROM employees
		JOIN salaries ON salaries.employee_id = employees.id;
		