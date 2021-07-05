CREATE DATABASE  IF NOT EXISTS `keshe` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `keshe`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: keshe
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `loc_id` int(11) NOT NULL,
  `capicity` double(10,2) DEFAULT NULL,
  `area` double(10,2) DEFAULT NULL,
  `altitude` double(10,2) DEFAULT NULL,
  `longtitude` double(10,2) DEFAULT NULL,
  `latitude` double(10,2) DEFAULT NULL,
  `best_angles` double(10,2) DEFAULT NULL,
  `radiation` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`loc_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,131.00,131.00,1231.00,1231.00,1231.00,131.00,131.00),(2,3000.00,1234.00,2342.00,234.00,23423.00,4223.00,2342.00),(9,100.00,200.00,35.00,27.00,13.80,89.00,90.20);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteorology`
--

DROP TABLE IF EXISTS `meteorology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meteorology` (
  `loc_id` int(11) NOT NULL,
  `avg_year_tem` double(10,2) DEFAULT NULL,
  `max_year_tem` double(10,2) DEFAULT NULL,
  `max_soil_depth` double(10,2) DEFAULT NULL,
  `min_year_tem` double(10,2) DEFAULT NULL,
  `avg_wind_speed` double(10,2) DEFAULT NULL,
  `avg_strom_days` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`loc_id`) USING BTREE,
  CONSTRAINT `meteorology_ibfk_1` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteorology`
--

LOCK TABLES `meteorology` WRITE;
/*!40000 ALTER TABLE `meteorology` DISABLE KEYS */;
INSERT INTO `meteorology` VALUES (1,132.00,123.00,1312.00,1231.00,342.00,242.00);
/*!40000 ALTER TABLE `meteorology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`owner_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (3,'张三','12356','122321','河海大学'),(4,'李四','12213','131231','河海大学'),(29,'吴芋航','123','123','河海大学');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `pj_id` int(11) NOT NULL COMMENT '项目录入编号',
  `owner_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL COMMENT '项目地址',
  `pv_area` int(11) DEFAULT NULL COMMENT '项目光伏区',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目名称',
  `disign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目类型',
  `stage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目阶段',
  `date` date DEFAULT NULL COMMENT '项目日期',
  `invest` double(20,2) DEFAULT NULL,
  PRIMARY KEY (`pj_id`) USING BTREE,
  KEY `location` (`loc_id`) USING BTREE,
  KEY `搭建` (`pv_area`) USING BTREE,
  KEY `管理` (`owner_id`) USING BTREE,
  CONSTRAINT `位于` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `管理` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,29,1,1,'青海省海南州100MW地面电站项目','中国能源建设集团山西省电力勘测设计院有限公司','平地光伏','在研','2020-09-01',2000.50),(2,3,2,123,'黄龙县三岔镇10万千瓦平价上网光伏发电项目','西安隆基清洁能源有限公司','山地光伏','可研','2020-09-23',21312312.60);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv_area`
--

DROP TABLE IF EXISTS `pv_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pv_area` (
  `pj_id` int(11) NOT NULL COMMENT '光伏区编号',
  `pv_set` int(11) NOT NULL COMMENT '光伏区配置',
  `pv_system` int(11) DEFAULT NULL COMMENT '光伏发电系统',
  `pv_booster` int(11) DEFAULT NULL COMMENT '光伏升压站',
  `area` double(10,2) DEFAULT NULL COMMENT '光伏区面积',
  `road_length` double(10,2) DEFAULT NULL COMMENT '厂区道路长度',
  `inverter` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pv_module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pad_mounted` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`pj_id`) USING BTREE,
  KEY `pv_set` (`pv_set`) USING BTREE,
  KEY `pv_system` (`pv_system`) USING BTREE,
  KEY `pv_booster` (`pv_booster`) USING BTREE,
  CONSTRAINT `pv_area_ibfk_2` FOREIGN KEY (`pv_system`) REFERENCES `pv_system` (`system_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pv_area_ibfk_3` FOREIGN KEY (`pv_booster`) REFERENCES `pv_booster` (`booster_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pv_area_ibfk_4` FOREIGN KEY (`pj_id`) REFERENCES `project` (`pj_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv_area`
--

LOCK TABLES `pv_area` WRITE;
/*!40000 ALTER TABLE `pv_area` DISABLE KEYS */;
INSERT INTO `pv_area` VALUES (1,132,1,11,3000.00,400.00,'3000.9','mod_1','mounte_1');
/*!40000 ALTER TABLE `pv_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv_booster`
--

DROP TABLE IF EXISTS `pv_booster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pv_booster` (
  `booster_id` int(11) NOT NULL,
  `capicity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`booster_id`) USING BTREE,
  KEY `搭建` (`booster_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv_booster`
--

LOCK TABLES `pv_booster` WRITE;
/*!40000 ALTER TABLE `pv_booster` DISABLE KEYS */;
INSERT INTO `pv_booster` VALUES (11,'成都');
/*!40000 ALTER TABLE `pv_booster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pv_system`
--

DROP TABLE IF EXISTS `pv_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pv_system` (
  `system_id` int(11) NOT NULL,
  `capcity` double(10,2) DEFAULT NULL,
  `merge_date` datetime DEFAULT NULL,
  `scheme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ratio` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`system_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pv_system`
--

LOCK TABLES `pv_system` WRITE;
/*!40000 ALTER TABLE `pv_system` DISABLE KEYS */;
INSERT INTO `pv_system` VALUES (1,1.00,'2021-07-04 00:00:00','scheme_1',0.28);
/*!40000 ALTER TABLE `pv_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (14,'wuyuhang',NULL,'123@mail.com','123'),(16,'keshe','123456','keshe@hhu.cn','123456');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-04 18:59:18
