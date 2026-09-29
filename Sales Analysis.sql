use ecommerce_analysis;
-- Total Gross Sales
SELECT
    ROUND(SUM(quantity * unit_price), 2) AS total_gross_sales
FROM order_items;

-- Total Discount
SELECT
    ROUND(
        SUM(quantity * unit_price * discount / 100),
        2
    ) AS total_discount
FROM order_items;



-- Net Revenue
SELECT
    ROUND(
        SUM(
            quantity * unit_price
            - (quantity * unit_price * discount / 100)
        ),
        2
    ) AS net_revenue
FROM order_items;


-- Total Units Sold
SELECT
    SUM(quantity) AS total_units_sold
FROM order_items;



-- Average Order Value

SELECT
    ROUND(
        SUM(
            quantity * unit_price
            - (quantity * unit_price * discount / 100)
        )
        / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM order_items;




-- Revenue by Category
SELECT
    c.category_name,

    ROUND(
        SUM(
            oi.quantity * oi.unit_price
            - (
                oi.quantity
                * oi.unit_price
                * oi.discount / 100
            )
        ),
        2
    ) AS net_revenue

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

JOIN categories c
    ON p.category_id = c.category_id

GROUP BY c.category_name

ORDER BY net_revenue DESC;







-- Revenue by Payment Method
SELECT
    o.payment_method,

    COUNT(DISTINCT o.order_id) AS total_orders,

    ROUND(
        SUM(
            oi.quantity * oi.unit_price
            - (
                oi.quantity
                * oi.unit_price
                * oi.discount / 100
            )
        ),
        2
    ) AS net_revenue

FROM orders o

JOIN order_items oi
    ON o.order_id = oi.order_id

GROUP BY o.payment_method

ORDER BY net_revenue DESC;





-- Revenue by Order Status
SELECT
    o.order_status,

    COUNT(DISTINCT o.order_id) AS total_orders,

    ROUND(
        SUM(
            oi.quantity * oi.unit_price
            - (
                oi.quantity
                * oi.unit_price
                * oi.discount / 100
            )
        ),
        2
    ) AS net_revenue

FROM orders o

JOIN order_items oi
    ON o.order_id = oi.order_id

GROUP BY o.order_status

ORDER BY net_revenue DESC;


