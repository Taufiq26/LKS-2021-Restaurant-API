-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: lks_restaurant
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AccessToken`
--

DROP TABLE IF EXISTS `AccessToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AccessToken` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `EmployeeId` int DEFAULT NULL,
  `Token` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessToken`
--

LOCK TABLES `AccessToken` WRITE;
/*!40000 ALTER TABLE `AccessToken` DISABLE KEYS */;
INSERT INTO `AccessToken` VALUES (1,2,'cc3a0f4e-8697-4395-a7e6-4aa9346a2839'),(2,3,'0fefb802-68c6-4046-8735-03504c3f018a'),(3,3,'641a904a-5d21-4cf2-9068-6e6482c14026'),(4,3,'6cb9758d-a90b-47ba-b3be-fdc29dbc34f9'),(5,3,'437fe4a4-1d1d-4084-b9d4-07dc9b7dc509'),(6,3,'de11c9ac-e843-4da2-9243-b8b681691231'),(7,4,'1818340f-ebb5-4385-b41d-676fd6d3b453'),(8,4,'b97dc2b5-c361-4a11-b605-247e99f65ec9'),(9,4,'e4737fb0-1ed4-4330-885e-3e564320e7e2'),(10,4,'267429fb-1697-46dd-a332-132f5b36381b'),(11,4,'9cf0a127-e108-4bda-a847-9c03e7c007a5'),(12,4,'5f0460b7-d9b3-4eca-9a64-b964b9b77a8d'),(13,3,'d4db4a2a-e39a-48cc-8c75-06a561a68d83'),(14,6,'9db47c0f-adbe-4aa2-a4a4-ff56a2006637'),(15,6,'ff27db89-74ab-48c4-bad6-c98f8fa9db0b'),(16,4,'b7ca026c-475e-4f52-9243-46394bbe26c2'),(17,6,'b6dc684d-a196-49a2-bb29-7046557361bf'),(18,7,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsa3MtcmVzdGF1cmFudCIsInN1YiI6NywiZW1haWwiOiJ1c2VyMSIsImlhdCI6MTc0ODQ5MjU1NCwiZXhwIjoxNzQ4NTc4OTU0fQ.me7d-CWdcasYj_ctHEdDbwzlgNW43ELyalOu6BSeE8I');
/*!40000 ALTER TABLE `AccessToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MsEmployee`
--

DROP TABLE IF EXISTS `MsEmployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MsEmployee` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` char(128) DEFAULT NULL,
  `Handphone` varchar(13) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `MsEmployee_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MsEmployee`
--

LOCK TABLES `MsEmployee` WRITE;
/*!40000 ALTER TABLE `MsEmployee` DISABLE KEYS */;
INSERT INTO `MsEmployee` VALUES (1,'Taufiq','taufiq26.ridwan@gmail.com','21232f297a57a5a743894a0e4a801fc3','0896969696969','Supervisor'),(2,NULL,'gwetaufiq@gmail.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL),(3,NULL,'admin','827ccb0eea8a706c4c34a16891f84e7b',NULL,NULL),(4,NULL,'user','827ccb0eea8a706c4c34a16891f84e7b',NULL,NULL),(7,NULL,'user1','5ebe2294ecd0e0f08eab7690d2a6ee69',NULL,NULL);
/*!40000 ALTER TABLE `MsEmployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MsMenu`
--

DROP TABLE IF EXISTS `MsMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MsMenu` (
  `Id` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  `Carbo` int DEFAULT NULL,
  `Protein` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `MsMenu_MsEmployee_FK` (`UserId`),
  CONSTRAINT `MsMenu_MsEmployee_FK` FOREIGN KEY (`UserId`) REFERENCES `MsEmployee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MsMenu`
--

LOCK TABLES `MsMenu` WRITE;
/*!40000 ALTER TABLE `MsMenu` DISABLE KEYS */;
INSERT INTO `MsMenu` VALUES ('1008b1c0-ed00-4526-916d-d2760e91c199','Baso','Baso bulat seperti bola pingpong',10000,NULL,NULL,NULL,1),('1c8cd4d2-93d6-4469-9452-a96fafdc7252','Mie Ayam','Mie Ayam yang udah mati ayamnya',8000,NULL,NULL,NULL,1),('47b2a9cd-c258-49c7-904b-c70437b9b4e0','Es Teh Manis','Es teh manis yg buat juga teteh yang manis',3000,NULL,NULL,NULL,1),('a435af39-9cc6-4190-81a6-c2311f065600','Sebluk','Syarat wajib untuk jadi teteh sunda',12000,'http://localhost:8000/storage/menu/bea7f63c-d979-4a6a-a9eb-83b7926c49ac.png',100,10,7),('c2263b4a-d4ee-40b9-9ee8-db70b60518aa','Jus Alpukat','Jus alpukat pekat kat kat',8000,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `MsMenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetail`
--

DROP TABLE IF EXISTS `OrderDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDetail` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Orderid` char(12) DEFAULT NULL,
  `Menuid` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetail`
--

LOCK TABLES `OrderDetail` WRITE;
/*!40000 ALTER TABLE `OrderDetail` DISABLE KEYS */;
INSERT INTO `OrderDetail` VALUES (1,'202104131436',1,2,NULL),(2,'202104131436',3,2,NULL),(3,'202104131437',2,1,NULL),(4,'202104131437',3,1,NULL),(5,'202105131438',1,1,NULL),(6,'202105131438',2,1,NULL),(7,'202105131438',3,2,NULL),(8,'202106131439',2,1,NULL),(9,'202106131439',4,1,NULL),(10,'202107131440',1,1,NULL),(11,'202107131440',4,1,NULL);
/*!40000 ALTER TABLE `OrderDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderHeader`
--

DROP TABLE IF EXISTS `OrderHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderHeader` (
  `Id` char(12) NOT NULL DEFAULT '',
  `Employeeid` char(6) DEFAULT NULL,
  `Memberid` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `PaymentType` varchar(20) DEFAULT NULL,
  `CardNumber` varchar(16) DEFAULT NULL,
  `Bank` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderHeader`
--

LOCK TABLES `OrderHeader` WRITE;
/*!40000 ALTER TABLE `OrderHeader` DISABLE KEYS */;
INSERT INTO `OrderHeader` VALUES ('202104131436','1',1,'2021-04-13','EDC','123123123','BCA'),('202104131437','1',1,'2021-04-13','EDC','123123123','BCA'),('202105131438','1',1,'2021-05-13','EDC','123123123','BCA'),('202106131439','1',1,'2021-06-13','EDC','123123123','BCA'),('202107131440','1',1,'2021-07-13','EDC','123123123','BCA');
/*!40000 ALTER TABLE `OrderHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lks_restaurant'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 14:26:41
