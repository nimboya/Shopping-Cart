-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.32 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.0.0.4478
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for scart
CREATE DATABASE IF NOT EXISTS `scart` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `scart`;


-- Dumping structure for table scart.audittrail
CREATE TABLE IF NOT EXISTS `audittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` text,
  `operation` text,
  `status` text,
  `trandt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `agent` text NOT NULL,
  `logintokfk` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of Activities carried out by users of the system';

-- Dumping data for table scart.audittrail: ~0 rows (approximately)
DELETE FROM `audittrail`;
/*!40000 ALTER TABLE `audittrail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audittrail` ENABLE KEYS */;


-- Dumping structure for table scart.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartid` varchar(50) NOT NULL DEFAULT '0',
  `itemname` varchar(100) NOT NULL DEFAULT '0',
  `qty` decimal(10,0) NOT NULL DEFAULT '0',
  `unitprice` decimal(10,0) NOT NULL DEFAULT '0',
  `total` decimal(10,0) NOT NULL DEFAULT '0',
  `userid` varchar(50) NOT NULL DEFAULT '0',
  `checkout` int(11) NOT NULL DEFAULT '0',
  `trandate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of Items in the Cart';

-- Dumping data for table scart.cart: ~0 rows (approximately)
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


-- Dumping structure for table scart.members
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL DEFAULT '0',
  `lastname` varchar(50) NOT NULL DEFAULT '0',
  `sex` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(100) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `salt` varchar(50) NOT NULL DEFAULT '0',
  `trandate` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of Members in System';

-- Dumping data for table scart.members: ~0 rows (approximately)
DELETE FROM `members`;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
