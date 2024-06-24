SELECT category, SUM(price) AS total_price
FROM products
GROUP BY category;