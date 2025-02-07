-- Create a view where the rows are the store types and the columns
-- are the total sales, percentage of total sales and the count of orders.

-- CREATE VIEW store_type_sales_summary AS
SELECT
    s.store_type,
    ROUND(SUM(o.product_quantity * p.sale_price)::NUMERIC, 2) AS total_sales,
    ROUND(
        (SUM(o.product_quantity * p.sale_price) * 100.0 / 
        SUM(SUM(o.product_quantity * p.sale_price)) OVER ())::NUMERIC, 
        2
    ) AS revenue_percentage,
    COUNT(*) AS total_orders
FROM orders o
JOIN dim_stores s ON o.store_code = s.store_code
JOIN dim_products p ON p.product_code = o.product_code
GROUP BY s.store_type
ORDER BY total_sales DESC;

