USE vk;

/*Напишем процедуру, которая будет предлагать пользователям новых друзей.
Критерии выбора пользователей:
	из одного города
	состоят в одной группе
	друзья друзей
Из выборки будем показывать 5 человек в случайной комбинации.
*/

drop procedure if exists friendship_offers;

delimiter //
create procedure friendship_offers(in for_user_id INT)
  begin
	-- общий город
	select p2.user_id
	from profiles p1
	join profiles p2 
	    on p1.hometown = p2.hometown
	where p1.user_id = for_user_id 
	    and p2.user_id <> for_user_id -- исключим себя
	
		union 
		
	-- общие группы
	select uc2.user_id
	from users_communities uc1
	join users_communities uc2 
	    on uc1.community_id = uc2.community_id
	where uc1.user_id = for_user_id 
	    and uc2.user_id <> for_user_id -- исключим себя

		union 
		
	-- друзья друзей
	-- получим друзей друзей
	-- объединяем таблицу саму с собой 3 раза
	-- фильтруем «первую» таблицу по for_user_id
	select fr3.target_user_id	
	from friend_requests fr1
		join friend_requests fr2 
		    on (fr1.target_user_id = fr2.initiator_user_id 
		        or fr1.initiator_user_id = fr2.target_user_id)
		join friend_requests fr3 
		    on (fr3.target_user_id = fr2.initiator_user_id 
		        or fr3.initiator_user_id = fr2.target_user_id)
	where (fr1.initiator_user_id = for_user_id or fr1.target_user_id = for_user_id)
	 	and fr2.status = 'approved' -- оставляем только подтвержденную дружбу
	 	and fr3.status = 'approved'
		and fr3.target_user_id <> for_user_id -- исключим себя
	
	order by rand() -- будем брать всегда случайные записи
	limit 5; -- ограничим всю выборку до 5 строк
  END// -- не забываем наш новый разделитель
DELIMITER ; -- вернем прежний разделитель



/*
Направленность дружбы
Кол-во приглашений в друзья к пользователю
/
Кол-во приглашений в друзья от пользователя

Чем больше - популярность выше
Если значение меньше единицы - пользователь инициатор связей.
*/
USE vk;

DROP FUNCTION IF EXISTS func_friendship_direction;

DELIMITER // -- выставим разделитель
CREATE FUNCTION func_friendship_direction(check_user_id INT)
RETURNS FLOAT READS SQL DATA
  BEGIN
-- объявим переменные
    DECLARE requests_to_user INT;
    DECLARE requests_from_user INT;
    DECLARE `_result` FLOAT;
    
-- получим запросы к пользователю
    SET requests_to_user = (
    	SELECT COUNT(*) 
        FROM friend_requests
        WHERE target_user_id = check_user_id);
    
-- получим запросы от пользователя
/*	SET requests_from_user = (
		SELECT count(*)
		from friend_requests
		where check_user_id = initiator_user_id 
	);*/
  	SELECT COUNT(*)
  	INTO requests_from_user 
	FROM friend_requests
      WHERE initiator_user_id = check_user_id;

-- разделим первое на второе
    	if requests_from_user > 0 then 
		set `_result` = requests_to_user / requests_from_user;
	else 
		set `_result` = 99999;
	end if;

-- вернем результат
	return `_result`;

  END// -- не забываем наш новый разделитель
DELIMITER ; -- вернем прежний разделитель


/*
Процедура добавления пользователя в БД
*/

-- обработка ошибки в транзакции
DROP PROCEDURE IF EXISTS `sp_add_user`;

DELIMITER $$

CREATE PROCEDURE `sp_add_user`(firstname varchar(100), lastname varchar(100), email varchar(100), phone varchar(12), hometown varchar(50), photo_id INT, OUT tran_result varchar(200))
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
   	DECLARE code varchar(100);
   	DECLARE error_string varchar(100);
   DECLARE last_user_id int;

   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
   begin
    	SET `_rollback` = 1;
	GET stacked DIAGNOSTICS CONDITION 1
          code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
    	set tran_result := concat('Error occured. Code: ', code, '. Text: ', error_string);
    end;
		        
    START TRANSACTION;
		INSERT INTO users (firstname, lastname, email, phone)
		  VALUES (firstname, lastname, email, phone);
	
		INSERT INTO profiles (user_id, hometown, photo_id)
		  VALUES (last_insert_id(), hometown, photo_id); 
	
	    IF `_rollback` THEN
	       ROLLBACK;
	    ELSE
		set tran_result := 'ok';
	       COMMIT;
	    END IF;
END$$

DELIMITER ;

-- вызываем процедуру
call sp_add_user('New', 'User', 'new87@mail.com', 454545456, 'Moscow', 1, @tran_result);

-- смотрим результат
select @tran_result;



-- представление, выбирающее друзей пользователей
CREATE or replace VIEW v_friends
AS 
  select *
  FROM users u
    JOIN friend_requests fr ON u.id = fr.target_user_id
  WHERE 
  fr.status = 'approved'

  	union
  	
  select *
  FROM users u
    JOIN friend_requests fr ON u.id = fr.initiator_user_id
  WHERE 
  fr.status = 'approved'
;

-- получим друзей пользователя из представления 
select *
from v_friends;


-- триггер для проверки возраста пользователя перед обновлением
DROP TRIGGER IF EXISTS check_user_age_before_update;

DELIMITER //

CREATE TRIGGER check_user_age_before_update BEFORE UPDATE ON profiles
FOR EACH ROW
begin
    IF NEW.birthday >= CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Canceled. Birthday must be in the past!';
    END IF;
END//

DELIMITER ;


-- триггер для корректировки возраста пользователя при вставке новых строк

DROP TRIGGER IF EXISTS check_user_age_before_insert;

DELIMITER //

CREATE TRIGGER check_user_age_before_insert BEFORE INSERT ON profiles
FOR EACH ROW
begin
    IF NEW.birthday > CURRENT_DATE() THEN
        SET NEW.birthday = CURRENT_DATE();
    END IF;
END//

DELIMITER ;



