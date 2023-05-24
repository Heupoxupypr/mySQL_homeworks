CREATE DATABASE IF NOT EXISTS lesson_1;

USE lesson_1;

DROP TABLE IF EXISTS phone;
CREATE TABLE phone
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(20),
    manufacturer VARCHAR(20),
    product_count INT,
    price INT
);

INSERT phone (product_name, manufacturer, product_count, price)
VALUES
	("iPhone X", "Apple", 3, 76000),
	("iPhone 8", "Apple", 2, 51000),
	("Galaxy S9", "Samsung", 2, 56000),
	("Galaxy S8", "Samsung", 1, 41000),
	("P20 Pro", "Huawei", 5, 36000);
    
-- SELECT * FROM phone;

-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT product_name, price
FROM phone
WHERE product_count > 2;

-- Выведите весь ассортимент товаров марки “Samsung”
SELECT product_name, product_count, price
FROM phone
WHERE manufacturer = "Samsung";

-- Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT product_name, manufacturer, product_count, price
FROM phone
WHERE product_count * price >= 100000 AND product_count * price <= 145000;

-- найти Товары, в которых есть упоминание "Iphone"
SELECT product_name, manufacturer, product_count, price
FROM phone
WHERE product_name LIKE "%Iphone%";

-- найти "Galaxy"
SELECT product_name, manufacturer, product_count, price
FROM phone
WHERE product_name LIKE "%Galaxy%";

-- найти Товары, в которых есть ЦИФРЫ
SELECT product_name, manufacturer, product_count, price
FROM phone
WHERE product_name RLIKE "[0-9]";

-- Товары, в которых есть ЦИФРА "8"
SELECT product_name, manufacturer, product_count, price
FROM phone
WHERE product_name RLIKE "8";