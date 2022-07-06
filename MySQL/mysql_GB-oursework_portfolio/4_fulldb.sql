CREATE DATABASE coursework_portfolio;

-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_20
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `country`
--
USE coursework_portfolio;

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Страна из которой осуществляется торговля';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Bermuda'),(2,'Christmas Island'),(3,'Holy See (Vatican City State)'),(4,'Macedonia'),(5,'Qatar'),(6,'Tokelau'),(7,'Romania'),(8,'Central African Republic'),(9,'Uganda'),(10,'Saint Pierre and Miquelon');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код используемый для уникального обозначения валюты',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальное название этой валюты',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Если валюта в настоящее время активна в нашей системе',
  `is_base_currency` tinyint(1) DEFAULT 0 COMMENT 'Если эта валюта является базовой валютой нашей системы.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Курс валюты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (0,'htxs','eaque',0,0),(1,'nnlp','soluta',1,0),(2,'dtlh','quis',0,0),(3,'wimu','animi',0,0),(4,'lnag','earum',0,0),(5,'ekbd','molestiae',1,0),(6,'nivw','nam',1,0),(7,'zldi','consequuntur',1,1),(8,'zyrs','qui',1,1),(9,'uvfn','blanditiis',1,1);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_rate`
--

DROP TABLE IF EXISTS `currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned DEFAULT NULL COMMENT 'Ключ на другую таблицу',
  `base_currency_id` int(10) unsigned DEFAULT NULL COMMENT 'Ключ на другую таблицу',
  `rate` decimal(16,6) NOT NULL DEFAULT 0.000000 COMMENT 'Курс валюты',
  `ts` datetime DEFAULT current_timestamp() COMMENT 'Время в которое данный курс был зафиксирован',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Курс валюты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rate`
--

