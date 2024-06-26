SELECT e.employeeid, e.firstname, e.lastname, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.employeeid=s.employeeid;

SELECT e.firstname, e.lastname, e.hiredate
FROM employees AS e
WHERE EXTRACT(YEAR FROM e.hiredate)=1986;

SELECT m.departmentid, d.departmentname, e.employeeid, e.lastname, e.firstname
FROM departments AS d
INNER JOIN departmentmanagers AS m
ON d.departmentid=m.departmentid
INNER JOIN employees AS e
ON m.employeeid=e.employeeid;

SELECT d.departmentid, e.employeeid, e.lastname, e.firstname, d.departmentname
FROM departments AS d
INNER JOIN departmentemployees AS de
ON d.departmentid=de.departmentid
INNER JOIN employees AS e
ON de.employeeid=e.employeeid;

SELECT e.firstname, e.lastname, e.sex
FROM employees AS e
WHERE e.firstname='Hercules' AND e.lastname LIKE 'B%';

SELECT e.employeeid, e.lastname, e.firstname
FROM employees AS e
INNER JOIN departmentemployees AS de
ON e.employeeid=de.employeeid
INNER JOIN departments AS d
ON de.departmentid=d.departmentid
WHERE d.departmentname='Sales';

SELECT e.employeeid, e.lastname, e.firstname, d.departmentname
FROM employees AS e
INNER JOIN departmentemployees AS de
ON e.employeeid=de.employeeid
INNER JOIN departments AS d
ON de.departmentid=d.departmentid
WHERE d.departmentname='Sales' OR d.departmentname='Development';

SELECT e.lastname, COUNT(*) AS employee_count
FROM employees AS e
GROUP BY e.lastname
ORDER BY e.lastname;