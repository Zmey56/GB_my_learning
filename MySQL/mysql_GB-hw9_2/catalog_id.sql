DELIMITER //

DROP PROCEDURE IF EXISTS catalog_id//
CREATE PROCEDURE catalog_id (OUT total INT)
BEGIN
  SELECT id INTO total FROM catalogs;
END//

CALL catalog_id(@total)//