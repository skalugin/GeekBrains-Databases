-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
ALTER TABLE users ADD (
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW());

-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

ALTER TABLE users 
DROP COLUMN created_at, 
DROP COLUMN updated_at
;

ALTER TABLE users ADD (
	created_at VARCHAR(100) DEFAULT "20.10.2017 8:10",
	updated_at VARCHAR(100) DEFAULT "20.10.2017 8:10")
;

UPDATE users  
	SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %T');

UPDATE users  
	SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %T');


ALTER TABLE users 
	MODIFY COLUMN created_at DATETIME,
	MODIFY COLUMN updated_at DATETIME
;

-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.

SELECT * from test.storehouses_products  ORDER BY value = 0, value;

-- по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)

ALTER TABLE users ADD birthday DATETIME;
	
SELECT * FROM test.users WHERE (MONTH(birthday) = date_format(str_to_date('March','%M'),'%c')) or (MONTH(birthday) = date_format(str_to_date('May','%M'),'%c'))

-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM shop.catalogs as selection WHERE id IN (5, 1, 2) ORDER BY selection.name;



