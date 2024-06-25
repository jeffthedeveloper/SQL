SELECT
  supplier_name,
  COUNT(delivery_id) AS number_of_late_deliveries
FROM
  deliveries
WHERE
  delivery_date > promised_delivery_date
AND
  delivery_date BETWEEN CURRENT_DATE - 180 AND CURRENT_DATE;
