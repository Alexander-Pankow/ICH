#1. Выберите все строки из таблицы suppliers. 
#Предварительно подключитесь к базе данных northwind

use northwind;
SELECT 
    *
FROM
    suppliers

#2. Выберите только те строки из таблицы suppliers где company имеет значение Supplier A

where company = "supplier A";

#3. Выберите все строки из таблицы purchase_orders

SELECT 
    *
FROM
    purchase_orders

#4. Выберите только те строки из таблицы purchase_orders  где supplier_id = 2

where supplier_id = 2;

#5. Выберите supplier_id и shipping_fee из purchase_orders 
# там где created_by равно 1 и supplier_id равен 5 Объясните полученный результат

SELECT 
    supplier_id,shipping_fee
FROM
    purchase_orders
WHERE
    created_by = 1 AND supplier_id = 5;
# я так понял что результаты нулевые потомучто это два разных столбца,
# они находятся в одной строке а такого совпадения в одной строке нет.

#6. Выберите last_name и first_name из таблицы employees
#там где адрес address имеет значение 123 2nd Avenue или 123 8th Avenue
#Напишите запрос двумя способами - с применением оператора OR и оператора IN

SELECT 
    last_name, first_name
FROM
    employees
WHERE
    address IN ('123 2nd Avenue' , '123 8th Avenue');
 
SELECT 
    last_name, first_name
FROM
    employees
WHERE
    address = '123 2nd Avenue'
        OR address = '123 8th Avenue';

#7. Выведите все имена сотрудников, 
# которые содержат английскую букву p в середине фамилии

SELECT 
    first_name
FROM
    employees
WHERE
    first_name LIKE '%p%';
    # имен таких нет если выбрать last_name то найдет 2 фамилии.

#8. Выберите все строки из таблицы orders там где нет информации о  shipper_id

SELECT 
    *
FROM
    orders
WHERE
    shipper_id IS NULL;

#9. Отформатируйте стиль написания запросов
#10. Сохраните запросы в виде файла с расширением .sql и загрузите на платформу


