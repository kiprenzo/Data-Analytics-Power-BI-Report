-- Which German store type had the highest revenue for 2022?

SELECT
s.store_type,
ROUND(SUM(o.product_quantity * p.sale_price)::NUMERIC, 2) AS total_revenue
FROM orders o
JOIN dim_stores s ON o.store_code = s.store_code
JOIN dim_products p ON p.product_code = o.product_code
WHERE s.country_code = 'DE'
GROUP BY s.store_type
ORDER BY total_revenue DESC

-- A: The 'Local' store type generated most revenue in German stores with £1423541.42.