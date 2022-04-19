-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table icstesto.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table icstesto.category: ~2 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`CategoryID`, `Category`) VALUES
	(1, 'Plain Color'),
	(2, 'Pattern'),
	(3, 'Figure');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table icstesto.order_product
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `FK_order_product_product` (`ProductID`),
  CONSTRAINT `FK_order_product_order_status` FOREIGN KEY (`OrderID`) REFERENCES `order_status` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_order_product_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table icstesto.order_product: ~54 rows (approximately)
DELETE FROM `order_product`;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` (`OrderID`, `ProductID`, `Quantity`) VALUES
	(1, 1, 1),
	(1, 2, 2),
	(2, 4, 1),
	(3, 3, 13),
	(4, 4, 1),
	(5, 5, 1),
	(6, 6, 4),
	(7, 7, 1),
	(8, 8, 2),
	(9, 9, 1),
	(10, 10, 6),
	(11, 11, 1),
	(12, 12, 1),
	(13, 13, 3),
	(14, 14, 7),
	(15, 15, 1),
	(16, 16, 1),
	(17, 17, 9),
	(18, 18, 1),
	(19, 19, 1),
	(20, 20, 1),
	(21, 21, 5),
	(22, 22, 1),
	(23, 23, 1),
	(24, 24, 1),
	(25, 25, 1),
	(26, 26, 36),
	(27, 27, 1),
	(28, 28, 2),
	(29, 29, 1),
	(30, 30, 4),
	(31, 31, 1),
	(32, 32, 1),
	(33, 33, 2),
	(34, 34, 1),
	(35, 35, 9),
	(36, 36, 1),
	(37, 37, 6),
	(38, 38, 1),
	(39, 39, 1),
	(40, 40, 7),
	(41, 41, 1),
	(42, 42, 3),
	(43, 43, 1),
	(44, 44, 8),
	(45, 45, 1),
	(46, 46, 1),
	(47, 47, 16),
	(48, 48, 1),
	(49, 49, 1),
	(50, 50, 7),
	(50, 51, 5),
	(50, 52, 6),
	(50, 53, 1),
	(77, 1, 100),
	(77, 2, 200);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;

-- Dumping structure for table icstesto.order_status
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `StatusID` int(11) NOT NULL,
  `PaidDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Address` varchar(1000) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK__status` (`StatusID`),
  CONSTRAINT `FK__status` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- Dumping data for table icstesto.order_status: ~50 rows (approximately)
