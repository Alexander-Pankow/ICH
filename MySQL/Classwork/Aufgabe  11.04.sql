select ship_name,count(1) cnt from orders 
where ship_name ='Karen Toh'
group by ship_name

union all

select ship_name,count(1) from orders 
where ship_name ='Anna Bedecs'
and id =44
group by ship_name;

select null,last_name,first_name  from employees
union
select city,last_name,first_name from customers

select *
from orders as o
inner join customers as c
on o.customer_id = c.id
where c.id = 25;


select * from  orders 
where
customer_id = 25;


select * from  customers 
where
id = 25;


select last_name,first_name,'employee' as Type_  from employees
union
select last_name,first_name,'customer' from customers;


select o.customer_id,ods.status_name
from orders as o
join order_details as od
on o.id = od.order_id
join order_details_status as ods
on ods.id = od.status_id


-- 1. Объедините с помощью UNION ALL названия компаний сотрудников из
-- таблицы employees, названия компаний клиентов из таблицы customers и
-- названия компаний для поставщиков из таблицы suppliers.

SELECT company FROM employees
UNION ALL
SELECT company from customers
UNION ALL
SELECT company from suppliers


-- 2. Объясните почему в предыдущем запросе не стоит использовать UNION ALL.
-- Добавьте к предыдущему запросу столбец, показывающий из какой таблицы
-- была взята запись.


SELECT company, 'employees' FROM employees
UNION ALL
SELECT company, 'customers' from customers
UNION ALL
SELECT company, 'suppliers' from suppliers



-- 3. У каких сотрудников в таблице employees нет привилегий таблица
-- employee_privileges. Выведите имя и фамилию .



SELECT id FROM employees e
LEFT JOIN employee_privileges ep
ON e.id = ep.employee_id
WHERE ep.employee_id IS NULL


-- 4. Работаем с таблице inventory_transactions. Выведите transaction_created_date,
-- а также название типа транзакции и название продукта.


SELECT transaction_created_date, product_name, type_name FROM
inventory_transactions it
JOIN inventory_transaction_types itt ON it.transaction_type = itt.id
JOIN products p ON p.id = it.product_id


-- 5. Используя предыдущий запрос, посчитайте количество транзакций по типу.
-- Оставьте только те типы транзакций в которых отсутствует слово 'Sold'.


SELECT type_name, COUNT(*) FROM inventory_transactions it
JOIN inventory_transaction_types itt ON it.transaction_type = itt.id
JOIN products p ON p.id = it.product_id
WHERE type_name NOT LIKE '%Sold%'
GROUP BY 1


-- 6. В таблице orders расшифруйте значения всех столбцов, в именах которых
-- присутствует 'id' и для которых в базе данных имеются соответствующие
-- таблицы. Выведите все строки в которых ship_city Seattle. Объясните почему в
-- данном случае важно использовать LEFT JOIN.

SELECT * FROM orders o
LEFT JOIN employees e
ON o.employee_id = e.id
LEFT JOIN customers c
ON c.id = o.customer_id
LEFT JOIN shippers s
ON s.id = o.shipper_id
WHERE ship_city = 'Seattle'


#1 Выведите все строки из объединенных таблиц employees и employee_privileges с помощью INNER/RIGHT и LEFT JOIN.
#Объясните полученные результаты.

use northwind;

select * from employees inner join 
employee_privileges as ep
on employees.id = ep.employee_id;

select * from employees right join 
employee_privileges as ep
on employees.id = ep.employee_id;

select * from employees left join 
employee_privileges as ep
on employees.id = ep.employee_id;

select * from employees;

select * from employee_privileges;

#2 Выведите идентификаторы заказов из таблицы order_details. 
 #Дополнительно выведите вместо product_id  столбец с именем продукта product_name из products.
 
 select * from order_details;
select * from products;

select order_id, product_name 
from order_details as od
 left join products as p
on od.product_id = p.id;
 
 
#3 Используя предыдущий запрос, посчитайте количество заказов для каждого наименования продукта.

select product_name , count(order_id)
from order_details as od
 left join products as p
on od.product_id = p.id
GROUP BY product_name;

#4 Выведите идентификаторы заказов из таблицы order_details. 
#Дополнительно выведите вместо product_id  столбец с именем продукта product_name из products 
#и столбец payment_amount из таблицы purchase_orders.

SELECT order_id, p.product_name , po.payment_amount From order_details as od
JOIN products as p
on od.product_id=p.id
JOIN purchase_order_details as pod
on p.id=pod.product_id
JOIN purchase_orders as po
on pod.purchase_order_id=po.id;

#5 Оставить все строки из таблицы order_details.



## Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов по этим продуктам.


select sum(tot_price) from (
select p.product_name, a.tot_price, a.quantity from
(
select product_id, 
sum(quantity * unit_price) as tot_price, 
count(*) as quantity
from order_details group by 1
) as a 
join products as p on a.product_id = p.id 
order by a.quantity desc limit 10
) as b
;





select sum(tot_price) from (
select p.product_name, a.tot_price, a.quantity from
(
select product_id, 
sum(quantity * unit_price) as tot_price, 
sum(quantity) as quantity
from order_details group by 1
) as a 
join products as p on a.product_id = p.id 
order by a.quantity desc limit 10
) as b
;

