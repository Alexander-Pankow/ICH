
# 1) Выбрать все строки из таблицы order_details, где unit_price больше среднего.

with cte as
(SELECT  avg(unit_price) as AVG_
FROM order_details
) 
#SELECT * from cte;
SELECT * FROM order_details
where unit_price>(SELECT cte.AVG_ from cte);

#2 Выбрать все строки из таблицы order_details, где unit_price больше среднего и меньше (среднего, умноженного на 1,5).

with cte as 
(SELECT  avg(unit_price) as AVG_
FROM order_details
) 
#SELECT AVG_, AVG_*1.5 from cte;
SELECT * FROM order_details
where 
unit_price>(SELECT cte.AVG_ from cte)
and unit_price<(SELECT cte.AVG_*1.5 from cte); #(22.27172414	33.407586210), 4 rows

# 3 Найти все заказы таблица orders оформленных сотрудниками employee_id,
--  в контактах которых таблица employees указан Sales Representative (столбец job_title).

with CTE as (
select * from employees
where job_title = 'Sales Representative')

-- select * from CTE;
select *, 
(
select CTE.job_title from CTE where CTE.id = orders.employee_id  # что бы дополнительно вытянуть столбец job.title
)
 from orders where employee_id in (select id from CTE);


# тот же самый вариант но без CTE 
select * from orders where employee_id in 
(
select id from employees                     
where job_title = 'Sales Representative'
);



# Практика 

-- 1. У каких сотрудников в таблице employees нет привилегий таблица
-- employee_privileges. Выведите имя и фамилию. Выполните задание тремя
-- способами - с помощью left join, подзапроса и сte.

select * from employees as e
left join employee_privileges as ep
on ep.employee_id=e.id 
where privilege_id is null ;


select last_name,first_name from employees where id not in
(
SELECT employee_id
FROM employee_privileges
where privilege_id is not null);

with cte as (
select employee_id from employee_privileges where privilege_id is not null 

)

select last_name, first_name from employees where id not in (select employee_id from cte);


-- 2. Выберите только тех сотрудников из таблицы, имя которых содержит
-- английскую букву 'e' или их job_title = Sales Representative. Из заказов orders
-- выберите заказы в которых город отправки ship_city = Las Vegas. Проверьте,
-- отправляли ли найденные сотрудники заказы в Las Vegas. Решите задачу с
-- помощью подзапросов и cte.

with CTE as (
select * from employees
where job_title = 'Sales Representative'
or first_name like '%e%'
),
CTE2 as (
select * from orders 
where ship_city = 'Las Vegas'
)
select * from CTE
join CTE2
on CTE.id = CTE2.employee_id;




-- 3. Выберите клиентов из компаний A, B, C, D, F. Проверьте, делали ли они заказы
-- orders, используя перевозчика shipper_id = 3. Выведите имя клиента и
-- наименование перевозчика company из таблицы shippers. Решить задачу
-- тремя способами - с помощью JOIN, подзапросов и временных таблиц.


SELECT * FROM (
SELECT *,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY ORDER_DATE ASC) RN FROM orders
) AS A
WHERE RN = 1
;
select order_id,sum(quantity) from order_details
group by order_id;


select order_id,quantity,sum(quantity) over (partition by order_id) sum_
 from order_details;
 
 
 select *,quantity/sum_ from (
 select *,sum(quantity) over (partition by order_id) sum_,
 row_number() over (PARTITION BY order_id ORDER BY quantity desc) rn
 from order_details
 )a ;
 
 
 

WITH CTE as (
SELECT 1 AS user_,	'London' as city,	45 age ,	'2024-09-01' order_date,'2024-06-01' registration_date
union all
select 2,'London'	,45,	'2024-10-01',	'2024-07-01'
union all
select 3,'London'	,39,	'2024-10-01',	'2024-07-01'
union all
select 2,'London'	,45,	'2024-10-01',	'2024-07-01'
)

SELECT * FROM (
SELECT *,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY ORDER_DATE ASC) RN FROM orders
) AS A
WHERE RN = 1
;