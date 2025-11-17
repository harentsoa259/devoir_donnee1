-- 1
SELECT id, first_name, last_name
FROM employee
WHERE team_id IS NULL;

-- 2
SELECT id, first_name, last_name
FROM employee
WHERE id NOT IN (SELECT employee_id FROM leave);

-- 3
SELECT l.id,l.start_date,l.end_date,e.first_name,e.last_name,t.name
FROM leave l
JOIN employee e ON l.employee_id = e.id
LEFT JOIN team t ON e.team_id = t.id;

-- 4
SELECT employee.contract_type,
COUNT(employee.contract_type) AS total
FROM employee
GROUP BY employee.contract_type;

-- 5
SELECT COUNT(*)
FROM leave
WHERE CURDATE() >= start_date
  AND CURDATE() <= end_date;

-- 6
SELECT employee.id,employee.first_name,employee.last_name,team.name
FROM employee
INNER JOIN leave
ON employee.id = leave.employee_id
LEFT JOIN team
ON employee.team_id = team.id
WHERE CURDATE() >= leave.start_date
  AND CURDATE() <= leave.end_date;