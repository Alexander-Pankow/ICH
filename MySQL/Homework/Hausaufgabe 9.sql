
SELECT * FROM purchase_order_details;
# 1 Для каждого заказа order_id выведите минимальный, максмальный и средний unit_cost

SELECT purchase_order_id,
MIN(unit_cost) OVER (PARTITION BY purchase_order_id) as MIN_,
MAX(unit_cost) OVER (PARTITION BY purchase_order_id) as MAX_,
AVG(unit_cost) OVER (PARTITION BY purchase_order_id) as AVG_
FROM purchase_order_details;                                     # попробывал сначала через "PARITION BY"

SELECT
  purchase_order_id,
  MIN(unit_cost) AS MIN_,
  MAX(unit_cost) AS MAX_,
  AVG(unit_cost) AS AVG_
FROM purchase_order_details
GROUP BY purchase_order_id;

# 2  Оставьте только уникальные строки из предыдущего запроса

SELECT distinct purchase_order_id,
MIN(unit_cost) OVER (PARTITION BY purchase_order_id) as MIN_,
MAX(unit_cost) OVER (PARTITION BY purchase_order_id) as MAX_,
AVG(unit_cost) OVER (PARTITION BY purchase_order_id) as AVG_
FROM purchase_order_details;

SELECT
  purchase_order_id,
  MIN(unit_cost) AS MIN_,
  MAX(unit_cost) AS MAX_,
  AVG(unit_cost) AS AVG_
FROM purchase_order_details
GROUP BY purchase_order_id;

# 3 Посчитайте стоимость продукта в заказе как quantity*unit_cost Выведите суммарную стоимость продуктов с помощью оконной функции
# Сделайте то же самое с помощью GROUP BY

SELECT
  purchase_order_id
  quantity,
  unit_cost,
  quantity * unit_cost AS item_total,
  SUM(quantity * unit_cost) OVER (PARTITION BY  purchase_order_id) AS order_total
FROM purchase_order_details;


SELECT
purchase_order_id,
SUM(quantity * unit_cost) AS order_total
FROM purchase_order_details
GROUP BY purchase_order_id;


#4 Посчитайте количество заказов по дате получения и posted_to_inventory Если оно превышает 1 то выведите '>1' в противном случае '=1'
#Выведите purchase_order_id, date_received и вычисленный столбец

SELECT 
    purchase_order_id,
    date_received,
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) > 1 THEN '>1'
        ELSE '=1'
    END AS status
FROM purchase_order_details;
