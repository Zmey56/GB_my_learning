# Задание 1. Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)

#решил выделить страны, но лучше сделать иные ссылки для каждого поля. Лучше бы сделать ссылки в первоначально созданных таблицах 
USE vk;

-- считаю необходимо добавить таблицу страны, хотя лучше было вынести и города из уже созданной таблицы
DROP TABLE IF EXISTS country;

CREATE TABLE IF NOT EXISTS country(
	id SERIAL,
	nation VARCHAR(50) NOT NULL
)

ALTER TABLE `profiles` ADD CONSTRAINT fk_country
    FOREIGN KEY (user_id) REFERENCES country(id); 
   
   
-- так же можно создать таблицу дя деления медиа на типы --
   
DROP TABLE IF EXISTS typeMedia;

CREATE TABLE IF NOT EXISTS typeMedia(
	id SERIAL,
	sex ENUM('video', 'photo', 'music') NOT NULL
)

ALTER TABLE `profiles` ADD CONSTRAINT media_type
    FOREIGN KEY (user_id) REFERENCES typeMedia(id);
   
   
-- последняя таблица - доступность медиа другим --  

DROP TABLE IF EXISTS privateMedia;

CREATE TABLE IF NOT EXISTS privateMedia(
	id SERIAL,
	typePrivate BOOL NOT NULL
)

ALTER TABLE `media` ADD CONSTRAINT media_private
    FOREIGN KEY (id) REFERENCES privateMedia(id);
