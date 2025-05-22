-- Создайте таблицу products со следующими столбцами и ограничениями:
-- product_id — тип INT, автоинкремент, первичный ключ.
-- product_name — тип VARCHAR(100), не может быть пустым.
-- category — тип VARCHAR(50), значение по умолчанию — 'General'.
-- price — тип DECIMAL(8, 2), не может быть отрицательным, добавьте ограничение CHECK (price >= 0).
-- stock_quantity — тип INT, не может быть отрицательным.
-- supplier_id — тип INT, может быть NULL, указывает на поставщика продукта.


Create table products(product_id INT AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR(100) not null,
	category VARCHAR(50) default 'General',
	price DECIMAL(8, 2) check (price >= 0),
	stock_quantity INT check (stock_quantity >=0),
	supplier_id INT
);
-- 2 добавить 5 товаров
insert into products (product_name, category, price, stock_quantity, supplier_id)
values ('Telefon','Elektronic',1000.05,25,1),
('TV','Elektronic',2500.00,12,2),
('Laptop','Elektronic',500,5,3),
('Pencil','Scool',5.67,57,2),
('Karton','Scool',45.07,334,3);

# 3.Измените значение в таблице, например, уменьшите количество на складе для продукта с product_id = 1

update products set stock_quantity = stock_quantity - 1 where product_ID = 1;
update products set price = 10, stock_quantity = 99 where product_ID = 4;
update products set product_name = 'PC' where product_ID = 1;

select * from products;

# 4. Создайте представление product_overview, которое будет содержать следующие данные:
# ● product_name — название продукта.
# ● category — категория продукта.
# ● stock_value — расчетная стоимость запасов (произведение price и stock_quantity).
# ● stock_status — строка "Low Stock", если stock_quantity меньше 20, и "In Stock" в противном случае.


select product_name, category, (stock_quantity * price) as stock_value, 
case when stock_quantity <20 then 'Low Stock'
else 'In Stock'end as stock_status
from  products;

# 5. Вам необходима таблица с данными о мониторинге основных показателей здоровья.
#Подумайте какие столбцы и с какими ограничениями вы будете использовать.
#Создайте такую таблицу и заполните ее тремя тестовыми строками. 
#Обсудите результаты с коллегами.

create table t_gesundheit (
id int auto_increment primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null,
BirthDate date not null check(BirthDate > '1900-01-01'),
Alergie boolean default false,
Growth decimal(3) not null,
Created_on timestamp default current_timestamp,
Diagnos text
);

INSERT INTO t_gesundheit (
	FirstName,
    LastName,
    BirthDate,
    Alergie,
    Growth,
    Diagnos)
VALUES (
	'Petr',
    'Petrov',
    '1988-01-28',
    True,
    175,
    'Not good');
    
    INSERT INTO t_gesundheit (
	FirstName,
    LastName,
    BirthDate,
    Alergie,
    Growth,
    Diagnos)
VALUES (
	'Ivan',
    'Ivanov',
    '2003-01-28',
    False,
    183,
    'Good');
    
    INSERT INTO t_gesundheit (
	FirstName,
    LastName,
    BirthDate,
    Alergie,
    Growth,
    Diagnos)
VALUES (
	'Sydor',
    'Sydorov',
    '2020-01-28',
    True,
    180,
    '!!!!!!!');