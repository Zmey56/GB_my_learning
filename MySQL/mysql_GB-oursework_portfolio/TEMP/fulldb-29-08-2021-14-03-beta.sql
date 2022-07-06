-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
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
INSERT INTO `country` VALUES (1,'Saint Martin'),(2,'Cambodia'),(3,'United Kingdom'),(4,'Saint Pierre and Miquelon'),(5,'Andorra'),(6,'Saint Helena'),(7,'Austria'),(8,'Hong Kong'),(9,'Chad'),(10,'Namibia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_currencies`
--

DROP TABLE IF EXISTS `currency_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код используемый для уникального обозначения валюты',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальное название этой валюты',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Если валюта в настоящее время активна в нашей системе',
  `is_base_currency` tinyint(1) DEFAULT 0 COMMENT 'Если эта валюта является базовой валютой нашей системы.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Курс валюты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_currencies`
--

LOCK TABLES `currency_currencies` WRITE;
/*!40000 ALTER TABLE `currency_currencies` DISABLE KEYS */;
INSERT INTO `currency_currencies` VALUES (1,'swtb','velit',0,1),(2,'dfvz','sint',1,1),(3,'wttl','quisquam',1,1),(4,'jtnx','aut',1,0),(5,'zaye','nisi',0,1),(6,'vakq','voluptate',0,0),(7,'pduq','delectus',0,0),(8,'qqtt','neque',1,0),(9,'karm','est',1,1),(10,'wkym','doloremque',1,1);
/*!40000 ALTER TABLE `currency_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_items`
--

DROP TABLE IF EXISTS `currency_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код используемый для уникального обозначения товара(акции, ПИФы и т.д.)',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Полное имя',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Доступен ли этот товар для торговли или нет',
  `is_base_currency` tinyint(1) DEFAULT 0 COMMENT 'Торгуется ли товар в основной валюте',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Связь товара и валюты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_items`
--

LOCK TABLES `currency_items` WRITE;
/*!40000 ALTER TABLE `currency_items` DISABLE KEYS */;
INSERT INTO `currency_items` VALUES (1,'equg','rerum',1,0),(2,'gwak','quidem',1,0),(3,'beep','nihil',0,1),(4,'nbpz','quis',0,1),(5,'zbnm','sapiente',1,1),(6,'qdvo','dolores',1,0),(7,'goqi','voluptas',0,0),(8,'ibkh','at',1,0),(9,'jlrw','sequi',1,0),(10,'qndy','veritatis',1,1);
/*!40000 ALTER TABLE `currency_items` ENABLE KEYS */;
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
INSERT INTO `currency_rate` VALUES (1,1,2,183.969416,'2007-06-17 20:36:13'),(2,2,7,63.994048,'1972-12-14 16:34:07'),(3,3,4,586.458081,'1982-12-16 16:47:31'),(4,4,1,230731402.000000,'1971-08-01 07:49:03'),(5,5,1,900741983.230000,'1981-03-12 09:04:49'),(6,6,9,625929.100700,'1997-09-11 02:05:36'),(7,7,1,4870388.289090,'2007-01-23 23:45:26'),(8,8,4,39109.700000,'2009-06-13 03:51:26'),(9,9,7,42.691000,'1985-01-24 08:20:01'),(10,10,6,385.793910,'1991-08-02 21:28:51');
/*!40000 ALTER TABLE `currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_traders`
--

DROP TABLE IF EXISTS `currency_traders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_traders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код используемый для уникального обозначения товара(акции, ПИФы и т.д.)',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Полное имя',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Доступен ли этот товар для торговли или нет',
  `is_base_currency` tinyint(1) DEFAULT 0 COMMENT 'Торгуется ли в базовой валюте',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_traders`
--

LOCK TABLES `currency_traders` WRITE;
/*!40000 ALTER TABLE `currency_traders` DISABLE KEYS */;
INSERT INTO `currency_traders` VALUES (1,'bruq','similique',1,1),(2,'ygdl','dicta',1,1),(3,'xyrg','qui',1,0),(4,'cfmf','perspiciatis',0,1),(5,'hhnb','ut',0,1),(6,'upqj','maxime',1,0),(7,'mnjv','atque',1,0),(8,'eaiz','non',0,1),(9,'hdom','et',0,1),(10,'catx','officiis',0,1);
/*!40000 ALTER TABLE `currency_traders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_used`
--

DROP TABLE IF EXISTS `currency_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_used` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned DEFAULT NULL COMMENT 'Ключ на другую таблицу',
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
INSERT INTO `currency_used` VALUES (1,1,1,'2018-05-26 00:16:24','1981-01-02 20:52:23'),(2,2,2,'1985-12-09 03:41:30','1988-10-01 09:43:55'),(3,3,3,'1973-06-25 07:17:07','1976-08-30 21:13:34'),(4,4,4,'2008-04-16 12:49:07','1995-06-23 19:15:36'),(5,5,5,'1995-11-30 20:27:15','2017-05-17 15:40:06'),(6,6,6,'2005-09-06 05:05:22','2011-11-09 08:08:03'),(7,7,7,'1985-09-16 05:27:36','1975-11-01 23:23:48'),(8,8,8,'1971-01-22 19:14:05','1982-03-19 08:06:57'),(9,9,9,'1997-12-23 14:41:58','1970-03-24 00:25:54'),(10,10,10,'2000-08-15 09:13:48','1992-02-02 02:16:56');
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
  `trader_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на трейдера',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на товар',
  `quantity` decimal(16,6) DEFAULT NULL COMMENT 'Количество товаров',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Список товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_inventory`
--

LOCK TABLES `current_inventory` WRITE;
/*!40000 ALTER TABLE `current_inventory` DISABLE KEYS */;
INSERT INTO `current_inventory` VALUES (1,1,1,31.000000),(2,2,2,66006856.000000),(3,3,3,530118.000000),(4,4,4,873.000000),(5,5,5,0.000000),(6,6,6,418268.000000),(7,7,7,393.000000),(8,8,8,51.000000),(9,9,9,21223273.000000),(10,10,10,18713.000000);
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
INSERT INTO `item` VALUES (1,'zghn','est',1,1,'Repellendus aut facere repellendus minima laborum. Rerum excepturi molestias non aut a voluptatem consequatur. Dicta perferendis ipsum numquam possimus.'),(2,'rzwr','veritatis',1,2,'Quas culpa quia ab et eos aperiam provident. Explicabo enim voluptate veniam qui earum fugit ducimus. Dolore recusandae ut consequatur. Et iusto ea nisi dolorem repellat quisquam.'),(3,'lgtg','amet',0,3,'Commodi voluptatibus velit quia ad et ea asperiores. Qui ea provident vero est odio minus ipsa voluptas. Atque eum quis odio ut quod est. Perferendis voluptatem praesentium nesciunt ut ipsa ex cum.'),(4,'vddj','ab',1,4,'Libero sequi esse suscipit quibusdam qui. Quia in quos impedit. Sed magni qui nam sunt molestias ipsum et. Voluptatum quis recusandae necessitatibus explicabo ipsam ut quia.'),(5,'vgut','quisquam',1,5,'Sed perspiciatis natus omnis ipsam doloribus est. Harum rem provident qui officia voluptatem placeat voluptatibus nam. Velit ea maiores reprehenderit voluptates.'),(6,'vyjr','ea',0,6,'Velit ea harum omnis ut. Molestias soluta dolorum tempore voluptates esse dolor. Porro repudiandae officiis aut ipsum inventore quo quia quasi.'),(7,'lbyi','nostrum',1,7,'Illo necessitatibus voluptatem sed enim ut quaerat. Laboriosam repellendus laudantium ut. Ut quis sint voluptatem sequi dolor delectus.'),(8,'yinz','perferendis',0,8,'Et recusandae repudiandae dolores aliquid maiores. Exercitationem quia ullam natus et voluptatum. Repellat quidem quidem vero qui atque exercitationem.'),(9,'aohk','quos',0,9,'Et possimus voluptatem culpa voluptatem accusamus soluta voluptatem. Aut et ut non nisi sit voluptatibus voluptas. Dolor repellat eligendi id.'),(10,'vnvh','doloremque',0,10,'Ipsam natus totam cupiditate. Earum hic rerum esse sequi. Praesentium aliquam non ut adipisci nobis perferendis iure.');
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
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на товар',
  `trader_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на трейдера',
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
INSERT INTO `offer` VALUES (1,1,1,5652722.838819,0,1,37173.632174,'2014-04-25 23:28:08',1),(2,2,2,16.515555,1,1,0.040000,'1975-07-26 02:20:31',1),(3,3,3,162210.804794,0,0,467611.424061,'2015-05-25 18:10:12',1),(4,4,4,567.870600,1,0,296.503000,'1987-04-14 08:03:38',0),(5,5,5,5.000000,1,0,161408808.551000,'1996-10-02 05:55:48',1),(6,6,6,1.910000,1,0,3459546.000000,'2012-07-02 12:53:58',0),(7,7,7,3866753.000000,0,1,3414.335650,'1971-06-03 09:57:18',1),(8,8,8,5060.536264,1,0,33511.948430,'2006-07-28 20:01:28',0),(9,9,9,64.528294,1,1,5.243000,'1975-05-16 15:36:08',0),(10,10,10,11198053.960000,1,1,5197478.546860,'1985-10-23 11:25:01',1);
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
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
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
INSERT INTO `price` VALUES (1,1,1,5598.072230,10.624324,'1976-05-22 22:31:40'),(2,2,2,769.900000,0.000000,'2004-05-05 02:07:09'),(3,3,3,21756845.270000,55.633146,'1990-06-12 20:59:53'),(4,4,4,43197.888900,10386183.000000,'1996-06-28 01:41:17'),(5,5,5,17.222100,2402229.494000,'1971-11-15 02:12:05'),(6,6,6,1.111500,1810.000000,'1992-06-09 17:27:38'),(7,7,7,303586219.662500,3270094.307618,'1971-11-18 14:55:48'),(8,8,8,1777874.743600,0.000000,'2019-07-16 22:55:11'),(9,9,9,0.000000,2.000000,'2010-12-26 21:37:34'),(10,10,10,2229.791973,1287747.030769,'1981-07-02 11:42:17');
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
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
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
INSERT INTO `report` VALUES (1,'1970-07-16 01:36:59',1,1,905473.260000,6360618.615700,8404082.120000,25457.000000,2998916.748000,28.000000,6.380000),(2,'2014-06-19 17:50:27',2,2,2.000000,3919134.611227,866.439880,7761851.000000,33.353600,38.584480,168957652.300000),(3,'1993-04-12 20:51:23',3,3,146490.993079,0.000000,289415.740000,52274.000000,2.327154,1.824111,350.000000),(4,'2013-12-30 23:31:23',4,4,151118838.440000,54225.300000,0.000000,408262.000000,0.000000,68.700000,899917.165910),(5,'2013-05-02 18:25:55',5,5,15.000000,28155.981370,0.000000,97.000000,12082.077022,0.000000,0.000000),(6,'2002-06-08 14:58:24',6,6,220.561630,6344.065183,14059940.926870,0.000000,127.283940,373.469102,0.000000),(7,'2004-07-12 09:15:23',7,7,57308380.943370,2.300000,3908125.130000,0.000000,0.000000,10749007.250133,520973.213077),(8,'1976-10-30 22:50:49',8,8,137.104758,16469083.300000,133.769581,58815.000000,2325455.765091,381515.890790,7.060000),(9,'1989-12-06 00:03:56',9,9,258.309590,656797652.075230,5671.091400,8.000000,2283.910000,599.315000,20222236.252667),(10,'1989-12-12 03:22:41',10,10,4102.962970,0.000000,1447.797000,47360.000000,475.406100,6968.045880,1.854960);
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
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на товар',
  `seller_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на трейдера',
  `buyer_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на трейдера',
  `quantity` decimal(16,6) DEFAULT NULL COMMENT 'Количество товаров',
  `unit_price` decimal(16,6) DEFAULT NULL COMMENT 'Цена за единицу',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Все дополнительные сведения (например, количество выпущенных акций) в текстовом формате.',
  `offer_id` int(10) unsigned DEFAULT NULL COMMENT 'Индификатор сделки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сделки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES (1,1,1,1,29511984.796622,0.000000,'Temporibus est deserunt id id quia odio nostrum. Et voluptas in optio cupiditate nam iusto. Accusantium aut dolores quas omnis minima ea sunt.',1),(2,2,2,2,118505.486949,272129.640000,'Voluptatem earum libero animi cum assumenda. Facilis dolorum sequi et omnis. Vero quos sunt similique iure voluptatibus minus neque. Qui qui et non est eaque dolor.',2),(3,3,3,3,226115953.524000,148000944.007200,'Dignissimos omnis qui eum qui eum consequatur. Enim sint distinctio voluptatem quos voluptates. Laborum nihil soluta recusandae ea sit voluptas laborum. Perferendis deserunt dolor earum numquam exercitationem.',3),(4,4,4,4,336963.533130,24953.000000,'Non vel sint deserunt assumenda similique magnam et. Praesentium debitis corrupti culpa et voluptate amet qui. Dignissimos impedit ipsa sed omnis quis dolorum totam.',4),(5,5,5,5,6324153.225000,582279.813296,'Laborum tempore explicabo qui distinctio sit. Est molestias eveniet molestiae inventore. Sequi eos dicta ut minima est quasi.',5),(6,6,6,6,123719022.719500,0.000000,'Enim corrupti aut corrupti dolor quia. Sit voluptatum ipsam velit voluptates natus dolorem id. Veritatis hic incidunt provident pariatur dignissimos. Est dicta et temporibus earum earum laborum.',6),(7,7,7,7,0.000000,1.000000,'Atque porro molestiae est eveniet eveniet. Similique aut delectus labore quam optio commodi labore fugit. Quo est ea velit aliquid quod omnis. Aut sed ut magni est qui quo minima quo.',7),(8,8,8,8,23002302.906611,55973.190640,'Enim sint voluptas rerum id. Dolorem quaerat vero facilis aperiam est nostrum doloremque. Aut neque maxime ratione corporis laboriosam consequatur a. Aut nihil quisquam aspernatur aspernatur.',8),(9,9,9,9,11964905.318000,5515805.678757,'Doloribus velit repudiandae ea. Quia libero doloremque sunt. Quia qui ad qui et eos. Repellendus libero sint earum sed culpa molestias porro aut.',9),(10,10,10,10,2.090000,0.000000,'Nulla voluptatibus recusandae commodi in. Vitae nobis aspernatur perferendis et. Sequi aspernatur ea occaecati aut. Totam earum dolorem et facere vel.',10);
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
  `country_id` int(10) unsigned DEFAULT NULL COMMENT 'Страна, в которой живет.',
  `preffered_currency_id` int(10) unsigned DEFAULT NULL COMMENT 'Валюта, которую трейдер предпочитает',
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
INSERT INTO `trader` VALUES (1,'Dax','O\'Connell','deckow.samson','tstrosin@example.com','rgyt','2020-01-20 08:45:59','2021-08-06 10:38:02',1,6),(2,'Dorcas','Welch','coy42','hschaefer@example.org','awqk','1982-05-02 11:10:27','2004-06-07 17:45:09',2,2),(3,'Linwood','Heidenreich','keegan07','demetris.ruecker@example.org','hfms','1971-04-01 06:16:53','1985-11-12 02:16:24',3,1),(4,'Rubye','Franecki','cassie20','hilpert.maximus@example.org','dkqr','2019-03-08 05:32:02','1999-09-06 14:39:00',4,8),(5,'Karson','Abernathy','qledner','hailey30@example.org','lpav','2020-04-03 05:28:41','1986-08-17 08:03:34',5,3),(6,'Kasey','Weber','callie.kautzer','delmer47@example.net','gjxi','2016-02-01 16:55:32','1975-03-29 15:37:45',6,5),(7,'Marion','Borer','hrobel','fgusikowski@example.org','mnfh','2003-01-04 05:41:34','1990-04-26 17:41:17',7,7),(8,'Danial','Schiller','kirlin.enos','kuhn.rosina@example.org','omoc','2000-03-21 11:59:29','1993-04-23 09:52:31',8,3),(9,'Kira','Hane','rosenbaum.icie','toney.hyatt@example.net','iygk','2010-11-11 13:07:58','1980-03-24 04:31:54',9,5),(10,'Elenora','Nikolaus','daniel.carter','djohns@example.org','ztxs','1992-09-05 16:30:57','1990-07-22 06:10:57',10,2);
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

-- Dump completed on 2021-08-29 14:03:11
