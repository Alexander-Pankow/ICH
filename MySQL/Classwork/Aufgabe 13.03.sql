##Напишите запрос для сортировки списка продуктов #по цене  standard_cost и list_price.

-- select * from products
--  order by standard_cost desc , list_price desc ;
--  

#Напишите запрос для сортировки  списка клиентов по компании и затем по городу по возрастанию.
 
 select * from customers order by company,city ;
 
 #Напишите запрос для сортировки заказов по дате выполнения в порядке убывания.
 
 select * from orders order by shipped_date desc ; 
 
 # Напишите запрос для выбора пяти самых дешевых продуктов standard_cost из таблицы products.
 
 select * from products
 order by standard_cost
 limit 5;
 
 #Напишите запрос для выбора id десяти последних заказов. Таблица orders.
 
 select * from orders
 order by order_date desc limit 10;
 
 #Напишите запрос для вывода первых 5 записей.Таблица Customers:
 
 select * from customers
 limit 5 ;
 
 #Предположим, что в products данные из интернетмагазина, где ассортимент продуктов выводится
#покупателю по страницам, отсортированный от А
#до Z по 10 продуктов на страницу.
#Составьте запрос, который выведет этот список

select * from products
order by product_name limit 10 offset 10;

#Составьте запрос для выбора уникальных городов, в которых находятся клиенты.Таблица customers

select distinct city from customers;