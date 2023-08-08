Исходные данные: есть 2 таблицы Customers и Orders с соответствующим набором полей. Структура таблиц и значения полей указаны ниже:

CREATE TABLE Customers (
  CustomerID varchar,
  CompanyName varchar,
  Address varchar,
  City varchar ,
  Country varchar,
  PRIMARY KEY(CustomerID)
  );


CREATE TABLE Orders (
  OrderID NOT NULL,
  CustomerID varchar,
  OrderDate date ,
  OrderSum int,
  PRIMARY KEY(OrderID)
  );

INSERT INTO Customers (CustomerID,CompanyName,Address,City,Country) values ('ALFKI','Alfreds Futterkiste','Obere Str. 57','Berlin','Germany'),
('ANATR','Ana Trujillo Emparedados y helados','Avda. de la Constitución 2222','México D.F.','Mexico'),
('ANTON','Antonio Moreno Taquería','Mataderos  2312','México D.F.','Mexico'),
('AROUT','Around the Horn','120 Hanover Sq.','London','UK'),
('BERGS','Berglunds snabbköp','Berguvsvägen  8','Luleå','Sweden'),
('BLAUS','Blauer See Delikatessen','Forsterstr. 57','MannheimCity','Germany'),
('BLONP','Blondesddsl père et fils'	,'24, place Kléber','StrasbourgCity','France'),
('BOLID','Bólido Comidas preparadas','C/ Araquil, 67','MadridCity','Spain');

INSERT INTO Orders (OrderID,CustomerID,OrderDate,OrderSum) values (10355,'AROUT','1996-11-15',10000),
(10365,'ANTON','1996-11-27',15000),
(10381,'LILAS','1996-12-12',20000),
(10436,'BLONP','1997-02-05',17500),
(10442,'ERNSH','1997-02-11',20000),
(10449,'BLONP','1997-02-18',10000),
(10453,'AROUT','1997-02-21',15000)

По данным таблиц необходимо написать запросы, которые будут выводить всю необходимую информацию:
1)Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 
2)Вывести названия компаний поставщиков, которые находятся в México D.F.;
3)Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
4)Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
5)Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.
6)Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
7)Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.



1)SELECT Customers.CompanyName,Orders.OrderDate FROM Customers JOIN Orders ON Customers.CustomerID = Orders.customerid WHERE OrderDate NOT BETWEEN '1996-11-15' AND '1997-02-18'
2)SELECT CompanyName FROM Customers WHERE City= 'México D.F.'
3)SELECT*FROM Orders WHERE OrderDate BETWEEN '1996-12-12'  AND '1997-02-18'
4)SELECT CompanyName FROM Customers WHERE CompanyName LIKE 'An%'
5)SELECT Customers.CompanyName,Orders.OrderID FROM Customers JOIN Orders ON Customers.CustomerID = Orders.customerid WHERE  OrderSum > 17000 
6)SELECT Customers.CompanyName,Orders.OrderSum FROM Customers JOIN Orders ON Customers.CustomerID = Orders.customerid ORDER BY CompanyName DESC
7)SELECT Customers.CompanyName,Orders.OrderDate FROM Customers JOIN Orders ON Customers.CustomerID = Orders.customerid