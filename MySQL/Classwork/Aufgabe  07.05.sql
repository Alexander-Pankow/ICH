
with cte as 
(
select 'Ivan' name_,'Petrenko' lastname_, 'Hamburg' city, 5 wohnen_tag
union 
select 'Ivan' name_,'Petrenko' lastname_,  'Berlin' city, 10 wohnen_tag
)

select 
	name_,lastname_,
	sum(wohnen_tag) wohnen_tag_
		from cte
			group by name_,lastname_


WITH Sales AS (
    SELECT 1 AS ProductID, 
		      10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' dte UNION ALL
    SELECT 2, 10, 300,'2020-01-01' dte UNION ALL
    
     SELECT 6, 10, 300,'2020-01-01' dte UNION ALL
    
    SELECT 3, 10, 200,'2020-01-01' 

),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        RANK() OVER (PARTITION BY DepartmentID ORDER BY SaleAmount DESC) AS Rank_
    FROM Sales
)
SELECT *
FROM RANK_;



WITH Sales AS (
    SELECT 1 AS ProductID, 
		      10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' dte UNION ALL
    SELECT 2, 10, 300,'2020-01-01' dte UNION ALL
    
     SELECT 6, 10, 300,'2020-01-01' dte UNION ALL
    
    SELECT 3, 10, 200,'2020-01-01' 
),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY SaleAmount DESC) AS Rank_
    FROM Sales
)
SELECT *
FROM RANK_;


WITH Sales AS (
    SELECT 1 AS ProductID, 
		      10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' dte UNION ALL
    SELECT 2, 10, 300,'2020-01-01' dte UNION ALL
    
     SELECT 6, 10, 300,'2020-01-01' dte UNION ALL
    
    SELECT 3, 10, 200,'2020-01-01' 
),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        NTILE(1) OVER (PARTITION BY DepartmentID) AS Rank_
    FROM Sales
)
SELECT *
FROM RANK_;

WITH Sales AS (
    SELECT 1 AS ProductID, 
		      10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' AS dte1 UNION ALL
    SELECT 2, 10, 300,'2020-01-01' AS dte1 UNION ALL
    
     SELECT 6, 20, 200,'2020-01-01' AS asdfsdzffsdsdfsdfsdfsdfsdf UNION ALL
    
    SELECT 3, 20, 500,'2020-01-01'  UNION ALL
    
        SELECT 3, 20, 400,'2020-01-01'  
),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        dte1,
        DENSE_RANK () over  (partition by DepartmentID order BY SaleAmount desc) AS Rank_
    FROM Sales
)
SELECT *
FROM RANK_;

#Присвоить ранг продукту без пропусков значений в ранге от больше себестоимости к меньшей.
# Вывести ТОП 10 продуктов product_name.

SELECT product_name, standard_cost,
DENSE_RANK () OVER (ORDER BY standard_cost DESC) as D_RANK
 FROM products
 LIMIT 10;

#Пронумеровать строки в таблице в зависимости от названия товара от A до Z.

SELECT product_name,
row_number() over (order by product_name ASC) as rn
FROM products;

#Разделить все продукты на 4 равных группы в зависимости от list_price. 

select product_name, list_price,
NTILE(4) OVER (ORDER BY list_price) AS rrrr
from products;


# новая лекция
WITH Sales AS (
    SELECT 1 AS ProductID, 
        10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' AS dte1 UNION ALL
    SELECT 2, 10, 300,'2020-01-02' AS dte1 UNION ALL
    
     SELECT 6, 20, 200,'2020-01-03' AS asdfsdzffsdsdfsdfsdfsdfsdf UNION ALL
    
    SELECT 3, 20, 500,'2020-01-04'  UNION ALL
    
        SELECT 3, 20, 400,'2020-01-05'  
),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        dte1,
        LEAD(dte1) over  (partition by DepartmentID order BY dte1) AS Rank_
    FROM Sales
)
SELECT *
FROM RANK_


