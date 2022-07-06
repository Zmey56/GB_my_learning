DELIMITER //

DROP PROCEDURE IF EXISTS format_now//
CREATE PROCEDURE format_now (format CHAR(4))
BEGIN
  IF(format = 'date') THEN
    SELECT DATE_FORMAT(NOW(), "%d.%m.%Y") AS format_now;
  END IF;
  IF(format = 'time') THEN
    SELECT DATE_FORMAT(NOW(), "%H:%i:%s") AS format_now;
  END IF;
END//

CALL format_now('date')//
CALL format_now('time')//

DROP PROCEDURE IF EXISTS format_now//
CREATE PROCEDURE format_now (format CHAR(4))
BEGIN
  IF(format = 'date') THEN
    SELECT DATE_FORMAT(NOW(), "%d.%m.%Y") AS format_now;
  ELSE
    SELECT DATE_FORMAT(NOW(), "%H:%i:%s") AS format_now;
  END IF;
END//

DROP PROCEDURE IF EXISTS format_now//
CREATE PROCEDURE format_now (format CHAR(4))
BEGIN
  IF(format = 'date') THEN
    SELECT DATE_FORMAT(NOW(), "%d.%m.%Y") AS format_now;
  ELSEIF (format = 'time') THEN
    SELECT DATE_FORMAT(NOW(), "%H:%i:%s") AS format_now;
  ELSE
    SELECT UNIX_TIMESTAMP(NOW()) AS format_now;
  END IF;
END//

DROP PROCEDURE IF EXISTS format_now//
CREATE PROCEDURE format_now (format CHAR(4))
BEGIN
  CASE format
    WHEN 'date' THEN
      SELECT DATE_FORMAT(NOW(), "%d.%m.%Y") AS format_now;
    WHEN 'time' THEN
      SELECT DATE_FORMAT(NOW(), "%H:%i:%s") AS format_now;
    WHEN 'secs' THEN
      SELECT UNIX_TIMESTAMP(NOW()) AS format_now;
    ELSE
      SELECT 'Ошибка в параметре format';
  END CASE;
END//

CALL format_now ('date')//
CALL format_now ('secs')//
CALL format_now ('four')//
