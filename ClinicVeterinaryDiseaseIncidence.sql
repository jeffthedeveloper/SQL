SELECT
  animal_type,
  age_range,
  breed,
  disease,
  COUNT(*) AS number_of_animals,
  ROUND(COUNT(*) / (SELECT COUNT(*) FROM pets), 2) AS prevalence_rate
FROM
  (
    SELECT
      animal_type,
      CASE
        WHEN age < 1 THEN 'Filhote'
        WHEN age BETWEEN 1 AND 7 THEN 'Adulto Jovem'
        WHEN age BETWEEN 8 AND 15 THEN 'Adulto'
        ELSE 'Idoso'
      END AS age_range,
      breed,
      disease
    FROM
      pets
      JOIN pet_health_records ON pets.pet_id = pet_health_records.pet_id
  ) AS animal_data
GROUP BY
  animal_type,
  age_range,
  breed,
  disease
ORDER BY
  animal_type,
  age_range,
  breed,
  disease;
