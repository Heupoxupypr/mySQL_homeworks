CREATE DATABASE IF NOT EXISTS lesson_5;

USE lesson_5;

DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW cost_filter
AS
SELECT
	*
FROM cars
WHERE
	cost <= 25000
ORDER BY cost DESC;

SELECT
	*
FROM cost_filter;

-- Изменить в существующем представлении порог для стоимости:
-- пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
CREATE OR REPLACE VIEW cost_filter
AS
SELECT
	*
FROM cars
WHERE
	cost <= 30000
ORDER BY cost DESC;

SELECT
	*
FROM cost_filter;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE OR REPLACE VIEW name_filter
AS
SELECT
	*
FROM cars
WHERE
	`name` IN ("Skoda","Audi")
ORDER BY cost DESC;

SELECT
	*
FROM name_filter;

DROP TABLE IF EXISTS trains_way;
CREATE TABLE trains_way
(
	id INT NOT NULL PRIMARY KEY,
    train_id INT,
    station VARCHAR(45),
    station_time TIME
);

INSERT trains_way
VALUES
	(1, 110, "San Francisco","10:00:00"),
    (2, 110, "Redwood City","10:54:00" ),
    (3, 110, "Palo Alto","11:02:00" ),
    (4, 110, "San Jose","12:35:00" ),
	(5, 120, "San Francisco","11:00:00"),
    (6, 120, "Palo Alto","12:49:00"), 
    (7, 120, "San Jose","13:30:00"); 
    
    SELECT
		*
	FROM trains_way;
    
SELECT 
	train_id,
	station,
    station_time, 
	TIMEDIFF(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY station_time), station_time) AS time_to_next_station_interval
FROM trains_way;