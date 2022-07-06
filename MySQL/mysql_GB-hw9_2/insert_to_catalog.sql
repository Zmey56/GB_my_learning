DELIMITER //

DROP PROCEDURE IF EXISTS insert_to_catalog//
CREATE PROCEDURE insert_to_catalog (IN id INT, IN name VARCHAR(255))
BEGIN
  DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @error = 'Ошибка вставки значения';
  INSERT INTO catalogs VALUES(id, name);
  IF @error IS NOT NULL THEN
    SELECT @error;
  END IF;
END//

SELECT * FROM catalogs//

CALL insert_to_catalog(4, 'Оперативная память')//
CALL insert_to_catalog(1, 'Процессоры')//
