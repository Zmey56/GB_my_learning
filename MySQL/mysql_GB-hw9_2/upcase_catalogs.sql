DELIMITER //

DROP TABLE IF EXISTS upcase_catalogs//
CREATE TABLE upcase_catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина'//

DROP PROCEDURE IF EXISTS copy_catalogs//
CREATE PROCEDURE copy_catalogs ()
BEGIN
  DECLARE id INT;
  DECLARE is_end INT DEFAULT 0;
  DECLARE name TINYTEXT;

  DECLARE curcat CURSOR FOR SELECT * FROM catalogs;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;

  OPEN curcat;

  cycle : LOOP
    FETCH curcat INTO id, name;
    IF is_end THEN LEAVE cycle;
    END IF;
    INSERT INTO upcase_catalogs VALUES(id, UPPER(name));
  END LOOP cycle;

  CLOSE curcat;
END//
