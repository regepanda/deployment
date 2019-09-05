-- MySQL dump 10.13  Distrib 5.5.48, for Linux (x86_64)
--
-- Host: localhost    Database: tff
-- ------------------------------------------------------
-- Server version	5.5.48-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `deploy_record`
--

DROP TABLE IF EXISTS `deploy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_record` (
  `deploy_record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project` varchar(500) NOT NULL,
  `env` varchar(50) DEFAULT NULL,
  `repositories` text NOT NULL,
  `deploy_message` text,
  `is_successful` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`deploy_record_id`),
  KEY `fk_deploy_record_user` (`user_id`),
  CONSTRAINT `fk_deploy_record_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deploy_record`
--

LOCK TABLES `deploy_record` WRITE;
/*!40000 ALTER TABLE `deploy_record` DISABLE KEYS */;
INSERT INTO `deploy_record` VALUES (1,'Public-own-email','development','{\"yiimodel\":{\"revision\":\"edcb9e5\",\"branch\":\"develop\",\"message\":\"commit\\n\"}}','',1,'2017-09-25 09:38:38','2017-09-25 09:38:49',10263),(2,'Public-own-email','development','{\"yiimodel\":{\"revision\":\"2fae6b8\",\"branch\":\"master\",\"message\":\"init\\n\"}}','',1,'2017-09-25 09:39:57','2017-09-25 09:40:08',10263),(3,'Public-own-email','development','{\"yiimodel\":{\"revision\":\"8413b6a\",\"branch\":\"develop\",\"message\":\"commit 5.1\\n\"}}','',1,'2017-09-25 09:40:25','2017-09-25 09:40:36',10263),(4,'Public-own-email','development','{\"yiimodel\":{\"revision\":\"f284f91\",\"branch\":\"develop\",\"message\":\"commit\\n\"}}','',1,'2017-09-26 01:19:16','2017-09-26 01:19:30',10263),(5,'Public-own-email','development','{\"yiimodel\":{\"revision\":\"edcb9e5\",\"branch\":\"develop\",\"message\":\"commit\\n\"}}','',1,'2017-09-26 01:40:38','2017-09-26 01:40:53',10263),(6,'Public-own-email','development','{\"yiimodel\":{\"revision\":\"8413b6a\",\"branch\":\"develop\",\"message\":\"commit 5.1\\n\"}}','',1,'2017-09-26 02:11:45','2017-09-26 02:11:52',10263);
/*!40000 ALTER TABLE `deploy_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL COMMENT 'This must be the hashed password, not a plain text one',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `display_name` varchar(90) NOT NULL COMMENT 'Name used for emails and other public facing features',
  `email` varchar(255) NOT NULL,
  `email_notification` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL,
  `parent_user_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username_index` (`username`),
  UNIQUE KEY `user_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10263,'test@toursforfun.com','0e27ea019866dfbf53124befd43ca23ba4','Tester','Toursforfun','Tester','test@toursforfun.com',0,1,NULL,'2012-10-17 00:15:18','2017-03-29 09:48:45');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  KEY `fk_user_group_user` (`user_id`),
  KEY `fk_user_group_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (10263,1);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-26 10:37:33
