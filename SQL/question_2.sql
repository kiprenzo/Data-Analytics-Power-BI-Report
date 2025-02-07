-- Which month in 2022 has had the highest revenue?

SELECT 
    d.month_number,
    d.month_name,
    SUM(o.product_quantity * p.sale_price) AS total_revenue
FROM orders o
JOIN dim_products p ON o.product_code = p.product_code
JOIN dim_date d ON TO_DATE(o.order_date, 'DD/MM/YYYY') = TO_DATE(d.date, 'DD/MM/YYYY')
WHERE EXTRACT(YEAR FROM TO_DATE(o.order_date, 'DD/MM/YYYY')) = 2022
GROUP BY d.month_number, d.month_name
ORDER BY total_revenue DESC;

-- A: August, with £65953.70



