-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: basicjsp
-- ------------------------------------------------------
-- Server version	5.5.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(20) NOT NULL,
  `app_dev_id` varchar(20) NOT NULL,
  `app_price` int(11) NOT NULL,
  `app_iconURL` varchar(200) DEFAULT NULL,
  `app_descURL` varchar(200) DEFAULT NULL,
  `app_dlURL` varchar(200) DEFAULT NULL,
  `app_rel_date` date NOT NULL,
  `app_update` date NOT NULL,
  `app_ver` varchar(20) NOT NULL,
  `app_dlcount` int(11) NOT NULL,
  `app_category` varchar(20) NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,'Simple ImageEditor','jobs@apple.com',1000,'appicon_1000213.png','잡스.html','잡스.html','2024-02-01','2024-02-13','1.01',4,'100'),(2,'잡스의작품2','jobs@apple.com',2000,'appicon_102413.png','잡스.html','잡스.html','2023-06-04','2024-02-07','1.01',0,'200'),(3,'잡스의작품3','jobs@apple.com',3000,'appicon_200101.png','잡스.html','잡스.html','2024-01-29','2024-02-07','1.01',2,'300'),(5,'잡스의추억1','jobs@apple.com',1500,'logo.png','잡스.html','잡스.html','2024-01-29','2024-02-07','1.01',0,'100'),(6,'잡스의추억2','jobs@apple.com',2000,'appicon_1024131.png','잡스.html','잡스.html','2024-02-07','2024-02-08','1.01',2,'200'),(7,'잡스의추억3','jobs@apple.com',1500,'appicon_unknown.png','잡스.html','잡스.html','2024-02-05','2024-02-06','1.01',0,'300'),(9,'빌의추억1','bill@ms.com',1000,'appicon_3141591.png','빌.html','빌.html','2024-01-30','2024-02-07','1.01',3,'100'),(10,'빌의추억2','bill@ms.com',2300,'appicon_1000214.png','빌.html','빌.html','2024-01-28','2024-02-08','1.01',1,'100'),(11,'빌의추억3','bill@ms.com',4000,'appicon_1024132.png','빌.html','빌.html','2024-01-28','2024-02-01','1.01',0,'300'),(13,'빌의추억4','bill@ms.com',4000,'appicon_1000212.png','빌.html','빌.html','2024-02-06','2024-02-08','1.01',1,'400'),(14,'빌의추억5','bill@ms.com',3000,'appicon_3141594.png','빌.html','빌.html','2024-02-06','2024-02-17','1.01',1,'400'),(15,'잡스의기억10','jobs@apple.com',3000,'appicon_1024133.png','잡스.html','잡스.html','2024-02-07','2024-02-20','1.01',0,'100'),(16,'잡스의기억11','jobs@apple.com',3000,'appicon_unknown1.png','잡스.html','잡스.html','2024-01-30','2024-02-14','1.01',0,'100'),(17,'p','me',1000,'제목 없음 (3).png','11','11','2024-02-16','2024-02-08','1',1,'200'),(18,'잡스의 요리 가이드','jobs@apple.com',3000,'appicon_1024134.png','잡스.html','잡스.html','2024-02-07','2024-02-20','1.2.1',0,'400');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 12:51:13
