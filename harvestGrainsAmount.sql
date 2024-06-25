SELECT
  farm_name,
  SUM(harvest_amount) AS total_harvested_grains
FROM
  harvests
WHERE
  harvest_year = 2023
GROUP BY
  farm_name;
