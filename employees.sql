#1. Выбрать среднюю зарплату по отделам.
SELECT
	AVG(salaries.salary) AS salary, 
    departments.dept_name AS department 
		FROM 
        departments 
LEFT JOIN 
	dept_emp ON departments.dept_no = dept_emp.dept_no 
LEFT JOIN 
	salaries ON dept_emp.emp_no = salaries.emp_no
GROUP BY department;

# 2. Выбрать максимальную зарплату у сотрудника.
SELECT 
	max(salary) AS max_salary,
	concat(first_name, ' ', last_name) AS employee 
		FROM salaries 
LEFT JOIN 
	employees ON salaries.emp_no = employees.emp_no
GROUP BY 
	employees.emp_no 
ORDER BY 
	max_salary DESC;

#3. Удалить одного сотрудника, у которого максимальная зарплата.
DELETE FROM 
employees 
	WHERE emp_no = (SELECT emp_no FROM salaries HAVING max(salary));

#4. Посчитать количество сотрудников во всех отделах.
SELECT 
	count(employees.emp_no) AS emp_count,
	departments.dept_name AS department 
		FROM employees 
RIGHT JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
RIGHT JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
GROUP BY 
	department 
ORDER BY
	emp_count DESC;

#5. Найти количество сотрудников в отделах и посмотреть сколько всего денег получает отдел.
SELECT 
	count(employees.emp_no) AS emp_count, 
    departments.dept_name AS department, 
    sum(salaries.salary) AS money 
		FROM employees
RIGHT JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no 
RIGHT JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
LEFT JOIN 
	salaries ON employees.emp_no = salaries.emp_no
GROUP BY 
	department 
ORDER BY 
	money DESC;
							  
'\n'							       