LOCK TABLES `currency_rate` WRITE;
/*!40000 ALTER TABLE `currency_rate` DISABLE KEYS */;
INSERT INTO `currency_rate` VALUES (1,0,0,248964.149700,'1992-06-09 14:41:36'),(2,1,1,390368.888800,'2017-09-18 05:43:25'),(3,2,2,0.000000,'2001-11-16 22:01:24'),(4,3,3,50.506542,'1979-06-15 23:49:48'),(5,4,4,81.498779,'1984-06-23 02:36:52'),(6,5,5,584941.290982,'1970-04-04 16:47:28'),(7,6,6,6265204.580000,'1979-09-29 09:25:05'),(8,7,7,16.154948,'2010-12-21 00:43:41'),(9,8,8,8.630000,'1986-04-16 05:48:55'),(10,9,9,2.800000,'1984-10-06 10:07:42');
/*!40000 ALTER TABLE `currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_used`
--

DROP TABLE IF EXISTS `currency_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_used` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL COMMENT 'Ключ на другую таблицу',
  `currency_id` int(10) unsigned DEFAULT NULL COMMENT 'Ключ на другую таблицу',
  `data_from` datetime DEFAULT current_timestamp() COMMENT 'Дата начала использования валюты',
  `data_to` datetime DEFAULT current_timestamp() COMMENT 'Дата окончания использования валюты. Если NULL, то валюта до сих пор используется',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Валюта использованная для покупки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_used`
--

LOCK TABLES `currency_used` WRITE;
/*!40000 ALTER TABLE `currency_used` DISABLE KEYS */;
INSERT INTO `currency_used` VALUES (1,1,0,'1972-07-14 21:53:10','1989-06-25 02:18:23'),(2,2,1,'1970-03-19 12:37:26','2018-12-11 16:34:23'),(3,3,2,'1989-06-15 13:50:05','1985-06-10 17:07:32'),(4,4,3,'2008-09-26 16:36:58','1992-01-21 09:35:20'),(5,5,4,'1984-09-02 16:32:24','2019-07-25 03:33:31'),(6,6,5,'2018-10-02 04:32:51','1973-08-23 18:43:00'),(7,7,6,'2004-07-04 22:17:20','1990-11-19 16:48:34'),(8,8,7,'2007-06-25 10:34:33','1997-09-16 08:51:40'),(9,9,8,'1977-10-01 11:13:18','1985-03-05 19:28:04'),(10,10,9,'1987-03-28 10:28:24','2003-02-05 18:20:56');
/*!40000 ALTER TABLE `currency_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_inventory`
--

DROP TABLE IF EXISTS `current_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `current_inventory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trader_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на трейдера',
  `item_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на товар',
  `quantity` decimal(16,6) DEFAULT NULL COMMENT 'Количество товаров',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Список товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_inventory`
--

LOCK TABLES `current_inventory` WRITE;
/*!40000 ALTER TABLE `current_inventory` DISABLE KEYS */;
INSERT INTO `current_inventory` VALUES (1,1,1,8421.000000),(2,2,2,969106.000000),(3,3,3,9235206.000000),(4,4,4,92961.000000),(5,5,5,145700.000000),(6,6,6,0.000000),(7,7,7,19133.000000),(8,8,8,0.000000),(9,9,9,26582.000000),(10,10,10,78483052.000000);
/*!40000 ALTER TABLE `current_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код используемый для уникального обозначения товара(акции, ПИФы и т.д.)',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Полное имя',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Доступен ли этот товар для торговли или нет',
  `currency_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Все дополнительные сведения (например, количество выпущенных акций) в текстовом формате.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Доступные товары';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'kzgb','doloremque',1,0,NULL),(2,'krcn','omnis',1,1,NULL),(3,'ywfp','rerum',0,2,NULL),(4,'bbjq','eaque',0,3,NULL),(5,'hsib','quis',1,4,NULL),(6,'dnuf','quia',1,5,NULL),(7,'wnfb','numquam',0,6,NULL),(8,'pefi','quos',0,7,NULL),(9,'vbrv','expedita',1,8,NULL),(10,'afem','esse',0,9,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на товар',
  `trader_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на трейдера',
  `quantity` decimal(16,6) DEFAULT NULL COMMENT 'Количество товаров',
  `buy` tinyint(1) DEFAULT 0,
  `sell` tinyint(1) DEFAULT 0,
  `price` decimal(16,6) DEFAULT NULL COMMENT 'Желаемая цена за единицу',
  `ts` datetime DEFAULT current_timestamp() COMMENT 'Когда была выставлена',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Действует ли еще это предложение',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сделки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (1,1,1,4492564.690000,0,0,3560.226016,'1978-04-16 05:11:17',0),(2,2,2,88065.115876,0,1,25673.801940,'2012-01-27 00:48:33',0),(3,3,3,57342.670793,1,1,5968955.094700,'1994-04-03 09:01:57',0),(4,4,4,0.841573,0,1,43.341753,'2016-01-27 13:50:13',1),(5,5,5,21273859.908703,0,1,1003.024800,'1976-04-11 21:39:31',0),(6,6,6,330151.950000,0,0,0.908693,'2005-12-14 22:57:53',1),(7,7,7,270663059.774970,1,0,105.000000,'1988-11-26 14:32:08',0),(8,8,8,242300815.081650,1,1,418.591556,'2009-01-04 11:59:22',0),(9,9,9,43.108410,1,0,175276231.966730,'1980-11-30 22:09:40',1),(10,10,10,35074063.000000,0,0,3151.711086,'2007-11-07 11:28:43',1);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
  `currency_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
  `buy` decimal(16,6) NOT NULL DEFAULT 0.000000 COMMENT 'Курс покупки',
  `sell` decimal(16,6) NOT NULL DEFAULT 0.000000 COMMENT 'Курс продажи',
  `ts` datetime DEFAULT current_timestamp() COMMENT 'Время в которое сделка по последней цене была зафиксирована',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Изменение цены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,1,0,833143.663441,7083.640000,'1974-02-28 12:14:53'),(2,2,1,506349.000000,13.956034,'1989-08-25 08:13:42'),(3,3,2,0.000000,3.100000,'1977-01-24 01:27:13'),(4,4,3,30754203.895000,22564.976107,'2005-03-20 21:58:47'),(5,5,4,607602067.694800,692.700000,'1995-05-31 22:30:59'),(6,6,5,55.747000,131.327840,'2011-06-04 13:19:14'),(7,7,6,4047695.239467,9294.278000,'1991-08-02 18:28:19'),(8,8,7,2053.700000,42688565.419750,'1995-09-23 02:06:23'),(9,9,8,29.743971,5.057628,'2002-05-03 05:17:56'),(10,10,9,56795556.100000,3272.168110,'1994-03-20 04:59:16');
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trading_data` datetime DEFAULT current_timestamp() COMMENT 'Дата отчета',
  `item_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
  `currency_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
  `first_price` decimal(16,6) DEFAULT NULL COMMENT 'Начальная цена',
  `last_price` decimal(16,6) DEFAULT NULL COMMENT 'Последняя цена',
  `min_price` decimal(16,6) DEFAULT NULL COMMENT 'Минимальная цена',
  `max_price` decimal(16,6) DEFAULT NULL COMMENT 'Максимальная цена',
  `avg_price` decimal(16,6) DEFAULT NULL COMMENT 'Средняя цена',
  `total_amount` decimal(16,6) DEFAULT NULL COMMENT 'Общая сумма, уплаченная за этот товар в течение отчетного периода.',
  `quantity` decimal(16,6) DEFAULT NULL COMMENT 'Количество товаров, проданных в течение данного отчетного периода.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Отчет';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'2008-09-12 05:40:01',1,0,0.000000,0.000000,11284.100000,0.000000,2113910.285725,33.000000,0.000000),(2,'2005-08-05 11:49:42',2,1,7.124000,17.382430,2.353250,2569858.500000,15130.120000,0.000000,0.000000),(3,'1985-04-14 09:07:10',3,2,43490527.885671,1452.364336,26509.073543,135.213446,341326328.324550,33705.000000,45819518.090000),(4,'2018-02-14 00:52:19',4,3,649342.981000,3.424990,991.284828,4063.439875,1324038.780000,9267588.571890,133722.790635),(5,'2003-12-24 09:46:13',5,4,2413.800000,3.000000,170787253.391930,221895.722237,2782544.825000,196.304264,85386572.462400),(6,'2014-11-14 05:28:06',6,5,4.320848,0.000000,120899.185986,351820.630000,44.353438,0.000000,2229.320343),(7,'2000-11-12 21:49:52',7,6,69682369.400000,211162.000000,119454.460000,37212568.372855,2133133.264035,153722219.685720,5557523.960000),(8,'2021-07-08 17:06:56',8,7,341.300000,1861.743223,1.337996,49.590397,8522.873563,2269.709000,16999.627000),(9,'2003-12-11 22:56:40',9,8,20354369.167190,3144.140230,0.800314,305.165000,1.136590,215.070000,0.000000),(10,'1999-04-10 21:50:09',10,9,4736112.251411,1569.689600,52377.000310,492851.324047,0.000000,33864985.940000,68705694.321598);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на товар',
  `seller_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на трейдера',
  `buyer_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на трейдера',
  `quantity` decimal(16,6) DEFAULT NULL COMMENT 'Количество товаров',
  `unit_price` decimal(16,6) DEFAULT NULL COMMENT 'Цена за единицу',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Все дополнительные сведения (например, количество выпущенных акций) в текстовом формате.',
  `offer_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Индификатор сделки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сделки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES (1,1,1,1,2.460000,58902033.493045,'Dolores officiis quas necessitatibus qui amet. Id error atque laborum ea maiores rerum voluptatem eum. Et tempora pariatur quaerat laborum. Placeat ipsa tenetur maiores architecto.',1),(2,2,2,2,28389.028300,64.144119,'Dolorem perspiciatis consequatur eaque est corporis adipisci. Quae numquam quo provident alias natus eligendi. Voluptas ratione velit eveniet aperiam.',2),(3,3,3,3,267929.007257,3002.000000,'Distinctio facere ullam nostrum commodi. Mollitia ea quo aut labore eaque. Aliquam dolores porro ut magni vitae dolore a nostrum.',3),(4,4,4,4,9942452.040000,572582523.427500,'Cumque fugit similique culpa et ad. Temporibus dolores ut sint ipsum voluptas a et. Dolore et totam tempora dolorem ea. Unde dolore velit perspiciatis exercitationem.',4),(5,5,5,5,679040271.000000,73901.498440,'Totam quisquam unde possimus voluptatibus quos praesentium provident. Et magnam aspernatur aut cupiditate eaque et non. Minima ex ut unde ut magni.',5),(6,6,6,6,11415.933040,34761.863528,'Necessitatibus laudantium fugit porro. A et reprehenderit iusto ut deleniti ut. Et inventore aut culpa quibusdam eveniet aut nulla.',6),(7,7,7,7,4.820000,77.000000,'Corporis provident natus neque et. Libero nostrum aut minima impedit. Libero quos et beatae eos. Facere et officia quis et quia.',7),(8,8,8,8,667543.999204,422918.783910,'Autem rerum est nostrum placeat nulla. Velit cumque eius a enim. Dolor harum dignissimos sunt ea. Consectetur rerum eius ratione rerum nisi ipsam perspiciatis.',8),(9,9,9,9,280068485.000000,0.000000,'Voluptatem veritatis consectetur libero autem reiciendis. Animi qui aut animi sed perspiciatis. Reprehenderit officia iure occaecati molestiae ipsam ipsa. Quo qui laudantium provident veniam aut.',9),(10,10,10,10,0.000000,107806.940000,'Ipsa ut veniam deserunt quis. Ipsam labore aspernatur cupiditate et molestiae. Animi voluptatem vel reprehenderit tempora. At doloribus facere voluptatem dignissimos dolorem.',10);
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trader`
--

DROP TABLE IF EXISTS `trader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trader` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя',
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Логин у всех уникальный',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код, отправленный пользователю для завершения процесса регистрации.',
  `time_registered` datetime DEFAULT current_timestamp(),
  `time_confirmed` datetime DEFAULT current_timestamp(),
  `country_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Страна, в которой живет.',
  `preffered_currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Валюта, которую трейдер предпочитает',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trader`
--

LOCK TABLES `trader` WRITE;
/*!40000 ALTER TABLE `trader` DISABLE KEYS */;
INSERT INTO `trader` VALUES (1,'Gideon','Hettinger','nweissnat','hilda.schulist@example.com','sdaj','1994-07-02 14:22:41','1973-09-17 17:51:44',1,0),(2,'Antwon','Rogahn','eva.stoltenberg','grussel@example.org','cddo','1979-12-08 07:45:35','1990-02-28 17:41:55',2,1),(3,'Letitia','Cremin','bergnaum.tyra','berniece.feeney@example.com','jrip','2005-05-27 20:49:06','1990-05-07 05:33:38',3,2),(4,'Braulio','Hessel','andreanne97','margarita71@example.net','zqnt','2006-01-12 00:24:22','2021-04-16 22:24:14',4,3),(5,'Clementine','Zboncak','orion53','sawayn.keara@example.net','tkwo','2004-09-08 13:05:57','2009-04-21 11:36:19',5,4),(6,'Alvis','Gutkowski','ikovacek','ikovacek@example.net','supc','2009-10-11 20:46:23','2003-04-14 08:48:12',6,5),(7,'Raphael','Sanford','mcdermott.providenci','leonie94@example.org','ibjn','1975-03-27 19:01:54','2000-12-20 15:01:59',7,6),(8,'Ruthie','Dietrich','lyost','powlowski.hillary@example.org','mdzm','2005-02-19 04:07:58','1993-08-30 12:18:06',8,7),(9,'Keagan','Gutmann','kpredovic','kody.gibson@example.com','ejxu','2001-09-05 00:29:11','2016-07-10 15:52:51',9,8),(10,'Marianne','Ziemann','jace.kunde','qbergnaum@example.com','qozb','1991-04-13 01:13:57','1987-11-14 13:35:07',10,9);
/*!40000 ALTER TABLE `trader` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-02 19:36:59

UPDATE trader SET country_id = (FLOOR(1 + RAND() * 3));
UPDATE offer SET item_id = (FLOOR(1 + RAND() * 3));
UPDATE offer SET trader_id = (FLOOR(1 + RAND() * 3));
UPDATE offer SET price = (FLOOR(1 + RAND() * 100000));
UPDATE offer SET buy = 0 WHERE sell = 1;
UPDATE offer SET buy = 1 WHERE sell = 0;
UPDATE trade SET seller_id = (FLOOR(1 + RAND() * 3));
UPDATE trade SET buyer_id = (FLOOR(1 + RAND() * 3));
UPDATE trade SET buyer_id = (FLOOR(1 + RAND() * 3)) WHERE buyer_id = seller_id ;
UPDATE trade SET quantity = (FLOOR(1 + RAND() * 1000000));
UPDATE trade SET unit_price = (FLOOR(1 + RAND() * 1000));
UPDATE trade SET item_id = (FLOOR(1 + RAND() * 3));
UPDATE trade SET offer_id = (FLOOR(1 + RAND() * 3));
UPDATE report SET currency_id = (FLOOR(1 + RAND() * 3));
UPDATE trader SET birthday = CURRENT_DATE() - INTERVAL (FLOOR(20 + RAND() * 60)) YEAR;



















