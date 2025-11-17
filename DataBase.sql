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