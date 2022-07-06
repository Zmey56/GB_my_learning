DELIMITER //

DROP PROCEDURE IF EXISTS numbers_string//
CREATE PROCEDURE numbers_string (IN num INT)
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE bin TINYTEXT DEFAULT '';
  IF (num > 0) THEN
    cycle : WHILE i < num DO
      SET i = i + 1;
      SET bin = CONCAT(bin, i);
      IF i > CEILING(num / 2) THEN ITERATE cycle;
      END IF;
      SET bin = CONCAT(bin, i);
    END WHILE cycle;
    SELECT bin;
  ELSE
    SELECT 'Ошибочное значение параметра';
  END IF;
END//

CALL numbers_string(9)//