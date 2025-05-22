Use 210255_Pankow;

CREATE TABLE Employees (
 EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
 FirstName VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL,
 BirthDate DATE,
 HireDate DATE DEFAULT (CURRENT_DATE),
 Salary DECIMAL(10, 2) CHECK (Salary > 0),
 Email VARCHAR(100) UNIQUE);

INSERT INTO TableName (Column1, Column2, Column3, ...)
VALUES (Value1, Value2, Value3, ...);


create schema 210225_Pankow;

select * from Employees;


create table Employees_test
as 
select EmployeeID,concat(FirstName,' ',LastName) as FULL_NAME from Employees;  -- создание таблицы из таблицы

insert into Employees (FirstName,LastName,BirthDate,HireDate,Salary,Email) values ('Ivan','Ivanov','1980-01-10',null,1,'ivan1@mail.de');
insert into Employees (FirstName,LastName,BirthDate,Salary,Email) values ('Nalia','Pertova',null,1000,'Na@mail.de');

insert into Employees (FirstName,LastName,BirthDate,Salary,Email)VALUES ('Alice', 'Green', '1985-05-15', 55000.00, 'alice.green@example.com'),
 ('Bob', 'Smith', '1990-08-22', 60000.00, 'bob.smith@example.com'),
('Charlie', 'Johnson', '1988-02-10', 52000.00, 'charlie.johnson@example.com'),
('Diana', 'Williams', '1992-11-01', 58000.00, 'diana.williams@example.com'),
('Edward', 'Brown', '1987-09-30', 61000.00, 'edward.brown@example.com');





