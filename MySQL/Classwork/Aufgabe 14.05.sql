create table students 
(id int primary key, name varchar(100), age int, grade decimal);

SELECT * FROM students WHERE age = 30;

insert into students (id,name,age,grade) values (1,'Ivan',30,1);
insert into students (id,name,age,grade) values (2,'Olga',30,1);
insert into students (id,name,age,grade) values (3,'Petr',40,2);
insert into students (id,name,age,grade) values (4,'Natalia',50,2);
insert into students (id,name,age,grade) values (5,'Oleg',60,3);
insert into students (id,name,age,grade) values (6,'Sergey',51,3);
insert into students (id,name,age,grade) values (7,'Vasiliy',57,1);
insert into students (id,name,age,grade) values (8,'Nikita',80,1);
insert into students (id,name,age,grade) values (9,'Yulia',31,1);
insert into students (id,name,age,grade) values (10,'Kirill',39,1);

create index idx_students_age on students (age);  #создать индекс

DROP index idx_students_age on students;  #удаляет индекс

DELIMITER //           #функция подсчет возроста по дате

CREATE FUNCTION calculate_age(birthdate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN TIMESTAMPDIFF(YEAR, birthdate, CURDATE());
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION greet_user(name VARCHAR(100))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	RETURN CONCAT('Hello, ', name, '!');
END //

DELIMITER ;

select greet_user(‘XXX’);select calculate_age('1970-01-01');
CREATE FUNCTION greet_user(name VARCHAR(100))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	RETURN CONCAT('Hello, ', name, '!');
END //

DELIMITER ;

select greet_user('XXX');


CREATE FUNCTION UPPER_CASE(X VARCHAR(100))
RETURNS VARCHAR(100)
BEGIN
	RETURN UPPER(X);
END //
DELIMITER ;

SELECT UPPER_CASE('ivan');


DELIMITER //

CREATE FUNCTION FUNC1(X INT)
RETURNS BOOLEAN
BEGIN 
	RETURN X % 2 = 0;
END //

DELIMITER ;

SELECT FUNC1(2.2);


'''
Перевод сантиметров в дюймы

Создайте функцию для перевода сантиметров в дюймы. 

Используйте формулу:
1 сантиметр = 0.393701 дюйма
'''
DELIMITER //
CREATE  FUNCTION DUME ( n numeric(10,5) )
RETURNS numeric(10,5)
BEGIN 
     RETURN n*0.393701;
END //    
DELIMITER ;
Select DUME(15);

DROP function DUME ;



'''
Расчет объема шара
Создайте функцию для расчета объема шара, если известен радиус.
Можно воспользоваться следующей формулой:
Где
V— объем шара,
r — радиус шара,
​π≈3.14159
'''

DELIMITER //
CREATE FUNCTION VOLUME_BALL(R FLOAT)
RETURNS FLOAT
BEGIN 
	RETURN 4/3 * PI() * POW(R, 3);
END //
DELIMITER ;

SELECT VOLUME_BALL(5);

DROP FUNCTION VOLUME_BALL;

SELECT POW(2, 3), POWER(2, 3), SQRT(25);

'''
Перевод градусов в радианы
Создайте функцию для перевода градусов в радианы.
Для перевода градусов в радианы используется следующая формула:
радианы=градусы×π/180, где ​π≈3.14159
'''

DELIMITER //
CREATE FUNCTION GRAD(G FLOAT)
RETURNS FLOAT
BEGIN
    RETURN G * PI()/180;
END //
DELIMITER ;

SELECT GRAD(360);

#калькулятор

DELIMITER //
CREATE FUNCTION CALCULATOR(X FLOAT, Y FLOAT)
RETURNS FLOAT
BEGIN
    RETURN X + Y;
END //
DELIMITER ;

SELECT CALCULATOR(10.2, 10.8);


DELIMITER //
CREATE FUNCTION RANG_STUDENT(age INT)
RETURNS VARCHAR(100)
BEGIN
    RETURN
    CASE
        WHEN age <= 40 THEN "Young"
        WHEN age <= 60 THEN "Midle"
        WHEN age <= 80 THEN "Senior"
        ELSE "Mensch"
     END;  
END //
DELIMITER ;

SELECT
       *,
       RANG_STUDENT(age) AS rang_student
FROM
     students;
     
     
     
DELIMITER //
CREATE FUNCTION funk_1(a NUMERIC(10,2), b NUMERIC(10,2), c DOUBLE)
RETURNS NUMERIC(10,2)
BEGIN
 RETURN (a - b) * c ;
end //
DELIMITER ;


SELECT funk_1(55 , 3 , 2);
     