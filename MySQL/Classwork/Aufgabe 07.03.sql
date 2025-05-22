# 1. Выведите список всех товаров из таблицы products, у которых цена (standard_cost) находится в диапазоне
#от 10 до 20 единиц.
SELECT 
    *
FROM
    products
WHERE
    standard_cost BETWEEN 10 AND 20;
# WHERE standard_cost >= 10 AND standard_cost <= 20;

#2. Найдите все заказы из таблицы orders, у которых стоят пропуски в payment_type, и которые были
#отправлены из Калифорнии ship_state_province равен английские буквы ‘CAʼ.

SELECT 
    *
FROM
    orders
WHERE
    payment_type IS NULL
        AND ship_state_province = 'CA';
# можно Like но она ресурсоемкая , лучше использовать когда мы не все слово знаем целиком.

#3. Выведите список всех сотрудников из таблицы employees, чья фамилия начинается на букву "C".

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'C%';

#4. Найдите всех клиентов в таблице customers, которые проживают в городах
#Minneapolis, Denver, Boston или работают в качестве Purchasing Manager (колонка job_title).

SELECT 
    *
FROM
    customers
WHERE
    city IN ('Minneapolis' , 'Denver', 'Boston')
        OR job_title = 'Purchasing Manager';

#5. Измените предыдущий запрос таким образом, чтобы из предыдущего результата выводились только записи
#там где state_province Колородо 'CO'.

SELECT 
    *
FROM
    customers
WHERE
    (city IN ('Minneapolis' , 'Denver', 'Boston')
        OR job_title = 'Purchasing Manager')
        AND state_province = 'CO';

#6. Выведите все строки из таблицы products там где minimum_reorder_quantity входит в диапазон от 10 до 25,
#включая концы и quantity_per_unit включает в себя слово 'boxes'. Кроме того? standard_cost должен быть
#менее 10.

SELECT 
    *
FROM
    products
WHERE
    minimum_reorder_quantity BETWEEN 10 AND 25
        AND quantity_per_unit LIKE '%boxes%'
        AND standard_cost < 10;

#7. Измените предыдущий запрос заменив операторы and на or Объясните какие строки выводятся в данном
#запросе.

SELECT 
    *
FROM
    products
WHERE
    minimum_reorder_quantity BETWEEN 10 and 25
        or quantity_per_unit LIKE '%boxes%'
        or standard_cost < 10;
#теперь больше вариантов потому что выходят строки в которых учитывается хотя бы один вариант
#, а не все сразу.

#8. Подумайте одинаковый ли результат дадут эти два запроса.

# нет , во втором варианте будет больше конечно же.

#9. Выберите все строки из таблицы products где есть пропуски
# в столбце quantity_per_unit и reorder_level равен 100.

SELECT 
    *
FROM
    products
WHERE
    quantity_per_unit IS NULL
        AND reorder_level = '100';

#10. Выберите имена продуктов из таблицы products где минимальная цена list_price
#превышает себестоимость standard_cost более чем на 5 уе.

SELECT 
    product_name
FROM
    products
WHERE
    list_price > standard_cost + 5;

#11. Выбрать все строки из таблицы products где reorder_level в два раза меньше target_level.

SELECT 
    *
FROM
    products
WHERE
    reorder_level * 2 = target_level;

#12. Выберите все строки из таблицы products для которых product_code содержит 'NWTSO' и стандартная
#себестоимость standard_cost равна 1, либо минимальная цена list_price меньше 5 и target_level = 40.

SELECT 
    *
FROM
    products
WHERE
    (product_code = '%NWTSO%'
        AND standard_cost = 1)
        OR (list_price < 5 AND target_level = 40);

#13. Выберите все строки из таблицы products для которых product_code содержит 'NWTSO' или стандартная
#себестоимость standard_cost равна 1 минимальная. При этом target_level должен быть равен 40. Решить задачу
#двумя способами.

# первый
SELECT 
    *
FROM
    products
WHERE
    (product_code = '%NWTSO%'
        OR standard_cost = 1)
        AND target_level = 40;
        
#второй

SELECT 
    *
FROM
    products
WHERE
    (product_code = '%NWTSO%' AND target_level = 40)
        OR (standard_cost = 1 AND target_level = 40);

# третий 

SELECT 
    *
FROM
    products
WHERE
    product_code LIKE '%NWTSO%'
        AND target_level = 40 
UNION SELECT 
# UNION объединяет оба результата, убирая дубликаты (если они есть).
    *
FROM
    products
WHERE
    standard_cost = 1 AND target_level = 40;