WITH Sales AS (
    SELECT 1 AS ProductID, 
		      10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' AS dte1 UNION ALL
    SELECT 2, 10, 300,'2020-01-02' AS dte1 UNION ALL
    
     SELECT 6, 20, 200,'2020-01-03' AS asdfsdzffsdsdfsdfsdfsdfsdf UNION ALL
    
    SELECT 3, 20, 500,'2020-01-04'  UNION ALL
    
        SELECT 3, 20, 400,'2020-01-05'  
),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        dte1,
        LAG(dte1) over  (order BY dte1) AS Rank_
    FROM Sales
)
SELECT *
FROM RANK_;


WITH Sales AS (
    SELECT 1 AS ProductID, 
		      10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' AS dte1 UNION ALL
    SELECT 2, 10, 300,'2020-01-02' AS dte1 UNION ALL
    
     SELECT 6, 20, 200,'2020-01-03' AS asdfsdzffsdsdfsdfsdfsdfsdf UNION ALL
    
    SELECT 3, 20, 500,'2020-01-04'  UNION ALL
    
        SELECT 3, 20, 400,'2020-01-05'  
),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        dte1,
        LAG(dte1) over  (order BY dte1) AS Rank_1,
        LAG(dte1,1) over  (order BY dte1) AS Rank_2,
        LAG(dte1,3) over  (order BY dte1) AS Rank_3
    FROM Sales
)
SELECT *
FROM RANK_;

WITH Sales AS (
    SELECT 1 AS ProductID, 
		      10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' AS dte1 UNION ALL
    SELECT 2, 10, 300,'2020-01-02' AS dte1 UNION ALL
    
     SELECT 6, 20, 500,'2020-01-03' AS asdfsdzffsdsdfsdfsdfsdfsdf UNION ALL
    
    SELECT 3, 20, 400,'2020-01-04'  UNION ALL
    
        SELECT 3, 20, 200,'2020-01-05'  
),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        dte1,
        FIRST_VALUE(SaleAmount) over  (partition by DepartmentID) AS Rank_1,
        LAST_VALUE(SaleAmount) over  (partition by DepartmentID) AS Rank_2

    FROM Sales
)
SELECT *
FROM RANK_;

WITH Sales AS (
    SELECT 1 AS ProductID, 
		      10 AS DepartmentID, 300 AS SaleAmount,'2020-01-01' AS dte1 UNION ALL
    SELECT 2, 10, 300,'2020-01-02' AS dte1 UNION ALL
    
     SELECT 6, 20, 500,'2020-01-03' AS asdfsdzffsdsdfsdfsdfsdfsdf UNION ALL
    
    SELECT 3, 20, 400,'2020-01-04'  UNION ALL
    
        SELECT 3, 20, 200,'2020-01-05'  
),
RANK_ AS (
    SELECT
        ProductID,
        DepartmentID,
        SaleAmount,
        dte1,
        FIRST_VALUE(dte1) over  (partition by DepartmentID) AS Rank_1,
        LAST_VALUE(dte1) over  (partition by DepartmentID) AS Rank_2

    FROM Sales
)
SELECT *
FROM RANK_;

#Из таблицы purchase_orders для каждого поставщика supplier_id выведите дату создания заказа,
# а также дату создания предыдущего заказа. Посчитайте разницу между этим датами.

select supplier_id, creation_date,
LAG (creation_date) over (partition by supplier_id order by creation_date) as new_date,
datediff(creation_date, LAG (creation_date) over (partition by supplier_id order by creation_date)) as date_diff
 from purchase_orders;
 
 select *,
 datediff(creation_date,new_date) as date_diff
 from (select supplier_id, creation_date,
LAG (creation_date) over (partition by supplier_id order by creation_date) as new_date
#datediff(creation_date, LAG (creation_date) over (partition by supplier_id order by creation_date)) as date_diff
 from purchase_orders) as second_table;
 

#Измените предыдущий запрос таким образом, чтобы узнать среднее время между двумя заказами.


WITH CTE as 

(select supplier_id, creation_date,
LAG (creation_date) over (partition by supplier_id order by creation_date) as new_date,
datediff(creation_date, LAG (creation_date) over (partition by supplier_id order by creation_date)) as date_diff
 from purchase_orders),

#Напишите аналогичный второму задания запрос, но с использованием функции LEAD. Сравните результаты.

CTE2 as 
(SELECT supplier_id, AVG(date_diff) as AVG_DATE
 from CTE
GROUP BY supplier_id)

