SELECT
  state_name,
  (infant_deaths / total_births) AS infant_mortality_rate
FROM
  births_and_deaths
WHERE
  year = 2023;
