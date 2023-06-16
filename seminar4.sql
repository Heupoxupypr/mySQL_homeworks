DROP DATABASE IF EXISTS lesson_4;
CREATE DATABASE lesson_4;
USE lesson_4;
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT
	c.`name` AS Catname,
    sh.shopname AS Shopname
FROM cats c
JOIN shops sh ON c.shops_id = sh.id;

-- Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
SELECT
	c.`name` AS Catname,
    sh.shopname AS Shopname
FROM cats c
JOIN shops sh ON c.shops_id = sh.id
WHERE c.`name` = "Murzik";

SELECT
	sh.shopname AS Shopname,
    murzik_shop.`name` AS Catname    
FROM shops sh
JOIN (SELECT `name`, shops_id FROM cats WHERE `name` = "Murzik") murzik_shop
ON murzik_shop.shops_id = sh.id;

-- Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

SELECT
	sh.shopname,
    err_shops.shops_id
FROM shops sh
LEFT JOIN (SELECT shops_id FROM cats WHERE `name` = "Murzik" OR `name` = "Zuza") err_shops
ON err_shops.shops_id = sh.id
WHERE err_shops.shops_id is null;

