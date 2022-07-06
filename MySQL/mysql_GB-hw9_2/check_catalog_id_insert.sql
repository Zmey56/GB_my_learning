DELIMITER //

CREATE TRIGGER check_catalog_id_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
  DECLARE cat_id INT;
  SELECT id INTO cat_id FROM catalogs ORDER BY id LIMIT 1;
  SET NEW.catalog_id = COALESCE(NEW.catalog_id, cat_id);
END//

CREATE TRIGGER check_catalog_id_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
  DECLARE cat_id INT;
  SELECT id INTO cat_id FROM catalogs ORDER BY id LIMIT 1;
  SET NEW.catalog_id = COALESCE(NEW.catalog_id, OLD.catalog_id, cat_id);
END//
