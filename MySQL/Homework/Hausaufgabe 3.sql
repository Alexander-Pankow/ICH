# 1. Выведите Ваш возраст на текущий день в секундах

SELECT 
    TIMESTAMPDIFF(SECOND,
        '1990-04-11',
        NOW()) AS 'How many seconds do i live';

# 2. Выведите какая дата будет через 51 день

SELECT DATE_ADD(CURDATE(), INTERVAL 51 DAY) AS '51 days later';

# 3. Отформатируйте предыдущей запрос - выведите день недели для этой даты Используйте документацию My SQL

SELECT 
    DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 51 DAY),
            '%W') AS '51 days later of week' ;  
            # узнал что если '%W' выводит слова а '%w' выводит число дня в недели тоесть было бы просто "5"

#SELECT CONCAT(DATE_ADD(CURDATE(), INTERVAL 51 DAY), ' - ', DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 51 DAY), '%W')) AS "Date and Day of week"; Ввсе в месте


# 4.  Подключитесь к базе данных northwind Выведите столбец с исходной датой создания
# транзакции transaction_created_date из таблицы inventory_transactions, 
#а также столбец полученный прибавлением 3 часов к этой дате

SELECT 
    transaction_created_date,
    DATE_ADD(transaction_created_date,
        INTERVAL 3 HOUR) AS 'three hours later'
FROM
    inventory_transactions;

#5. Выведите столбец с текстом  'Клиент с id <customer_id> сделал заказ <order_date>' из таблицы orders
#Запрос написать двумя способами - с использованием неявных преобразований 
#а также с указанием изменения типа данных для столбца customer_id
#Внимание В MySQL функция CAST не принимает VARCHAR в качестве параметра для длины.
# Вместо этого, нужно использовать CHAR для указания длины.

# Неявное приобразование

SELECT concat('Клиент с id ' , customer_id,' сделал заказ', order_date) as "Info" from orders;

# Явное приобразование 

SELECT concat('Клиент с id ' , cast(customer_id as char),' сделал заказ', order_date) as "Info" from orders; 
# не совсем понимаю зачем это дополнительно делать(

