DELIMITER //

CREATE TABLE prices (
  id SERIAL PRIMARY KEY,
  processor DECIMAL (11,2) COMMENT 'Цена процессора',
  mother DECIMAL (11,2) COMMENT 'Цена мат.платы',
  memory DECIMAL (11,2) COMMENT 'Цена оперативной памяти',
  total DECIMAL (11,2) COMMENT 'Результирующая цена'
)//

CREATE TRIGGER auto_update_price_on_insert BEFORE INSERT ON prices
FOR EACH ROW
BEGIN
  SET NEW.total = NEW.processor + NEW.mother + NEW.memory;
END//

CREATE TRIGGER auto_update_price_on_update BEFORE UPDATE ON prices
FOR EACH ROW
BEGIN
  SET NEW.total = NEW.processor + NEW.mother + NEW.memory;
END//

INSERT INTO prices
  (processor, mother, memory)
VALUES
  (7890.00, 5060.00, 4800.00)//

INSERT INTO prices
  (processor, mother, memory)
VALUES
  (12700.00, 19310.00, 6800.00)//

SELECT * FROM prices//

DROP TABLE IF EXISTS prices//

CREATE TABLE prices (
  id SERIAL PRIMARY KEY,
  processor DECIMAL (11,2) COMMENT 'Цена процессора',
  mother DECIMAL (11,2) COMMENT 'Цена мат.платы',
  memory DECIMAL (11,2) COMMENT 'Цена оперативной памяти',
  total DECIMAL (11,2) AS (processor + mother + memory) STORED COMMENT 'Результирующая цена'
)//

INSERT INTO prices
  (processor, mother, memory)
VALUES
  (7890.00, 5060.00, 4800.00)//

INSERT INTO prices
  (processor, mother, memory)
VALUES
  (12700.00, 19310.00, 6800.00)//

SELECT * FROM prices//