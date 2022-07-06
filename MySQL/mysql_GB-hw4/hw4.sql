/* 
Практическое задание по теме “CRUD - операции”:
1. Повторить все действия по доработке БД vk.
2. Заполнить новые таблицы.
3. Повторить все действия CRUD.
4. Подобрать сервис-образец для курсовой работы.

Как я понял надо повторить все операции пройденные на уроке

*/

USE vk;

-- START подготовительная работа

-- Таблица статусов пользователей
CREATE TABLE user_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "Название статуса (уникально)",
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник статусов пользователей"; 

SELECT * FROM user_statuses;
INSERT INTO user_statuses (name) VALUES ('single'),('married');
UPDATE profiles SET status = NULL;
ALTER TABLE profiles RENAME COLUMN status TO status_id;
ALTER TABLE profiles MODIFY COLUMN status_id INT UNSIGNED;

-- FINISH окончание подготовительной работы


SHOW TABLES;


-- USERS

SELECT * FROM users LIMIT 10;

DESC users ;

-- Приводим в порядок временные метки
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at; 

-- PROFILES

DESC profiles ;

SELECT * FROM profiles p LIMIT 10;

-- Добавляем ссылки на фото и получили страшное предупреждение
UPDATE profiles SET photo_id = FLOOR(1 + RAND() * 100);

-- Поправим столбец пола
CREATE TEMPORARY TABLE genders (name CHAR(1));

INSERT INTO genders VALUES ('m'), ('f'); 

SELECT * FROM genders;

-- Обновляем пол
UPDATE profiles 
  SET gender = (SELECT name FROM genders ORDER BY RAND() LIMIT 1);
 
-- Обновляю status_id
 UPDATE profiles SET status_id = 1 + FLOOR(RAND()*2); 

-- MESSAGES

DESC messages ;
SELECT * FROM messages m LIMIT 10;
-- Обновляем значения ссылок на отправителя и получателя сообщения
UPDATE messages SET 
  from_user_id = FLOOR(1 + RAND() * 100),
  to_user_id = FLOOR(1 + RAND() * 100);

 -- MEDIA
 
DESC media;
SELECT * FROM media m LIMIT 10;
-- Обновляем данные для ссылки на тип и владельца
UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3);
UPDATE media SET user_id = FLOOR(1 + RAND() * 100);

-- Создаём временную таблицу форматов медиафайлов
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));

-- Заполняем значениями
INSERT INTO extensions VALUES ('jpeg'), ('avi'), ('mpeg'), ('png');

-- Проверяем
SELECT * FROM extensions;

-- Обновляем ссылку на файл
UPDATE media SET filename = CONCAT(
  'http://dropbox.net/vk/',
  filename,
  (SELECT last_name FROM users ORDER BY RAND() LIMIT 1),
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

-- Обновляем размер файлов
UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;

-- Заполняем метаданные
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  

-- Возвращаем столбцу метеданных правильный тип
ALTER TABLE media MODIFY COLUMN metadata JSON;

-- FRIENDSHIPS
DESC friendships ;
SELECT * FROM friendships f limit 10;
SELECT * FROM friendship_statuses fs;

-- Очищаем таблицу
TRUNCATE friendship_statuses;
-- Вставляем значения статусов дружбы
INSERT INTO friendship_statuses (name) VALUES 
	('Sent'),  
	('Requested'),
	('Confirmed'), 
	('Rejected');
 
UPDATE friendships SET status_id = FLOOR(1 + RAND() * 4);

 -- Обновляем ссылки на друзей
UPDATE friendships SET 
  user_id = 1 + FLOOR(RAND() * 100),
  friend_id = 1 + FLOOR(RAND() * 100);
 
-- COMMUNITIES
 desc communities ;
SELECT * FROM communities c limit 30;

-- Удаляем часть групп
DELETE FROM communities WHERE id > 30;	

-- COMMUNITIES_USERS

-- Анализируем таблицу связи пользователей и групп
SELECT * FROM communities_users;
-- Обновляем значения community_id
UPDATE communities_users SET
	user_id = 1 + FLOOR(RAND() * 100),
	community_id = FLOOR(1 + RAND() * 30);

desc communities_users ;

-- 4. Сервис - портфель инвестора



















