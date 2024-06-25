SELECT
  patient_id,
  first_name,
  last_name,
  admission_date
FROM
  patients
WHERE
  admission_date >= CURRENT_DATE - 30
AND
  discharge_date IS NULL;
