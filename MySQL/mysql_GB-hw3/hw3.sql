-- 1. Предлагаю в качестве оптимизации вынести таблицы Country, gender, city для Profiles

-- 2. Предлагаю создать три таблицы для каждого типа отдельно: медиафайлов, постов и пользователей.

USE vk;
-- Таблица лайков медиафайлов
CREATE TABLE media_like (
	media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на медиафайл",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
	is_like BOOLEAN COMMENT "Понравилось или нет",
	PRIMARY KEY (media_id, user_id) COMMENT "Составной первичный ключ",
	created_at DATETIME DEFAULT NOW() COMMENT "Время первой отметки",
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время когда передумал"
) COMMENT "Лайки медиафайлов";

-- Таблица лайков постов
CREATE TABLE messages_like (
	messages_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пост",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
	is_like BOOLEAN COMMENT "Понравился или нет",
	PRIMARY KEY (messages_id, user_id) COMMENT "Составной первичный ключ",
	created_at DATETIME DEFAULT NOW() COMMENT "Время первой отметки",
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время когда передумал"
) COMMENT "Лайки постов";

-- Таблица лайков юзеров
CREATE TABLE user_like (
	user_like_id INT UNSIGNED NOT NULL COMMENT "Ссылка на юзера",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
	is_like BOOLEAN COMMENT "Понравился или нет",
	PRIMARY KEY (user_like_id, user_id) COMMENT "Составной первичный ключ",
	created_at DATETIME DEFAULT NOW() COMMENT "Время первой отметки",
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время когда передумал"
) COMMENT "Лайки пользователя";

-- Используя сервис http://filldb.info или другой по вашему желанию, сгенерировать тестовые данные для всех таблиц, учитывая логику связей. 
-- Для всех таблиц, где это имеет смысл, создать не менее 100 строк. Создать локально БД vk и загрузить в неё тестовые данные.
-- Так как получаю большое количество ошибок при генерации на сайте - решил воспользоваться кодом из следующего урока
-- единственное сгенерировал для своих таблиц лайков

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Группы';

INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'qui', '2012-11-24 17:20:16', '2016-12-28 04:36:37');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'et', '2011-11-07 19:35:30', '2011-08-16 14:45:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'minima', '2011-02-13 19:27:18', '2019-03-06 19:05:04');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'doloremque', '2018-10-08 15:52:14', '2010-11-28 04:38:35');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'nihil', '2018-07-15 08:05:12', '2016-10-20 01:36:51');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'esse', '2011-03-21 06:33:08', '2017-01-19 06:27:03');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'nesciunt', '2012-09-04 20:29:02', '2010-12-12 09:52:10');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'ut', '2014-11-06 19:47:53', '2018-05-01 02:29:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'eligendi', '2014-11-29 12:48:14', '2016-06-13 01:39:51');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'aut', '2020-06-11 23:15:20', '2010-11-16 04:32:11');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'assumenda', '2014-10-19 11:31:56', '2016-01-10 22:00:49');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'labore', '2016-01-05 02:55:46', '2015-12-04 18:22:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'temporibus', '2014-06-13 00:14:38', '2011-11-13 17:54:37');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'ipsa', '2017-06-16 22:54:31', '2019-04-17 07:06:05');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'sunt', '2017-04-11 15:22:15', '2014-05-08 16:36:57');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'in', '2013-11-22 23:12:00', '2014-01-28 20:22:24');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'quidem', '2014-04-17 22:39:01', '2015-02-13 18:55:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'inventore', '2017-08-12 02:24:29', '2019-04-03 02:25:54');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'beatae', '2017-01-12 09:37:00', '2019-03-21 14:57:45');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'ad', '2012-08-17 01:21:31', '2020-05-18 19:37:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (21, 'ex', '2012-02-17 11:05:56', '2011-09-02 18:46:19');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (22, 'autem', '2018-12-02 07:28:54', '2015-08-12 02:31:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (23, 'possimus', '2018-03-01 23:05:07', '2019-12-28 01:13:39');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (24, 'totam', '2013-07-12 17:55:30', '2016-12-02 22:41:25');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (25, 'atque', '2013-09-15 04:06:35', '2020-04-29 23:47:38');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (26, 'ipsam', '2015-12-20 15:30:35', '2015-02-04 14:09:10');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (27, 'ratione', '2011-05-15 15:16:16', '2011-11-05 22:22:36');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (28, 'dolor', '2016-09-18 05:36:10', '2014-05-12 03:50:54');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (29, 'aliquid', '2017-01-22 03:51:11', '2013-11-05 14:40:22');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (30, 'tenetur', '2016-04-10 20:58:03', '2020-08-08 10:59:01');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (31, 'sint', '2018-02-04 15:19:08', '2017-06-18 11:13:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (32, 'delectus', '2015-09-14 03:58:23', '2017-07-29 14:45:03');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (33, 'dolores', '2013-04-21 03:08:58', '2016-12-26 03:36:19');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (34, 'quis', '2020-08-19 20:49:07', '2011-05-24 15:29:12');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (35, 'vel', '2018-02-20 18:06:15', '2016-07-25 23:10:01');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (36, 'debitis', '2019-09-22 11:39:50', '2012-09-14 20:06:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (37, 'odit', '2015-08-03 17:24:36', '2014-08-27 18:44:03');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (38, 'enim', '2012-03-20 10:41:25', '2019-08-27 00:06:45');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (39, 'architecto', '2017-06-24 03:09:58', '2015-05-15 16:41:52');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (40, 'fugiat', '2019-09-08 01:26:47', '2014-05-13 01:52:33');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (41, 'placeat', '2014-03-03 21:18:38', '2017-04-02 15:30:59');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (42, 'accusantium', '2015-06-19 21:27:28', '2015-09-22 07:48:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (43, 'animi', '2012-12-23 11:56:12', '2016-12-21 09:51:45');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (44, 'numquam', '2013-07-08 23:59:40', '2012-07-22 16:10:42');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (45, 'molestiae', '2015-07-11 04:30:54', '2016-06-11 15:13:57');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (46, 'expedita', '2015-08-19 13:43:39', '2010-11-23 14:47:49');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (47, 'voluptate', '2012-07-24 11:01:16', '2015-05-24 23:34:46');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (48, 'consectetur', '2019-12-12 07:30:50', '2011-01-30 07:12:52');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (49, 'nisi', '2011-09-11 06:02:30', '2016-09-30 05:52:22');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (50, 'corporis', '2019-09-10 20:22:50', '2016-06-12 12:00:43');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (51, 'quo', '2014-12-30 22:28:14', '2016-10-31 07:44:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (52, 'itaque', '2011-05-18 04:42:00', '2014-06-13 22:58:38');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (53, 'saepe', '2015-07-11 14:54:53', '2017-01-30 20:22:00');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (54, 'sed', '2014-09-20 10:08:05', '2017-02-10 03:08:02');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (55, 'non', '2011-04-09 13:45:43', '2020-04-17 04:32:39');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (56, 'voluptatum', '2014-07-18 07:43:53', '2017-06-29 02:10:00');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (57, 'quos', '2019-11-21 11:55:09', '2019-10-26 06:45:54');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (58, 'ducimus', '2020-06-18 04:14:26', '2017-02-01 20:53:10');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (59, 'laborum', '2014-05-06 16:38:12', '2015-10-25 06:46:31');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (60, 'minus', '2015-06-07 23:15:40', '2016-07-28 10:41:02');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (61, 'sapiente', '2019-12-07 20:36:51', '2019-05-30 23:36:55');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (62, 'rem', '2017-05-25 01:28:00', '2012-09-26 23:25:55');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (63, 'rerum', '2015-05-28 06:17:44', '2013-09-07 19:15:48');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (64, 'accusamus', '2017-12-26 02:14:15', '2015-02-04 07:50:10');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (65, 'est', '2016-02-27 22:01:13', '2017-08-26 01:00:12');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (66, 'sequi', '2017-09-06 09:47:06', '2010-10-11 04:59:48');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (67, 'mollitia', '2020-01-30 09:02:17', '2012-07-27 03:03:19');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (68, 'quisquam', '2019-08-20 23:12:43', '2012-02-09 14:48:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (69, 'dignissimos', '2012-07-16 23:14:01', '2015-04-26 00:07:22');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (70, 'quae', '2019-02-22 23:21:01', '2017-09-26 19:03:03');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (71, 'amet', '2019-10-24 15:23:55', '2015-05-28 11:39:04');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (72, 'nulla', '2012-05-13 03:50:50', '2015-12-27 14:26:00');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (73, 'occaecati', '2010-10-04 18:31:11', '2020-07-03 14:12:47');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (74, 'eos', '2016-07-06 11:48:19', '2013-09-21 09:19:37');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (75, 'tempora', '2020-02-03 14:15:34', '2012-06-16 04:21:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (76, 'perspiciatis', '2016-08-02 03:13:43', '2017-02-04 22:11:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (77, 'vitae', '2016-11-09 14:34:13', '2016-07-30 09:27:49');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (78, 'a', '2017-01-27 10:22:09', '2017-08-02 20:00:13');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (79, 'ea', '2016-06-04 10:07:20', '2018-05-27 18:59:30');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (80, 'voluptatem', '2010-10-17 04:28:57', '2012-04-11 04:37:27');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (81, 'magni', '2015-04-16 14:48:14', '2018-10-16 15:35:16');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (82, 'hic', '2011-12-14 07:11:37', '2013-01-12 13:29:37');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (83, 'quibusdam', '2012-03-27 04:17:07', '2015-01-31 03:42:39');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (84, 'dolorem', '2020-03-07 20:05:05', '2017-08-28 00:46:36');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (85, 'omnis', '2012-01-31 18:37:19', '2013-11-28 14:18:51');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (86, 'veritatis', '2017-05-25 14:17:16', '2019-07-06 23:12:15');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (87, 'repellat', '2016-01-30 00:00:56', '2019-01-18 22:42:33');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (88, 'quas', '2020-07-09 03:51:14', '2019-03-02 06:15:47');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (89, 'fugit', '2012-04-30 21:06:20', '2015-12-02 01:58:44');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (90, 'quia', '2013-06-07 04:42:09', '2014-04-18 09:29:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (91, 'aperiam', '2017-04-28 03:32:31', '2019-12-08 15:37:32');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (92, 'quaerat', '2017-09-12 05:16:28', '2014-11-24 10:29:24');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (93, 'iure', '2014-07-01 09:12:30', '2014-02-22 11:48:12');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (94, 'vero', '2019-10-23 06:49:30', '2014-02-16 14:09:42');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (95, 'excepturi', '2019-07-25 03:01:44', '2018-05-02 13:34:31');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (96, 'repellendus', '2015-07-21 19:11:12', '2014-10-04 00:58:51');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (97, 'eaque', '2012-01-05 20:36:46', '2019-04-17 13:24:27');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (98, 'distinctio', '2019-02-08 13:46:28', '2010-10-01 03:32:40');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (99, 'maiores', '2016-08-26 07:06:14', '2013-11-02 17:29:33');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (100, 'asperiores', '2012-07-04 06:35:02', '2016-08-30 23:36:13');


#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на группу',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';

INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (1, 1, '2013-12-13 03:21:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (2, 2, '2015-09-13 11:46:22');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (3, 3, '2012-09-30 11:06:33');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (4, 4, '2012-10-14 20:28:44');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (5, 5, '2018-01-21 12:59:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (6, 6, '2010-11-08 16:35:06');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (7, 7, '2013-07-21 04:27:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (8, 8, '2012-07-20 16:38:23');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (9, 9, '2019-12-03 15:03:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (10, 10, '2012-12-26 19:07:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (11, 11, '2012-12-15 06:21:14');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (12, 12, '2019-04-14 05:44:46');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (13, 13, '2016-04-09 20:06:39');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (14, 14, '2012-03-03 06:05:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (15, 15, '2017-08-25 09:47:18');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (16, 16, '2015-03-29 03:58:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (17, 17, '2020-04-09 22:45:37');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (18, 18, '2019-11-01 23:39:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (19, 19, '2010-10-19 05:24:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (20, 20, '2018-05-24 13:32:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (21, 21, '2019-11-10 01:53:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (22, 22, '2017-09-30 08:27:32');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (23, 23, '2015-10-16 01:38:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (24, 24, '2018-06-04 18:24:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (25, 25, '2011-05-17 20:55:06');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (26, 26, '2020-09-06 05:43:31');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (27, 27, '2012-08-25 16:07:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (28, 28, '2012-07-17 23:09:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (29, 29, '2020-05-29 08:01:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (30, 30, '2019-09-11 11:33:24');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (31, 31, '2011-10-04 03:57:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (32, 32, '2011-05-04 03:05:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (33, 33, '2019-12-20 08:29:02');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (34, 34, '2014-08-25 19:33:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (35, 35, '2010-10-13 17:51:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (36, 36, '2018-05-24 13:29:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (37, 37, '2016-03-29 04:23:54');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (38, 38, '2019-07-03 02:45:16');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (39, 39, '2013-05-15 01:04:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (40, 40, '2018-09-09 04:12:39');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (41, 41, '2017-07-28 16:22:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (42, 42, '2020-04-06 09:37:30');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (43, 43, '2020-01-03 10:58:34');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (44, 44, '2012-10-07 13:46:48');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (45, 45, '2019-11-27 09:39:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (46, 46, '2011-09-27 10:00:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (47, 47, '2019-05-01 22:51:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (48, 48, '2015-12-22 07:51:12');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (49, 49, '2011-05-14 18:55:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (50, 50, '2012-12-25 18:17:51');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (51, 51, '2013-02-07 21:09:50');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (52, 52, '2018-01-31 23:05:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (53, 53, '2011-03-28 09:10:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (54, 54, '2014-09-04 20:45:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (55, 55, '2011-12-05 15:07:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (56, 56, '2012-09-27 07:31:42');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (57, 57, '2016-02-07 23:37:58');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (58, 58, '2015-03-11 08:41:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (59, 59, '2011-07-20 03:36:57');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (60, 60, '2012-07-23 02:04:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (61, 61, '2017-12-30 09:30:49');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (62, 62, '2011-06-23 18:18:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (63, 63, '2014-07-21 15:47:30');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (64, 64, '2012-05-19 14:10:00');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (65, 65, '2014-09-15 13:53:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (66, 66, '2011-06-20 02:44:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (67, 67, '2012-12-11 19:34:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (68, 68, '2017-07-07 13:11:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (69, 69, '2016-03-18 07:14:50');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (70, 70, '2016-03-17 12:50:56');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (71, 71, '2014-01-18 07:00:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (72, 72, '2018-12-27 17:21:38');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (73, 73, '2019-12-21 13:26:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (74, 74, '2017-07-11 05:27:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (75, 75, '2011-05-12 12:09:33');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (76, 76, '2016-08-15 08:00:38');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (77, 77, '2017-04-28 08:30:03');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (78, 78, '2011-04-04 06:33:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (79, 79, '2020-04-05 06:09:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (80, 80, '2014-07-27 22:09:06');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (81, 81, '2015-04-17 23:14:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (82, 82, '2017-11-17 06:06:18');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (83, 83, '2017-03-01 05:29:36');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (84, 84, '2016-09-16 17:18:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (85, 85, '2014-04-04 02:40:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (86, 86, '2011-07-04 18:30:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (87, 87, '2018-11-08 06:19:28');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (88, 88, '2014-04-10 20:12:24');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (89, 89, '2019-05-11 06:25:46');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (90, 90, '2012-01-15 02:59:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (91, 91, '2016-10-13 22:20:36');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (92, 92, '2015-08-18 19:03:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (93, 93, '2013-11-13 09:51:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (94, 94, '2013-04-27 13:19:14');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (95, 95, '2015-06-03 00:43:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (96, 96, '2011-05-25 12:15:56');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (97, 97, '2015-04-26 11:58:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (98, 98, '2017-05-27 09:15:00');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (99, 99, '2015-08-22 15:58:48');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (100, 100, '2019-11-18 07:54:54');


#
# TABLE STRUCTURE FOR: friendship
#

DROP TABLE IF EXISTS `friendship`;

CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `status_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на статус (текущее состояние) отношений',
  `requested_at` datetime DEFAULT current_timestamp() COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Таблица дружбы';

INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (1, 1, 1, '2011-10-09 05:47:32', '2012-06-07 15:19:17', '2013-07-07 15:14:00', '2016-04-11 14:41:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (2, 2, 2, '2020-04-29 16:09:39', '2013-09-14 19:17:53', '2020-08-13 19:08:42', '2019-10-20 05:17:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (3, 3, 3, '2012-07-03 03:32:59', '2017-05-07 21:26:24', '2016-03-16 02:50:04', '2013-04-30 12:57:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (4, 4, 4, '2015-01-27 04:07:57', '2016-07-24 16:50:02', '2018-12-23 04:36:02', '2016-11-18 03:52:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (5, 5, 5, '2018-01-01 23:06:25', '2020-02-21 03:58:48', '2012-06-02 00:10:20', '2013-05-26 16:39:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (6, 6, 6, '2014-10-22 02:14:34', '2012-06-07 19:15:50', '2018-10-10 15:56:54', '2020-09-08 04:15:39');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (7, 7, 7, '2016-11-30 21:09:18', '2011-02-13 11:09:02', '2012-06-16 19:28:53', '2013-06-22 11:07:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (8, 8, 8, '2018-03-19 04:14:15', '2010-12-19 22:51:36', '2018-01-19 19:33:45', '2019-11-26 07:18:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (9, 9, 9, '2019-03-04 06:13:25', '2011-09-16 23:42:12', '2016-07-22 02:58:05', '2011-06-22 19:36:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (10, 10, 10, '2018-06-23 07:41:54', '2016-09-27 21:36:01', '2011-11-22 18:07:31', '2012-03-12 19:35:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (11, 11, 11, '2020-07-28 10:16:38', '2015-09-19 11:58:20', '2014-02-04 13:19:01', '2015-02-26 21:18:45');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (12, 12, 12, '2016-02-18 08:03:14', '2012-08-11 18:26:05', '2020-07-15 05:17:19', '2017-08-07 03:03:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (13, 13, 13, '2019-02-01 20:33:26', '2013-11-04 08:58:42', '2010-12-25 09:20:30', '2016-02-06 18:08:51');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (14, 14, 14, '2015-06-15 10:21:31', '2015-07-15 16:58:20', '2013-09-02 04:29:24', '2015-03-21 18:41:53');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (15, 15, 15, '2014-04-02 19:47:33', '2010-09-27 12:43:36', '2011-04-28 19:57:07', '2013-04-09 10:30:13');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (16, 16, 16, '2017-10-02 06:49:34', '2012-08-27 00:19:03', '2011-10-26 22:11:52', '2019-05-04 13:53:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (17, 17, 17, '2018-05-30 16:27:33', '2013-07-11 14:59:25', '2016-08-08 20:32:33', '2014-09-29 17:37:51');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (18, 18, 18, '2017-03-15 02:14:14', '2013-12-06 17:49:57', '2012-10-01 11:22:34', '2018-03-09 01:45:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (19, 19, 19, '2016-01-13 05:00:29', '2012-03-13 00:31:19', '2015-08-26 21:17:02', '2016-06-14 05:54:29');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (20, 20, 20, '2010-11-23 07:59:05', '2019-11-08 07:28:53', '2014-07-28 13:33:11', '2019-02-11 15:49:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (21, 21, 21, '2013-01-15 08:50:52', '2011-04-09 01:24:26', '2015-03-24 23:51:42', '2013-08-19 17:02:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (22, 22, 22, '2011-10-05 08:54:26', '2011-02-26 14:57:36', '2018-01-02 21:53:42', '2019-12-08 00:34:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (23, 23, 23, '2012-03-02 17:11:17', '2014-06-29 09:37:00', '2017-04-29 19:55:56', '2020-09-06 20:42:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (24, 24, 24, '2013-02-12 13:18:25', '2015-03-28 14:21:16', '2014-09-15 18:11:13', '2015-12-18 17:09:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (25, 25, 25, '2018-03-23 06:11:40', '2013-01-06 05:04:39', '2011-07-09 19:57:04', '2018-02-04 21:04:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (26, 26, 26, '2013-06-08 15:42:14', '2012-03-28 05:13:33', '2019-09-16 09:38:36', '2016-05-26 23:48:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (27, 27, 27, '2019-08-16 03:00:45', '2018-12-22 11:27:00', '2012-02-09 15:39:52', '2015-11-27 02:20:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (28, 28, 28, '2011-08-21 19:39:19', '2013-07-31 11:56:02', '2020-08-24 00:43:45', '2011-11-29 23:56:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (29, 29, 29, '2019-02-04 04:38:47', '2018-07-28 01:49:54', '2010-11-05 15:05:05', '2020-08-21 13:22:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (30, 30, 30, '2010-11-19 22:52:03', '2016-04-17 11:11:45', '2020-03-29 08:31:36', '2015-08-03 23:54:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (31, 31, 31, '2015-02-02 20:12:25', '2011-05-23 05:33:26', '2019-10-10 10:45:28', '2019-07-03 18:42:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (32, 32, 32, '2012-11-07 14:48:03', '2010-10-28 00:07:42', '2011-04-25 22:54:30', '2019-07-01 15:42:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (33, 33, 33, '2020-08-28 06:10:54', '2017-01-16 05:39:16', '2012-01-07 23:39:36', '2012-02-04 20:36:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (34, 34, 34, '2020-02-15 15:44:29', '2016-07-11 00:40:27', '2012-03-28 21:29:59', '2012-02-26 15:19:15');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (35, 35, 35, '2011-08-17 19:01:54', '2014-08-09 19:34:36', '2019-01-07 00:28:53', '2015-01-16 14:40:34');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (36, 36, 36, '2017-03-25 22:30:39', '2013-04-05 09:59:13', '2018-04-01 00:10:03', '2012-11-27 21:54:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (37, 37, 37, '2013-09-10 04:18:30', '2012-04-23 12:32:21', '2019-04-04 05:49:24', '2015-10-01 01:13:34');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (38, 38, 38, '2014-09-05 18:03:32', '2015-05-19 15:30:26', '2014-04-20 03:09:48', '2020-03-28 11:33:17');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (39, 39, 39, '2020-01-11 20:38:52', '2014-09-05 07:06:27', '2020-07-30 01:05:14', '2013-07-21 08:28:35');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (40, 40, 40, '2012-01-11 05:07:19', '2011-07-14 23:54:21', '2018-02-12 07:09:46', '2019-10-22 08:42:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (41, 41, 41, '2019-02-25 23:47:55', '2015-10-10 03:29:25', '2017-05-15 04:36:53', '2018-11-13 13:35:40');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (42, 42, 42, '2014-05-08 20:34:11', '2015-09-05 02:12:58', '2019-02-12 10:39:04', '2012-12-19 16:26:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (43, 43, 43, '2017-08-28 10:45:28', '2011-06-04 20:27:37', '2017-08-09 21:08:11', '2014-10-20 21:00:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (44, 44, 44, '2015-12-02 00:48:16', '2016-12-15 21:10:50', '2012-07-05 11:12:30', '2018-02-04 13:51:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (45, 45, 45, '2013-07-17 17:25:16', '2020-03-07 05:39:43', '2017-10-17 06:45:28', '2014-12-23 21:52:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (46, 46, 46, '2017-04-16 09:37:51', '2011-05-12 17:22:53', '2014-12-28 13:42:26', '2012-01-11 06:58:34');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (47, 47, 47, '2013-08-27 22:41:27', '2018-07-27 05:51:27', '2012-01-10 04:03:43', '2019-03-24 22:24:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (48, 48, 48, '2015-09-22 15:35:13', '2014-01-07 03:08:45', '2016-06-29 00:45:29', '2017-12-05 07:27:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (49, 49, 49, '2016-06-24 22:09:38', '2019-01-04 01:12:09', '2018-05-28 02:45:06', '2018-03-13 06:45:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (50, 50, 50, '2010-11-01 23:11:20', '2018-10-18 19:31:03', '2015-02-02 02:13:31', '2019-10-14 09:54:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (51, 51, 51, '2017-11-03 05:40:13', '2011-08-29 18:15:02', '2015-04-03 20:22:59', '2019-08-29 03:24:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (52, 52, 52, '2015-06-10 21:50:49', '2019-09-22 15:21:17', '2013-11-11 05:52:33', '2019-09-24 00:18:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (53, 53, 53, '2019-03-16 06:38:18', '2017-08-23 16:14:55', '2012-11-13 12:42:19', '2012-12-09 17:21:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (54, 54, 54, '2020-03-23 00:44:36', '2014-01-12 06:36:29', '2018-10-14 09:17:49', '2010-10-12 01:25:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (55, 55, 55, '2011-03-22 10:58:32', '2019-04-10 16:27:41', '2019-04-28 20:36:14', '2013-09-10 13:46:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (56, 56, 56, '2016-06-26 09:33:33', '2014-12-31 16:02:02', '2018-06-16 00:56:03', '2013-06-23 06:37:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (57, 57, 57, '2015-10-11 03:47:24', '2011-02-25 15:07:22', '2011-01-28 06:51:14', '2013-11-27 11:23:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (58, 58, 58, '2011-02-11 17:29:37', '2015-02-17 03:01:08', '2016-02-08 14:58:00', '2011-07-12 20:13:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (59, 59, 59, '2019-10-14 12:18:29', '2014-01-31 23:39:51', '2014-02-03 21:01:55', '2015-12-10 10:58:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (60, 60, 60, '2014-04-03 14:34:14', '2011-08-08 11:17:03', '2014-08-12 17:57:04', '2011-03-10 04:35:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (61, 61, 61, '2019-08-28 20:51:41', '2013-01-31 22:37:42', '2014-10-07 01:34:15', '2014-03-16 01:56:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (62, 62, 62, '2014-08-18 05:02:47', '2020-08-16 22:06:48', '2017-04-04 18:22:26', '2019-11-18 04:39:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (63, 63, 63, '2016-12-25 01:30:07', '2016-01-13 06:58:07', '2016-10-08 21:08:59', '2016-03-13 06:49:38');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (64, 64, 64, '2019-02-11 00:31:50', '2013-04-06 22:07:14', '2016-12-16 21:10:16', '2017-10-15 17:24:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (65, 65, 65, '2019-03-18 12:09:54', '2011-01-30 16:01:26', '2014-10-01 23:33:02', '2018-01-14 22:02:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (66, 66, 66, '2018-04-23 20:59:09', '2011-01-20 22:16:07', '2012-10-31 12:30:56', '2017-12-30 23:49:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (67, 67, 67, '2019-08-26 22:21:52', '2010-11-16 20:55:44', '2014-12-25 09:13:30', '2011-08-14 16:27:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (68, 68, 68, '2019-05-09 15:45:30', '2012-03-23 16:17:21', '2017-03-05 18:08:53', '2015-03-20 03:16:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (69, 69, 69, '2018-05-17 18:58:10', '2014-05-27 04:34:19', '2018-01-18 23:10:58', '2015-06-26 11:45:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (70, 70, 70, '2017-04-11 20:59:02', '2020-01-08 04:22:02', '2012-10-10 12:02:56', '2020-03-22 08:29:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (71, 71, 71, '2012-11-24 10:11:00', '2014-08-25 05:55:14', '2017-07-02 16:30:14', '2016-12-04 19:36:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (72, 72, 72, '2010-09-20 17:47:20', '2019-07-17 04:38:49', '2016-08-28 05:41:02', '2011-03-23 05:03:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (73, 73, 73, '2011-08-17 20:01:33', '2020-06-17 03:38:44', '2019-02-21 16:57:52', '2014-10-03 03:56:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (74, 74, 74, '2016-10-15 23:57:43', '2012-07-05 05:57:19', '2011-04-04 07:31:05', '2018-09-17 19:00:17');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (75, 75, 75, '2013-01-13 18:31:39', '2011-11-02 21:19:34', '2011-07-21 13:26:56', '2017-04-22 22:57:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (76, 76, 76, '2017-09-12 01:13:34', '2018-01-31 21:07:40', '2018-05-07 03:51:13', '2015-08-09 22:24:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (77, 77, 77, '2013-05-10 16:02:34', '2014-11-21 23:14:32', '2016-01-04 08:39:26', '2011-06-03 21:35:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (78, 78, 78, '2011-03-30 19:10:49', '2011-11-13 23:19:16', '2020-07-20 02:55:24', '2017-05-17 16:47:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (79, 79, 79, '2017-06-26 04:57:23', '2018-06-08 12:51:48', '2014-11-12 19:17:55', '2020-08-31 08:35:07');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (80, 80, 80, '2018-09-27 03:37:28', '2013-03-01 11:28:31', '2017-08-14 09:29:45', '2016-04-07 14:50:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (81, 81, 81, '2013-05-09 19:21:39', '2011-02-04 18:25:24', '2016-03-13 21:11:25', '2017-11-09 02:19:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (82, 82, 82, '2013-07-23 05:33:28', '2019-05-23 00:44:40', '2020-02-21 19:27:17', '2019-01-17 21:04:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (83, 83, 83, '2016-09-05 23:57:57', '2013-05-22 18:50:17', '2014-04-05 21:45:10', '2013-07-25 01:45:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (84, 84, 84, '2016-07-19 18:39:51', '2018-06-11 15:27:54', '2012-05-14 00:38:29', '2015-10-23 10:13:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (85, 85, 85, '2018-06-27 00:25:02', '2018-01-30 14:21:54', '2019-07-03 00:46:27', '2014-05-19 19:57:34');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (86, 86, 86, '2019-11-08 02:01:08', '2014-05-05 08:22:44', '2011-06-10 01:44:18', '2019-04-02 17:53:38');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (87, 87, 87, '2014-09-04 11:08:09', '2014-07-18 09:30:19', '2010-10-15 07:39:24', '2017-07-12 04:26:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (88, 88, 88, '2013-04-06 02:30:21', '2011-06-30 23:50:47', '2014-03-03 21:10:35', '2013-04-26 04:13:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (89, 89, 89, '2015-10-17 01:13:37', '2015-05-12 13:51:56', '2017-12-06 22:51:31', '2012-04-12 18:32:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (90, 90, 90, '2016-12-13 01:14:30', '2020-03-04 22:14:19', '2014-07-25 09:27:36', '2014-04-28 12:59:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (91, 91, 91, '2017-02-08 09:13:20', '2016-11-29 00:48:02', '2017-01-08 19:30:25', '2019-09-22 12:48:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (92, 92, 92, '2020-04-06 00:41:22', '2012-11-10 22:28:58', '2010-11-05 17:14:14', '2010-12-02 14:13:34');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (93, 93, 93, '2013-07-02 09:29:44', '2019-09-17 03:10:00', '2015-11-09 01:01:01', '2019-02-21 07:11:55');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (94, 94, 94, '2011-01-08 10:30:00', '2017-10-06 13:02:56', '2019-08-20 21:50:04', '2018-08-23 21:58:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (95, 95, 95, '2013-01-07 08:00:35', '2018-06-11 10:29:09', '2015-06-23 18:53:11', '2013-03-09 06:40:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (96, 96, 96, '2020-02-11 04:10:56', '2011-11-13 14:07:24', '2020-07-22 02:33:06', '2016-04-18 17:06:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (97, 97, 97, '2013-12-07 14:36:28', '2013-10-05 13:46:43', '2016-03-07 23:50:51', '2017-04-30 17:41:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (98, 98, 98, '2012-11-21 11:27:55', '2014-07-06 06:16:38', '2015-08-23 06:24:57', '2018-06-15 05:30:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (99, 99, 99, '2014-05-23 15:22:25', '2013-09-07 23:07:23', '2013-07-31 00:16:56', '2018-06-08 09:22:29');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (100, 100, 100, '2011-06-28 01:57:57', '2014-03-12 05:55:06', '2016-07-19 08:39:44', '2011-10-09 08:43:41');


#
# TABLE STRUCTURE FOR: friendship_statuses
#

DROP TABLE IF EXISTS `friendship_statuses`;

CREATE TABLE `friendship_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Статусы дружбы';

INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'Jillian Schowalter', '2015-03-04 03:45:22', '2015-08-24 00:47:09');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'Miss Noemie Koepp', '2012-12-29 16:32:59', '2014-03-18 06:00:27');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'Buck Ankunding DDS', '2014-06-20 19:59:32', '2017-01-02 07:56:14');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'Annetta Waelchi III', '2013-12-19 04:19:41', '2019-11-18 02:01:32');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'Fabiola Glover', '2020-02-24 21:24:42', '2018-08-05 21:00:29');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'Nichole Hirthe', '2011-06-07 11:10:46', '2012-03-20 04:24:03');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'Maximo Tremblay DDS', '2017-11-11 02:25:03', '2010-11-20 03:46:53');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'Annalise Stracke', '2011-05-27 13:25:54', '2014-07-15 10:00:01');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'Mr. Jeremy Lesch', '2015-08-11 07:42:19', '2019-01-19 05:44:02');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'Dr. Nettie Reilly', '2016-11-04 08:56:18', '2017-07-12 22:59:38');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'Prof. Bud Brekke', '2018-02-19 02:39:02', '2013-03-11 11:04:40');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'Abel Bogisich', '2019-05-03 03:27:10', '2013-11-04 15:04:38');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'Jerrell Spencer', '2011-09-11 03:03:35', '2013-04-17 07:12:37');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'Edgardo Hilll DDS', '2011-07-29 20:56:55', '2018-07-05 00:00:42');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'Dr. Michel Yundt', '2014-05-05 01:43:02', '2019-07-19 15:45:06');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'Carson Koelpin', '2013-01-25 13:56:52', '2018-08-17 13:11:01');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'Wellington Turcotte', '2013-03-30 15:42:27', '2016-03-19 12:01:55');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'Jordyn Schamberger', '2017-12-08 03:09:35', '2019-12-27 22:44:10');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'Dr. Ahmad Pacocha', '2011-02-25 14:44:15', '2018-07-18 05:39:31');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'Winnifred Zboncak', '2011-06-01 00:02:56', '2020-07-15 09:20:10');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (21, 'Blaze Towne PhD', '2014-05-30 11:20:18', '2016-03-23 21:02:35');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (22, 'Olga Rice', '2013-05-31 08:54:33', '2019-02-03 05:20:19');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (23, 'Jalen Schroeder', '2019-01-28 20:50:06', '2020-05-22 08:10:49');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (24, 'Maiya Pollich', '2011-10-20 17:32:59', '2013-12-13 09:42:44');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (25, 'Brandy Stehr', '2015-06-24 16:52:26', '2014-01-17 00:06:35');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (26, 'Ruby Gulgowski', '2012-11-29 07:04:37', '2018-04-10 05:55:36');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (27, 'Ludie Becker', '2018-09-10 07:26:15', '2019-07-25 20:49:26');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (28, 'Jayson Pollich', '2017-02-19 09:04:37', '2016-08-28 23:48:03');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (29, 'Ms. Rowena Quigley', '2020-02-26 15:55:50', '2014-01-12 10:28:11');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (30, 'Rebecca Gutkowski', '2015-04-11 05:10:49', '2012-06-30 04:38:25');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (31, 'Dr. Mustafa Fritsch IV', '2011-01-15 09:11:21', '2019-08-06 02:30:07');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (32, 'Ms. Hermina Barrows', '2016-08-14 19:33:50', '2011-06-13 09:08:30');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (33, 'Evie Lakin', '2011-04-12 23:40:23', '2020-05-22 13:11:56');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (34, 'Marshall Morissette', '2012-12-08 12:44:50', '2012-04-21 21:01:00');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (35, 'Ulices Schinner', '2019-09-21 03:54:45', '2020-08-28 07:36:41');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (36, 'Miss Nicolette Kovacek II', '2016-03-21 11:19:36', '2012-04-22 05:26:01');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (37, 'Dr. Malika Miller', '2014-06-24 14:34:31', '2011-06-03 12:36:37');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (38, 'Jaydon Gulgowski', '2010-09-27 00:54:25', '2014-11-12 08:12:29');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (39, 'Moshe Mills MD', '2012-10-06 20:25:55', '2012-02-14 04:17:41');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (40, 'Prof. Wiley Crona V', '2018-07-07 08:57:47', '2011-08-16 16:33:45');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (41, 'Miss Carolyn Wiegand', '2013-11-11 14:53:58', '2015-12-03 13:09:56');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (42, 'Dorian Auer', '2012-09-23 09:50:06', '2016-07-13 03:47:30');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (43, 'Lacey Hand', '2012-05-31 22:22:41', '2019-03-13 02:20:18');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (44, 'Antonetta Padberg', '2015-11-17 06:15:34', '2015-05-10 21:21:36');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (45, 'Benton D\'Amore', '2016-11-22 23:54:36', '2012-03-29 04:35:58');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (46, 'Wilbert Cormier', '2013-08-09 08:34:34', '2019-08-11 08:12:50');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (47, 'Noah Douglas', '2014-02-25 10:10:36', '2015-06-18 00:55:05');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (48, 'Hilbert Reilly', '2018-09-20 22:34:45', '2013-01-03 07:48:56');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (49, 'Karianne Spinka', '2017-08-07 00:27:23', '2017-07-05 20:37:46');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (50, 'Miss Petra Friesen DDS', '2010-11-04 12:39:03', '2017-06-09 19:26:09');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (51, 'Cordia Grady I', '2019-09-18 00:33:13', '2013-12-22 21:26:04');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (52, 'Gunner Schulist', '2015-11-06 20:04:41', '2017-12-04 14:19:49');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (53, 'Berneice Steuber', '2020-05-13 02:54:29', '2012-09-03 07:37:57');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (54, 'Dr. Noemy Keebler DDS', '2018-12-20 18:46:40', '2012-11-21 18:38:49');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (55, 'Melany Heathcote', '2013-03-21 19:32:27', '2015-09-22 12:39:59');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (56, 'Shanna Berge', '2014-10-29 07:41:45', '2013-04-15 07:15:48');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (57, 'Prof. Dexter Grady II', '2012-02-06 12:40:47', '2014-03-05 02:21:41');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (58, 'Jack Walker', '2014-06-28 15:48:20', '2020-02-02 17:08:54');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (59, 'Ms. Elissa Olson PhD', '2013-11-10 15:27:21', '2019-09-20 03:34:25');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (60, 'Davon Funk', '2014-11-18 13:06:37', '2011-08-05 01:51:20');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (61, 'Henry Becker', '2012-07-09 20:23:21', '2012-09-08 13:15:21');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (62, 'Vivian DuBuque', '2016-02-27 19:20:09', '2017-06-12 17:44:42');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (63, 'Mrs. Fatima Gusikowski', '2017-04-15 09:33:07', '2017-03-15 19:26:32');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (64, 'Mr. Ibrahim Trantow', '2018-07-23 00:15:33', '2011-02-05 11:28:16');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (65, 'Ms. Ruth Gerlach IV', '2010-11-14 19:27:38', '2012-07-03 02:01:44');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (66, 'Royce Baumbach', '2013-11-08 07:25:07', '2016-02-25 09:53:40');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (67, 'Prof. Judy Welch', '2013-11-09 15:20:25', '2016-11-09 15:55:00');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (68, 'Stephon King', '2019-12-02 01:22:41', '2019-09-18 11:44:38');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (69, 'Rory Crooks', '2012-08-27 05:38:45', '2016-12-03 00:39:57');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (70, 'Elody Stamm Sr.', '2013-06-01 19:19:58', '2014-04-26 23:54:08');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (71, 'Jackeline Bashirian', '2015-05-28 09:07:40', '2011-03-23 03:31:41');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (72, 'Layla Bosco', '2019-07-27 15:58:04', '2016-04-29 20:48:48');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (73, 'Margot Marquardt', '2019-06-25 23:02:56', '2017-02-09 22:08:20');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (74, 'Mr. Jaquan Sipes Jr.', '2013-05-16 10:26:49', '2017-10-07 00:36:36');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (75, 'Miss Catalina Hoeger', '2019-05-31 19:35:55', '2015-05-01 05:16:31');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (76, 'Moshe Price', '2012-02-12 00:51:09', '2019-09-12 14:42:19');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (77, 'Lucy Mann', '2012-12-27 08:07:22', '2015-07-03 05:32:23');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (78, 'Thalia Littel', '2016-01-21 01:40:38', '2016-03-03 17:33:26');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (79, 'Darrin Kunze II', '2014-03-08 01:17:00', '2016-08-08 07:20:05');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (80, 'Samara Harris', '2015-02-13 04:24:13', '2016-06-14 04:21:32');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (81, 'Miss Alberta McGlynn DVM', '2018-03-29 08:16:05', '2010-09-22 11:57:34');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (82, 'Prof. Jeramy Beatty PhD', '2015-12-25 13:58:55', '2016-06-30 08:36:39');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (83, 'Rebekah Rogahn', '2020-03-06 18:17:30', '2014-04-03 20:54:29');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (84, 'Rosetta Kuhic', '2015-07-16 23:17:24', '2015-02-27 03:18:25');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (85, 'Myrtis Connelly DDS', '2019-12-26 01:40:34', '2013-02-07 09:02:28');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (86, 'Miss Earlene Graham MD', '2020-08-19 23:34:32', '2019-09-14 17:18:02');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (87, 'Mr. Felton Schuster', '2018-10-16 07:02:37', '2017-10-19 02:29:20');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (88, 'Gonzalo Wisoky', '2019-10-31 20:47:40', '2015-07-11 22:18:25');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (89, 'General Veum PhD', '2012-08-07 23:15:46', '2017-10-29 06:40:15');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (90, 'Prof. Beulah Ryan Sr.', '2016-02-17 12:50:12', '2016-01-12 22:56:26');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (91, 'Miss Priscilla Rosenbaum DDS', '2014-04-18 17:46:56', '2020-02-23 07:26:46');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (92, 'Esteban McLaughlin', '2012-11-08 21:23:03', '2018-03-07 11:53:58');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (93, 'Marian Bauch MD', '2015-05-13 02:06:32', '2015-04-26 04:44:44');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (94, 'Mr. Juwan Kiehn Jr.', '2020-03-15 18:58:04', '2019-09-12 16:05:41');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (95, 'Miss Ruthe Rohan Sr.', '2019-07-25 22:35:40', '2019-06-26 14:30:25');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (96, 'William Murray', '2012-04-28 07:59:54', '2013-03-07 01:11:41');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (97, 'Dr. Laurel Fahey PhD', '2019-12-25 10:05:44', '2011-02-07 10:38:05');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (98, 'Lola Zboncak', '2020-05-02 23:34:08', '2018-01-08 14:19:53');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (99, 'Mrs. Drew Kulas', '2011-07-09 10:24:33', '2018-04-03 09:35:03');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (100, 'Mr. Liam Kuhlman', '2011-11-28 12:33:30', '2015-05-29 21:16:55');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя, который загрузил файл',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Путь к файлу',
  `size` int(11) NOT NULL COMMENT 'Размер файла',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Метаданные файла' CHECK (json_valid(`metadata`)),
  `media_type_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Медиафайлы';

INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (1, 1, 'quisquam', 54725, NULL, 1, '2018-06-19 19:10:47', '2013-07-21 05:39:18');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (2, 2, 'facere', 93475, NULL, 2, '2016-07-12 02:53:13', '2016-12-16 01:54:58');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (3, 3, 'exercitationem', 4, NULL, 3, '2018-08-16 00:19:08', '2013-08-02 18:26:28');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (4, 4, 'similique', 0, NULL, 4, '2020-01-22 15:30:11', '2018-06-20 12:16:34');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (5, 5, 'iusto', 516379, NULL, 5, '2019-01-13 23:54:39', '2019-10-14 08:21:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (6, 6, 'ut', 971553, NULL, 6, '2013-09-16 00:53:15', '2013-12-14 07:08:58');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (7, 7, 'qui', 924250, NULL, 7, '2012-09-27 06:37:45', '2019-06-26 23:07:04');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (8, 8, 'quo', 119699, NULL, 8, '2012-07-21 18:20:50', '2018-09-27 13:04:46');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (9, 9, 'expedita', 62, NULL, 9, '2012-06-22 06:35:03', '2019-05-17 07:42:31');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (10, 10, 'qui', 0, NULL, 10, '2018-08-22 03:35:14', '2013-11-24 02:24:58');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (11, 11, 'commodi', 22756810, NULL, 11, '2017-01-18 08:21:54', '2012-03-20 22:49:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (12, 12, 'amet', 564996, NULL, 12, '2011-08-16 12:12:46', '2016-11-26 00:16:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (13, 13, 'maiores', 313460032, NULL, 13, '2011-12-31 18:56:32', '2014-09-20 20:58:21');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (14, 14, 'impedit', 96715677, NULL, 14, '2019-09-26 08:55:15', '2012-09-05 09:24:51');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (15, 15, 'quia', 0, NULL, 15, '2020-01-15 02:42:44', '2012-10-13 02:39:00');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (16, 16, 'quia', 688176061, NULL, 16, '2017-02-06 15:55:52', '2019-01-11 23:24:53');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (17, 17, 'amet', 1508, NULL, 17, '2013-04-16 18:55:06', '2012-03-13 04:16:55');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (18, 18, 'consequatur', 6127, NULL, 18, '2011-01-25 02:40:13', '2016-01-31 20:47:58');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (19, 19, 'id', 0, NULL, 19, '2018-09-08 08:36:50', '2011-01-01 23:45:05');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (20, 20, 'maxime', 7819291, NULL, 20, '2016-10-24 23:28:33', '2016-11-05 07:50:53');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (21, 21, 'beatae', 8503159, NULL, 21, '2012-09-18 13:27:07', '2010-11-01 14:01:55');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (22, 22, 'iste', 4624180, NULL, 22, '2012-06-22 23:21:46', '2019-06-26 09:26:23');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (23, 23, 'reprehenderit', 691, NULL, 23, '2013-01-08 06:39:02', '2016-03-06 16:16:09');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (24, 24, 'reiciendis', 399055, NULL, 24, '2011-11-15 21:23:34', '2018-02-27 13:17:11');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (25, 25, 'velit', 980262, NULL, 25, '2015-01-13 11:20:56', '2016-06-07 11:30:47');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (26, 26, 'eos', 231477146, NULL, 26, '2016-10-05 23:43:13', '2011-07-29 23:28:15');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (27, 27, 'numquam', 1232, NULL, 27, '2020-01-23 02:44:33', '2020-03-13 14:56:09');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (28, 28, 'officiis', 4469, NULL, 28, '2016-07-04 00:11:35', '2018-01-27 23:52:37');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (29, 29, 'tempora', 22305072, NULL, 29, '2013-06-16 17:58:37', '2011-10-01 03:53:01');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (30, 30, 'dolor', 8, NULL, 30, '2018-10-30 01:36:05', '2018-03-12 07:12:25');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (31, 31, 'libero', 0, NULL, 31, '2012-06-17 09:31:27', '2016-12-07 07:48:55');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (32, 32, 'sapiente', 603690634, NULL, 32, '2011-09-06 02:34:56', '2017-07-09 18:51:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (33, 33, 'incidunt', 0, NULL, 33, '2014-11-11 21:40:52', '2015-09-08 14:10:28');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (34, 34, 'voluptatum', 10833, NULL, 34, '2014-07-15 13:59:40', '2015-11-26 06:56:38');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (35, 35, 'consectetur', 86, NULL, 35, '2017-07-30 23:25:41', '2016-07-02 03:40:56');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (36, 36, 'ipsam', 823211091, NULL, 36, '2011-11-26 19:06:21', '2016-10-26 09:47:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (37, 37, 'ab', 1488748, NULL, 37, '2015-07-21 19:29:41', '2011-09-10 00:58:20');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (38, 38, 'non', 21057, NULL, 38, '2011-11-08 18:06:37', '2017-03-28 07:55:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (39, 39, 'ab', 8, NULL, 39, '2012-07-13 00:36:30', '2017-11-16 17:58:32');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (40, 40, 'reiciendis', 6052702, NULL, 40, '2012-03-01 03:48:47', '2013-06-24 08:37:04');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (41, 41, 'quaerat', 932, NULL, 41, '2020-05-04 09:03:22', '2013-04-09 03:39:30');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (42, 42, 'distinctio', 95, NULL, 42, '2011-03-11 11:55:32', '2013-01-29 17:25:39');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (43, 43, 'nesciunt', 1134, NULL, 43, '2015-05-14 21:37:36', '2017-10-01 16:49:56');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (44, 44, 'esse', 2, NULL, 44, '2010-12-03 20:40:26', '2015-03-09 13:21:25');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (45, 45, 'error', 8257657, NULL, 45, '2014-10-10 05:22:41', '2011-02-03 18:48:30');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (46, 46, 'est', 9, NULL, 46, '2019-01-16 12:59:54', '2010-09-23 23:50:34');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (47, 47, 'voluptas', 3305, NULL, 47, '2014-06-23 07:59:14', '2011-06-30 19:05:44');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (48, 48, 'ab', 1, NULL, 48, '2013-08-08 07:09:01', '2019-02-16 18:51:34');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (49, 49, 'autem', 1, NULL, 49, '2018-07-07 18:13:06', '2016-11-07 17:45:17');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (50, 50, 'possimus', 796, NULL, 50, '2016-06-08 03:48:52', '2020-01-15 23:48:35');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (51, 51, 'voluptatum', 6920422, NULL, 51, '2016-06-09 09:46:07', '2016-06-01 10:31:41');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (52, 52, 'minus', 884, NULL, 52, '2020-01-06 02:31:19', '2020-07-23 02:30:48');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (53, 53, 'perferendis', 60622, NULL, 53, '2018-03-11 20:49:13', '2019-03-29 11:11:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (54, 54, 'aliquam', 97013862, NULL, 54, '2018-11-29 06:44:13', '2011-06-27 09:01:30');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (55, 55, 'dolore', 882, NULL, 55, '2018-03-30 01:48:10', '2018-03-11 14:15:29');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (56, 56, 'architecto', 5, NULL, 56, '2015-10-24 10:24:40', '2011-12-20 21:18:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (57, 57, 'optio', 918465524, NULL, 57, '2019-01-25 08:00:42', '2010-11-13 14:44:22');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (58, 58, 'numquam', 2, NULL, 58, '2017-01-08 07:33:06', '2019-11-29 18:54:54');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (59, 59, 'dicta', 0, NULL, 59, '2015-07-30 10:00:25', '2013-06-30 19:39:18');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (60, 60, 'corrupti', 96, NULL, 60, '2020-03-25 19:35:50', '2016-03-20 14:07:18');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (61, 61, 'quia', 75835148, NULL, 61, '2017-03-07 06:20:11', '2011-02-05 15:11:38');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (62, 62, 'ipsa', 0, NULL, 62, '2017-05-08 01:06:41', '2017-04-12 14:04:24');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (63, 63, 'optio', 91, NULL, 63, '2019-12-16 14:41:06', '2019-07-08 23:53:33');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (64, 64, 'vero', 75530, NULL, 64, '2019-02-21 06:52:28', '2018-03-21 01:23:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (65, 65, 'ut', 578365, NULL, 65, '2014-03-20 02:57:02', '2012-07-22 00:50:09');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (66, 66, 'omnis', 356789, NULL, 66, '2010-11-13 02:27:23', '2017-11-15 12:23:51');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (67, 67, 'mollitia', 28, NULL, 67, '2019-08-15 07:10:45', '2012-07-30 09:40:32');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (68, 68, 'laudantium', 5, NULL, 68, '2019-04-08 13:16:42', '2018-06-13 10:08:32');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (69, 69, 'sapiente', 0, NULL, 69, '2013-06-19 02:26:22', '2012-10-09 12:05:33');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (70, 70, 'distinctio', 322, NULL, 70, '2011-10-31 10:18:52', '2015-11-28 16:44:57');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (71, 71, 'dolore', 219437, NULL, 71, '2014-01-29 12:40:01', '2014-02-17 08:02:19');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (72, 72, 'necessitatibus', 0, NULL, 72, '2018-07-04 14:37:07', '2010-12-06 19:39:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (73, 73, 'numquam', 0, NULL, 73, '2017-12-29 13:48:21', '2016-12-13 21:42:58');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (74, 74, 'commodi', 7019614, NULL, 74, '2015-10-09 16:07:58', '2015-04-09 09:05:18');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (75, 75, 'sint', 16018183, NULL, 75, '2019-07-07 16:31:19', '2013-01-21 15:33:16');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (76, 76, 'sunt', 23, NULL, 76, '2015-05-31 23:17:39', '2012-01-16 21:58:56');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (77, 77, 'rerum', 374, NULL, 77, '2020-09-03 08:42:27', '2017-12-18 04:37:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (78, 78, 'culpa', 70162, NULL, 78, '2011-04-13 01:34:56', '2012-06-10 17:05:47');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (79, 79, 'debitis', 63730538, NULL, 79, '2015-11-08 21:31:10', '2013-02-19 10:30:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (80, 80, 'qui', 482653, NULL, 80, '2010-10-18 22:02:11', '2018-09-14 01:27:31');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (81, 81, 'eum', 883039, NULL, 81, '2020-05-04 11:14:58', '2016-05-23 22:17:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (82, 82, 'repellat', 39, NULL, 82, '2013-09-19 04:23:55', '2017-04-20 01:27:37');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (83, 83, 'ut', 95, NULL, 83, '2016-08-18 08:11:32', '2013-11-23 22:43:43');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (84, 84, 'rerum', 534, NULL, 84, '2012-11-01 22:55:29', '2018-02-12 18:14:47');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (85, 85, 'eos', 270922, NULL, 85, '2015-03-11 00:06:50', '2013-09-30 19:03:31');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (86, 86, 'voluptas', 2, NULL, 86, '2019-06-28 21:40:22', '2020-01-24 08:25:21');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (87, 87, 'exercitationem', 47997, NULL, 87, '2017-08-30 15:39:08', '2014-03-10 12:26:41');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (88, 88, 'harum', 3, NULL, 88, '2018-01-13 19:18:19', '2013-07-13 00:10:21');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (89, 89, 'et', 59, NULL, 89, '2020-04-22 00:57:17', '2020-08-03 12:10:33');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (90, 90, 'perferendis', 9, NULL, 90, '2012-12-29 00:45:31', '2013-03-29 13:57:22');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (91, 91, 'quis', 163511367, NULL, 91, '2014-11-10 09:31:48', '2013-01-13 00:44:17');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (92, 92, 'ullam', 957, NULL, 92, '2018-04-25 09:43:18', '2010-11-23 10:07:12');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (93, 93, 'velit', 725868459, NULL, 93, '2013-03-30 16:35:35', '2011-04-07 00:31:47');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (94, 94, 'fugiat', 64247744, NULL, 94, '2017-11-21 02:35:47', '2014-02-07 11:24:03');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (95, 95, 'dolores', 646351085, NULL, 95, '2011-01-08 11:23:57', '2014-08-04 06:00:00');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (96, 96, 'dignissimos', 6315, NULL, 96, '2016-07-11 13:59:33', '2017-09-30 03:45:55');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (97, 97, 'laborum', 8, NULL, 97, '2019-07-08 17:51:52', '2019-11-18 09:19:44');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (98, 98, 'numquam', 96668, NULL, 98, '2018-05-19 10:42:03', '2020-04-23 04:09:23');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (99, 99, 'praesentium', 340, NULL, 99, '2019-08-07 22:35:30', '2012-03-19 14:37:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (100, 100, 'consequatur', 443561377, NULL, 100, '2018-03-03 19:49:17', '2010-12-19 09:06:55');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Типы медиафайлов';

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'nemo', '2016-11-07 07:27:38', '2017-08-27 21:30:15');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'labore', '2017-10-31 18:54:12', '2015-03-18 14:55:43');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'nam', '2015-10-17 16:57:38', '2013-11-01 05:15:51');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'voluptate', '2010-12-08 03:53:47', '2014-11-07 16:21:56');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'cumque', '2014-10-21 06:28:40', '2015-02-07 20:11:32');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'vitae', '2011-03-14 12:28:41', '2015-07-16 12:46:15');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'amet', '2018-06-16 11:27:55', '2012-06-16 18:29:52');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'et', '2020-07-03 12:49:40', '2012-06-07 08:39:12');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'ut', '2012-12-02 17:58:38', '2019-10-12 14:04:07');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'molestiae', '2020-02-01 02:29:08', '2013-11-16 11:30:56');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'debitis', '2012-07-09 04:30:11', '2019-06-16 23:46:02');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'quis', '2011-04-29 09:07:46', '2012-12-29 05:10:50');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'fugit', '2014-03-15 00:11:17', '2014-11-12 19:15:19');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'dolor', '2015-06-18 08:48:44', '2019-11-01 18:54:30');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'aliquid', '2019-01-07 06:54:17', '2014-12-30 03:44:50');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'libero', '2012-12-29 09:08:52', '2018-10-05 07:27:13');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'assumenda', '2014-12-02 06:02:16', '2017-07-22 04:23:26');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'itaque', '2012-03-29 11:00:12', '2012-03-14 14:03:02');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'velit', '2017-11-10 16:53:15', '2011-10-24 20:13:57');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'sequi', '2015-01-02 16:05:33', '2020-07-08 17:17:22');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (21, 'non', '2017-08-31 02:59:27', '2015-11-02 14:05:14');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (22, 'placeat', '2011-10-31 17:01:28', '2012-06-29 06:48:44');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (23, 'fuga', '2015-10-04 15:28:18', '2011-04-26 01:12:56');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (24, 'aliquam', '2020-07-06 19:49:55', '2015-01-29 15:28:59');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (25, 'omnis', '2015-06-11 22:47:20', '2012-05-18 14:39:02');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (26, 'temporibus', '2012-06-17 08:28:45', '2016-11-26 17:02:03');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (27, 'mollitia', '2017-09-17 01:31:28', '2010-11-18 17:56:36');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (28, 'corrupti', '2015-09-26 15:20:49', '2015-08-31 03:44:59');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (29, 'ullam', '2016-07-14 12:26:08', '2017-05-08 14:57:11');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (30, 'nihil', '2012-01-16 02:05:27', '2012-05-25 14:36:22');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (31, 'dignissimos', '2018-07-19 05:46:14', '2019-12-17 23:19:21');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (32, 'voluptatem', '2016-02-28 02:42:10', '2020-05-06 08:49:28');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (33, 'laborum', '2018-06-02 20:16:12', '2015-06-18 03:37:11');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (34, 'aperiam', '2016-06-08 21:41:29', '2018-09-29 01:08:18');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (35, 'unde', '2017-07-28 10:37:28', '2020-01-23 03:27:03');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (36, 'dolorum', '2015-11-14 08:00:12', '2017-03-07 09:18:19');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (37, 'quas', '2012-04-28 14:56:32', '2020-06-09 16:42:56');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (38, 'sint', '2011-10-20 00:21:53', '2012-09-28 01:45:36');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (39, 'beatae', '2014-03-06 10:55:51', '2020-04-04 07:57:48');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (40, 'quia', '2016-02-09 05:33:41', '2013-08-10 01:14:54');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (41, 'officia', '2018-12-29 11:05:34', '2019-05-23 00:07:48');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (42, 'vel', '2019-06-12 02:55:42', '2012-03-23 18:16:32');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (43, 'sunt', '2011-01-05 20:23:34', '2019-07-21 23:10:35');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (44, 'eaque', '2012-05-27 20:58:37', '2010-10-25 09:41:26');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (45, 'dolores', '2012-11-16 06:59:23', '2018-01-26 19:25:50');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (46, 'doloremque', '2018-12-13 12:18:03', '2012-06-25 00:08:09');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (47, 'laboriosam', '2017-06-30 21:27:50', '2011-05-09 11:21:27');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (48, 'est', '2016-08-17 08:41:55', '2011-07-06 15:36:31');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (49, 'iste', '2019-07-31 09:13:11', '2015-10-03 06:02:15');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (50, 'praesentium', '2014-07-28 14:20:52', '2018-10-08 22:45:29');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (51, 'suscipit', '2012-04-29 04:57:44', '2012-09-01 08:52:10');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (52, 'expedita', '2014-05-01 01:32:46', '2020-05-27 07:47:48');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (53, 'perferendis', '2019-03-15 09:22:02', '2017-07-05 02:30:04');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (54, 'consequatur', '2019-04-05 06:46:20', '2019-01-07 09:50:28');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (55, 'id', '2018-04-21 19:59:10', '2014-11-08 04:35:47');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (56, 'tempora', '2014-12-05 10:20:17', '2016-05-20 11:39:16');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (57, 'exercitationem', '2012-04-06 13:15:43', '2012-10-19 04:34:37');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (58, 'cum', '2011-11-06 07:56:49', '2016-01-28 07:56:18');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (59, 'sit', '2015-10-23 03:59:04', '2016-05-15 16:28:16');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (60, 'ex', '2016-11-22 08:25:29', '2013-08-26 22:00:08');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (61, 'rem', '2013-09-26 20:59:18', '2011-04-25 09:47:02');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (62, 'error', '2013-06-08 06:05:14', '2012-04-07 03:52:25');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (63, 'aut', '2012-04-27 15:21:40', '2014-05-12 20:54:03');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (64, 'eum', '2017-09-03 10:48:07', '2014-09-20 16:07:42');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (65, 'tempore', '2014-08-22 09:11:42', '2016-06-20 13:26:33');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (66, 'cupiditate', '2013-09-06 00:08:26', '2011-02-26 03:53:43');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (67, 'sed', '2019-07-09 07:15:25', '2020-06-21 02:02:21');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (68, 'ea', '2014-01-02 23:35:39', '2011-11-29 00:40:52');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (69, 'soluta', '2020-05-31 10:49:06', '2011-07-21 06:54:42');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (70, 'ratione', '2011-07-22 16:07:28', '2011-03-21 22:27:30');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (71, 'tenetur', '2011-07-19 20:42:23', '2015-07-16 23:11:00');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (72, 'eveniet', '2010-10-31 08:59:37', '2011-07-13 11:20:27');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (73, 'alias', '2017-08-26 02:20:07', '2011-05-08 11:06:01');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (74, 'recusandae', '2017-12-05 03:54:53', '2012-03-31 13:11:17');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (75, 'ipsam', '2018-03-11 16:58:25', '2017-12-02 17:47:13');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (76, 'qui', '2019-01-08 07:10:52', '2016-12-24 07:00:40');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (77, 'reprehenderit', '2013-07-06 03:22:40', '2012-09-17 03:21:06');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (78, 'asperiores', '2015-12-18 10:36:32', '2018-05-26 14:02:40');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (79, 'fugiat', '2010-10-28 06:00:36', '2020-06-09 09:11:56');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (80, 'quo', '2019-02-21 17:14:51', '2019-09-10 22:31:13');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (81, 'a', '2019-04-13 18:03:14', '2014-08-15 23:56:09');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (82, 'quod', '2017-12-09 15:53:52', '2014-03-28 20:56:36');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (83, 'vero', '2011-02-24 02:34:54', '2013-06-02 06:00:38');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (84, 'in', '2015-06-25 23:12:00', '2012-07-03 10:12:54');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (85, 'accusamus', '2012-05-22 17:49:37', '2012-08-28 08:40:28');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (86, 'architecto', '2012-11-11 17:30:42', '2013-08-20 15:47:26');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (87, 'quibusdam', '2012-03-26 01:50:41', '2015-06-26 17:58:28');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (88, 'facere', '2010-12-22 10:57:43', '2014-11-08 19:43:48');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (89, 'aspernatur', '2020-01-29 13:57:12', '2020-08-30 14:37:29');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (90, 'harum', '2013-11-06 20:54:41', '2018-02-19 22:57:58');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (91, 'at', '2019-05-07 18:36:26', '2014-09-19 16:04:45');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (92, 'dolorem', '2012-04-14 05:51:07', '2017-11-28 18:49:09');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (93, 'voluptates', '2019-03-21 23:05:23', '2019-08-19 18:25:06');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (94, 'ipsa', '2011-11-08 23:56:18', '2020-03-12 04:48:12');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (95, 'quae', '2020-07-23 10:31:28', '2010-12-11 23:04:37');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (96, 'magni', '2017-01-16 01:06:37', '2019-02-02 19:07:59');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (97, 'nesciunt', '2016-01-08 11:28:55', '2012-07-21 03:12:20');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (98, 'sapiente', '2011-08-12 08:12:09', '2015-07-18 19:56:16');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (99, 'accusantium', '2013-02-06 02:53:34', '2012-09-22 10:45:46');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (100, 'distinctio', '2013-06-30 06:36:15', '2010-11-11 15:40:39');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Сообщения';

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (1, 1, 1, 'Laboriosam ut quis vitae aliquam sapiente magnam consequatur ullam. Ipsam vitae maxime laborum laborum repellendus accusantium aut expedita. Facilis totam quia in culpa quis non expedita sit.', 1, 0, '2014-03-17 11:39:17', '2011-06-11 11:15:00');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (2, 2, 2, 'Laudantium non at tempore eum incidunt. Rem dicta rerum soluta unde similique. Dolor iste et illum eaque optio dolores.', 1, 0, '2018-05-23 01:01:11', '2017-10-28 01:48:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (3, 3, 3, 'Maxime odio reprehenderit illo blanditiis maxime quis et. Sed qui nobis assumenda sed. Expedita modi est animi veniam possimus accusamus recusandae.', 0, 0, '2018-11-19 06:45:17', '2020-07-09 04:54:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (4, 4, 4, 'Exercitationem et qui est est. Voluptates nostrum modi dolore ea veritatis aut.', 0, 1, '2016-07-17 02:28:06', '2014-03-16 23:24:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (5, 5, 5, 'Sunt labore expedita et est quia aliquid. Fugit quis rerum ea ad.', 0, 0, '2020-01-06 03:44:31', '2012-04-16 20:32:08');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (6, 6, 6, 'Eos sint aut ipsam ut harum quisquam vitae nihil. Laudantium et molestiae et ratione provident. Qui maxime eaque iste reprehenderit eos occaecati illum. Ab veniam dolorum ab odio.', 1, 0, '2019-10-24 00:27:50', '2012-09-30 23:56:24');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (7, 7, 7, 'Aspernatur id quidem vitae ea. Sunt nobis quo et suscipit veniam odio nisi in. Recusandae enim ut voluptas quia accusamus ipsam ut. Aut provident minima aut illum laudantium.', 0, 1, '2019-03-01 08:31:12', '2017-01-05 00:29:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (8, 8, 8, 'Aspernatur nemo sit et ducimus quia consequatur praesentium. Ullam qui excepturi ea quis dignissimos. Dolores tempora magnam consequatur occaecati qui excepturi tenetur quis.', 1, 1, '2015-06-26 11:05:44', '2015-09-01 12:08:38');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (9, 9, 9, 'Ut sit animi consectetur sit minus rerum. In assumenda ratione aut cum. Ad aut aut aperiam temporibus qui mollitia. Non qui labore enim.', 1, 0, '2012-02-23 17:53:34', '2013-01-07 15:35:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (10, 10, 10, 'Sunt facere delectus nihil odit iure et. Temporibus eum amet voluptatibus assumenda voluptatem est maxime cum. Dicta cupiditate voluptate autem et rem ab molestiae.', 0, 0, '2014-10-23 22:14:48', '2019-03-17 00:01:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (11, 11, 11, 'Modi maiores asperiores aut earum eum. Ut deleniti incidunt accusamus cupiditate nihil doloremque aut. Ut saepe et rerum sed.', 0, 1, '2012-03-31 21:06:25', '2019-06-25 17:28:34');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (12, 12, 12, 'Eos similique voluptatem voluptate at nostrum suscipit illo. Reiciendis ea corrupti dignissimos voluptas perspiciatis ea totam. Laboriosam fuga ad harum ipsa asperiores. Et qui quisquam aspernatur nam assumenda.', 1, 1, '2011-03-16 11:50:24', '2011-10-15 21:51:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (13, 13, 13, 'Numquam expedita ducimus suscipit voluptas atque. Explicabo numquam et ad deserunt officia. Voluptatibus veritatis quo optio et nobis ea quas.', 1, 1, '2010-12-07 17:24:39', '2013-10-29 04:30:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (14, 14, 14, 'Eveniet nam nisi eos quia similique doloremque aperiam. Voluptas quis tenetur dolor est et vel ratione. Et autem cupiditate similique quod adipisci. Non quo voluptate tempore labore.', 0, 1, '2015-05-28 16:13:24', '2011-09-23 18:35:27');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (15, 15, 15, 'Eos harum libero itaque non est ut vel. Nulla autem assumenda qui in. Atque ut nesciunt aut temporibus nobis eligendi provident. Maxime unde quia blanditiis et aut quam voluptate. Enim sunt aspernatur minus amet et occaecati.', 1, 0, '2016-07-17 15:05:00', '2010-09-17 20:51:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (16, 16, 16, 'Quia aut dolorem eveniet. Dolor beatae quod sit necessitatibus et sunt. Nihil labore maxime qui commodi aperiam nihil.', 0, 0, '2011-08-16 17:37:36', '2013-12-12 20:35:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (17, 17, 17, 'Soluta consequuntur consectetur saepe qui quia. Minus dolore et cum. Optio officiis a nihil error sapiente. Hic pariatur iusto sit et.', 1, 0, '2019-08-12 04:19:30', '2019-02-28 14:37:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (18, 18, 18, 'Impedit sunt commodi tempore accusamus dolorem. Illum necessitatibus quia in omnis. Rerum ut voluptates eos quas cupiditate libero. Quos quod itaque totam quis nobis nisi.', 0, 1, '2014-03-16 22:00:08', '2016-09-04 17:10:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (19, 19, 19, 'Cupiditate magni perferendis dolor aliquid dolore sed similique. Nobis voluptas eveniet id at et.', 1, 0, '2016-11-25 22:53:23', '2014-03-30 01:38:47');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (20, 20, 20, 'Aut aspernatur voluptatem suscipit quam. Aut rem sint nisi velit nobis molestiae. Ut numquam similique voluptate id veniam qui quibusdam voluptate.', 0, 0, '2019-06-28 21:04:02', '2019-03-10 10:52:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (21, 21, 21, 'Illo laboriosam iure repellendus facilis quos maiores. Molestias magnam cum sed beatae veniam voluptatibus facilis. Non velit repellendus est velit repudiandae consectetur. Quia dolores iste consequatur nihil similique.', 1, 0, '2010-09-13 17:41:51', '2015-05-12 07:48:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (22, 22, 22, 'Nesciunt totam eos ut ipsum cum a. Molestiae ut nihil qui voluptate et. Autem ut porro sequi. Numquam sint sed sequi.', 0, 1, '2016-04-11 15:46:18', '2020-01-27 03:21:20');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (23, 23, 23, 'Inventore inventore debitis fugit necessitatibus exercitationem deleniti ab natus. Sit suscipit quia repellat hic. Ab placeat omnis iste eius explicabo quidem placeat.', 0, 1, '2018-10-27 11:29:23', '2019-10-16 15:20:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (24, 24, 24, 'Et corrupti voluptates laboriosam voluptatibus quidem. Ipsa molestias tenetur eius. Voluptatem occaecati consequuntur et quos sed animi. Quam aut explicabo expedita excepturi distinctio.', 1, 1, '2018-11-16 21:12:37', '2016-07-17 23:31:26');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (25, 25, 25, 'Qui eveniet inventore beatae nihil. Consequatur beatae enim culpa autem.', 1, 1, '2014-12-30 21:46:59', '2020-06-13 10:04:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (26, 26, 26, 'Deleniti reprehenderit rerum velit. Voluptas nobis sit quia et. Et pariatur aliquam omnis assumenda sint nostrum rem recusandae. Perferendis animi voluptatem quibusdam in est non natus sunt.', 1, 0, '2015-05-27 12:16:28', '2013-12-30 01:19:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (27, 27, 27, 'Perspiciatis nobis aut beatae eaque dolore ab. Aut perferendis cumque sint vel aut magnam. Qui ut officiis aut dolores tempora officiis sapiente sunt. Voluptas aliquam expedita harum tempora.', 0, 1, '2019-08-24 15:14:12', '2018-01-03 21:16:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (28, 28, 28, 'Sint tenetur expedita quas aut dolorum et at. Excepturi vel inventore dicta et similique.', 1, 0, '2017-09-15 13:28:45', '2018-01-26 06:42:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (29, 29, 29, 'Ipsum quia nostrum nulla debitis. Perspiciatis necessitatibus quo dolore voluptas incidunt. Et et et consequuntur eum ut molestiae.', 1, 1, '2014-04-14 06:25:31', '2014-11-24 01:56:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (30, 30, 30, 'Ipsam quo eveniet architecto atque perspiciatis optio non neque. Facilis facere repellendus sequi nesciunt soluta illo et. Doloremque voluptatem autem dolores ut ea. Similique et ut laudantium possimus sequi.', 0, 1, '2013-08-01 14:47:04', '2019-06-22 23:49:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (31, 31, 31, 'Maxime nostrum laudantium suscipit veritatis aut consequatur. Explicabo rerum nisi quidem necessitatibus et minus et. Similique sequi atque autem eaque dolor. Est exercitationem in est qui aliquam et.', 0, 1, '2013-04-05 19:54:09', '2017-12-18 02:48:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (32, 32, 32, 'Est natus molestiae unde sunt quas eligendi doloremque. Et at quaerat numquam ducimus qui rem. Nisi est vitae quas quidem nemo aspernatur. Facere voluptatum soluta enim eos saepe possimus officia.', 0, 1, '2019-12-09 15:22:37', '2016-06-24 23:06:55');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (33, 33, 33, 'Aspernatur optio porro nam alias qui et. Dolores consequuntur qui eligendi sequi amet ut. Reiciendis voluptatem qui libero dicta necessitatibus asperiores.', 1, 0, '2018-07-11 05:26:34', '2017-05-03 12:38:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (34, 34, 34, 'Velit hic occaecati pariatur et. Facilis quidem delectus aut est. Minus excepturi et porro id vero eveniet. Consequatur iure eligendi recusandae qui quaerat aut est. Iste et eum doloremque ut.', 0, 1, '2012-02-19 09:36:09', '2018-05-20 10:45:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (35, 35, 35, 'In rerum qui ut est. Sint corporis et quos beatae quibusdam enim est. Magnam beatae consequuntur praesentium dicta quisquam ea. Voluptatem porro itaque molestiae molestiae magnam.', 1, 0, '2017-07-05 11:14:30', '2015-02-16 06:26:36');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (36, 36, 36, 'Officia occaecati quod aut illo et et. Consequatur quia est et optio. Sunt dolor aut at et maxime voluptatem. Nobis vel facere nostrum mollitia aliquam.', 0, 0, '2017-08-20 12:06:21', '2019-12-12 03:46:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (37, 37, 37, 'Possimus beatae eum in sunt. Tempore magni non excepturi est porro ut.', 0, 1, '2015-06-03 12:06:24', '2020-04-27 13:41:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (38, 38, 38, 'Id sit cumque consequatur itaque commodi consequatur. Odio nobis quam ex quo laborum sed. Sequi tempora sint et cum tempore voluptatibus deserunt. Sed consequatur et animi incidunt.', 1, 0, '2016-10-29 07:12:38', '2019-07-08 20:55:36');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (39, 39, 39, 'Quo autem architecto assumenda et. Ut consequatur dolorem quia. Ut est eligendi perspiciatis sed odit. Molestiae praesentium error voluptas sint aperiam quam ea voluptas. Et fugit aliquam consequatur dignissimos officia.', 1, 0, '2017-11-11 01:15:01', '2015-03-22 13:52:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (40, 40, 40, 'Voluptas saepe dolor maiores distinctio nihil modi soluta. Sunt laudantium nihil omnis in ratione quos. Aliquam labore rerum qui et eligendi ut quisquam rerum.', 1, 0, '2012-01-21 08:33:19', '2015-02-28 02:22:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (41, 41, 41, 'Dignissimos quidem cumque dolore in. Non at consequatur enim. Sit sunt voluptas in autem incidunt consequatur. Ex neque saepe quam qui praesentium eos.', 1, 1, '2012-01-12 16:40:43', '2015-06-15 05:59:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (42, 42, 42, 'Sunt sunt labore nemo in. Omnis amet eum cumque quisquam. Quod et et praesentium qui. Voluptatem at ut sed aliquam doloribus. Dolorum sunt minima fuga ad ut.', 1, 1, '2018-01-22 00:06:58', '2012-08-24 14:16:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (43, 43, 43, 'Omnis adipisci excepturi et eos. Voluptas blanditiis nam itaque rem suscipit laudantium et. Rerum dolorum natus consequatur rem vitae nulla et. Veniam maxime qui ea sint odit quo consequuntur.', 0, 0, '2019-07-21 05:21:16', '2016-07-02 12:42:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (44, 44, 44, 'Quasi expedita est consequatur. Impedit atque illo doloribus distinctio quis voluptatem amet. Qui est quibusdam quam sed.', 1, 0, '2013-03-27 23:52:32', '2012-05-02 09:37:23');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (45, 45, 45, 'Veniam adipisci et architecto. Dolorem eos voluptatem nisi. Aut ullam optio suscipit ad amet quis. Quo officiis animi ipsa et maxime earum natus odio.', 0, 1, '2012-11-15 05:24:46', '2011-02-24 01:41:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (46, 46, 46, 'Autem qui nihil sed dolorem consequatur maiores qui molestias. Odit tempora saepe aut unde perspiciatis et odit. Eum non placeat magni eligendi autem. Ratione nesciunt ex est nesciunt laudantium hic.', 0, 0, '2011-08-23 20:41:45', '2012-05-15 11:38:03');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (47, 47, 47, 'Ipsam numquam quo aliquid labore neque eveniet. Magnam voluptas esse saepe dolor vel et. Tempore aut cum assumenda. Accusamus accusamus laboriosam sed.', 0, 0, '2018-02-12 05:03:42', '2015-12-04 17:06:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (48, 48, 48, 'Corporis sunt sed sit voluptas omnis ipsam sit. Corrupti qui vel fugiat voluptas magni ipsam id vel.', 1, 0, '2019-07-30 21:23:25', '2012-12-27 11:15:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (49, 49, 49, 'Dolore id non est voluptatem hic ad. Rerum eos sunt qui vel laudantium. Vel et nemo non dolore ut recusandae. Iusto hic recusandae voluptatem illum.', 0, 0, '2018-03-06 03:31:33', '2011-05-16 07:13:35');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (50, 50, 50, 'Molestiae excepturi sunt nisi. Quos natus quaerat voluptatem. Perspiciatis natus nesciunt nam et voluptate sed doloribus.', 0, 0, '2014-08-31 14:02:29', '2011-04-09 11:11:26');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (51, 51, 51, 'Voluptas aliquid veniam accusantium itaque dicta. Optio vitae incidunt doloremque nihil corporis possimus aut. Quod et minus dolor vel quia repellendus adipisci architecto.', 0, 0, '2018-08-12 01:59:14', '2016-02-08 14:36:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (52, 52, 52, 'Expedita quia ut voluptatem iste. Quibusdam aut repellendus modi quis laborum.', 1, 1, '2018-07-12 17:56:26', '2019-08-04 19:23:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (53, 53, 53, 'Sed rerum est nam est molestiae. Dolores nulla maxime aut rerum vero eum. Ad iste at sit nisi.', 0, 0, '2013-03-31 09:23:40', '2013-06-27 06:01:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (54, 54, 54, 'Hic est eos quis officia quos. Quia aut velit aut reiciendis et. Dolorum aut quis consectetur laborum reprehenderit voluptate. Excepturi et sunt explicabo aut enim.', 1, 0, '2016-12-30 15:37:59', '2012-12-20 03:27:35');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (55, 55, 55, 'Doloremque nemo voluptatem vel veritatis. Hic sit provident et nemo expedita laboriosam. Voluptas quidem et eveniet alias perspiciatis consequuntur eum.', 0, 1, '2020-07-09 07:48:13', '2019-01-18 08:28:53');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (56, 56, 56, 'Consequatur iure sint enim qui cumque rerum dignissimos. Eos dolor et natus molestias praesentium sapiente. Voluptatem velit officia ea laudantium deleniti enim sed qui. Sit exercitationem doloremque odio veritatis commodi.', 1, 1, '2013-01-05 02:00:00', '2019-04-18 08:02:16');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (57, 57, 57, 'Eaque sunt non quaerat et. Fugit amet aut et reiciendis similique et. Eveniet laudantium voluptas ea veritatis facilis. Dolorum earum adipisci totam est dolor.', 1, 0, '2015-04-03 10:09:47', '2014-08-31 23:53:49');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (58, 58, 58, 'Fuga dolor assumenda totam voluptatum. Voluptatum temporibus aspernatur veritatis autem expedita. Aspernatur est omnis cupiditate molestias. Nam non eos nam rerum delectus nulla. Soluta sint at commodi eum sit numquam qui labore.', 0, 0, '2011-01-10 01:02:02', '2018-09-13 09:39:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (59, 59, 59, 'Dicta dolore eum quo modi est accusantium. Quisquam officiis placeat sit distinctio molestias voluptatem et. Sunt natus est dolore est quia.', 1, 0, '2017-07-06 22:05:21', '2017-01-08 08:30:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (60, 60, 60, 'Optio dolor repellendus quaerat omnis reprehenderit eos. Esse animi qui autem tempora sequi autem. Rerum ea iste illo omnis nam atque voluptatem. Enim voluptates sed quo et ab minima vel.', 0, 0, '2017-02-18 17:09:00', '2012-06-29 20:56:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (61, 61, 61, 'Amet amet esse est quasi facilis. Sed quidem eveniet magni magni deserunt accusantium ut. Ut at doloribus animi qui rem sunt mollitia.', 0, 0, '2015-11-25 18:38:47', '2018-07-15 12:57:21');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (62, 62, 62, 'Qui assumenda beatae quidem aut et voluptatem alias qui. Ut suscipit fugiat illum est qui ea. Laboriosam ipsa ab debitis tempore amet. Sint repellendus velit animi aut exercitationem.', 0, 1, '2018-06-18 17:14:10', '2014-03-05 04:51:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (63, 63, 63, 'Sunt tenetur incidunt quia nihil molestiae labore in accusantium. Vel omnis sint accusamus sunt. Facere aut consequuntur ex facilis voluptas rerum.', 1, 0, '2018-10-13 09:47:48', '2016-05-22 20:32:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (64, 64, 64, 'Velit omnis eveniet necessitatibus odit fugiat minus qui. Repellendus fuga consequatur qui dicta eaque. Sit odit quae numquam.', 0, 1, '2014-11-18 05:01:24', '2017-07-15 13:28:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (65, 65, 65, 'Sunt facere non quasi eveniet quis. Ad quo qui tempore magni. Quisquam voluptatem alias enim consequatur temporibus rerum recusandae. Enim cupiditate quia incidunt quo cupiditate ea.', 1, 1, '2012-11-29 02:56:04', '2013-11-10 23:18:21');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (66, 66, 66, 'Veniam voluptatem omnis eligendi quo molestiae distinctio. Perferendis maiores velit molestiae sed id aperiam voluptates dolorum. Laboriosam sint veritatis corrupti eos molestias molestiae. Et laboriosam in veniam provident delectus.', 0, 1, '2019-12-10 17:40:20', '2020-01-13 03:50:47');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (67, 67, 67, 'Quia earum modi placeat. Vitae quas delectus porro sint. Et sint voluptatum aliquid quaerat aut rerum omnis. Tempora veritatis veniam est omnis sit similique.', 1, 0, '2017-03-07 03:57:02', '2010-12-26 21:46:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (68, 68, 68, 'Sit dignissimos magnam nam nihil. Ab ut amet et adipisci. Aliquam praesentium ut quae. Magnam facere sit id.', 1, 0, '2015-10-17 22:00:53', '2015-03-14 16:18:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (69, 69, 69, 'Quis inventore amet aliquid aperiam deleniti aut quia. Est quidem debitis doloremque tempore et consequatur ullam. Ut perspiciatis delectus accusantium blanditiis rerum enim eveniet. Nulla laudantium omnis inventore et.', 0, 0, '2017-02-01 19:22:26', '2019-01-31 13:51:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (70, 70, 70, 'Ut sequi voluptatem recusandae sequi occaecati. Tempora voluptates maxime qui placeat non ut vitae. Suscipit velit excepturi et minus commodi. Voluptatem similique doloribus consequatur nisi.', 0, 0, '2012-12-13 12:29:59', '2017-07-16 02:23:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (71, 71, 71, 'Reprehenderit neque deleniti autem repellendus. Modi labore magnam est tempore. Eaque est explicabo eligendi consequatur.', 0, 0, '2012-02-28 09:08:44', '2012-06-09 15:22:17');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (72, 72, 72, 'Eos mollitia repellendus ipsam dolorem qui corporis. Sed consequuntur fugiat dolores et quos fugiat possimus. Tempore consequatur culpa ullam. Asperiores sit sapiente voluptatem quaerat. Omnis ab explicabo in sed aliquam provident eaque.', 0, 0, '2018-08-31 23:56:14', '2016-08-10 21:30:39');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (73, 73, 73, 'Eaque dolorem sed laboriosam. Hic modi laborum ad ut. Voluptates necessitatibus ducimus recusandae. Reprehenderit voluptate perferendis itaque illo dolores.', 0, 0, '2018-12-03 12:58:56', '2011-02-17 00:30:24');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (74, 74, 74, 'Iusto in vel repudiandae id dolor sit. Vel natus porro error deserunt nihil nulla non. Tempore voluptatem quod consequatur rerum quo pariatur. Ipsum ad magnam itaque suscipit explicabo.', 1, 0, '2019-03-10 19:39:27', '2013-04-23 12:27:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (75, 75, 75, 'Corrupti est eligendi voluptatem earum. Vel omnis in illo ducimus. Enim officia repellendus voluptatem totam.', 1, 0, '2012-04-09 20:33:26', '2011-05-21 17:03:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (76, 76, 76, 'Consequuntur maxime veritatis exercitationem et. Dignissimos non ipsam eaque. Totam earum sapiente placeat quod porro earum.', 0, 0, '2020-04-26 18:17:53', '2017-07-11 19:22:34');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (77, 77, 77, 'Optio quas neque ab quis suscipit saepe qui. Consequatur omnis quos consequatur rerum ab soluta. Nulla laudantium aut expedita aut nihil.', 1, 1, '2012-01-01 02:19:00', '2011-06-19 11:39:53');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (78, 78, 78, 'Aut cum voluptatem ut aperiam reiciendis incidunt repellat. At molestias hic ratione sed aut omnis. Cum eum quos incidunt qui quia. Sunt aut similique ut quasi.', 1, 1, '2014-05-25 23:51:25', '2020-08-23 12:53:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (79, 79, 79, 'Accusantium totam vel dolores et dolorem aliquam. Architecto maxime cupiditate ut quas. Voluptatibus expedita quasi perferendis quos sapiente voluptas error. Aliquid dicta voluptas neque assumenda minus.', 1, 1, '2011-02-19 03:49:25', '2014-01-05 13:10:20');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (80, 80, 80, 'Iste et earum omnis corrupti. At ipsum cupiditate voluptas voluptas quisquam. Perferendis officia voluptatem reiciendis aut. Et a eligendi fugit inventore soluta impedit harum. Minima ea totam et aliquid est.', 0, 0, '2013-09-14 07:28:18', '2011-09-18 00:24:36');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (81, 81, 81, 'Est ut quis aut beatae quibusdam. Exercitationem quibusdam et labore. Esse possimus dolores recusandae magni blanditiis eius.', 0, 0, '2020-05-27 21:59:17', '2014-08-12 02:44:23');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (82, 82, 82, 'Omnis tempora voluptatum labore facilis dolorem a blanditiis. Impedit est optio dolores fugit. Incidunt ratione perferendis enim ut aliquam. Officia pariatur cum quia. Officiis voluptas eum quia veniam alias quo architecto.', 0, 0, '2014-04-28 12:17:29', '2018-01-05 19:15:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (83, 83, 83, 'Sequi ab laboriosam aut consequatur occaecati maiores. Impedit ex consequatur consequatur et nesciunt. Illo vel quod architecto et voluptatem delectus.', 1, 1, '2012-03-04 00:52:36', '2011-11-03 07:55:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (84, 84, 84, 'Facere harum nulla facilis laboriosam expedita veritatis. Voluptas id voluptate expedita quia nobis repudiandae non. Aut voluptatem nisi mollitia delectus delectus et. Sit maxime voluptate ratione laborum magnam. Occaecati aut atque velit perspiciatis.', 1, 1, '2018-01-18 16:18:03', '2015-04-07 19:11:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (85, 85, 85, 'Et voluptatibus reiciendis doloribus et saepe quam. Laudantium qui ab quod veniam quas fugit aut pariatur. Distinctio ullam quasi distinctio voluptatem.', 0, 1, '2019-09-18 06:22:48', '2018-10-10 21:13:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (86, 86, 86, 'Maiores fuga dolor quia perferendis laborum facilis. Illo corrupti ab voluptates adipisci nobis fugit consequatur. Dolorem aut natus ad qui.', 1, 0, '2012-08-27 00:30:32', '2018-07-15 12:48:08');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (87, 87, 87, 'Eum quo rerum quaerat. Sit maxime ut voluptate. Et est qui itaque.', 0, 0, '2010-12-06 14:11:54', '2011-07-02 07:01:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (88, 88, 88, 'Soluta sed enim et voluptatem. Distinctio dolorem id non consequuntur soluta.', 1, 1, '2011-08-07 14:32:26', '2020-06-15 22:43:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (89, 89, 89, 'Ab vel molestias qui dolore asperiores quaerat ut. Voluptatum ipsum repellat dolorum delectus. Dolore mollitia molestiae veniam libero totam animi molestiae.', 0, 0, '2015-05-11 05:04:48', '2016-06-27 13:17:53');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (90, 90, 90, 'Voluptas autem molestiae assumenda. Adipisci soluta ad amet vel facere qui debitis. Et minus laboriosam dolor sunt dolores harum id. Molestias culpa minima quasi eos nobis sed.', 1, 0, '2015-03-17 09:16:44', '2014-02-08 01:52:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (91, 91, 91, 'Placeat et dicta architecto eum ipsa molestiae nulla. Quos doloremque sapiente impedit eum sed at. Incidunt rerum corrupti fuga omnis. Amet exercitationem delectus sapiente dolorem minus omnis.', 1, 1, '2011-04-15 20:07:35', '2016-05-18 01:00:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (92, 92, 92, 'Nihil et dignissimos ab in. A est est commodi quisquam exercitationem nihil consequatur.', 0, 1, '2019-06-27 03:16:22', '2012-01-12 22:50:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (93, 93, 93, 'Et voluptas officia officia quas vitae et est dolor. Dolores deleniti itaque laudantium cum. Dolorum corrupti et maiores mollitia minima odio est.', 0, 1, '2017-02-04 07:47:18', '2013-12-23 03:07:30');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (94, 94, 94, 'Alias minus sed voluptatem ut. Quis rerum et fuga est aut nihil incidunt. Quos nobis molestiae adipisci ea voluptas est.', 1, 0, '2020-04-01 03:01:57', '2011-10-23 08:18:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (95, 95, 95, 'Necessitatibus dolorem possimus sit sit quam. Molestias molestiae voluptatibus voluptatem aut ut vero ut. Sit reiciendis reiciendis quae ut magni porro nulla. Vel laboriosam esse ut ut eum velit.', 0, 0, '2013-06-10 12:59:07', '2020-05-31 06:56:16');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (96, 96, 96, 'Aut fuga in voluptatem non praesentium. Sit ut eos molestiae consectetur nemo aliquid ullam est. Eius hic qui molestias excepturi consequuntur. Totam sit numquam modi quibusdam architecto.', 1, 0, '2013-09-25 21:40:38', '2016-08-16 23:19:26');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (97, 97, 97, 'Placeat possimus ad est velit est officia velit. Id et aut voluptatibus praesentium. In quaerat tenetur delectus illum recusandae.', 1, 1, '2010-09-11 09:47:29', '2019-06-10 15:31:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (98, 98, 98, 'Voluptatem et labore eius aspernatur. Sit aut numquam ad dolores. Dolorum rerum cumque eos animi nesciunt.', 1, 1, '2020-08-28 08:20:25', '2019-05-26 15:12:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (99, 99, 99, 'Dolore ea ipsam molestiae quia et voluptate. Labore deserunt tenetur inventore ad voluptatem esse. Suscipit architecto adipisci eius porro nisi laboriosam incidunt. Suscipit odit cum ullam voluptatem dolore quo sint. Accusamus atque quis incidunt accusamus et laudantium.', 0, 1, '2013-06-23 13:17:14', '2013-07-10 09:33:16');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (100, 100, 100, 'Facere placeat ullam delectus vero. Eaque cum harum vel hic repudiandae.', 0, 0, '2017-12-05 10:20:12', '2020-01-25 14:50:21');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `photo_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на основную фотографию пользователя',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Текущий статус',
  `city` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Профили';

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (1, 'm', '1972-08-30', 781948, 'voluptatibus', 'South Noelia', 'Niger', '2017-10-31 19:37:58', '2019-09-15 11:44:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (2, 'm', '2003-06-02', 44, 'ea', 'Cordiatown', 'Bhutan', '2012-08-19 06:56:03', '2017-07-14 05:35:29');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (3, 'm', '1970-09-13', 35500, 'dolores', 'Farrellland', 'Argentina', '2016-05-21 23:24:37', '2015-08-07 06:41:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (4, 'm', '2001-03-22', 18329873, 'porro', 'Port Maymiehaven', 'Saudi Arabia', '2011-01-30 23:48:25', '2014-12-10 07:33:13');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (5, 'm', '1996-08-09', 692480, 'enim', 'Lemkeport', 'Ghana', '2012-04-24 07:53:36', '2011-04-02 19:13:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (6, 'm', '1970-04-26', 756203145, 'omnis', 'New Magalifort', 'Costa Rica', '2010-11-27 06:22:34', '2013-07-11 00:44:14');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (7, '', '1999-01-03', 197723, 'nihil', 'Port Leilanishire', 'Poland', '2013-12-08 15:44:20', '2014-12-28 02:18:18');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (8, '', '1978-06-27', 437456, 'est', 'Ernestinafurt', 'British Indian Ocean Territory (Chagos Archipelago)', '2011-09-13 18:55:51', '2017-08-04 05:53:14');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (9, 'm', '2011-10-08', 21123, 'nam', 'New Madisyn', 'Macedonia', '2015-04-24 06:45:57', '2017-02-01 19:37:07');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (10, '', '2010-03-22', 55390820, 'voluptatem', 'Zechariahberg', 'Sierra Leone', '2015-05-21 12:45:02', '2015-08-03 16:52:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (11, '', '1978-04-08', 200492, 'et', 'Halvorsonborough', 'Zimbabwe', '2017-11-03 02:28:32', '2018-05-09 19:53:54');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (12, 'm', '2007-11-25', 1476839, 'non', 'Jenniferborough', 'Nepal', '2018-08-12 10:36:20', '2015-04-01 19:41:00');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (13, 'm', '1992-08-02', 6298442, 'voluptatum', 'Bernieborough', 'Uzbekistan', '2018-02-24 20:58:48', '2011-12-26 14:42:10');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (14, '', '2015-06-21', 1, 'tempore', 'Lake Candidahaven', 'Saint Kitts and Nevis', '2018-01-29 13:06:23', '2014-12-18 16:35:43');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (15, '', '1982-03-28', 670050733, 'sit', 'Kuhlmanborough', 'Austria', '2018-06-01 14:41:27', '2016-05-23 21:00:26');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (16, 'm', '2020-01-30', 7, 'sint', 'Genehaven', 'Senegal', '2013-08-21 05:01:46', '2011-02-28 07:09:33');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (17, 'm', '2011-11-09', 2, 'veniam', 'Johnstonfort', 'Northern Mariana Islands', '2012-06-05 21:30:03', '2012-01-21 10:45:34');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (18, '', '1998-12-16', 45235803, 'molestiae', 'Collierview', 'Bosnia and Herzegovina', '2016-12-08 14:33:54', '2016-04-15 17:10:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (19, 'm', '1986-01-21', 2020140, 'ab', 'Lake Issac', 'Bahamas', '2011-05-03 13:59:44', '2019-02-01 15:38:01');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (20, '', '2003-05-04', 5537, 'temporibus', 'New Kaylaton', 'French Guiana', '2011-06-12 09:42:00', '2018-01-31 10:30:29');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (21, 'm', '2019-02-08', 53110, 'ut', 'Homenickland', 'Netherlands Antilles', '2019-06-24 07:26:34', '2018-11-30 02:00:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (22, '', '1980-06-27', 9709448, 'rem', 'Haneview', 'Bulgaria', '2017-07-20 22:15:41', '2017-07-13 14:21:08');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (23, 'm', '2002-10-08', 1421, 'laboriosam', 'Lake Molly', 'Armenia', '2011-06-21 05:49:36', '2013-02-22 19:53:25');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (24, 'm', '2008-01-17', 1362289, 'est', 'Lilianatown', 'Belarus', '2012-02-28 22:33:00', '2020-04-26 11:23:55');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (25, '', '2014-05-18', 56511, 'voluptates', 'North Stanfordstad', 'Martinique', '2012-08-30 11:02:34', '2013-07-04 02:04:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (26, 'm', '1994-06-04', 0, 'maxime', 'South Theodora', 'Palestinian Territory', '2013-03-14 03:14:49', '2012-10-14 10:30:23');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (27, 'm', '1973-11-26', 5, 'temporibus', 'East Nicholausmouth', 'Bulgaria', '2011-08-07 13:03:16', '2014-01-09 20:02:28');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (28, 'm', '2019-04-13', 15, 'aliquam', 'Julesberg', 'Greece', '2016-06-19 20:04:36', '2017-11-29 10:11:21');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (29, '', '1996-12-07', 77157, 'possimus', 'South Tinaburgh', 'Mongolia', '2015-01-24 17:32:40', '2013-02-21 07:53:33');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (30, 'm', '1994-08-01', 3, 'recusandae', 'Port Coralie', 'China', '2018-03-07 23:44:11', '2020-05-26 01:57:39');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (31, 'm', '2015-01-12', 1797, 'aut', 'Douglasborough', 'Bulgaria', '2013-06-12 19:09:46', '2015-10-10 04:26:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (32, 'm', '1985-07-21', 687010, 'earum', 'Romaineborough', 'United Kingdom', '2016-06-20 19:42:52', '2010-11-20 13:46:13');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (33, '', '1999-03-16', 2389621, 'dolores', 'Waldotown', 'Morocco', '2015-12-18 20:35:00', '2013-11-13 19:57:36');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (34, 'm', '1999-05-30', 23, 'quia', 'Kimberlyville', 'Romania', '2013-02-26 17:13:02', '2013-02-10 00:09:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (35, '', '1987-02-24', 49650274, 'animi', 'New Mackenzieborough', 'United States of America', '2013-05-27 17:27:58', '2012-04-13 03:37:58');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (36, '', '2008-04-22', 93202042, 'accusamus', 'Lake Mauricio', 'Thailand', '2011-03-08 19:14:10', '2016-08-03 11:15:19');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (37, 'm', '2015-10-17', 63582, 'aut', 'Lake Marcia', 'Madagascar', '2014-12-15 21:59:48', '2015-12-07 11:00:01');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (38, '', '2015-11-20', 93437529, 'rerum', 'Rodriguezbury', 'French Polynesia', '2019-11-29 09:16:29', '2010-10-29 09:00:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (39, '', '1980-09-08', 930699, 'ut', 'West Johnpaul', 'French Polynesia', '2018-02-21 20:01:16', '2014-11-01 08:25:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (40, 'm', '2017-05-09', 940, 'ut', 'Port Earnest', 'Gambia', '2019-06-08 03:38:08', '2018-05-13 23:37:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (41, '', '1976-04-16', 72, 'aspernatur', 'Gerlachborough', 'Nepal', '2012-02-04 05:33:57', '2015-07-26 08:46:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (42, 'm', '1990-05-02', 881, 'velit', 'East Brendabury', 'Suriname', '2015-11-09 11:59:46', '2015-02-20 10:50:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (43, 'm', '1974-08-14', 3008363, 'voluptatem', 'Noelside', 'Andorra', '2019-04-07 08:39:02', '2015-03-30 00:18:23');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (44, '', '2003-01-30', 8973236, 'sequi', 'Nikolausport', 'Tunisia', '2017-04-10 22:34:18', '2015-10-06 06:40:43');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (45, 'm', '1972-07-05', 89849, 'in', 'West Samanta', 'Rwanda', '2015-03-14 15:12:09', '2020-03-03 02:58:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (46, '', '2002-11-26', 0, 'velit', 'East Maximillia', 'Libyan Arab Jamahiriya', '2016-07-19 15:06:13', '2019-11-04 08:08:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (47, 'm', '1998-12-13', 9700, 'ut', 'East Myrtieview', 'Mauritius', '2016-01-03 21:54:49', '2011-01-24 11:14:04');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (48, 'm', '2002-02-12', 877, 'architecto', 'Tracehaven', 'Ukraine', '2012-02-11 21:28:39', '2017-04-26 07:23:34');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (49, '', '1980-07-30', 2, 'tenetur', 'Port Jedberg', 'Micronesia', '2016-05-22 22:37:18', '2014-05-04 10:42:23');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (50, '', '2000-02-17', 0, 'fugiat', 'Gulgowskiton', 'Paraguay', '2019-12-10 11:17:44', '2015-10-02 15:02:28');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (51, '', '1985-04-04', 7292664, 'hic', 'North Art', 'Libyan Arab Jamahiriya', '2018-08-31 20:05:32', '2011-08-17 19:01:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (52, 'm', '1996-03-04', 62842069, 'explicabo', 'Nolanmouth', 'Cayman Islands', '2020-07-13 13:07:48', '2019-12-08 04:55:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (53, 'm', '2018-11-11', 853706, 'distinctio', 'West Gwendolynville', 'Bhutan', '2018-02-10 06:02:58', '2014-03-30 16:08:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (54, 'm', '1976-04-29', 34, 'voluptatum', 'West Pinkie', 'French Guiana', '2019-11-18 09:29:51', '2011-11-01 12:56:49');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (55, 'm', '1988-09-20', 7, 'sit', 'Schroederchester', 'Egypt', '2011-10-21 10:05:03', '2018-01-07 03:51:05');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (56, '', '1970-11-04', 76, 'explicabo', 'Hudsonstad', 'South Georgia and the South Sandwich Islands', '2019-03-07 07:37:38', '2020-01-29 05:08:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (57, 'm', '1982-02-22', 9641833, 'rem', 'North Isidro', 'Syrian Arab Republic', '2013-11-09 03:12:53', '2018-11-04 14:17:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (58, '', '1975-01-16', 4, 'est', 'Grantside', 'Chile', '2020-02-18 02:06:19', '2019-04-27 02:43:47');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (59, 'm', '1990-05-05', 63, 'et', 'Queentown', 'United Arab Emirates', '2020-01-19 17:44:15', '2017-06-22 22:52:47');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (60, 'm', '2020-01-26', 82696, 'neque', 'Carolanneville', 'Paraguay', '2012-01-14 01:47:14', '2012-08-16 16:44:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (61, '', '1993-04-16', 2048689, 'dicta', 'Loraineshire', 'Japan', '2018-05-31 04:35:49', '2020-05-09 19:22:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (62, 'm', '1997-06-03', 42, 'neque', 'Dedrickmouth', 'Croatia', '2018-07-06 13:57:18', '2016-09-04 10:50:20');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (63, '', '2010-11-10', 7122309, 'adipisci', 'West Rebekahstad', 'Tokelau', '2017-11-28 20:56:34', '2012-07-02 18:58:33');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (64, 'm', '1989-01-26', 646107, 'iste', 'South Lillianachester', 'Guam', '2017-09-17 02:56:23', '2018-09-13 09:20:04');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (65, 'm', '1999-06-06', 0, 'illum', 'Port Krisfort', 'Suriname', '2018-05-05 07:16:11', '2016-03-22 20:34:01');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (66, 'm', '1983-06-27', 29, 'commodi', 'Coyberg', 'Algeria', '2013-05-03 07:18:58', '2019-09-10 15:20:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (67, 'm', '2010-08-28', 460217, 'deleniti', 'East Annaburgh', 'Turkey', '2012-02-21 03:00:13', '2013-12-22 08:33:06');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (68, 'm', '2010-09-01', 88480857, 'dolores', 'Port Henry', 'Aruba', '2012-03-08 01:25:02', '2011-08-05 15:42:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (69, 'm', '1991-11-02', 38855267, 'dolorem', 'Hageneschester', 'Belize', '2017-07-08 20:17:18', '2011-03-03 15:09:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (70, '', '2000-06-10', 5160151, 'ducimus', 'South Maverick', 'Bulgaria', '2019-01-16 02:15:08', '2012-04-06 12:59:26');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (71, 'm', '1983-05-02', 0, 'in', 'East Breana', 'Bahamas', '2013-04-07 23:23:51', '2011-03-07 05:34:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (72, '', '2012-03-16', 10357470, 'dolores', 'Maiyaberg', 'Swaziland', '2015-01-24 13:52:16', '2013-03-13 21:25:34');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (73, '', '1970-10-08', 578, 'vitae', 'Welchland', 'Anguilla', '2016-04-09 06:20:05', '2020-03-05 00:34:32');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (74, '', '1986-03-31', 4075181, 'sed', 'Ezekielfurt', 'Norway', '2017-09-15 14:24:58', '2017-07-25 06:26:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (75, 'm', '2019-02-05', 58934334, 'tempora', 'New Athenaberg', 'Mozambique', '2014-07-17 06:18:22', '2015-03-19 23:20:18');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (76, 'm', '2007-01-06', 7769018, 'est', 'Port Ewell', 'Ethiopia', '2016-03-25 21:55:03', '2019-09-29 05:15:50');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (77, 'm', '1975-05-15', 4, 'provident', 'South Judy', 'Grenada', '2019-01-19 04:27:23', '2011-08-03 15:43:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (78, '', '2014-09-27', 7, 'molestiae', 'North Nedramouth', 'Ghana', '2011-02-14 23:16:45', '2018-11-14 14:54:13');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (79, '', '2017-12-07', 133021, 'ea', 'Franciscostad', 'Micronesia', '2020-03-30 16:59:28', '2020-08-08 09:04:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (80, '', '1979-01-13', 662316250, 'reiciendis', 'Simonisberg', 'Comoros', '2017-05-23 11:21:06', '2020-06-12 15:33:02');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (81, '', '2004-08-14', 54076, 'sit', 'Andreanehaven', 'Tuvalu', '2014-12-04 11:29:43', '2013-06-18 05:06:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (82, 'm', '1976-04-08', 10, 'dolorem', 'East Kirstin', 'Peru', '2016-03-29 02:47:35', '2019-06-25 15:52:18');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (83, '', '2003-09-14', 920603145, 'id', 'Whiteside', 'Ecuador', '2017-04-22 08:43:00', '2014-06-30 15:09:19');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (84, '', '1985-08-23', 0, 'quidem', 'New Maurice', 'Costa Rica', '2020-02-17 22:13:02', '2013-03-16 21:34:20');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (85, '', '1973-08-16', 894785243, 'similique', 'Tiffanybury', 'Morocco', '2017-06-11 00:24:36', '2012-02-14 10:15:14');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (86, '', '1979-11-22', 318, 'explicabo', 'Elverafort', 'Spain', '2013-11-20 04:53:23', '2012-09-14 13:21:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (87, 'm', '2013-02-27', 585579, 'consequatur', 'Lake Joshua', 'Nigeria', '2018-12-08 14:18:17', '2013-07-15 20:37:35');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (88, '', '2017-07-03', 840692, 'ratione', 'West Marysehaven', 'Austria', '2012-06-02 03:18:53', '2014-04-14 18:32:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (89, 'm', '1988-10-17', 4944386, 'eos', 'Arliemouth', 'Palestinian Territory', '2018-09-06 09:45:18', '2017-01-22 12:16:23');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (90, '', '1976-03-26', 335994065, 'vitae', 'Port Masonview', 'Turkey', '2014-04-04 20:54:58', '2014-06-25 03:14:49');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (91, 'm', '1988-05-31', 7867, 'provident', 'New Vicente', 'Hungary', '2018-01-31 23:09:16', '2018-11-05 11:52:51');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (92, '', '2011-04-30', 8833, 'vel', 'West Belleborough', 'Indonesia', '2019-12-16 09:22:28', '2012-11-15 21:18:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (93, '', '2008-08-31', 49384, 'et', 'Alfonzofurt', 'Mayotte', '2013-08-18 20:24:41', '2016-09-17 04:54:08');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (94, 'm', '2015-05-20', 6357276, 'doloremque', 'Port Norma', 'Cote d\'Ivoire', '2011-04-10 12:10:31', '2019-03-16 16:35:27');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (95, 'm', '1984-10-10', 2, 'nam', 'East Palma', 'Palau', '2012-12-16 22:51:00', '2017-06-24 00:22:12');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (96, '', '2014-07-15', 3, 'nobis', 'West Amira', 'Peru', '2011-10-01 07:32:03', '2016-05-11 02:14:28');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (97, 'm', '1985-01-24', 7, 'quo', 'North Jazminbury', 'Saint Lucia', '2015-10-20 22:01:54', '2010-09-25 04:51:53');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (98, '', '2014-01-08', 3926, 'est', 'Ovashire', 'Faroe Islands', '2014-08-11 17:43:28', '2017-12-17 17:06:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (99, '', '2011-06-28', 79955681, 'iusto', 'East Stacy', 'France', '2013-01-28 03:17:39', '2013-05-17 09:56:14');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `status`, `city`, `country`, `created_at`, `updated_at`) VALUES (100, '', '2003-08-30', 201518444, 'sit', 'Criststad', 'Ghana', '2016-08-18 09:20:09', '2016-10-22 01:30:10');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользователи';

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (1, 'Layne', 'Cassin', 'beth12@example.com', '(586)198-2099', '2011-05-01 01:06:30', '2020-01-10 01:42:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (2, 'Arvel', 'McKenzie', 'ola16@example.net', '02666478393', '2019-11-23 17:27:47', '2016-08-13 23:48:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (3, 'Joanny', 'Simonis', 'jerald.lockman@example.org', '1-648-456-1126x93073', '2016-03-30 14:20:46', '2020-03-29 12:17:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (4, 'Felipa', 'Schumm', 'rose.padberg@example.org', '797.800.6808x746', '2016-07-12 18:25:03', '2012-09-15 09:30:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (5, 'Aracely', 'Streich', 'hkirlin@example.com', '770-345-2311x52751', '2020-03-25 21:21:58', '2018-12-29 18:08:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (6, 'Abraham', 'Jast', 'dhuel@example.org', '1-884-131-0886x1949', '2019-09-07 21:43:15', '2012-03-30 07:44:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (7, 'Kenny', 'Stoltenberg', 'alice62@example.net', '985.330.3153x2197', '2016-04-27 18:59:27', '2012-02-08 02:56:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (8, 'Emilie', 'Quigley', 'atorphy@example.com', '652.179.4269', '2019-09-02 10:26:55', '2012-10-02 09:42:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (9, 'Toni', 'Rau', 'rosendo59@example.net', '827-251-7226x85306', '2013-10-25 22:46:10', '2013-02-04 22:25:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (10, 'Chanelle', 'Jast', 'marjorie86@example.com', '221.504.8525', '2018-11-10 15:57:24', '2012-07-02 15:23:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (11, 'Gaylord', 'Miller', 'xmurazik@example.com', '790.055.6726x88939', '2012-08-23 16:18:02', '2010-09-25 19:51:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (12, 'Fabiola', 'Marvin', 'cary64@example.net', '(992)308-0108', '2014-02-20 01:04:12', '2011-06-23 04:41:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (13, 'Abbey', 'Schamberger', 'dcummings@example.org', '1-078-258-6639x7975', '2013-06-25 05:02:55', '2020-08-08 01:01:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (14, 'Rigoberto', 'Mitchell', 'slebsack@example.net', '414-961-7467', '2014-10-19 00:44:00', '2016-10-09 06:25:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (15, 'Jerel', 'Becker', 'lparisian@example.net', '+71(6)4865467297', '2016-07-19 00:36:55', '2012-07-25 13:10:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (16, 'Francesca', 'Hessel', 'murray.garrison@example.org', '(028)180-5332', '2012-09-08 17:33:29', '2016-02-06 14:55:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (17, 'Deja', 'Durgan', 'sabshire@example.net', '(306)696-3848x87014', '2014-11-09 21:56:28', '2016-03-05 21:41:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (18, 'Bernice', 'Homenick', 'darren.ward@example.net', '(868)073-6070x57759', '2017-04-15 01:23:04', '2020-01-16 07:29:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (19, 'Kailee', 'Sporer', 'ronny46@example.net', '960-577-8954', '2013-07-28 20:20:31', '2012-01-28 13:18:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (20, 'Aubrey', 'Bruen', 'schulist.carol@example.org', '1-926-993-6751x91226', '2012-01-19 05:50:41', '2020-08-20 15:48:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (21, 'Alvera', 'Carroll', 'norene01@example.org', '08344960118', '2020-01-07 14:04:20', '2019-11-10 02:37:46');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (22, 'Mya', 'Schmitt', 'jakubowski.jamar@example.com', '518.610.6611', '2014-04-30 02:00:47', '2018-05-07 10:26:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (23, 'Sim', 'Murazik', 'schmidt.joesph@example.net', '1-080-209-3504', '2018-01-17 00:47:26', '2011-09-25 18:59:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (24, 'Allene', 'Volkman', 'jordy.murphy@example.org', '(911)437-4137x57221', '2015-11-02 09:09:38', '2011-09-16 12:58:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (25, 'Sunny', 'Wiegand', 'jakob.raynor@example.com', '+38(7)7747295614', '2016-01-27 15:49:19', '2018-12-09 01:17:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (26, 'Cassandra', 'Schroeder', 'fbruen@example.net', '1-393-763-3406', '2012-10-25 10:59:28', '2012-04-18 16:00:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (27, 'Chaya', 'Bogisich', 'kory.yundt@example.net', '094-079-4237x573', '2018-12-07 07:47:14', '2011-06-09 12:27:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (28, 'Quincy', 'Kuhlman', 'mfritsch@example.com', '815-314-9719', '2015-10-19 07:37:33', '2020-05-27 09:27:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (29, 'Amely', 'Roob', 'nadia43@example.org', '376.627.9422x088', '2018-03-13 07:41:55', '2016-05-27 18:21:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (30, 'Antwan', 'Borer', 'jamar.monahan@example.com', '695-422-7000', '2015-07-09 22:52:45', '2014-12-03 16:53:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (31, 'Malika', 'Boehm', 'dahlia66@example.org', '859.573.2997x216', '2014-05-10 11:13:23', '2019-02-20 12:01:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (32, 'Moriah', 'Wiegand', 'gorczany.issac@example.net', '(794)647-1034', '2012-11-25 01:50:35', '2012-07-04 01:12:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (33, 'Rodger', 'Greenholt', 'alysa70@example.com', '849.318.7016x8351', '2017-05-08 09:50:52', '2020-03-06 10:06:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (34, 'Eleazar', 'Cormier', 'lbergstrom@example.net', '(393)275-2816x5728', '2011-11-30 11:02:33', '2012-12-08 17:23:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (35, 'Raleigh', 'Hilpert', 'russel.gus@example.net', '(183)372-5940x162', '2017-02-19 19:01:40', '2012-03-10 01:41:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (36, 'Damien', 'Boehm', 'stephan23@example.com', '1-203-159-5080', '2018-08-29 21:48:45', '2013-10-02 20:16:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (37, 'Elissa', 'Jacobson', 'osvaldo.ritchie@example.org', '(248)037-9116x9257', '2020-07-18 12:00:42', '2011-12-04 20:31:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (38, 'Etha', 'Howell', 'hudson.laurie@example.net', '392.241.0664', '2015-12-02 08:18:33', '2018-06-03 06:00:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (39, 'Dedrick', 'Fritsch', 'jadyn.rohan@example.org', '976-699-6748', '2019-10-20 23:51:52', '2016-06-28 03:20:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (40, 'Mitchell', 'Gottlieb', 'wlehner@example.net', '04345995896', '2019-11-25 23:10:15', '2015-07-14 15:12:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (41, 'Elmo', 'Wolff', 'garett.quitzon@example.com', '180-107-1389x835', '2017-02-08 19:15:56', '2014-10-29 07:20:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (42, 'Sigmund', 'Skiles', 'sward@example.net', '(837)946-6316x40393', '2015-04-09 03:16:28', '2020-02-27 22:48:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (43, 'Araceli', 'Monahan', 'kuhic.adrienne@example.org', '02543886443', '2019-02-18 06:15:42', '2011-03-17 23:33:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (44, 'Javier', 'Schimmel', 'christophe22@example.com', '(927)208-2149x112', '2019-12-10 21:05:36', '2017-01-11 19:56:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (45, 'Jordon', 'King', 'deanna00@example.org', '1-117-666-3714x44442', '2020-02-27 13:20:26', '2020-07-19 04:34:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (46, 'Pedro', 'Kohler', 'cbalistreri@example.net', '166-029-7583x325', '2018-03-10 07:13:08', '2019-07-05 22:41:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (47, 'Katelyn', 'Doyle', 'rylan.heaney@example.com', '+80(8)1811969389', '2020-04-08 01:22:33', '2013-12-07 08:54:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (48, 'Louisa', 'Tremblay', 'elfrieda.weber@example.com', '322-497-3170', '2012-06-08 03:18:54', '2013-04-04 21:36:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (49, 'Sabryna', 'Herman', 'francisco55@example.com', '721-278-0659x62675', '2016-07-16 17:30:36', '2011-10-04 18:59:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (50, 'Casandra', 'Bergnaum', 'uwolf@example.net', '1-992-818-7207x49833', '2012-01-01 08:30:23', '2014-12-15 08:44:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (51, 'Darron', 'Klein', 'reichel.abigayle@example.com', '1-944-294-4444x07096', '2011-10-15 15:21:33', '2014-02-10 03:42:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (52, 'Roderick', 'Hettinger', 'deanna.romaguera@example.com', '1-517-253-7327', '2014-12-12 17:27:00', '2019-07-27 01:37:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (53, 'Gerhard', 'Bauch', 'guido.stokes@example.net', '347.076.0546', '2011-10-30 02:28:23', '2011-02-06 17:48:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (54, 'Everett', 'Mills', 'upton.shanna@example.org', '060.054.8003', '2020-06-01 09:18:08', '2015-12-05 19:52:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (55, 'Michale', 'Dickinson', 'nrodriguez@example.org', '09238174030', '2010-12-24 22:00:33', '2019-10-28 18:56:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (56, 'Linda', 'Denesik', 'felton99@example.net', '277.887.1245', '2014-02-25 07:43:00', '2017-08-22 10:06:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (57, 'Pearlie', 'Johnson', 'gleichner.colton@example.net', '+75(1)8406341874', '2015-07-11 08:40:40', '2014-07-30 06:31:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (58, 'Norval', 'Rath', 'santino66@example.com', '488.692.7263', '2012-06-22 23:11:55', '2017-01-19 20:06:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (59, 'Carmella', 'Rowe', 'weissnat.loyce@example.net', '(221)285-7240', '2013-08-28 00:22:55', '2020-08-30 13:02:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (60, 'Cornelius', 'Grant', 'emmitt56@example.org', '1-058-011-5637x348', '2017-02-06 12:32:05', '2013-04-24 06:34:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (61, 'Margarete', 'Hyatt', 'margarette.parisian@example.com', '(438)449-6638', '2019-05-13 15:46:54', '2020-02-29 06:31:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (62, 'Ben', 'Koch', 'asa.flatley@example.org', '03756262631', '2011-06-11 20:26:57', '2020-06-25 06:11:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (63, 'Nicolas', 'Maggio', 'ora.bernhard@example.com', '(523)758-7301x76011', '2011-03-18 08:58:27', '2011-04-16 22:30:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (64, 'Kole', 'Bruen', 'fpowlowski@example.org', '(893)991-0709x8004', '2015-04-09 07:26:55', '2017-02-26 14:51:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (65, 'Joyce', 'Bogan', 'ncremin@example.org', '148.226.7100', '2019-05-26 20:07:11', '2016-01-13 15:07:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (66, 'Garrick', 'Blanda', 'oran.wilderman@example.net', '1-494-538-2598x796', '2013-11-14 09:22:24', '2012-11-20 01:38:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (67, 'Lizzie', 'Olson', 'charlotte.monahan@example.org', '(481)995-7389', '2016-03-16 05:50:21', '2012-08-22 16:36:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (68, 'Armani', 'Kiehn', 'javon46@example.org', '421-876-6451x297', '2013-03-22 09:30:56', '2020-08-21 15:40:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (69, 'Miles', 'Fay', 'ricky87@example.com', '+96(4)4812420950', '2015-02-22 15:46:41', '2018-11-03 07:27:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (70, 'Myrtice', 'Bergstrom', 'ylesch@example.com', '1-656-684-1656x58120', '2010-10-04 03:23:24', '2012-07-29 21:45:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (71, 'Nelson', 'Roob', 'mschmeler@example.org', '(283)415-0719x734', '2020-04-28 17:24:32', '2015-02-24 03:02:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (72, 'Alexandrea', 'Kihn', 'kcollins@example.net', '04648134874', '2015-12-20 16:38:28', '2018-07-26 12:19:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (73, 'Orie', 'O\'Kon', 'charlie.conroy@example.net', '(922)084-0794x3181', '2012-08-29 16:20:32', '2017-06-16 08:18:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (74, 'Augusta', 'Haag', 'sarmstrong@example.net', '(966)628-8552x26472', '2017-08-13 06:06:01', '2012-12-18 15:45:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (75, 'Riley', 'Witting', 'althea.lemke@example.com', '574.977.8817x34600', '2017-12-15 22:34:18', '2017-02-14 19:26:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (76, 'Maynard', 'Roberts', 'xbahringer@example.net', '582.009.3702x28615', '2020-07-16 20:28:01', '2015-04-23 16:22:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (77, 'Thelma', 'Hilpert', 'christiansen.ashtyn@example.net', '938-878-7752', '2016-04-27 07:33:39', '2010-12-23 01:52:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (78, 'Florida', 'Boehm', 'garland.anderson@example.org', '(572)247-4272x304', '2015-03-23 17:30:11', '2014-03-23 06:21:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (79, 'Reinhold', 'Lynch', 'omari41@example.net', '459-118-1243', '2016-10-30 01:43:45', '2014-10-10 01:23:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (80, 'Gail', 'Boehm', 'madonna.boyer@example.net', '1-733-114-0724x443', '2013-04-10 19:26:42', '2014-05-27 04:40:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (81, 'Claudine', 'Koelpin', 'wmurazik@example.net', '472-194-1730x4315', '2012-10-18 20:36:06', '2011-05-01 13:24:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (82, 'Connie', 'Frami', 'troy73@example.org', '+11(8)7292982304', '2011-12-28 23:22:27', '2018-06-21 10:07:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (83, 'Aaliyah', 'Thompson', 'danial67@example.net', '843.182.1173x1918', '2011-09-08 16:13:07', '2016-08-24 12:11:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (84, 'Maya', 'Langworth', 'morar.baylee@example.com', '232-658-2382x85029', '2015-09-04 15:11:58', '2019-05-01 16:25:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (85, 'Braeden', 'Cassin', 'enos75@example.com', '(031)616-3482x0776', '2020-01-26 14:56:10', '2011-05-04 06:32:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (86, 'Cierra', 'Stracke', 'elwin95@example.org', '(249)866-9800x0416', '2019-11-18 06:50:32', '2016-11-03 22:32:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (87, 'Jovan', 'Pagac', 'hhoppe@example.org', '758-649-5254', '2012-03-15 13:01:06', '2017-10-30 17:05:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (88, 'Devyn', 'Harvey', 'orath@example.org', '(283)908-5751x45635', '2020-03-04 01:38:05', '2018-11-15 04:10:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (89, 'Consuelo', 'Sanford', 'ratke.jaida@example.net', '333-669-5912', '2014-02-10 04:13:51', '2019-12-25 03:11:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (90, 'Hanna', 'Gutmann', 'reichert.lina@example.org', '598.574.3351x9841', '2016-06-16 05:05:28', '2017-05-21 16:31:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (91, 'Caleb', 'Sanford', 'macejkovic.esteban@example.org', '884-852-5468x065', '2015-04-18 20:22:09', '2011-02-06 02:46:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (92, 'Graham', 'Feest', 'dooley.francesco@example.org', '(662)622-9139x446', '2019-04-08 21:40:19', '2017-05-01 00:13:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (93, 'Jermaine', 'Haley', 'zfranecki@example.net', '+60(9)2958559519', '2011-07-06 04:35:17', '2019-05-14 13:35:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (94, 'Terry', 'Hermann', 'leffler.katelin@example.org', '01467056680', '2010-11-19 10:08:30', '2011-05-01 12:38:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (95, 'Cassandra', 'Bauch', 'myrtle87@example.net', '407.148.8557x35946', '2011-09-02 13:10:01', '2012-05-23 05:40:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (96, 'Stefan', 'Cartwright', 'khartmann@example.net', '522-290-7009x7378', '2019-10-11 21:15:47', '2014-01-10 10:06:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (97, 'Rafaela', 'Ebert', 'lgibson@example.net', '649.593.3861x53148', '2016-09-29 19:24:41', '2014-08-24 07:33:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (98, 'Alf', 'Pouros', 'obeahan@example.org', '(793)262-3061x880', '2014-06-28 20:30:44', '2017-08-15 18:23:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (99, 'Cesar', 'Stamm', 'ereichert@example.com', '352.495.1105x337', '2011-10-14 13:44:59', '2018-05-13 13:31:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (100, 'Lewis', 'Donnelly', 'schaefer.edna@example.org', '1-195-612-6848', '2017-11-19 01:12:03', '2015-09-03 02:55:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (101, 'Harmon', 'Hartmann', 'tre.medhurst@example.org', '05910471361', '2011-03-31 12:28:17', '2017-06-21 09:30:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (102, 'Emerald', 'Johnson', 'okoelpin@example.net', '251.512.3792', '2014-03-03 02:33:03', '2018-07-20 11:38:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (103, 'Edwin', 'Beer', 'luella.bashirian@example.com', '1-153-544-4383', '2018-08-02 09:51:44', '2019-05-03 22:48:48');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (104, 'Lorena', 'Mante', 'ron.kulas@example.com', '07305273226', '2012-02-17 04:53:38', '2018-01-04 21:23:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (105, 'Rick', 'Walker', 'erin72@example.org', '06302935589', '2015-05-24 13:57:09', '2011-09-20 11:34:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (106, 'Liliana', 'Bechtelar', 'joelle.goyette@example.com', '073.318.8377x278', '2010-10-29 02:52:00', '2013-04-29 11:57:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (107, 'Aron', 'Stanton', 'benny01@example.org', '1-088-517-1476x227', '2019-10-11 13:26:44', '2010-12-13 13:58:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (108, 'Edythe', 'Jacobi', 'shawna.davis@example.net', '942-567-3679x9561', '2012-10-28 04:56:30', '2014-06-11 21:20:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (109, 'Myrtie', 'Sanford', 'uhodkiewicz@example.com', '(277)615-5425', '2016-10-04 21:31:32', '2015-04-25 12:12:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (110, 'Camylle', 'Lindgren', 'brandt.boyle@example.org', '409-087-4944x60075', '2015-08-24 02:35:51', '2017-04-07 17:40:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (111, 'Otha', 'McDermott', 'bailey.madalyn@example.com', '1-983-876-2096x648', '2016-04-01 19:55:32', '2016-10-30 23:07:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (112, 'Christa', 'Ruecker', 'xgraham@example.com', '09383035473', '2018-09-14 21:14:51', '2011-05-29 20:24:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (113, 'Myrna', 'Kiehn', 'torphy.burnice@example.net', '699.255.1307x2795', '2012-04-03 01:50:48', '2017-05-20 03:59:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (114, 'Joey', 'Hudson', 'greenholt.randal@example.net', '+20(7)0485967596', '2013-09-06 07:59:02', '2016-01-31 10:30:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (115, 'Carlee', 'Gulgowski', 'hsawayn@example.org', '633-271-0382x5024', '2011-07-12 18:09:51', '2015-04-15 17:33:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (116, 'Sylvester', 'Senger', 'flind@example.net', '1-897-551-4409x87349', '2012-01-03 13:39:38', '2014-08-25 22:50:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (117, 'Amalia', 'Howell', 'beaulah.carter@example.com', '597-095-1643x65828', '2020-03-16 05:15:25', '2017-06-22 15:26:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (118, 'Kailey', 'Hegmann', 'pacocha.laury@example.net', '779-492-2154x07679', '2011-06-27 04:50:11', '2010-11-23 03:55:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (119, 'Logan', 'Larson', 'bogisich.zachery@example.com', '(606)021-8913', '2018-02-10 11:57:23', '2013-10-28 09:56:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (120, 'Gerardo', 'Beer', 'ledner.jamison@example.org', '(387)247-8035x152', '2018-08-21 06:22:06', '2019-09-01 03:02:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (121, 'Sim', 'Fahey', 'iborer@example.com', '(147)528-3308', '2015-01-13 13:24:26', '2016-03-26 21:34:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (122, 'Briana', 'Swaniawski', 'colleen39@example.net', '09979634330', '2018-07-01 14:37:30', '2014-11-06 17:26:46');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (123, 'Susan', 'Grimes', 'justina45@example.org', '339-548-2340x0198', '2019-05-24 05:04:59', '2017-05-19 23:53:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (124, 'Lance', 'Pagac', 'abagail.witting@example.org', '(520)432-7892x2173', '2014-06-26 23:10:39', '2019-02-25 20:14:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (125, 'Karli', 'Fadel', 'iwaters@example.net', '644.982.7501x1118', '2013-03-07 14:22:05', '2016-04-09 13:29:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (126, 'Isai', 'Parisian', 'lynn.terry@example.org', '01664645302', '2018-10-12 23:02:39', '2016-07-22 23:54:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (127, 'Blake', 'Yundt', 'hackett.maryam@example.net', '+35(0)5718019595', '2015-04-20 20:37:04', '2012-02-03 21:05:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (128, 'Alfreda', 'Beier', 'emmet14@example.org', '+87(9)8748001124', '2013-01-14 01:51:09', '2015-07-22 09:20:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (129, 'Kenya', 'Hermiston', 'pollich.gilberto@example.net', '756.156.1598x78784', '2015-11-06 20:15:43', '2018-06-13 17:36:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (130, 'Rosemary', 'Kuhic', 'natalie45@example.net', '(031)644-0278', '2012-08-17 03:50:17', '2016-02-01 17:50:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (131, 'Irma', 'Treutel', 'donnelly.cristian@example.net', '(268)536-1074x74312', '2015-10-28 12:24:24', '2019-11-25 22:58:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (132, 'Destin', 'Nicolas', 'arne.murphy@example.com', '1-945-758-2951x509', '2017-06-07 09:33:06', '2019-04-06 14:22:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (133, 'Kayla', 'McClure', 'maximillian.braun@example.com', '304-261-9215x9463', '2018-05-10 18:31:40', '2012-03-06 02:52:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (134, 'Christopher', 'Heller', 'dtromp@example.net', '(906)877-0024', '2019-04-09 02:08:13', '2015-08-29 18:57:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (135, 'Karianne', 'McClure', 'mckenzie.ewald@example.org', '(049)415-1523', '2016-04-02 02:09:31', '2016-12-02 23:32:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (136, 'Adolf', 'Feest', 'dudley.davis@example.org', '1-625-068-0619x304', '2016-10-30 09:59:52', '2019-02-01 08:40:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (137, 'Kelli', 'Maggio', 'funk.vaughn@example.org', '1-387-465-3299x1750', '2018-12-23 15:57:40', '2017-03-19 03:45:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (138, 'Gerhard', 'Leuschke', 'qfarrell@example.org', '(548)049-7183', '2015-02-26 05:02:06', '2016-05-23 23:29:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (139, 'Gudrun', 'Labadie', 'fstanton@example.net', '065-087-2766x5216', '2016-12-12 17:53:56', '2018-09-03 03:29:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (140, 'Lyda', 'Terry', 'margaret52@example.net', '(185)326-9967x670', '2020-04-24 19:18:07', '2013-01-28 00:46:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (141, 'Maxime', 'Kuphal', 'zhahn@example.net', '265.600.2647x805', '2018-12-05 18:00:44', '2020-02-05 09:37:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (142, 'Orrin', 'Kohler', 'bauch.daren@example.net', '588-376-4228x18277', '2014-04-30 08:26:24', '2011-02-09 23:45:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (143, 'Berry', 'Carter', 'dibbert.dannie@example.net', '063-773-7836', '2017-05-20 20:44:19', '2019-03-10 09:29:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (144, 'Lora', 'Dare', 'darby18@example.net', '01054206752', '2014-07-27 13:43:59', '2014-11-19 20:11:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (145, 'Stanton', 'Zemlak', 'gward@example.net', '00012882311', '2016-07-11 05:36:13', '2016-02-22 14:49:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (146, 'Wilma', 'Hand', 'rath.crystel@example.net', '1-612-406-1275x409', '2016-06-26 22:25:42', '2018-11-03 04:15:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (147, 'Coty', 'Schmeler', 'erich.ziemann@example.org', '+01(8)3123550215', '2013-12-23 08:47:52', '2013-12-13 21:21:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (148, 'Garret', 'Quitzon', 'deckow.elvie@example.org', '784-739-2665x0391', '2014-12-16 13:14:44', '2019-08-30 23:32:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (149, 'Sanford', 'Smith', 'jcorwin@example.com', '647-401-1788x7281', '2013-10-30 20:22:37', '2012-08-06 13:49:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (150, 'Lucious', 'Bogan', 'amani.hyatt@example.net', '1-027-497-1972', '2013-02-27 09:49:05', '2012-04-02 11:19:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (151, 'Alanis', 'Farrell', 'reta.kshlerin@example.net', '1-696-430-5733x30462', '2020-01-20 16:57:25', '2017-08-08 12:42:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (152, 'Narciso', 'Runolfsdottir', 'aurelie05@example.net', '(339)768-6643x1589', '2016-01-31 17:37:07', '2019-11-29 20:39:46');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (153, 'Khalil', 'Sanford', 'paucek.euna@example.com', '1-227-577-8291x81409', '2015-05-12 01:31:34', '2016-12-12 20:44:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (154, 'Luna', 'Bauch', 'schmeler.blanca@example.org', '00901102939', '2018-03-12 18:45:25', '2013-08-03 13:28:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (155, 'Patricia', 'Brekke', 'joanne.christiansen@example.org', '950.987.4863x877', '2015-03-17 18:36:54', '2019-05-25 23:20:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (156, 'Anais', 'Lebsack', 'wilmer29@example.net', '1-529-704-6466', '2013-01-29 18:31:24', '2014-10-21 12:09:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (157, 'Giovanni', 'Olson', 'willow.pacocha@example.org', '(915)655-9314x608', '2020-06-16 10:27:59', '2017-07-24 15:55:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (158, 'Desiree', 'Zulauf', 'kadin15@example.net', '102.975.5035x633', '2011-04-01 05:19:01', '2014-02-24 04:27:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (159, 'Chelsie', 'Littel', 'dweber@example.net', '639.431.4837', '2012-12-07 22:14:24', '2012-12-16 16:47:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (160, 'Dawson', 'Schneider', 'kiara.little@example.org', '1-474-482-6417x7707', '2020-03-07 20:53:58', '2010-10-14 23:26:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (161, 'Alfonso', 'Tremblay', 'hyatt.lilly@example.org', '931.942.6412', '2011-04-28 07:26:04', '2019-11-23 13:55:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (162, 'Maurine', 'Beier', 'ciara.kovacek@example.net', '+48(5)2077392645', '2010-09-16 05:59:01', '2019-11-08 20:45:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (163, 'Taryn', 'Erdman', 'ppurdy@example.com', '872.428.2183x79060', '2020-04-18 19:01:40', '2012-07-02 07:35:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (164, 'Loy', 'Langosh', 'johnpaul16@example.com', '(856)079-6693x1826', '2018-01-03 06:24:18', '2016-08-15 20:44:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (165, 'Aiyana', 'Bailey', 'gutkowski.jasen@example.org', '034-554-2387', '2013-12-11 06:17:32', '2015-01-04 06:22:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (166, 'Maggie', 'Hintz', 'dcrist@example.org', '182.457.4774', '2013-09-19 23:36:28', '2017-12-31 13:55:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (167, 'Kiana', 'Marvin', 'crawford69@example.com', '065-463-9173x1054', '2020-02-02 20:12:23', '2015-11-29 02:37:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (168, 'Erna', 'Grimes', 'kenna.anderson@example.net', '006-427-1237', '2019-05-20 18:20:03', '2017-05-29 05:20:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (169, 'Sherwood', 'Walter', 'brogahn@example.net', '(554)669-5930x285', '2011-07-24 05:58:46', '2011-09-23 02:05:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (170, 'Clementine', 'Medhurst', 'lang.colton@example.net', '02637795768', '2016-07-19 03:53:11', '2018-11-21 01:50:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (171, 'Terrence', 'Stokes', 'ramiro26@example.net', '572-867-3017x500', '2011-10-26 04:03:47', '2016-07-12 18:47:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (172, 'Rubie', 'Hahn', 'winona11@example.net', '808.113.9434x1203', '2012-11-26 13:53:12', '2013-12-19 02:03:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (173, 'Lesly', 'Aufderhar', 'connie35@example.com', '(769)408-8690x36204', '2019-08-31 16:03:05', '2017-01-03 06:39:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (174, 'Misty', 'Bins', 'miller.timmy@example.org', '(095)772-6104x966', '2019-11-24 22:34:35', '2018-08-02 16:55:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (175, 'Angela', 'Bergstrom', 'brandyn.hermann@example.net', '417.383.0345x755', '2010-12-30 12:32:05', '2015-06-25 02:27:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (176, 'Roslyn', 'Wehner', 'reva19@example.net', '+54(9)2924100230', '2012-03-21 09:23:12', '2013-06-09 06:33:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (177, 'Stanford', 'Flatley', 'wilfrid89@example.org', '1-218-946-5545x945', '2011-10-31 00:41:02', '2011-04-21 20:11:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (178, 'Florida', 'Berge', 'giles40@example.org', '(132)002-6158', '2015-01-11 08:04:59', '2014-04-09 16:08:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (179, 'Roosevelt', 'Schaefer', 'marc89@example.org', '770-714-0222x40285', '2015-11-03 16:12:37', '2014-07-21 23:46:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (180, 'Johan', 'Grant', 'batz.vincenzo@example.org', '110-146-3215', '2016-07-18 19:52:10', '2018-01-14 08:51:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (181, 'Karl', 'Grant', 'robel.julie@example.net', '+82(8)1034447032', '2013-09-22 18:24:05', '2013-04-07 09:58:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (182, 'Brant', 'Predovic', 'kspinka@example.com', '1-921-851-7939x55328', '2014-03-26 06:07:16', '2019-11-30 02:16:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (183, 'Eugenia', 'Green', 'jean.macejkovic@example.org', '+32(3)9792507956', '2014-05-05 03:59:57', '2014-04-14 09:37:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (184, 'Elliot', 'Funk', 'lauriane.king@example.com', '04262323819', '2017-04-01 10:32:15', '2015-07-30 12:47:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (185, 'Ciara', 'Dickinson', 'elvis38@example.com', '1-656-816-6439x215', '2015-01-27 20:00:03', '2011-01-01 12:25:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (186, 'Lesley', 'Schiller', 'yundt.king@example.org', '+69(3)8033791005', '2013-05-08 09:51:04', '2017-11-11 02:48:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (187, 'Brenda', 'Durgan', 'grady.waters@example.net', '293-359-6671x702', '2010-09-29 20:10:54', '2011-03-02 11:14:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (188, 'Davonte', 'Parisian', 'terrill35@example.com', '430-878-9862', '2017-03-08 16:26:43', '2014-03-31 06:41:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (189, 'Baylee', 'Heaney', 'cschimmel@example.org', '408-319-1239', '2014-06-01 10:17:18', '2015-03-04 03:36:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (190, 'Darby', 'Kohler', 'amani93@example.org', '(748)750-7707x8959', '2014-07-30 04:05:34', '2010-12-12 18:43:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (191, 'Kellen', 'Cartwright', 'cebert@example.org', '845.973.2858x636', '2016-05-28 03:31:51', '2012-10-09 15:23:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (192, 'Armani', 'Bradtke', 'kshlerin.claudia@example.org', '456-990-6637', '2010-11-15 19:00:56', '2014-09-13 17:13:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (193, 'Clemens', 'Pfannerstill', 'kassulke.neha@example.net', '+22(4)5645346490', '2015-03-24 04:22:11', '2013-10-27 18:37:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (194, 'Alek', 'Dietrich', 'wyman.delpha@example.org', '1-255-984-2395x77962', '2014-03-24 02:18:24', '2010-10-20 03:01:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (195, 'Darwin', 'Price', 'darrel.reynolds@example.org', '1-467-813-9847', '2019-02-01 12:05:35', '2018-08-27 12:48:58');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (196, 'Pedro', 'Hudson', 'isabel.rolfson@example.com', '1-370-258-0423', '2014-03-26 15:13:29', '2020-02-25 16:25:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (197, 'Myrtle', 'Stanton', 'kadin.barton@example.com', '(999)374-6268x9065', '2013-01-03 12:55:45', '2012-11-30 17:39:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (198, 'Mohamed', 'Nolan', 'bo32@example.com', '03868345578', '2013-04-18 17:15:23', '2019-09-06 17:03:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (199, 'Stephen', 'Koepp', 'jakubowski.nels@example.org', '+72(8)7331408019', '2019-07-01 21:11:05', '2017-04-11 16:25:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (200, 'Fay', 'Durgan', 'effie.windler@example.org', '1-536-757-4463x34914', '2011-12-20 09:20:08', '2017-11-27 09:59:32');

DROP TABLE IF EXISTS `media_like`;

CREATE TABLE `media_like` (
  `media_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на медиафайл',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `is_like` tinyint(1) DEFAULT NULL COMMENT 'Понравилось или нет',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время первой отметки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время когда передумал',
  PRIMARY KEY (`media_id`,`user_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Лайки медиафайлов';

INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (0, 38511546, 1, '1974-04-08 13:12:19', '1981-05-27 10:25:26');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (1, 3063845, 1, '1976-04-03 10:19:34', '1984-11-20 10:50:51');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (5, 893299, 1, '2020-10-24 01:50:53', '1998-09-05 15:27:18');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7, 9332, 1, '2017-09-21 12:01:38', '2006-12-09 21:44:51');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9, 6, 0, '1982-11-20 23:31:12', '2013-12-20 20:25:10');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (11, 948175799, 0, '1996-11-20 23:38:25', '2017-01-30 08:22:23');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (32, 221399452, 0, '1976-09-20 03:14:05', '2015-04-26 09:27:33');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (39, 86, 1, '2002-10-23 21:59:23', '1991-04-24 20:56:02');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (54, 920511297, 1, '2000-02-18 09:29:58', '1980-06-04 05:41:57');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (57, 6056, 0, '1999-05-05 00:56:42', '2008-04-11 10:52:32');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (66, 600215486, 1, '1994-11-13 11:23:33', '2016-01-22 18:55:24');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (67, 12275, 1, '2010-06-17 10:39:34', '1999-11-02 05:27:20');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (68, 96, 1, '2014-06-06 01:32:31', '1995-03-15 07:53:49');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (73, 9304868, 1, '1986-01-14 10:13:11', '1996-10-20 17:48:05');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (94, 320724, 1, '1980-12-05 08:15:00', '2002-11-01 17:52:18');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (97, 23046227, 1, '1998-03-31 10:03:34', '1981-04-05 22:30:06');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (201, 7830662, 0, '1977-01-16 21:54:55', '2019-01-03 10:59:25');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (218, 81823, 1, '1981-12-21 01:38:05', '2018-01-13 14:02:39');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (220, 41491, 1, '1985-08-05 22:41:33', '1980-03-07 17:47:21');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (248, 481, 0, '1971-08-22 00:25:44', '1972-03-10 17:13:09');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (307, 3636, 1, '1987-02-25 22:59:04', '1988-01-13 09:18:15');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (355, 23740, 1, '1977-06-01 18:45:13', '2008-10-08 20:51:51');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (428, 2104831, 0, '1976-10-30 08:50:51', '1984-03-28 17:00:55');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (450, 3, 0, '1990-02-10 16:41:04', '1976-08-27 19:22:03');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (641, 1439650, 0, '1970-08-03 04:25:21', '1974-05-05 01:54:02');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2365, 91, 0, '2005-03-11 13:42:25', '2011-06-11 01:14:36');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2428, 870, 1, '1970-07-06 07:21:33', '1996-01-26 21:15:08');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3513, 2977, 0, '1995-12-26 03:44:15', '2016-07-28 01:34:46');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3891, 793, 1, '1979-06-24 05:41:57', '1996-03-13 07:10:41');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3980, 6605147, 0, '1995-09-10 18:23:59', '2010-08-14 00:18:37');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4724, 242404, 1, '1987-07-19 12:22:26', '2000-08-16 09:56:58');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4846, 390672, 0, '2009-04-18 08:09:23', '1982-05-10 06:09:22');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (5809, 2, 1, '2019-02-28 01:29:32', '1985-11-17 03:58:14');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6597, 261382, 0, '1988-02-04 20:32:18', '1983-02-19 23:38:29');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6730, 526794, 0, '1997-06-22 05:37:58', '2012-04-24 06:27:58');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6908, 73420, 0, '1991-12-07 07:22:10', '1979-12-14 06:38:49');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8111, 82015, 0, '2008-10-13 10:55:50', '2009-01-03 18:23:12');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8414, 82768, 1, '1970-07-29 21:54:31', '1980-06-01 08:22:41');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8453, 742697629, 1, '2003-11-25 12:54:21', '2008-12-08 23:53:52');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8667, 1316422, 0, '1992-08-02 10:22:14', '1977-10-29 05:48:17');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8723, 5662268, 0, '2018-11-27 16:39:05', '1982-10-29 16:38:56');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9201, 20681180, 1, '1987-09-03 13:42:01', '1992-11-01 11:13:20');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9372, 13428, 0, '1992-06-30 02:39:35', '1989-08-22 12:32:27');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9818, 30198, 1, '1984-10-19 05:54:14', '1993-09-21 08:40:11');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9938, 59489086, 1, '1973-04-13 18:52:37', '1990-10-02 03:01:46');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (14132, 56, 1, '2010-10-05 06:14:42', '2006-02-13 16:49:54');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (16480, 742279, 0, '1989-08-21 08:07:20', '1978-09-23 13:20:29');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (16818, 461, 1, '2009-02-27 18:56:56', '2019-11-15 10:08:11');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (19539, 657, 1, '2017-12-23 18:19:34', '2006-11-25 05:12:53');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (51872, 56671304, 1, '1987-12-04 23:25:52', '1978-07-17 20:38:08');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (52576, 7694, 0, '2015-06-16 05:23:06', '1982-10-20 08:04:53');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (57537, 1548808, 0, '1978-03-01 03:05:57', '2008-06-19 00:30:29');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (70958, 826136365, 1, '2021-01-13 13:26:12', '2008-12-14 01:33:18');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (73359, 6284521, 0, '1989-11-07 01:26:29', '2011-08-25 22:36:44');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (84930, 759868, 0, '1990-05-16 20:37:54', '1991-11-17 22:47:14');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (88693, 88, 0, '2013-08-02 08:47:44', '2009-06-19 09:54:50');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (94382, 74329178, 0, '1987-01-29 13:14:14', '2007-08-31 02:28:37');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (160388, 57840233, 1, '2013-05-26 11:55:05', '1993-01-02 06:37:28');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (171255, 69408, 0, '2018-10-14 14:59:54', '2011-02-14 14:07:31');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (252875, 41, 0, '2020-02-17 01:37:27', '2014-08-23 02:51:34');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (260476, 143790824, 1, '1985-07-09 09:56:42', '1970-10-07 17:57:55');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (328167, 4096055, 1, '2004-04-20 12:28:25', '1970-08-13 02:19:15');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (430360, 2511481, 0, '2009-12-29 00:13:18', '1988-04-04 08:35:06');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (453890, 13214, 1, '1970-08-29 19:49:50', '1992-10-18 05:42:44');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (513118, 201083, 0, '1977-08-04 06:41:17', '1982-04-09 06:01:02');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (689509, 5990809, 1, '2018-10-22 06:29:47', '1980-12-25 19:42:20');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (835472, 22, 0, '1973-04-21 16:15:44', '1998-07-20 09:50:11');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (854174, 339476304, 0, '1983-02-22 21:07:12', '2009-10-06 07:18:26');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (873142, 674434806, 1, '1991-03-17 23:29:27', '1986-05-23 23:03:46');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (937639, 30700612, 0, '2018-03-03 18:13:07', '2008-04-20 15:42:23');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (945029, 635, 1, '2010-05-14 17:57:21', '1987-01-10 00:29:19');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (954590, 28560262, 0, '1985-06-26 04:22:51', '2009-06-06 23:21:11');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (961983, 66441, 0, '1982-10-16 09:14:16', '2016-04-06 14:45:57');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (969082, 664, 1, '2009-03-18 21:09:11', '1981-05-06 19:57:27');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (1267990, 4, 1, '1989-07-02 20:56:43', '1994-09-16 07:02:01');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3510641, 83833, 0, '1970-12-22 21:28:24', '1992-04-21 02:17:27');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4384409, 2275, 0, '1972-01-15 13:40:24', '1992-09-11 13:35:59');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (5443785, 89560, 1, '1985-09-17 23:43:06', '2016-03-28 07:45:21');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (5831564, 85785983, 1, '2014-02-21 15:27:59', '1983-04-25 02:22:16');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6826868, 75010298, 1, '1984-08-09 17:11:31', '1981-11-25 02:14:23');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8190130, 97413, 0, '2004-03-19 18:03:16', '2005-10-11 14:21:56');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9968898, 82248637, 0, '2015-04-03 00:19:19', '1988-11-21 19:49:15');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (19936345, 981114, 0, '2003-03-05 09:55:09', '1973-09-27 09:31:15');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (27124055, 4339143, 1, '1994-06-27 04:17:44', '2017-12-13 07:07:29');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (28466669, 24523, 0, '1991-05-04 20:42:04', '1977-06-28 06:50:43');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (54178282, 883120, 1, '1990-12-29 16:42:07', '1974-08-01 12:54:01');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (62003928, 35, 0, '2018-09-21 02:49:01', '1999-07-12 12:38:40');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (63437909, 886230031, 0, '1975-08-24 21:26:40', '2001-12-19 19:25:26');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (67374816, 49913553, 0, '1985-05-28 21:20:47', '2000-12-04 11:47:49');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (81233209, 66346856, 1, '1970-05-16 11:41:57', '1984-03-25 21:59:30');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (170788597, 2069, 1, '1983-05-21 19:24:22', '1970-06-07 03:50:17');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (188727817, 3464670, 1, '1973-06-19 01:07:54', '1982-07-05 04:10:59');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (395946311, 399, 1, '2006-10-30 10:02:19', '1996-04-20 08:47:47');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (464883539, 20153, 1, '1999-05-09 15:50:48', '2018-03-06 09:08:23');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (487352657, 86929, 0, '1975-01-08 12:47:03', '2013-07-24 07:16:31');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (672096242, 458099, 0, '1982-09-19 01:51:54', '2001-01-11 00:37:28');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (703255756, 17060, 1, '2016-11-23 00:27:37', '2018-12-26 13:30:54');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (828178140, 425747, 1, '1979-10-06 17:07:05', '1971-07-14 17:18:12');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (906152734, 589, 0, '1991-06-23 23:23:19', '1993-03-04 19:43:11');
INSERT INTO `media_like` (`media_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (975760736, 283104490, 1, '1996-10-22 01:00:35', '1975-12-30 11:24:01');

DROP TABLE IF EXISTS `messages_like`;

CREATE TABLE `messages_like` (
  `messages_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пост',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `is_like` tinyint(1) DEFAULT NULL COMMENT 'Понравился или нет',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время первой отметки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время когда передумал',
  PRIMARY KEY (`messages_id`,`user_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Лайки постов';

INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (1, 514734, 1, '2007-05-06 06:52:28', '1972-12-16 21:01:16');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7, 83535883, 1, '2019-03-31 08:24:51', '2018-12-12 22:41:01');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8, 296857401, 0, '2004-07-12 05:03:40', '1998-05-30 15:43:37');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (11, 1128509, 1, '2020-01-14 23:58:25', '2015-04-29 16:07:19');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (13, 8067, 0, '1979-09-07 23:35:03', '2002-10-26 17:49:51');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (25, 5761634, 0, '1985-03-01 22:37:27', '1992-03-04 20:30:59');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (40, 39631405, 1, '1994-01-10 20:20:35', '2014-06-08 10:49:23');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (77, 601204, 0, '2003-06-18 23:59:53', '1978-07-01 12:06:07');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (81, 14, 1, '2011-10-27 08:22:20', '1991-12-22 10:52:52');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (85, 88187, 1, '1987-08-06 16:45:06', '2018-03-12 13:19:10');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (94, 3574, 1, '1973-10-06 00:00:26', '1971-08-19 11:42:58');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (193, 75913736, 0, '1996-03-31 16:07:31', '1997-05-09 01:46:40');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (310, 4496, 0, '2002-02-11 18:36:27', '2016-12-14 05:58:20');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (516, 67, 1, '1999-12-05 19:00:30', '1999-01-13 08:58:14');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (554, 961, 1, '1970-11-19 13:50:19', '1990-04-23 21:12:30');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (934, 1513, 0, '2012-10-20 00:41:48', '2019-05-30 00:46:29');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (974, 36115, 1, '1984-03-27 14:25:45', '1977-12-04 00:10:41');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (976, 585048, 0, '2009-10-05 21:42:31', '1989-06-16 00:34:02');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (1782, 89902161, 0, '2013-06-16 10:01:08', '1980-08-31 00:19:07');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3365, 84706244, 1, '2003-03-09 13:12:47', '2015-04-18 17:35:56');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4634, 2851418, 1, '1980-07-05 07:32:50', '1987-03-20 12:27:20');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7139, 209, 0, '1997-06-01 13:44:29', '2011-07-21 11:48:39');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7715, 154505850, 1, '1972-07-25 21:10:59', '1971-01-21 08:27:09');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8653, 928, 0, '1996-05-05 05:28:37', '2019-08-11 12:54:12');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (10978, 812, 1, '2020-05-13 20:29:33', '2015-07-03 13:05:55');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (21019, 5112, 0, '1997-08-10 18:31:26', '2021-04-05 05:17:23');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (22196, 1730165, 1, '2001-12-11 04:25:33', '2000-01-14 09:25:04');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (37393, 345, 1, '2007-10-24 15:33:44', '2011-01-24 15:00:10');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (37666, 686257, 1, '2008-07-09 20:06:38', '1985-04-10 21:26:41');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (43158, 9826, 1, '1995-11-10 16:51:56', '1975-03-05 19:58:21');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (43322, 359390, 1, '1981-10-23 10:18:15', '2016-02-24 21:02:53');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (46181, 871085469, 1, '1990-01-03 23:05:05', '1991-05-26 14:33:10');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (50581, 611, 0, '1972-07-02 05:12:16', '1976-04-25 04:46:14');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (55442, 62760702, 1, '1991-05-06 07:06:45', '2016-10-20 16:59:25');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (59809, 9267, 0, '2008-04-06 22:58:34', '2003-11-12 12:57:42');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (64344, 2159478, 1, '1993-04-29 22:00:49', '2016-05-15 15:59:13');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (68270, 53448269, 1, '1973-04-22 04:56:03', '2018-09-27 07:57:11');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (86489, 258371, 1, '1974-08-10 18:24:43', '1975-12-11 04:36:51');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (127862, 469867819, 1, '1976-03-16 14:18:57', '2015-08-05 09:25:29');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (181129, 469, 1, '1995-08-13 18:16:13', '1998-12-19 05:31:15');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (327139, 624292, 0, '1972-03-02 14:33:31', '1997-02-01 02:35:09');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (381957, 8602268, 1, '1993-12-27 17:16:51', '1975-01-27 21:46:51');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (393214, 39876, 0, '1974-03-16 04:17:15', '2008-08-09 05:10:51');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (509024, 9, 0, '2002-04-03 11:41:54', '2009-11-09 06:43:21');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (539661, 66833897, 0, '2002-06-30 00:05:10', '2013-10-15 07:55:33');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (573144, 87364301, 1, '2005-04-18 06:33:40', '1996-07-28 22:59:24');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (612585, 579, 0, '2014-08-26 08:11:30', '1996-11-05 15:32:01');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (635912, 446, 1, '2000-07-05 19:21:35', '1997-04-14 11:40:31');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (777932, 83, 1, '2009-03-07 19:48:29', '2001-02-01 10:09:52');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (858450, 78193, 1, '1994-07-07 09:57:11', '1989-05-30 23:16:17');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (895794, 374446078, 0, '1986-11-05 17:44:05', '1996-06-07 18:05:07');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (964187, 153, 0, '2015-10-14 06:21:23', '1970-03-20 08:24:09');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (973598, 23, 1, '1976-09-07 13:44:48', '1996-12-23 19:16:48');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (1225824, 2064943, 1, '1979-12-30 10:42:13', '1981-05-22 18:22:37');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2476570, 940894486, 1, '2003-06-09 03:47:11', '2018-09-13 00:35:23');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3116340, 453316436, 0, '2006-01-06 08:42:59', '1973-08-03 20:46:38');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3582064, 874, 0, '2014-03-25 05:24:11', '2021-05-11 03:00:36');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4116444, 39, 0, '1985-07-11 03:35:20', '2003-02-03 14:12:20');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4490710, 71, 1, '2016-09-13 16:58:36', '1974-07-21 22:19:44');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4521781, 849848, 0, '2002-06-01 09:55:52', '2013-05-22 21:11:24');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4571209, 98335795, 1, '1989-06-28 04:21:22', '1995-05-29 05:53:47');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4706892, 437, 1, '2013-11-25 06:24:04', '1992-09-27 09:00:10');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (5111902, 5, 1, '2021-02-10 16:02:50', '1994-05-28 14:22:26');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (5322995, 830, 0, '1997-02-18 11:37:49', '2002-08-30 07:25:56');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6035977, 338032033, 0, '1984-07-26 11:23:14', '2021-04-03 22:41:41');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6331468, 26, 1, '2015-04-15 06:32:24', '1990-08-07 06:34:43');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6935389, 36373, 0, '1970-04-29 21:48:42', '1997-02-05 08:48:04');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7866333, 147056976, 1, '1980-02-10 15:36:10', '2009-08-12 00:42:55');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (10085547, 1002, 1, '1982-03-24 02:15:41', '2002-03-19 02:31:39');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (15642505, 418446, 0, '1975-12-24 16:39:34', '1985-04-14 18:54:48');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (16233365, 914972743, 1, '1990-02-02 14:06:03', '1981-05-27 05:25:49');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (23062628, 556522064, 1, '1994-11-02 19:02:01', '1978-04-01 14:44:34');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (34196091, 0, 1, '1983-10-11 22:18:47', '1979-10-14 03:18:18');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (38369603, 1086, 1, '1995-02-27 17:44:40', '2011-08-15 11:06:34');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (40122944, 30276042, 1, '1995-07-27 09:35:14', '1974-03-31 02:35:23');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (43021018, 2, 1, '1973-06-27 04:03:33', '2005-03-16 14:40:45');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (64240254, 6, 1, '2010-12-08 09:57:27', '1990-03-16 23:22:31');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (64930313, 216732, 0, '2001-05-05 17:32:57', '1989-09-02 18:15:49');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (68752330, 627471, 0, '2011-09-28 02:21:39', '2010-02-03 22:21:03');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (69514337, 3, 1, '1988-01-13 14:41:42', '1995-04-08 11:15:32');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (79851374, 76, 1, '1999-07-30 19:20:01', '1973-07-14 11:17:32');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (84962269, 58, 1, '2002-01-03 18:55:10', '1999-03-07 12:15:12');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (90647996, 973289746, 1, '1982-05-27 23:52:39', '2015-01-05 13:34:29');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (93162863, 72, 1, '1991-04-20 11:40:33', '2003-02-14 04:43:58');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (130788232, 4, 0, '1977-10-26 21:23:05', '2004-04-28 10:32:07');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (163851909, 754113921, 0, '1994-01-19 19:29:23', '2007-10-14 00:04:36');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (211588682, 591, 0, '2006-01-24 08:12:01', '2008-06-25 00:12:15');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (243584419, 481958567, 1, '2008-11-02 21:21:14', '1986-01-09 06:01:54');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (320291946, 146560085, 0, '1981-08-08 04:46:14', '1988-07-08 15:15:53');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (326274979, 36, 1, '2020-10-16 00:07:56', '2007-10-10 17:11:25');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (345187456, 57, 0, '1981-06-26 19:37:01', '1990-04-24 02:20:46');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (367512180, 726, 1, '1973-03-19 22:56:51', '2018-06-08 23:53:34');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (374396699, 323983, 1, '1982-10-17 15:16:22', '1979-06-06 15:10:05');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (402476735, 9346, 0, '1999-03-11 21:56:37', '1970-12-26 01:26:52');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (459837296, 585, 0, '1992-03-03 10:57:31', '2020-06-01 23:41:07');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (700069029, 28631, 0, '1970-11-08 08:10:57', '1984-03-17 08:51:33');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (819321220, 870076, 1, '1989-01-20 06:55:19', '1989-05-29 16:15:44');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (829287325, 87586501, 0, '2007-04-28 07:51:31', '2020-03-29 04:14:03');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (861123204, 281371348, 1, '1973-07-18 16:01:58', '1972-12-28 22:11:27');
INSERT INTO `messages_like` (`messages_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (946381653, 50609, 1, '1983-12-17 15:58:25', '2020-03-09 06:07:04');


#
# TABLE STRUCTURE FOR: user_like
#

DROP TABLE IF EXISTS `user_like`;

CREATE TABLE `user_like` (
  `user_like_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на юзера',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `is_like` tinyint(1) DEFAULT NULL COMMENT 'Понравился или нет',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время первой отметки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время когда передумал',
  PRIMARY KEY (`user_like_id`,`user_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Лайки пользователя';

INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (5, 48819, 0, '1986-07-24 13:34:44', '1991-04-10 00:38:17');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6, 49, 0, '2007-08-08 00:10:49', '1997-01-10 11:02:22');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9, 0, 1, '1984-02-07 18:03:36', '1991-08-30 04:59:11');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (10, 196, 0, '1995-07-24 12:50:17', '1997-10-03 07:45:23');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (17, 8, 1, '1991-11-28 11:43:49', '1999-02-19 18:25:53');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (29, 3483, 1, '1978-01-03 06:23:54', '1998-06-04 14:08:17');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (39, 14258601, 1, '2014-11-13 02:09:32', '2015-10-14 02:54:42');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (53, 628772, 0, '1980-02-24 04:36:49', '1987-08-06 18:51:46');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (56, 407650462, 0, '1982-08-31 23:42:57', '1994-12-01 06:31:34');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (78, 349816211, 1, '2012-04-16 21:22:32', '1990-07-22 14:51:36');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (89, 289187, 1, '1975-04-13 13:18:49', '1998-01-19 13:11:31');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (135, 7, 1, '1981-09-06 08:56:23', '1972-10-25 18:50:58');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (139, 636, 1, '1973-01-02 10:12:48', '2003-07-05 16:43:39');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (200, 547793356, 0, '1981-06-20 00:34:44', '1970-08-17 16:57:42');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (278, 28795111, 1, '2007-01-07 10:27:21', '2015-07-13 22:11:40');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (489, 46857064, 0, '2016-09-24 15:15:57', '1991-02-09 14:57:16');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (508, 86297560, 1, '2017-01-17 19:07:59', '2013-10-16 16:45:21');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (582, 39199070, 0, '1985-02-11 15:30:25', '1983-08-29 12:36:12');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (594, 624, 1, '2012-02-17 12:42:36', '2000-05-25 21:43:27');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (635, 89881213, 0, '1991-04-02 17:20:13', '2006-08-30 18:52:54');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (648, 376315, 0, '1982-07-20 21:12:44', '1973-12-04 12:58:13');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (847, 8198838, 0, '2012-08-25 06:56:06', '1970-10-13 17:11:56');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (926, 8044022, 0, '1996-10-04 15:31:46', '2012-07-07 01:45:26');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (1311, 78230, 1, '1983-05-23 12:05:34', '1974-04-12 23:38:52');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2102, 3554, 1, '2008-09-30 23:51:20', '1972-05-25 13:22:19');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2386, 4029, 1, '1991-05-16 11:47:17', '1985-05-04 16:02:27');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2620, 425060, 0, '1974-03-13 04:23:04', '1976-02-15 17:07:06');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2884, 82028, 0, '2004-07-31 21:35:50', '2019-03-16 18:26:48');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2892, 5031, 0, '2017-08-25 05:57:43', '2019-12-03 19:47:05');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3204, 379, 0, '1994-02-06 23:51:37', '2017-01-29 09:47:25');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (3825, 7559017, 0, '2019-03-23 16:43:53', '1971-12-18 07:56:35');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4148, 1671, 0, '1984-07-05 07:52:17', '2002-12-02 04:25:00');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4551, 1, 1, '1979-01-10 17:57:48', '2001-08-06 06:14:03');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7028, 805, 1, '2005-10-02 05:24:09', '1979-04-21 15:34:44');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7952, 3, 1, '2003-04-02 11:42:57', '1995-09-09 16:02:43');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (39768, 792893554, 0, '1977-05-21 15:14:45', '1973-05-19 03:24:17');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (46111, 960, 0, '1999-01-28 14:11:23', '2010-11-22 12:46:37');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (46919, 9098918, 1, '1976-10-28 03:32:05', '1989-04-02 06:32:15');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (51292, 667, 1, '2002-03-30 23:56:28', '2006-12-30 09:41:26');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (72700, 997109309, 1, '1978-04-23 14:13:16', '1975-12-26 20:02:29');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (81015, 64, 0, '1987-07-24 20:48:46', '1971-06-07 08:59:31');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (91599, 516, 0, '1980-10-22 02:43:35', '1981-03-27 09:43:27');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (92275, 8581, 1, '1983-03-31 11:23:39', '2006-04-09 08:58:28');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (99799, 4743962, 1, '2008-12-22 23:27:55', '2020-12-24 22:48:31');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (156664, 20629597, 1, '1993-02-28 03:01:51', '2004-10-13 08:32:24');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (178310, 701, 1, '2007-03-31 09:48:55', '2011-06-20 14:14:13');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (237306, 88403809, 1, '1993-05-09 06:22:02', '2018-02-17 07:26:53');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (296640, 864129, 0, '2018-05-25 05:37:41', '1999-10-11 22:57:29');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (340867, 98208781, 1, '2013-04-23 16:26:27', '1988-01-23 21:42:15');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (409393, 742820703, 1, '2017-08-17 16:51:06', '1990-03-18 10:09:35');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (487600, 52689078, 0, '2000-04-16 13:32:31', '1988-04-01 03:42:08');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (678710, 59630970, 1, '2021-03-27 18:45:57', '2005-07-15 06:11:49');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (753412, 989848, 1, '1998-01-23 06:15:25', '2009-08-08 00:43:53');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (870968, 80196, 1, '2009-05-07 04:02:07', '1980-12-07 18:34:51');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (974073, 1670686, 1, '1979-02-05 15:25:50', '1987-08-19 22:52:56');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (991943, 29064119, 0, '1988-04-19 18:43:07', '2004-02-09 21:07:34');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (1375179, 977, 1, '1972-01-31 18:58:55', '2001-05-30 14:50:43');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (1772465, 3850, 1, '1990-09-23 10:44:54', '1972-09-02 00:30:44');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2547921, 5330, 1, '1970-10-11 23:42:39', '1985-02-19 13:45:47');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2601215, 609, 0, '2007-04-28 06:09:19', '2018-01-14 23:16:54');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (2981890, 18, 1, '1999-09-11 01:47:15', '1980-10-05 01:10:51');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4001955, 62, 0, '2020-03-31 05:31:40', '1998-03-25 20:27:28');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (4150151, 20512, 1, '1984-09-17 11:38:41', '1996-05-20 06:11:35');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (5551507, 9738, 1, '2019-09-13 00:36:17', '1996-04-16 09:59:03');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (6454758, 596572388, 0, '2015-03-20 13:28:50', '1980-08-03 14:21:11');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7169849, 7443, 0, '1986-04-14 23:05:20', '1992-04-17 17:23:21');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (7946207, 904440, 0, '1979-05-20 15:52:11', '2017-04-08 19:41:10');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (8268224, 52865977, 1, '2017-11-17 22:03:38', '1976-06-03 19:10:19');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9399283, 3840, 1, '2001-10-27 11:35:09', '2006-06-10 17:17:44');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9408007, 645863586, 1, '2003-02-13 03:55:46', '1990-11-11 16:16:59');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (9968581, 755963, 1, '1970-03-02 09:58:32', '2009-06-06 09:55:50');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (11723367, 1309939, 1, '1996-05-02 02:20:15', '2019-09-26 02:23:42');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (20699956, 917831, 0, '1970-07-04 16:39:32', '1974-08-22 10:26:02');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (25100421, 4121436, 1, '1985-06-08 20:16:56', '1994-08-03 17:06:50');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (30977173, 1247366, 0, '1998-11-05 04:49:05', '2005-10-15 05:03:44');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (33005214, 117024, 1, '2006-06-08 14:19:06', '2000-03-02 17:25:30');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (38124365, 863, 0, '2009-08-19 11:38:59', '1999-08-19 23:34:51');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (45607120, 201728067, 1, '1976-08-10 14:36:48', '1985-02-26 12:58:45');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (59247727, 73579, 0, '1982-10-27 18:02:25', '1970-05-11 17:30:54');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (67134975, 4, 1, '2016-03-01 14:21:52', '1997-05-01 03:37:00');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (74315724, 506, 0, '2017-12-06 16:28:08', '2014-02-27 05:07:13');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (75945774, 610884865, 1, '2017-10-28 23:13:10', '1980-12-12 23:47:23');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (79011263, 8900, 1, '1986-09-23 06:37:30', '2013-09-17 06:45:00');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (92521799, 744780, 1, '1978-01-20 02:08:01', '1992-07-30 16:46:32');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (99528492, 2, 0, '2001-07-23 00:45:07', '1974-08-31 11:38:49');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (188670225, 22, 1, '2010-01-25 00:43:09', '1996-01-04 14:33:59');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (206000319, 548118923, 0, '1999-04-20 19:27:07', '2001-02-07 15:24:23');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (301072641, 61939, 0, '1981-03-23 11:23:10', '1997-05-13 02:26:40');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (350798705, 256473, 0, '1984-04-02 04:09:13', '1986-08-20 09:17:36');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (360203565, 13655625, 1, '1978-08-12 18:17:10', '2019-06-08 23:28:59');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (438151557, 334630, 1, '2008-08-24 18:40:22', '2005-08-26 07:22:47');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (453962817, 98, 1, '1982-03-01 22:26:54', '2013-03-04 08:17:35');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (503536196, 419557390, 1, '1990-08-05 02:06:48', '1986-12-03 21:03:06');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (504665594, 33, 0, '1995-10-14 01:17:00', '2014-04-23 17:48:53');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (545405175, 61654, 0, '2008-07-22 14:55:01', '1976-11-29 15:35:34');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (604006736, 81, 0, '1983-01-04 08:03:04', '2015-12-17 10:42:38');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (611102181, 2875, 1, '2000-09-04 05:30:54', '1973-02-21 19:21:56');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (642109452, 846579709, 1, '2010-01-26 04:43:33', '1984-03-13 20:10:28');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (793660537, 71, 1, '1996-01-09 02:16:19', '2015-03-14 12:10:56');
INSERT INTO `user_like` (`user_like_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES (929518161, 57, 0, '2013-03-31 06:43:40', '2012-08-20 22:43:53');

