DELIMITER //

CREATE PROCEDURE NOWN (IN num INT)
BEGIN
  DECLARE i INT DEFAULT 0;
  IF (num > 0) THEN
    WHILE i < num DO
      SELECT NOW();
      SET i = i + 1;
    END WHILE;
  ELSE
    SELECT 'Ошибочное значение параметра';
  END IF;
END//

CALL NOWN(1000)//