DELIMITER //

DROP PROCEDURE IF EXISTS numcatalogs//
CREATE PROCEDURE numcatalogs (OUT total INT)
BEGIN
  SELECT COUNT(*) INTO total FROM catalogs;
END//

CALL numcatalogs(@a)//
SELECT @a//
