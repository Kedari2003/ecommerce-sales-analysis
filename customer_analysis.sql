use ecommerce_analysis;

-- total customers
SELECT
    COUNT(*) AS total_customers
FROM customers;



-- Customers Who Have Placed Orders
SELECT
    COUNT(DISTINCT customer_id) AS customers_with_orders
FROM orders;




-- Top 10 Customers by Revenue
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,

    COUNT(DISTINCT o.order_id) AS total_orders,

    ROUND(
        SUM(
            oi.quantity * oi.unit_price
            - (
                oi.quantity
                * oi.unit_price
                * oi.discount / 100
            )
        )
    ) AS total_revenue

FROM customers c

JOIN orders o
    ON c.customer_id = o.customer_id

JOIN order_items oi
    ON o.order_id = oi.order_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

ORDER BY total_revenue DESC

LIMIT 10;







