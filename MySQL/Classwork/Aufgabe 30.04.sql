
#!
select *,
count(o.id) OVER (PARTITION BY o.customer_id) CNT_,
ROUND(sum(od.unit_price*od.quantity) over (PARTITION BY o.customer_id),2) SUM_
 from orders o
 join order_details od
 on o.id = od.order_id
 ;
 
 #2
 
 select *
,round((MAX_-list_price)/MAX_*100,2) 
 from (
SELECT product_name,list_price,
MAX(list_price) OVER () AS MAX_
 FROM products
 )a order by product_name
 ;
 
 
 SELECT product_name, 
 (MAX(list_price) OVER () - list_price)/(MAX(list_price) OVER ())*100
FROM products
order by product_name;
#3
select 
count(id) over (PARTITION BY category) cnt_,
product_name,  
category
 from products
 order by category,product_name;
 
 
 select 
count(id) over (PARTITION BY category) cnt_,
product_name,  
category
 from products
 order by category,product_name;
 
 with cte as 
 (
 select 
category,
product_name
 from products
 group by 
 category,
 product_name
 ),
 cte2 
 as 
 (
  select 
category,
count(1) cnt
 from products
 group by 
 category
 )
 select 
 cte2.cnt
 ,cte.product_name
 ,cte.category
 from cte
 join cte2 
 on cte.category = cte2.category
 order by cte.category,cte.product_name;
 
 #4
 
 select standard_cost - avg(list_price) over () stcost_avg_,
avg(list_price) over () avg_,
p.*
 from products as p;
 
 
 #5
 
 with cte as 
(
select AVG(list_price) as AVG_ FROM products
)

SELECT 
p.product_name, 
p.list_price,
p.standard_cost,
c.AVG_
 FROM products AS p
 CROSS JOIN cte c
 ;
 
 with cte as 
(
select AVG(list_price) as AVG_ FROM products
)

SELECT 
p.product_name, 
p.list_price,
p.standard_cost,
p.standard_cost - c.AVG_ STD_COST_AVG,
c.AVG_
 FROM products AS p
JOIN cte c
on 1=1
 order by p.product_name
 ;
 
 # 
 select *,
sum(quantity) over (partition by CAST(transaction_created_date as date) order by transaction_created_date) sum_
 from inventory_transactions;
 
 select *,
sum(shipping_fee) over (order by ship_name ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) sum_,
sum(shipping_fee) over (order by ship_name ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) sum_1
 from orders;
 
 #Для каждого заказа order_id выведите минимальный, максмальный и средний unit_price.

SELECT order_id,
MIN(unit_price) OVER (PARTITION BY order_id) as MIN_,
MAX(unit_price) OVER (PARTITION BY order_id) as MAX_,
AVG(unit_price) OVER (PARTITION BY order_id) as AVG_,
COUNT(unit_price) OVER (PARTITION BY order_id) as COUNT_,
SUM(unit_price) OVER (PARTITION BY order_id) as SUM_
 
 FROM order_details;

#Оставьте только уникальные строки из предыдущего запроса.

WITH cte as (
SELECT MIN(unit_price) over (PARTITION BY order_id) as min_unit_price,
MAX(unit_price) over (PARTITION BY order_id) as max_unit_price,
AVG(unit_price) over (PARTITION BY order_id) as avg_unit_price,
o.* from order_details as o
)
#SELECT DISTINCT (cte.order_id), min_unit_price, max_unit_price, avg_unit_price  from cte;

#variant 2
#select cte.order_id, min_unit_price, max_unit_price, avg_unit_price  from cte
#GROUP BY cte.order_id, min_unit_price, max_unit_price, avg_unit_price;

# variant 3
#select cte.order_id, min_unit_price, max_unit_price, avg_unit_price  from cte
#UNION
#select cte.order_id, min_unit_price, max_unit_price, avg_unit_price  from cte;

#variant 4
select * 
(select cte.order_id, min_unit_price, max_unit_price, avg_unit_price , 
ROW_NUMBER() over (PARTITION BY cte.order_id) as rn
from cte) ;

# variant 5 - mit subquery
SELECT * from
(
select cte.order_id, min_unit_price, max_unit_price, avg_unit_price , 
ROW_NUMBER() over (PARTITION BY cte.order_id ORDER BY cte.order_id) as rn
 from cte
) as query_
where rn = 1;

#Посчитайте стоимость продукта в заказе как quantity*unit_price Выведите суммарную стоимость продуктов с помощью оконной функции. Сделайте то же самое с помощью GROUP BY.

# variant 1 - mit dem Fensterfunction
select round(quantity*unit_price,2)  as kost_product_id,
round(sum(quantity*unit_price) over (PARTITION BY order_id),3) as sum_order,
od.* 
from order_details as od
ORDER BY order_id;


SELECT round(quantity*unit_price,2) as amount,
      round((sum(quantity*unit_price) OVER (PARTITION BY order_id)),2) as am_order,
      od.*
FROM order_details as od
ORDER BY order_id; 



WITH cte1 as (
SELECT *
FROM order_details
),
cte2 as(
SELECT order_id,
       sum(quantity*unit_price) as amount
       FROM order_details as o
       GROUP BY order_id
       ORDER BY order_id 
       )
SELECT 
      cte2.amount,
      cte1.* 
FROM cte1
join cte2
ON cte1.order_id=cte2.order_id
ORDER BY cte1.order_id       ;
#Таблица purchase_order_details

#Посчитайте количество продуктов в каждом заказе с учетом их статуса с помощью оконной функции.
select pod.purchase_order_id, po.status_id,
round(sum(pod.quantity) over (partition by pod.purchase_order_id, po.status_id),2) as sum_
from purchase_order_details as pod
join purchase_orders as po
on pod.purchase_order_id=po.id;


select *, 
round(count(product_id) over (partition by purchase_order_id),2) as count_
from purchase_order_details;
#Посчитайте кумулятивную количество товаров quantity по дате получения date_received.
select *,
 sum(quantity) over (order by date_received, id) as sum_
 from purchase_order_details
 ;
#Посчитайте кумулятивную выручку quantity*unit_cost по дате получения date_received для каждого product_id.
 