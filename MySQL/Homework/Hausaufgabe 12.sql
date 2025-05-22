# 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника

SELECT * FROM employees;

delimiter $$
create procedure P_employess(in id_1 int)
begin
select department_id from employees where id = id_1;
end$$
delimiter ;

call P_employess(2);

#2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника (IN-параметр)
# и возвращает его возраст через OUT-параметр.

drop procedure P_get_employee_age;

DELIMITER //
CREATE PROCEDURE P_get_employee_age (IN employees_id INT, OUT AGE_OUT INT)
BEGIN

SELECT age INTO AGE_OUT from employees where id = employees_id;

END //
DELIMITER ;

call P_get_employee_age(3,@AGE_OUT);

select @AGE_OUT;

#3 Создайте хранимую процедуру increase_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.

DELIMITER $$
CREATE PROCEDURE P_increase_salary(INOUT emp_salary DECIMAL(10,2))
BEGIN
SET emp_salary = emp_salary * 0.9; 
END $$
DELIMITER ;

SET @emp_salary = 80;

call P_increase_salary(@emp_salary);

select @emp_salary;