-- триггер для проверки что возраст не пустое значение
DROP TRIGGER IF EXISTS trader_age;

DELIMITER //

CREATE TRIGGER trader_age BEFORE UPDATE ON trader
FOR EACH ROW
BEGIN
	IF NEW.birthday IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Необходимо добавить дату рождения';
    END IF;
END//

DELIMITER ;

-- триггер для проверки что трейдер совершенолетний
DROP TRIGGER IF EXISTS trader_age;

DELIMITER //

CREATE TRIGGER trader_age BEFORE UPDATE ON trader
FOR EACH ROW
BEGIN
    IF NEW.birthday >= CURRENT_DATE() - INTERVAL 18 YEAR THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Подождите когда вам исполниться 18';
    END IF;
END//

DELIMITER ;

-- триггер для проверки что трейдер одновременно не выставляет одну и ту-же позицию сразу на продажу и покупку
DROP TRIGGER IF EXISTS trader_age;

DELIMITER //

CREATE TRIGGER trader_age BEFORE UPDATE ON trader
FOR EACH ROW
BEGIN
    IF NEW.sell = 1 AND NEW.buy = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Нельзя совершать одновременно покупку и продажу';
    END IF;
END//

DELIMITER ;

-- триггер для проверки что трейдер выбрал или покупку или продажу
DROP TRIGGER IF EXISTS trader_age;

DELIMITER //

CREATE TRIGGER trader_age BEFORE UPDATE ON trader
FOR EACH ROW
BEGIN
    IF NEW.sell = 0 AND NEW.buy = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Надо выбрать одну из операций';
    END IF;
END//

DELIMITER ;