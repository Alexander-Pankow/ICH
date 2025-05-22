-- 1 Подключитесь к своей базе данных созданной на уроке
Use 210255_Pankow;

-- 2 Создайте таблицу, которая отражает погоду в Вашем городе за последние 5 дней и включает следующее столбцы
-- Id - первичный ключ, заполняется автоматически
-- Дата - не может быть пропуском
-- Дневная температура - целое число, принимает значения от -30 до 30
-- Ночная температура - целое число, принимает значения от -30 до 30
-- Скорость ветра - подумайте какой тип данных и ограничения необходимы для этого столбца 

CREATE TABLE t_weather_hamburg (
    WeatherID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    DayTemperature INT CHECK (DayTemperature BETWEEN - 30 AND 30),
    NightTemperature INT CHECK (NightTemperature BETWEEN - 30 AND 30),
    WindSpeed DECIMAL(4 , 1 ) CHECK (WindSpeed >= 0)
);

SELECT 
    *
FROM
    t_weather_hamburg;

-- 3 Заполните таблицу 5 строками - за последние 5 дней 

INSERT INTO t_weather_hamburg (Date, DayTemperature, NightTemperature, WindSpeed) VALUES
    ('2024-03-24', 8, 2, 4.5),
    ('2024-03-25', 10, 3, 5.2),
    ('2024-03-26', 7, 1, 3.8),
    ('2024-03-27', 5, 0, 6.0),
    ('2024-03-28', 9, 4, 4.0);


-- 4 Увеличьте значения ночной температуры на градус если скорость ветра не превышала 3 м/с

UPDATE t_weather_hamburg
SET NightTemperature = NightTemperature + 1
WHERE WindSpeed <= 4;  # сделал 4 что бы заметно, ветер в Гамбурге сильный)

-- 5 На основе полученной таблицы создайте представление в своей базе данных
--  - включите все строки Вашей таблицы и дополнительно рассчитанные столбцы
-- Средняя суточная температура 
-- - среднее арифметическое между ночной и дневной температурами
-- Столбец на основе скорости ветра 
-- - если скорость ветра не превышала 2 м/с то значение ‘штиль’, от 2 включительно до 5 
-- - ‘умеренный ветер’, в остальных случаях - ‘сильный ветер’

CREATE VIEW v_weather_hamburg AS
SELECT 
    WeatherID, 
    Date, 
    DayTemperature, 
    NightTemperature, 
    WindSpeed, 
    (DayTemperature + NightTemperature) / 2.0 AS AvgDailyTemperature,   -- Расчёт средней суточной температуры
    CASE 
        WHEN WindSpeed < 2 THEN 'штиль'                                 -- Определение категории скорости ветра
        WHEN WindSpeed >= 2 AND WindSpeed <= 5 THEN 'умеренный ветер'
        ELSE 'сильный ветер'
    END AS WindCategory
FROM t_weather_hamburg;

SELECT 
    *
FROM
    v_weather_hamburg;

-- 6 Отформатируйте стиль написания запросов
-- 7 Сохраните запросы в виде файла с расширением .sql и загрузите на платформу

