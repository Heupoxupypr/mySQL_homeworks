CREATE DATABASE IF NOT EXISTS lesson_3;

USE lesson_3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    post VARCHAR(45) NOT NULL,
    seniority INT, 
    salary DECIMAL(8,2), -- 100 000 . 00
    age INT
);

INSERT staff(firstname, lastname, post, seniority,salary,age)
VALUES ("Петр", "Петров", "Начальник", 8, 70000, 30); -- id = 1
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
  ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
  ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
  ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
  ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff;

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT 
	CONCAT(firstname, " ", lastname) AS fullname,
    id,
    salary
FROM staff
ORDER BY salary DESC;

SELECT 
	CONCAT(firstname, " ", lastname) AS fullname,
    id,
    salary   
FROM staff
ORDER BY salary;

-- Выведите 5 максимальных заработных плат (saraly)
SELECT 
	salary as TOP_5_salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT
	post,
    SUM(salary) AS SUM_salary
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT
	post,
    COUNT(id)
FROM staff
WHERE post = "Рабочий" AND ((age >= 24) AND (age <= 49))
GROUP BY post;

-- Найдите количество специальностей

SELECT COUNT(DISTINCT post) AS Post_count
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

SELECT 
	post,
    ROUND (AVG(age), 0) AS AVG_age
FROM staff
GROUP BY post
HAVING AVG(age) > 30;
