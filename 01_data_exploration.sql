use ecommerce_analysis;
-- total recods
SELECT COUNT(*) AS total_categories
FROM categories;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_items
FROM order_items;


-- category types
select category_id, category_name from categories
order by category_id;


-- what is product catalog
select p.product_id, p.product_name,c.category_name,p.price from products p
join categories c on p.category_id = c.category_id
order by p.price desc;



-- What is our price range?
SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    ROUND(AVG(price), 2) AS average_price
FROM products;


-- What payment methods are being used?
SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method
ORDER BY total_orders DESC;


-- What is the order-status distribution?
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- What period does our data cover?
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date
FROM orders;