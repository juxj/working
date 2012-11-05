-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fund
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) DEFAULT NULL,
  `short_name` varchar(64) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `issued_date` varchar(24) DEFAULT NULL,
  `catelog_name` varchar(16) DEFAULT NULL,
  `manager` varchar(128) DEFAULT NULL,
  `administrator` varchar(128) DEFAULT NULL,
  `custodian` varchar(128) DEFAULT NULL,
  `investment_goal` text,
  `investment_vision` text,
  `investment_scale` text,
  `investment_strategy` text,
  `characteristics` varchar(128) DEFAULT NULL,
  `benchmark` text,
  `operation_mode` varchar(128) DEFAULT NULL,
  `fund_company_id` int(11) DEFAULT NULL,
  `fund_company_name` varchar(128) DEFAULT NULL,
  `catelog_id` varchar(36) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund`
--

LOCK TABLES `fund` WRITE;
/*!40000 ALTER TABLE `fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_announcement`
--

DROP TABLE IF EXISTS `fund_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_announcement` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `issued_date` datetime DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_announcement`
--

LOCK TABLES `fund_announcement` WRITE;
/*!40000 ALTER TABLE `fund_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_catelog`
--

DROP TABLE IF EXISTS `fund_catelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_catelog`
--

LOCK TABLES `fund_catelog` WRITE;
/*!40000 ALTER TABLE `fund_catelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_catelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_catelog_value`
--

DROP TABLE IF EXISTS `fund_catelog_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_catelog_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `comments` varchar(256) DEFAULT NULL,
  `fund_catelog_id` int(11) DEFAULT NULL,
  `fund_catelog_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_catelog_value`
--

LOCK TABLES `fund_catelog_value` WRITE;
/*!40000 ALTER TABLE `fund_catelog_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_catelog_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_charge`
--

DROP TABLE IF EXISTS `fund_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_charge` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `buy` text,
  `application` text,
  `redemption` text,
  `management` text,
  `extra` text,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_charge`
--

LOCK TABLES `fund_charge` WRITE;
/*!40000 ALTER TABLE `fund_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_company`
--

DROP TABLE IF EXISTS `fund_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(64) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `web_site` varchar(128) DEFAULT NULL,
  `config_file` varchar(64) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_company`
--

LOCK TABLES `fund_company` WRITE;
/*!40000 ALTER TABLE `fund_company` DISABLE KEYS */;
INSERT INTO `fund_company` VALUES (1,'华夏','华夏基金管理有限公司',NULL,'001.ini','0','2012-11-01 10:59:18'),(2,'嘉实','嘉实基金管理有限公司',NULL,'002.ini','0','2012-11-01 10:59:18'),(3,'南方','南方基金管理有限公司',NULL,'003.ini','0','2012-11-01 10:59:18'),(4,'易方达','易方达基金管理有限公司',NULL,'004.ini','0','2012-11-01 10:59:18'),(5,'博时','博时基金管理有限公司','www.bosera.com','005.ini','0','2012-11-01 10:59:18'),(6,'广发','广发基金管理有限公司',NULL,'006.ini','0','2012-11-01 10:59:18'),(7,'银华','银华基金管理有限公司',NULL,'007.ini','0','2012-11-01 10:59:18'),(8,'工银瑞信','工银瑞信基金管理有限公司','www.ubssdic.com','008.ini','1','2012-11-01 10:59:18'),(9,'富国','富国基金管理有限公司',NULL,'009.ini','0','2012-11-01 10:59:18'),(10,'华安','华安基金管理有限公司','www.huaan.com.cn','010.ini','0','2012-11-01 10:59:18'),(11,'大成','大成基金管理有限公司',NULL,'011.ini','0','2012-11-01 10:59:18'),(12,'汇添富','汇添富基金管理有限公司','www.htffund.com','012.ini','0','2012-11-01 10:59:18'),(13,'招商','招商基金管理有限公司','www.cmfchina.com','013.ini','0','2012-11-01 10:59:18'),(14,'中银','中银基金管理有限公司',NULL,'014.ini','0','2012-11-01 10:59:18'),(15,'建信','建信基金管理有限公司',NULL,'015.ini','0','2012-11-01 10:59:18'),(16,'鹏华','鹏华基金管理有限公司',NULL,'016.ini','0','2012-11-01 10:59:18'),(17,'上投摩根','上投摩根基金管理有限公司','www.51fund.com','017.ini','0','2012-11-01 10:59:18'),(18,'诺安','诺安基金管理有限公司',NULL,'018.ini','0','2012-11-01 10:59:18'),(19,'交银施罗德','交银施罗德基金管理有限公司',NULL,'019.ini','0','2012-11-01 10:59:18'),(20,'融通','融通基金管理有限公司',NULL,'020.ini','0','2012-11-01 10:59:18'),(21,'长盛','长盛基金管理有限公司',NULL,'021.ini','0','2012-11-01 10:59:18'),(22,'国泰','国泰基金管理有限公司',NULL,'022.ini','0','2012-11-01 10:59:18'),(23,'景顺长城','景顺长城基金管理有限公司',NULL,'023.ini','0','2012-11-01 10:59:18'),(24,'国投瑞银','国投瑞银基金管理有限公司',NULL,'024.ini','0','2012-11-01 10:59:18'),(25,'华宝兴业','华宝兴业基金管理有限公司',NULL,'025.ini','0','2012-11-01 10:59:18'),(26,'华泰柏瑞','华泰柏瑞基金管理有限公司',NULL,'026.ini','0','2012-11-01 10:59:18'),(27,'兴业全球','兴业全球基金管理有限公司',NULL,'027.ini','0','2012-11-01 10:59:18'),(28,'长城','长城基金管理有限公司',NULL,'028.ini','0','2012-11-01 10:59:18'),(29,'光大保德信','光大保德信基金管理有限公司',NULL,'029.ini','0','2012-11-01 10:59:18'),(30,'万家','万家基金管理有限公司',NULL,'030.ini','0','2012-11-01 10:59:18'),(31,'海富通','海富通基金管理有限公司',NULL,'031.ini','0','2012-11-01 10:59:18'),(32,'泰达宏利','泰达宏利基金管理有限公司',NULL,'032.ini','0','2012-11-01 10:59:18'),(33,'华商','华商基金管理有限公司',NULL,'033.ini','0','2012-11-01 10:59:18'),(34,'申万菱信','申万菱信基金管理有限公司',NULL,'034.ini','0','2012-11-01 10:59:18'),(35,'国联安','国联安基金管理有限公司',NULL,'035.ini','0','2012-11-01 10:59:18'),(36,'中邮创业','中邮创业基金管理有限公司',NULL,'036.ini','0','2012-11-01 10:59:18'),(37,'长信','长信基金管理有限公司',NULL,'037.ini','0','2012-11-01 10:59:18'),(38,'信诚','信诚基金管理有限公司',NULL,'038.ini','0','2012-11-01 10:59:18'),(39,'天弘','天弘基金管理有限公司',NULL,'039.ini','0','2012-11-01 10:59:18'),(40,'银河','银河基金管理有限公司',NULL,'040.ini','0','2012-11-01 10:59:18'),(41,'国海富兰克林','国海富兰克林基金管理有限公司',NULL,'041.ini','0','2012-11-01 10:59:18'),(42,'农银汇理','农银汇理基金管理有限公司',NULL,'042.ini','0','2012-11-01 10:59:18'),(43,'摩根士丹利华鑫','摩根士丹利华鑫基金管理有限公司',NULL,'043.ini','0','2012-11-01 10:59:18'),(44,'中海','中海基金管理有限公司',NULL,'044.ini','0','2012-11-01 10:59:18'),(45,'东吴','东吴基金管理有限公司',NULL,'045.ini','0','2012-11-01 10:59:18'),(46,'宝盈','宝盈基金管理有限公司',NULL,'046.ini','0','2012-11-01 10:59:18'),(47,'东方','东方基金管理有限公司',NULL,'047.ini','0','2012-11-01 10:59:18'),(48,'汇丰晋信','汇丰晋信基金管理有限公司',NULL,'048.ini','0','2012-11-01 10:59:18'),(49,'华富','华富基金管理有限公司',NULL,'049.ini','0','2012-11-01 10:59:18'),(50,'泰信','泰信基金管理有限公司',NULL,'050.ini','0','2012-11-01 10:59:18'),(51,'中欧','中欧基金管理有限公司',NULL,'051.ini','0','2012-11-01 10:59:18'),(52,'新华','新华基金管理有限公司',NULL,'052.ini','0','2012-11-01 10:59:18'),(53,'民生加银','民生加银基金管理有限公司',NULL,'053.ini','0','2012-11-01 10:59:18'),(54,'信达澳银','信达澳银基金管理有限公司',NULL,'054.ini','0','2012-11-01 10:59:18'),(55,'金鹰','金鹰基金管理有限公司',NULL,'055.ini','0','2012-11-01 10:59:18'),(56,'浦银安盛','浦银安盛基金管理有限公司',NULL,'056.ini','0','2012-11-01 10:59:18'),(57,'益民','益民基金管理有限公司',NULL,'057.ini','0','2012-11-01 10:59:18'),(58,'天治','天治基金管理有限公司',NULL,'058.ini','0','2012-11-01 10:59:18'),(59,'诺德','诺德基金管理有限公司',NULL,'059.ini','0','2012-11-01 10:59:18'),(60,'财通','财通基金管理有限公司',NULL,'060.ini','0','2012-11-01 10:59:18'),(61,'平安大华','平安大华基金管理有限公司','fund.pingan.com','061.ini','0','2012-11-01 10:59:18'),(62,'安信','安信基金管理有限公司',NULL,'062.ini','0','2012-11-01 10:59:18'),(63,'纽银','纽银基金管理有限公司',NULL,'063.ini','0','2012-11-01 10:59:18'),(64,'浙商','浙商基金管理有限公司',NULL,'064.ini','0','2012-11-01 10:59:18'),(65,'金元惠理','金元惠理基金管理有限公司',NULL,'065.ini','0','2012-11-01 10:59:18'),(66,'富安达','富安达基金管理有限公司',NULL,'066.ini','0','2012-11-01 10:59:18'),(67,'德邦','德邦基金管理有限公司',NULL,'067.ini','0','2012-11-01 10:59:18'),(68,'长安','长安基金管理有限公司',NULL,'068.ini','0','2012-11-01 10:59:18'),(69,'国金通用','国金通用基金管理有限公司',NULL,'069.ini','0','2012-11-01 10:59:18'),(70,'方正富邦','方正富邦基金管理有限公司',NULL,'070.ini','0','2012-11-01 10:59:18'),(71,'英大','英大基金管理有限公司',NULL,'071.ini','0','2012-11-01 10:59:18'),(72,'红塔红土','红塔红土基金管理有限公司',NULL,'072.ini','0','2012-11-01 10:59:18'),(73,'华宸未来','华宸未来基金管理有限公司',NULL,'073.ini','0','2012-11-01 10:59:18');
/*!40000 ALTER TABLE `fund_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_dividend`
--

DROP TABLE IF EXISTS `fund_dividend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_dividend` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `year` varchar(8) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `ex_dividend_date` datetime DEFAULT NULL,
  `delivered_date` datetime DEFAULT NULL,
  `unit` float DEFAULT NULL,
  `solution` varchar(64) DEFAULT NULL,
  `distribution_type` varchar(16) DEFAULT NULL,
  `fund_id` int(11) DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_dividend`
--

LOCK TABLES `fund_dividend` WRITE;
/*!40000 ALTER TABLE `fund_dividend` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_dividend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_file`
--

DROP TABLE IF EXISTS `fund_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_file` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `issued_date` datetime DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_file`
--

LOCK TABLES `fund_file` WRITE;
/*!40000 ALTER TABLE `fund_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_invest`
--

DROP TABLE IF EXISTS `fund_invest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_invest` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `overall` text,
  `stock_industry` text,
  `stock_top` text,
  `bond_catelog` text,
  `bond_top` text,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_invest`
--

LOCK TABLES `fund_invest` WRITE;
/*!40000 ALTER TABLE `fund_invest` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_invest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_manager`
--

DROP TABLE IF EXISTS `fund_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_manager` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `manager` varchar(32) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `resume` varchar(256) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `fund_company_id` int(11) DEFAULT NULL,
  `fund_company_name` varchar(128) DEFAULT NULL,
  `fund_id` int(11) DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_manager`
--

LOCK TABLES `fund_manager` WRITE;
/*!40000 ALTER TABLE `fund_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_nav`
--

DROP TABLE IF EXISTS `fund_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_nav` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `nav_date` datetime DEFAULT NULL,
  `nav` float DEFAULT NULL,
  `accumulated_nav` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_nav`
--

LOCK TABLES `fund_nav` WRITE;
/*!40000 ALTER TABLE `fund_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_roi`
--

DROP TABLE IF EXISTS `fund_roi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_roi` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `day_1` double DEFAULT NULL,
  `week_1` double DEFAULT NULL,
  `month_1` double DEFAULT NULL,
  `month_3` double DEFAULT NULL,
  `month_6` double DEFAULT NULL,
  `year_0` double DEFAULT NULL,
  `year_1` double DEFAULT NULL,
  `year_2` double DEFAULT NULL,
  `year_3` double DEFAULT NULL,
  `accumulated` double DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_roi`
--

LOCK TABLES `fund_roi` WRITE;
/*!40000 ALTER TABLE `fund_roi` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_roi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_sales`
--

DROP TABLE IF EXISTS `fund_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_sales` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `sales_agent` text,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_sales`
--

LOCK TABLES `fund_sales` WRITE;
/*!40000 ALTER TABLE `fund_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-05 15:15:34
