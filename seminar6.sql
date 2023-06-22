-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS get_time;
DELIMITER //
CREATE FUNCTION get_time
(
	seconds INT 
)
RETURNS VARCHAR (500) 
DETERMINISTIC
BEGIN
	DECLARE days INT;
	DECLARE hours INT;
	DECLARE minutes INT;
	SET days = FLOOR(seconds / 60 / 60 / 24);
    SET seconds = seconds - days * 24 * 60 * 60;
    SET hours = FLOOR(seconds / 60 / 60);
    SET seconds = seconds - hours * 60 * 60;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds - minutes * 60;
	RETURN CONCAT( days, " days ", hours, " hours ", minutes, " minutes ", seconds, " seconds "); -- minutes, " minutes ",
END; //
DELIMITER ; 

SELECT get_time(123456) AS "Time";

-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS print_even_numbers;
DELIMITER //
CREATE PROCEDURE print_even_numbers
(
	input_number INT 
)
BEGIN 
	DECLARE n INT; -- n = input_number
    DECLARE result VARCHAR(45) DEFAULT "";
    
    SET n = 1;
    REPEAT
		IF n%2 = 0 THEN
			SET result = CONCAT(result, n,",");
		END IF;
		SET n = n + 1;
        
        UNTIL n > input_number

    END REPEAT;
    SELECT result;
END; //
DELIMITER ; 

-- Вызов процедуры 
CALL print_even_numbers(10);