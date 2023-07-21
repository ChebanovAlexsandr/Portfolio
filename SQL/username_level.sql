Исходные данные: есть 2 таблицы Users и level с соответствующим набором полей. Структура таблиц и значения полей указаны ниже:

CREATE TABLE Users (
  id NOT NULL,
  userName varchar,
  level_id int,
  skill int,
  PRIMARY KEY(id)
  );


CREATE TABLE level (
  id NOT NULL,
  level_name varchar,
  PRIMARY KEY(id)
  );

INSERT INTO Users (id,userName,level_id,skill) values (1, 'Anton',	1,	900000),
(2,	'Denis',	3,	4000),
(3,	'Petr',	2,	50000),
(4,	'Andrey',	4,	20),
(5,	'Olga',	1,	600000),
(6,	'Anna',	1,	1600000);

INSERT INTO level (id,level_name) values (1,'admin'),
(2,	'power_user'),
(3,	'user'),
(4,	'guest')

Задания на написание запросов к БД:								
1. Отобрать из таблицы userName всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква 'а'								
2. Удалить всех пользователей, у которых skill меньше 100000					
3. Вывести все данные из таблицы Users в порядке убывания по полю skill 				
4. Добавить в таблицу Users нового пользователя по имени Oleg, с уровнем 4 и skill =10		
5. Обновить данные в таблице Users -  для пользователей с level_id меньше 2 проставить skill 2000000								
6. Выбрать userName всех пользователей уровня admin используя подзапрос			
7. Выбрать userName всех пользователей уровня admin используя join				

1.SELECT userName FROM Users WHERE level_id = 1 AND skill > 799000 AND userName LIKE '%a%'
2.DELETE FROM Users WHERE skill < 100000
3.SELECT*FROM Users ORDER BY skill DESC
4.INSERT INTO Users VALUES (7,'Oleg',4,10) 
5.UPDATE Users SET skill = 2000000 WHERE level_id < 2
6.SELECT userName FROM Users WHERE level_id = (SELECT id FROM level where level_name = 'admin')
7.SELECT Users.userName,level.level_name FROM Users JOIN level ON Users.level_id = level.id WHERE level.level_name = 'admin'				
