-- Which product category generated the most profit for the 'Wiltshire, UK' region in 2021?

SELECT 
    p.category,
    ROUND(SUM((p.sale_price - p.cost_price) * o.product_quantity)::NUMERIC, 2) AS total_profit
FROM orders o
JOIN dim_products p ON o.product_code = p.product_code
JOIN dim_date d ON TO_DATE(o.order_date, 'DD/MM/YYYY') = TO_DATE(d.date, 'DD/MM/YYYY')
JOIN dim_stores s ON s.store_code = o.store_code
WHERE EXTRACT(YEAR FROM TO_DATE(o.order_date, 'DD/MM/YYYY')) = 2021
AND s.country_code = 'GB' AND s.country_region = 'Wiltshire'
GROUP BY p.category
ORDER BY total_profit DESC;

-- A: The 'homeware' category was most profitable in Wiltshire in 2021.