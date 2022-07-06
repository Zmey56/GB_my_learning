DELIMITER //

CREATE PROCEDURE declare_var ()
BEGIN
  DECLARE id, num INT(11) DEFAULT 0;
  DECLARE name, hello, temp TINYTEXT;
END//

DROP PROCEDURE IF EXISTS declare_var//
CREATE PROCEDURE declare_var ()
BEGIN
  DECLARE var TINYTEXT DEFAULT 'внешняя переменная';
  BEGIN
    DECLARE var TINYTEXT DEFAULT 'внутренняя переменная';
    SELECT var;
  END;
  SELECT var;
END//
CALL declare_var()//

CREATE PROCEDURE one_declare_var ()
BEGIN
  DECLARE var TINYTEXT DEFAULT 'внешняя переменная';
  BEGIN
    SELECT var;
  END;
  SELECT var;
END//
