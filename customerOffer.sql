SELECT
  customer_id,
  name,
  address,
  contract_expiration_date
FROM
  customers
WHERE
  address LIKE '%bairro%'
AND
  contract_expiration_date < NOW()
  
  