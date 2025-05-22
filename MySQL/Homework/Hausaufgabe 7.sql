
-- 1 Вывести названия продуктов таблица products,
-- включая количество заказанных единиц quantity для каждого продукта таблица order_details.
-- Решить задачу с помощью cte и подзапроса

WITH CTE AS (
    SELECT product_id, SUM(quantity) AS total_quantity
    FROM order_details
    GROUP BY product_id
)
SELECT 
    p.product_name,
    (SELECT total_quantity FROM CTE WHERE CTE.product_id = p.id) AS quantity
FROM products p
WHERE p.id IN (SELECT product_id FROM CTE);

SELECT *from products;
SELECT * from order_details;

-- 2  Найти все заказы таблица orders,
--  сделанные после даты самого первого заказа клиента Lee таблица customers.
SELECT customer_id,order_date FROM orders;
SELECT * FROM customers;

SELECT * FROM orders
WHERE order_date > (
    SELECT MIN(order_date)
    FROM orders
    WHERE customer_id IN (     # Lee в таблице 2-е поэтому сделал через "IN" а не через "="
        SELECT id
        FROM customers
        WHERE last_name = 'Lee'
    )
);

-- 3 Найти все продукты таблицы  products c максимальным target_level

SELECT *
FROM products
WHERE target_level = (
    SELECT MAX(target_level)
    FROM products
);


SELECT MAX(target_level) FROM products;


