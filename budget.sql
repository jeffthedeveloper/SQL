SELECT
  name,
  email,
  department,
  budget
FROM
  employees
WHERE
  department IN ('Marketing', 'Sales')
AND
  budget > 1800