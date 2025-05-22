'''
1. Расчет площади круга
Создайте функцию для расчета площади круга, если известен его радиус.
Используйте формулу
Где:
 ● S — площадь шара,
 ● r — радиус шара,
 ● π≈3.14159 
 '''

DELIMITER //
CREATE FUNCTION cal_area_circle(radius DOUBLE)
RETURNS NUMERIC(10,4)
DETERMINISTIC   # что бы запомнить
BEGIN
 RETURN PI() * radius * radius;
END //
DELIMITER ;

DROP function cal_area_circle ;

SELECT cal_area_circle(5) AS area_of_circle;

''' 
2. Расчет гипотенузы треугольника
Создайте функцию для расчета гипотенузы треугольника, если известны длины его катетов.
Используйте формулу
Где:
● c — длина гипотенузы треугольника,
● a, b — длины его катетов
'''

DELIMITER //
CREATE FUNCTION cal_hypotenuse(a FLOAT, b FLOAT)
RETURNS NUMERIC
DETERMINISTIC # что бы запомнить
BEGIN
 RETURN sqrt(a * a + b * b);
END //

DELIMITER ;

DROP function cal_hypotenuse ;

SELECT cal_hypotenuse(3, 4) AS hypotenuse;