-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'enim'),(2,'illum'),(3,'et'),(4,'pariatur'),(5,'nulla');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `desription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'sed','Ut laborum natus blanditiis maxime numquam inventore.',0.10,1,'1974-05-06 17:07:21','1971-04-26 11:40:56'),(2,'est','Saepe numquam dolore in est sed amet.',8536244.89,2,'1991-12-24 09:28:56','1990-11-05 10:17:06'),(3,'asperiores','Voluptatem autem voluptatem consectetur amet id quia est.',0.00,3,'2009-01-17 23:05:10','1980-05-08 15:12:36'),(4,'debitis','At ea saepe optio voluptate voluptas.',737665.08,4,'1981-04-09 07:33:02','2014-03-06 13:34:25'),(5,'pariatur','Ea non repudiandae et quo eum eum.',2525.22,5,'1985-05-14 09:26:26','2007-02-13 22:27:56'),(6,'earum','Voluptates similique repellat fugiat quas et deleniti consequatur.',747.70,1,'1972-12-01 20:51:19','1982-12-13 15:13:39'),(7,'eos','Velit voluptatem quasi animi iure et voluptatem non.',147180.60,2,'1998-11-18 16:28:34','2003-10-28 04:28:20'),(8,'voluptates','Nobis hic quam et aliquid distinctio deleniti nihil.',24.00,3,'2006-12-15 06:14:31','1998-11-19 17:23:52'),(9,'est','Nulla eveniet cumque qui dolore quis aliquid.',8240377.00,4,'1982-02-06 05:31:15','2010-06-05 01:19:20'),(10,'cumque','Perferendis perspiciatis reiciendis dolores est nam iusto consequatur.',384267856.75,5,'1981-07-31 23:11:40','1989-04-13 14:01:29'),(11,'a','Recusandae ut excepturi enim occaecati.',0.00,1,'1997-05-12 06:06:35','2012-10-31 12:01:13'),(12,'dolores','Qui eum atque nihil quia ut velit sapiente magnam.',161.93,2,'2000-11-02 02:27:50','1991-01-17 22:45:57'),(13,'sit','Vel sit libero ut dolorum nemo harum.',0.00,3,'2007-12-06 09:37:23','2015-11-06 13:28:32'),(14,'maxime','Voluptatem pariatur voluptas ducimus ipsum nihil qui et.',0.00,4,'1985-06-13 07:33:42','2012-05-22 19:59:49'),(15,'adipisci','At rerum recusandae quis illum provident pariatur consectetur eum.',3039.00,5,'1984-09-08 00:24:30','1999-04-10 22:34:41'),(16,'id','Similique veritatis nulla porro fugit possimus.',129826626.70,1,'1989-11-29 14:16:53','1998-08-27 10:34:14'),(17,'esse','Error quo veniam asperiores laborum.',11518817.29,2,'2005-01-23 01:17:49','1971-02-21 06:55:18'),(18,'id','Est porro praesentium blanditiis ut.',231435.32,3,'2016-04-19 08:59:01','2019-07-01 10:32:29'),(19,'aspernatur','Reiciendis beatae quidem sed quis voluptas nihil.',9171.71,4,'1985-01-02 07:19:23','1988-08-26 03:11:26'),(20,'minima','Quo voluptate quia rerum qui.',231.36,5,'1971-06-16 18:59:12','2017-06-07 03:32:59'),(21,'quia','Qui porro ipsa culpa qui dolor voluptates dignissimos.',0.00,1,'1983-05-11 00:58:52','1981-12-10 23:47:49'),(22,'ea','Ea deserunt rerum exercitationem at praesentium omnis.',703172618.28,2,'1987-01-15 14:08:37','1998-11-16 12:56:59'),(23,'eius','Aut incidunt rerum quas perspiciatis.',27624.00,3,'2011-06-19 15:28:10','2006-06-02 17:59:49'),(24,'et','Consequatur ipsam accusantium aliquam voluptatem.',146926818.00,4,'1980-09-29 16:26:43','1980-03-24 05:00:33'),(25,'repellat','Facere quidem officia debitis.',586964179.00,5,'1996-08-10 11:09:24','1995-06-09 05:43:59'),(26,'earum','Impedit saepe ut qui optio non.',0.00,1,'2013-04-16 00:15:40','2004-07-12 06:20:10'),(27,'minima','Tenetur et officiis aliquam deserunt autem.',115439559.27,2,'1994-07-15 03:38:45','1976-01-17 04:29:58'),(28,'voluptates','Laudantium accusamus sit magni vel alias et voluptas.',422341415.38,3,'2002-11-25 22:53:56','1971-11-25 20:31:26'),(29,'animi','Aut distinctio ea placeat fugiat.',0.00,4,'1994-06-15 18:02:13','2011-09-23 10:00:00'),(30,'reiciendis','Dolores saepe molestiae voluptas ipsa magni cupiditate omnis.',730.58,5,'2008-04-23 16:03:46','2007-06-15 20:19:44');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-12  5:41:56