DELETE FROM `order_status`;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` (`OrderID`, `StatusID`, `PaidDate`, `Address`) VALUES
	(1, 1, '2022-04-18 00:00:00', '8434 Walerga Rd #817'),
	(2, 4, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(3, 3, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(4, 5, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(5, 2, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(6, 1, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(7, 4, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(8, 3, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(9, 5, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(10, 6, '2022-04-18 00:00:00', '3193 Keith Way Dr'),
	(11, 6, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(12, 2, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(13, 3, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(14, 3, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(15, 4, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(16, 4, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(17, 3, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(18, 1, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(19, 2, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(20, 2, '2021-04-18 00:00:00', '3193 Keith Way Dr'),
	(21, 3, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(22, 3, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(23, 4, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(24, 4, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(25, 1, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(26, 1, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(27, 6, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(28, 5, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(29, 5, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(30, 4, '2020-04-18 00:00:00', '3193 Keith Way Dr'),
	(31, 4, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(32, 3, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(33, 3, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(34, 2, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(35, 2, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(36, 4, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(37, 1, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(38, 1, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(39, 4, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(40, 4, '2019-04-18 00:00:00', '3193 Keith Way Dr'),
	(41, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(42, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(43, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(44, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(45, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(46, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(47, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(48, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(49, 4, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(50, 1, '2018-04-18 00:00:00', '3193 Keith Way Dr'),
	(77, 1, '2022-04-19 15:41:38', '777 test');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;

-- Dumping structure for table icstesto.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ShirtID` int(11) NOT NULL,
  `SexID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `Stock` int(11) NOT NULL DEFAULT '0',
  `Price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`ProductID`) USING BTREE,
  KEY `FK__shirt` (`ShirtID`),
  KEY `FK__sex` (`SexID`),
  KEY `FK__category` (`CategoryID`),
  KEY `FK__size` (`SizeID`),
  CONSTRAINT `FK__category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__sex` FOREIGN KEY (`SexID`) REFERENCES `sex` (`SexID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__shirt` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__size` FOREIGN KEY (`SizeID`) REFERENCES `size` (`SizeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- Dumping data for table icstesto.product: ~53 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`ProductID`, `ShirtID`, `SexID`, `CategoryID`, `SizeID`, `Stock`, `Price`) VALUES
	(1, 1, 1, 1, 2, 100, 15.990000),
	(2, 1, 1, 1, 3, 80, 20.990000),
	(3, 1, 1, 2, 3, 40, 25.990000),
	(4, 2, 2, 1, 4, 90, 30.990000),
	(5, 2, 2, 1, 5, 30, 35.990000),
	(6, 3, 1, 1, 3, 400, 5.000000),
	(7, 4, 1, 1, 5, 37, 24.000000),
	(8, 5, 1, 3, 3, 76, 37.000000),
	(9, 6, 1, 2, 5, 35, 70.000000),
	(10, 7, 1, 3, 1, 30, 17.000000),
	(11, 8, 1, 3, 3, 60, 80.000000),
	(12, 9, 1, 1, 1, 4, 38.000000),
	(13, 10, 1, 2, 5, 84, 65.000000),
	(14, 11, 2, 2, 3, 20, 40.000000),
	(15, 12, 2, 3, 1, 20, 40.000000),
	(16, 13, 2, 2, 4, 20, 40.000000),
	(17, 14, 2, 1, 2, 20, 40.000000),
	(18, 15, 2, 2, 5, 20, 40.000000),
	(19, 16, 2, 3, 1, 20, 40.000000),
	(20, 17, 2, 2, 4, 20, 40.000000),
	(21, 18, 2, 1, 2, 20, 40.000000),
	(22, 19, 2, 2, 3, 20, 40.000000),
	(23, 20, 2, 1, 5, 20, 40.000000),
	(24, 21, 2, 3, 1, 30, 60.000000),
	(25, 22, 2, 1, 3, 30, 60.000000),
	(26, 23, 2, 2, 5, 30, 60.000000),
	(27, 24, 2, 1, 2, 30, 60.000000),
	(28, 25, 2, 1, 2, 30, 60.000000),
	(29, 26, 2, 3, 5, 30, 60.000000),
	(30, 27, 2, 1, 3, 30, 60.000000),
	(31, 28, 2, 2, 4, 30, 60.000000),
	(32, 29, 2, 1, 5, 30, 60.000000),
	(33, 30, 2, 1, 1, 30, 60.000000),
	(34, 31, 2, 2, 5, 40, 80.000000),
	(35, 32, 2, 1, 1, 40, 80.000000),
	(36, 33, 2, 1, 3, 40, 80.000000),
	(37, 34, 2, 3, 1, 40, 80.000000),
	(38, 35, 2, 1, 2, 40, 80.000000),
	(39, 36, 2, 3, 1, 40, 80.000000),
	(40, 37, 2, 1, 4, 40, 80.000000),
	(41, 38, 2, 2, 2, 40, 80.000000),
	(42, 39, 2, 1, 1, 40, 80.000000),
	(43, 40, 2, 3, 2, 40, 80.000000),
	(44, 41, 1, 1, 4, 50, 100.000000),
	(45, 42, 1, 2, 2, 50, 100.000000),
	(46, 43, 1, 3, 5, 50, 100.000000),
	(47, 44, 1, 2, 2, 50, 100.000000),
	(48, 45, 1, 1, 3, 50, 100.000000),
	(49, 46, 1, 1, 2, 50, 100.000000),
	(50, 47, 1, 2, 1, 50, 100.000000),
	(51, 48, 1, 3, 1, 50, 100.000000),
	(52, 49, 1, 1, 2, 50, 100.000000),
	(53, 50, 1, 3, 3, 50, 100.000000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table icstesto.sex
DROP TABLE IF EXISTS `sex`;
CREATE TABLE IF NOT EXISTS `sex` (
  `SexID` int(11) NOT NULL AUTO_INCREMENT,
  `Sex` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SexID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table icstesto.sex: ~2 rows (approximately)
DELETE FROM `sex`;
/*!40000 ALTER TABLE `sex` DISABLE KEYS */;
INSERT INTO `sex` (`SexID`, `Sex`) VALUES
	(1, 'Male'),
	(2, 'Female');
/*!40000 ALTER TABLE `sex` ENABLE KEYS */;

-- Dumping structure for table icstesto.shirt
DROP TABLE IF EXISTS `shirt`;
CREATE TABLE IF NOT EXISTS `shirt` (
  `ShirtID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ShirtID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- Dumping data for table icstesto.shirt: ~50 rows (approximately)
DELETE FROM `shirt`;
/*!40000 ALTER TABLE `shirt` DISABLE KEYS */;
INSERT INTO `shirt` (`ShirtID`, `Title`) VALUES
	(1, 'Hanes Men\'s Full-Zip Eco-Smart Hoodie'),
	(2, 'Cicy Bell Womens Casual Blazers Open Front Long Sleeve Work Office Jackets Blazer'),
	(3, 'Men Paisley Scarf Print Curved Hem Shirt'),
	(4, 'Men Tropical Print Button Up Shirt'),
	(5, 'Men Random Geo & Leaf Print Button'),
	(6, 'Men Floral Print Shirt'),
	(7, 'Men Japanese Letter And Figure Graphic'),
	(8, 'Men Tropical Print Hawaiian Shirt'),
	(9, 'Men Geo Print Shirt'),
	(10, 'Men Chinese Letter Embroidery'),
	(11, 'Backless Crisscross Cami Dress'),
	(12, 'Solid Square Neck A-line Dress'),
	(13, 'Tie Dye Tee Dress'),
	(14, 'Polo Neck Slit Hem Fitted Dress'),
	(15, 'Floral Print Twist Cut Out Cami Dress'),
	(16, 'Tweed Frill Trim Knot Back Dress'),
	(17, 'Allover Cherry Sweetheart Neck Dress'),
	(18, 'Ditsy Floral Split Thigh Cami Dress'),
	(19, 'Ditsy Floral Print Knot Wrap Dress'),
	(20, 'Twist Front Cut Out Dress'),
	(21, 'Floral Print Overlap Collar Dress'),
	(22, 'Colorblock Stand Collar Belted Dress'),
	(23, 'Off Shoulder Backless Flounce Sleeve Ruched'),
	(24, 'Floral Print Wrap Belted Dress'),
	(25, 'Ditsy Floral Print Ruched Bust Cami Dress'),
	(26, 'Draped Tie Backless Halter Bodycon Dress'),
	(27, 'Backless Single Breasted Halter Dress'),
	(28, 'Floral Ruffle Hem Tie Side Wrap Dress'),
	(29, 'Floral Print Split Thigh Cami Dress'),
	(30, 'M-slit Hem Ring Link Cut Out Dress'),
	(31, 'Ditsy Floral Print Tie Front Cami Dress'),
	(32, 'Contrast Mesh Bodycon Dress'),
	(33, 'Floral Print Notch Neck Belted Dress'),
	(34, 'Tropical Print Cold Shoulder Tunic Dress'),
	(35, 'Floral Print Surplice Neck Dress'),
	(36, 'Knot Backless Twist Front Cami Dress'),
	(37, 'Solid Ruched Bust Tie Shoulder Dress'),
	(38, 'All Over Floral Print Notched Neck Dress'),
	(39, 'Drape Neck Ruched Side Split Hem Dress'),
	(40, 'Tie Backless Shirred Bodice Halter Dress'),
	(41, 'Men Battery Print Tee'),
	(42, 'Extended Sizes Men Shark & Slogan Graphic Tee'),
	(43, 'Men Random Tropical Print Shirt Without Tee'),
	(44, 'Men Slogan & Cartoon Face Print Tee'),
	(45, 'Men Random Zebra Striped & Leopard Print Shirt'),
	(46, 'Men Sun & Palm Tree Print Tee'),
	(47, 'Men Mock Neck Solid Tee'),
	(48, 'Men Plaid Button Up Shirt'),
	(49, 'Men Expression Print Colorblock Drawstring'),
	(50, 'Men Patchwork Print Button Front Shirt');
/*!40000 ALTER TABLE `shirt` ENABLE KEYS */;

-- Dumping structure for table icstesto.size
DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `SizeID` int(11) NOT NULL AUTO_INCREMENT,
  `Size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table icstesto.size: ~4 rows (approximately)
DELETE FROM `size`;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` (`SizeID`, `Size`) VALUES
	(1, 'XS'),
	(2, 'S'),
	(3, 'M'),
	(4, 'L'),
	(5, 'XL');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;

-- Dumping structure for table icstesto.status
DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `StatusID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table icstesto.status: ~6 rows (approximately)
DELETE FROM `status`;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`StatusID`, `Status`) VALUES
	(1, 'Ordered'),
	(2, 'Processing'),
	(3, 'Shipped'),
	(4, 'Delivered'),
	(5, 'Canceled'),
	(6, 'Refunded');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