SELECT *, LEAD (AVG_DATE) OVER (ORDER BY supplier_id) as LEAD_AVGDATE, LEAD (AVG_DATE) OVER (ORDER BY supplier_id) - AVG_DATE as LEAD_DIFF FROM CTE2 ;
#Нaйдите самую раннюю дату submitted_date для каждого менеджера created_by.
 #Решите данное задание использую оконные функции MIN и FIRST VALUE. Сравните результаты.
 
 SELECT 
	*,
	MIN(submitted_date) OVER (partition by created_by) as min__date,
    first_value(submitted_date) OVER (partition by created_by order by submitted_date) as min1_date
FROM purchase_orders;
 
 # Таблица purchase_order_details

#1 Для каждого product_id выведите дату его получения date_received, предыдущую и последующую даты получения этого продукта. 
#  Оставьте только строки где date_received не является пропуском.

select purchase_order_id, product_id, date_received,
	lag(date_received) over (PARTITION BY product_id) as _lag,
	lead(date_received) over (PARTITION BY product_id) as _lead
    from purchase_order_details
    where date_received is not null;
    

#2 Найдите время отправки заказа date_received  и время отправки предыдущего заказа. 
#  Для начала оставьте только уникальные пары purchase_order_id, date_received и  отфильтруйте строки,
#  там где  date_received не указано. Запишите результат в CTE и дальше работайте с ним.

with cte as(
select purchase_order_id, product_id, date_received,
	lag(date_received) over (PARTITION BY product_id) as _lag,
	lead(date_received) over (PARTITION BY product_id) as _lead
    from purchase_order_details
    where date_received is not null
    ),
    
cte2 as(
select DISTINCT purchase_order_id, date_received from cte
)
select *, 
LAG(date_received) over (ORDER BY purchase_order_id) as lag_dr
from cte2;

#3 Выведите максимальное количество quantity и минимальный unit_cost для каждого inventory_id с помощью функции FIRTS VALUE.

SELECT
FIRST_VALUE(quantity) over (PARTITION BY inventory_id  ORDER BY quantity DESC) as max_quantity_invenory_id, 
FIRST_VALUE(unit_cost) over (PARTITION BY inventory_id ORDER BY unit_cost) as min_unit_cost_inventory_id,
pod.* 
from purchase_order_details as pod;

#4 Выведите одно значения – насколько в среднем отличается unit_cost для каждой строки от максимального unit_cost.

SELECT avg(t.dif),
       avg(t.fv)
FROM
(select *,
     MAX(unit_cost) over (PARTITION BY inventory_id ) as max_up,
     (MAX(unit_cost) over (PARTITION BY inventory_id ))-unit_cost as dif,
     FIRST_VALUE (unit_cost) over (PARTITION BY inventory_id ORDER BY unit_cost DESC)-unit_cost as fv
from purchase_order_details) as t;

#5 Выберите ТОП 5 продуктов с максимальным quantity, используя DENSE RANK.

SELECT
     *
FROM 
(SELECT
       product_id,
       quantity,
       DENSE_RANK() OVER (ORDER BY quantity DESC) AS DR

FROM
       purchase_order_details
UNION
SELECT
       product_id,
       quantity,
       DENSE_RANK() OVER (ORDER BY quantity DESC) AS DR

FROM
       purchase_order_details
) AS T1
#WHERE DR IN (1, 2, 3, 4, 5);
#WHERE DR <= 5;
WHERE DR BETWEEN 1 AND 5;

#6 Пронумеруйте строки в соответствии с убывание inventory_id. Выведите только 13 строчку.

select * from 
(
select *,
row_number() over (order by inventory_id desc) as row_num
 from purchase_order_details
) as table1
where row_num = 13;
 
select * from (select *,
nth_value(inventory_id, 13) over (order by inventory_id desc) as nth
 from purchase_order_details) as table1
where nth = inventory_id;


# вывести макс quantity для каждого продукта. Если если quantity встречаеться несколько раз для одного продукта,
 # то оставить тот, который был последний добавлен в таблицу (id)
 select * from
 (select
 ROW_NUMBER() over (PARTITION BY product_id order by quantity desc, id DESC) as rn, 
 od.* 
 from order_details as od
 ORDER BY quantity desc) as subquery_T
 WHERE rn = 1;