# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.38)
# Database: lks_restaurant
# Generation Time: 2021-07-14 06:27:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AccessToken
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AccessToken`;

CREATE TABLE `AccessToken` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `EmployeeId` int(11) DEFAULT NULL,
  `Token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `AccessToken` WRITE;
/*!40000 ALTER TABLE `AccessToken` DISABLE KEYS */;

INSERT INTO `AccessToken` (`Id`, `EmployeeId`, `Token`)
VALUES
	(1,2,'cc3a0f4e-8697-4395-a7e6-4aa9346a2839');

/*!40000 ALTER TABLE `AccessToken` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table MsEmployee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MsEmployee`;

CREATE TABLE `MsEmployee` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` char(128) DEFAULT NULL,
  `Handphone` varchar(13) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `MsEmployee` WRITE;
/*!40000 ALTER TABLE `MsEmployee` DISABLE KEYS */;

INSERT INTO `MsEmployee` (`Id`, `Name`, `Email`, `Password`, `Handphone`, `Position`)
VALUES
	(1,'Taufiq','taufiq26.ridwan@gmail.com','21232f297a57a5a743894a0e4a801fc3','0896969696969','Supervisor'),
	(2,NULL,'gwetaufiq@gmail.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL);

/*!40000 ALTER TABLE `MsEmployee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table MsMenu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MsMenu`;

CREATE TABLE `MsMenu` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  `Carbo` int(11) DEFAULT NULL,
  `Protein` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `MsMenu` WRITE;
/*!40000 ALTER TABLE `MsMenu` DISABLE KEYS */;

INSERT INTO `MsMenu` (`Id`, `Name`, `Description`, `Price`, `Photo`, `Carbo`, `Protein`)
VALUES
	(1,'Baso','Baso bulat seperti bola pingpong',10000,NULL,NULL,NULL),
	(2,'Mie Ayam','Mie Ayam yang udah mati ayamnya',8000,NULL,NULL,NULL),
	(3,'Es Teh Manis','Es teh manis yg buat juga teteh yang manis',3000,NULL,NULL,NULL),
	(4,'Jus Alpukat','Jus alpukat pekat kat kat',8000,NULL,NULL,NULL);

/*!40000 ALTER TABLE `MsMenu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrderDetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderDetail`;

CREATE TABLE `OrderDetail` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Orderid` char(12) DEFAULT NULL,
  `Menuid` int(11) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `OrderDetail` WRITE;
/*!40000 ALTER TABLE `OrderDetail` DISABLE KEYS */;

INSERT INTO `OrderDetail` (`Id`, `Orderid`, `Menuid`, `Qty`, `Status`)
VALUES
	(1,'202104131436',1,2,NULL),
	(2,'202104131436',3,2,NULL),
	(3,'202104131437',2,1,NULL),
	(4,'202104131437',3,1,NULL),
	(5,'202105131438',1,1,NULL),
	(6,'202105131438',2,1,NULL),
	(7,'202105131438',3,2,NULL),
	(8,'202106131439',2,1,NULL),
	(9,'202106131439',4,1,NULL),
	(10,'202107131440',1,1,NULL),
	(11,'202107131440',4,1,NULL);

/*!40000 ALTER TABLE `OrderDetail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrderHeader
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderHeader`;

CREATE TABLE `OrderHeader` (
  `Id` char(12) NOT NULL DEFAULT '',
  `Employeeid` char(6) DEFAULT NULL,
  `Memberid` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `PaymentType` varchar(20) DEFAULT NULL,
  `CardNumber` varchar(16) DEFAULT NULL,
  `Bank` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `OrderHeader` WRITE;
/*!40000 ALTER TABLE `OrderHeader` DISABLE KEYS */;

INSERT INTO `OrderHeader` (`Id`, `Employeeid`, `Memberid`, `Date`, `PaymentType`, `CardNumber`, `Bank`)
VALUES
	('202104131436','1',1,'2021-04-13','EDC','123123123','BCA'),
	('202104131437','1',1,'2021-04-13','EDC','123123123','BCA'),
	('202105131438','1',1,'2021-05-13','EDC','123123123','BCA'),
	('202106131439','1',1,'2021-06-13','EDC','123123123','BCA'),
	('202107131440','1',1,'2021-07-13','EDC','123123123','BCA');

/*!40000 ALTER TABLE `OrderHeader` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
