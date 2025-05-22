
select sum(quantity) as sum_quantity from order_details;

SELECT 
    COUNT(DISTINCT order_id)
FROM
    order_details;

SELECT 
    GROUP_CONCAT(DISTINCT ' ', first_name)
FROM
    employees;

SELECT 
    GROUP_CONCAT(first_name
        SEPARATOR '!') AS name_all
FROM
    employees;
    
    
   select order_id as ID,
avg(unit_price) as avg_unit_price,
min(unit_price) as min_unit_price,
max(unit_price) as max_unit_price,
count(unit_price) as count_unit_price,
sum(unit_price) as sum_unit_price
 from order_details
 group by order_id ;
 
 #Посчитать количество сотрудников в разрезе компании и занимаемой должности из таблицы employees.
 select company,job_title,count(last_name) as customers,
 group_concat(last_name) as grup_last_name
 from employees 
 group by company,job_title 
 order by count(last_name) desc; # делает расположение от большего к меньшему в группе
 
 # 1. Из таблицы employees посчитать количество сотрудников в каждом городе city.
 
 select city, count(concat(last_name, first_name))
 from employees
 group by city;
 
  # 2. Отсортировать результаты по убыванию.
 
 select city, count(concat(last_name, first_name))
 from employees
 group by city
 order by count(concat(last_name, first_name)) desc ;
 
 select city, count(concat(first_name, last_name)) as hhh 
from employees
group by city
order by hhh desc;#nfr делать нельзя

 # 3. Посчитать общее количество продуктов из таблицы order_details для каждого заказа.
select * from order_details;
select order_id, sum(quantity) 
 from  order_details
 group by order_id;
 
 # 4. Отсортировать по убыванию общего количества продуктов. Для краткости записи в GROUP BY можно не 
 # указывать конкретное имя колонки, а указать ее порядковый номер в SELECT.
 
 SELECT 
    order_id, SUM(quantity)
FROM
    order_details
GROUP BY 1
ORDER BY 2 DESC , 1;
 
 
 # 5. Сделать то же самое  в ORDER BY
 
SELECT 
    order_id, SUM(quantity) AS _sum
FROM
    order_details
GROUP BY 1
ORDER BY 2 DESC;

# 6. Посчитать сколько сотрудников работает в каждой компании из таблицы customers. Учитывать только 
# тех сотрудников, у которых job_id равен 'Purchasing Manager'.

SELECT 
    company, COUNT(last_name)
FROM
    customers
WHERE
    job_title = 'Purchasing Manager'
GROUP BY 1;

# 7. Если столбец, который вы хотите использовать для группировки содержит только уникальные 
# неповторяющиеся значения, то в группировке нет смысла - любая агрегатная функция даст один и тот  
# же результат. Попробуйте сгруппировать любую таблицу по первичному ключу и применить агрегатные функции к столбцам.

select id, count(business_phone) from customers
group by id;

select id , count(payment_type) from orders
group by id;

select count(1) from orders;
select * from orders;

select count(payment_type) ,count(1)  from orders;

#Выбрать supplier_ids для тех поставщиков, у
#которых количество продуктов больше 2
#Используем таблицу products
select supplier_ids,count(product_code) from products
group by supplier_ids
having count(product_code) >2;

# Вы можете использовать несколько условий в HAVING Сгруппировать продукты по standard_cost и list_price 
# Посчитать количество продуктов и вывести только те данные, где количество продуктов не менее 2


select standard_cost, list_price,
count(product_code)
#min(list_price)
 from products
 group by 1,2 
 having count(product_code) >=2 and list_price>=4.0;

# Часто HAVING и WHERE используются вместе, чтобы максимально сузить набор данных перед тем, 
# как применять агрегатные функции и группировку. Выбрать только те продукты в quantity_per_unit 
# встречается слово 'oz' как в нижнем так и в верхнем регистрах Сгруппировать по standard_cost 
# Оставить только данные где количество продуктов не менее 3

USE northwind;
SELECT standard_cost,
	   COUNT(product_code)
FROM 
    products
WHERE
    UPPER(quantity_per_unit) LIKE '%OZ%'
GROUP BY
	standard_cost
HAVING COUNT(product_code) >= 3;

#1.Вывести среднее, минимум, максимум и сумму по столбцу standard_cost

select avg(coalesce(standard_cost)) as "Average",#убрать null заменить на 0
min(standard_cost) as min_,
max(standard_cost) as max_,
sum(standard_cost) as sum_,
count(standard_cost) as ammount
 from products;


#2.Посчитайте количество товаров в каждой категории category Выведите только записи с количеством товаров не менее 3

select category, count(id) as quantity
from products
group by category
having count(id) >= 3;

#3.Выведите среднюю себестоимость standard_cost для пары supplier_ids + category

SELECT 
    supplier_ids, category, AVG(standard_cost)
FROM
    products
GROUP BY supplier_ids , category;   #  1,2

#4.Посчитайте количество продуктов, для которых отсутсвует minimum_reorder_quantity

SELECT 
    COUNT(id)
FROM
    products
WHERE
    minimum_reorder_quantity IS NULL;

#5.Посчитайте количество уникальных категорий



#6.Разделите все товары на группы по reorder_level если reorder_level меньше 10 то 'low' , 
#от 10 до 20 включительно - 'medium' , осталные - 'hight' Вывести среднее,
# максимум и минимум столбца list_price для каждой группы

select 
case
when reorder_level < 10 then 'low'
when  reorder_level BETWEEN 10 and 20 then 'medium'
else 'hight' end as level_reorder,
avg(list_price) as avg_list_price,
max(list_price) as max_list_price,
min(list_price) as min_list_price
from products
GROUP BY 1;

#7.Найти средний standard_cost только для тех продуктов, которые продаются коробками quantity_per_unit 

select 

avg(standard_cost) from products
where quantity_per_unit like '%box%';

#8.Вычислите суммарную прибыль компании для каждой категории для продуктов с target_level больше 40 Прибыль компании вычисляется как list_price - standard_cost

SELECT category,
        sum(list_price-standard_cost) as profict
 FROM products
 WHERE target_level>40 and category='Pasta'
  GROUP BY category
 ORDER BY profict DESC




-- create table TEST  эта таблица доказывает то что коинт считает все строчки
-- (COL_1 varchar(10), COL_2 varchar(10));

-- insert into TEST (COL_1,COL_2) values ('Ivan', null);
-- insert into TEST (COL_1,COL_2) values (null, null);

-- select count(1) from TEST;
-- select * from TEST;

#1 В БД Shop в таблице ORDERS посчитать кол-во заказов и сумму в разрезе дат





#2 В БД Shop в таблице ORDERS посчитать минимальную, максимальную и среднюю сумму заказа в разрезе месяцев.
#Отсортировать по месяцам от меньшего к большему.

SELECT extract(month from ODATE) as month_,
       min(AMT) as min_amount,
       max(AMT) as max_amount,
       avg(AMT) as avg_amount
FROM ORDERS 
GROUP BY 1
ORDER BY 1;


