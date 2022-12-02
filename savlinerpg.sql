-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.10 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table savlinerpg.bank
CREATE TABLE IF NOT EXISTS `bank` (
  `Bank_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Master_ID` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Bank_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.bank: ~8 rows (approximately)
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` (`Bank_ID`, `Master_ID`, `Amount`) VALUES
	(1, 6, 0),
	(2, 6, 0),
	(3, 5, 0),
	(4, 16, 0),
	(5, 16, 0),
	(6, 16, 0),
	(7, 4, 0),
	(8, 4, 0);
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `entryId` int(11) NOT NULL AUTO_INCREMENT,
  `bannedId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `reason` varchar(256) DEFAULT 'banned',
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `entryId` (`entryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table savlinerpg.bans: ~0 rows (approximately)
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.gas_station
CREATE TABLE IF NOT EXISTS `gas_station` (
  `gasId` int(11) NOT NULL AUTO_INCREMENT,
  `propertyId` int(11) DEFAULT NULL,
  `liters` int(11) DEFAULT '1000',
  `price` int(11) DEFAULT '17',
  `gasX` float DEFAULT '0',
  `gasY` float DEFAULT '0',
  `gasZ` float DEFAULT '0',
  PRIMARY KEY (`gasId`),
  UNIQUE KEY `gasId` (`gasId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table savlinerpg.gas_station: ~0 rows (approximately)
/*!40000 ALTER TABLE `gas_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `gas_station` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(50) DEFAULT 'Unnamed',
  `groupTag` varchar(6) DEFAULT NULL,
  `groupSpeciality` int(11) DEFAULT '0',
  `groupOfficial` int(11) DEFAULT '0',
  `Rank1` varchar(32) DEFAULT 'Unnamed',
  `Rank2` varchar(32) DEFAULT 'Unnamed',
  `Rank3` varchar(32) DEFAULT 'Unnamed',
  `Rank4` varchar(32) DEFAULT 'Unnamed',
  `Rank5` varchar(32) DEFAULT 'Unnamed',
  `Rank6` varchar(32) DEFAULT 'Unnamed',
  `Rank7` varchar(32) DEFAULT 'Unnamed',
  `Rank8` varchar(32) DEFAULT 'Unnamed',
  `Rank9` varchar(32) DEFAULT 'Unnamed',
  `Rank10` varchar(32) DEFAULT 'Unnamed',
  `Rank11` varchar(32) DEFAULT 'Unnamed',
  `Rank12` varchar(32) DEFAULT 'Unnamed',
  `Rank13` varchar(32) DEFAULT 'Unnamed',
  `Rank14` varchar(32) DEFAULT 'Unnamed',
  `Rank15` varchar(32) DEFAULT 'Unnamed',
  `permissionInviteKick` int(11) DEFAULT '15',
  `permissionRank` int(11) DEFAULT '15',
  `permissionManage` int(11) DEFAULT '15',
  `permissionStorage` int(11) DEFAULT '15',
  `permissionManageProperty` int(11) DEFAULT '15',
  `gBankAcc` int(11) NOT NULL DEFAULT '0',
  `gSmuggleVanX` float NOT NULL DEFAULT '0',
  `gSmuggleVanY` float NOT NULL DEFAULT '0',
  `gSmuggleVanZ` float NOT NULL DEFAULT '0',
  `gSpawnX` float NOT NULL DEFAULT '0',
  `gSpawnY` float NOT NULL DEFAULT '0',
  `gSpawnZ` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`) USING BTREE,
  UNIQUE KEY `groupID` (`groupId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table savlinerpg.groups: ~5 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`groupId`, `groupName`, `groupTag`, `groupSpeciality`, `groupOfficial`, `Rank1`, `Rank2`, `Rank3`, `Rank4`, `Rank5`, `Rank6`, `Rank7`, `Rank8`, `Rank9`, `Rank10`, `Rank11`, `Rank12`, `Rank13`, `Rank14`, `Rank15`, `permissionInviteKick`, `permissionRank`, `permissionManage`, `permissionStorage`, `permissionManageProperty`, `gBankAcc`, `gSmuggleVanX`, `gSmuggleVanY`, `gSmuggleVanZ`, `gSpawnX`, `gSpawnY`, `gSpawnZ`) VALUES
	(1, 'San Andreas Police Department', 'SAPD', 3, 0, 'Volunteer', 'Cadet', 'Police Officer I', 'Police Officer II', 'Police Officer III', 'Corporal', 'Sergeant I', 'Sergeant II', 'Sergeant III', 'Lieutenant', 'Captain', 'Commander', 'Command Consultant', 'Deputy Chief', 'Chief', 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0),
	(2, 'Special Weapons and Tactics', 'SWAT', 4, 0, 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0),
	(3, 'San Andreas Government', 'GOV', 8, 0, 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0),
	(4, 'Outlaw', 'OUT', 1, 0, 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 15, 15, 15, 15, 15, 0, 647.403, -1223.1, 0, 0, 0, 18.063),
	(5, 'Federal Bureau of Investigation', 'FBI', 5, 0, 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 'Unnamed', 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.group_members
CREATE TABLE IF NOT EXISTS `group_members` (
  `entryId` int(11) NOT NULL AUTO_INCREMENT,
  `Master_ID` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `groupRank` int(11) DEFAULT '1',
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `entryId` (`entryId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table savlinerpg.group_members: ~10 rows (approximately)
/*!40000 ALTER TABLE `group_members` DISABLE KEYS */;
INSERT INTO `group_members` (`entryId`, `Master_ID`, `groupId`, `groupRank`) VALUES
	(4, 15, 1, 1),
	(5, 15, 5, 1),
	(6, 5, 4, 1),
	(7, 16, 4, 1),
	(8, 26, 1, 1),
	(9, 26, 2, 1),
	(10, 26, 4, 1),
	(11, 0, 4, 1),
	(12, 4, 1, 15),
	(13, 4, 2, 1);
/*!40000 ALTER TABLE `group_members` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.phone_calllog
CREATE TABLE IF NOT EXISTS `phone_calllog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Caller_ID` int(11) NOT NULL,
  `Receiver_ID` int(11) NOT NULL,
  `Caller_Number` int(11) NOT NULL,
  `Receiver_Number` int(11) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.phone_calllog: ~1 rows (approximately)
/*!40000 ALTER TABLE `phone_calllog` DISABLE KEYS */;
INSERT INTO `phone_calllog` (`ID`, `Caller_ID`, `Receiver_ID`, `Caller_Number`, `Receiver_Number`, `Timestamp`) VALUES
	(1, 6, 12, 10180, 10149, 1658346863);
/*!40000 ALTER TABLE `phone_calllog` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.phone_contact
CREATE TABLE IF NOT EXISTS `phone_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Master_ID` int(11) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  `Contact_Name` varchar(26) NOT NULL,
  `Contact_Number` int(11) NOT NULL,
  `Block` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.phone_contact: ~4 rows (approximately)
/*!40000 ALTER TABLE `phone_contact` DISABLE KEYS */;
INSERT INTO `phone_contact` (`ID`, `Master_ID`, `Phone_Number`, `Contact_Name`, `Contact_Number`, `Block`) VALUES
	(2, 6, 10180, 'Dum Dum', 10149, 0),
	(3, 12, 10149, 'Victor Amuso', 10180, 0),
	(4, 5, 185, 'Diego', 166, 0),
	(5, 6, 10180, 'Diego', 166, 0);
/*!40000 ALTER TABLE `phone_contact` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.phone_info
CREATE TABLE IF NOT EXISTS `phone_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Master_ID` int(11) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  `Speaker` int(11) NOT NULL DEFAULT '0',
  `Power` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.phone_info: ~17 rows (approximately)
/*!40000 ALTER TABLE `phone_info` DISABLE KEYS */;
INSERT INTO `phone_info` (`ID`, `Master_ID`, `Phone_Number`, `Speaker`, `Power`) VALUES
	(5, 6, 10180, 0, 1),
	(6, 12, 10149, 0, 1),
	(7, 4, 166, 0, 1),
	(8, 5, 185, 0, 1),
	(9, 3, 139, 0, 1),
	(10, 15, 10182, 0, 1),
	(11, 16, 10187, 0, 1),
	(12, 0, 10115, 0, 1),
	(13, 17, 10175, 0, 1),
	(14, 13, 10191, 0, 1),
	(15, 20, 10190, 0, 1),
	(16, 21, 10140, 0, 1),
	(17, 24, 10209, 0, 1),
	(18, 25, 0, 0, 0),
	(19, 26, 10132, 0, 1),
	(20, 18, 10196, 0, 1),
	(21, 27, 10219, 0, 1);
/*!40000 ALTER TABLE `phone_info` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.phone_sms
CREATE TABLE IF NOT EXISTS `phone_sms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sender_ID` int(11) NOT NULL,
  `Receiver_ID` int(11) NOT NULL,
  `Sender_Number` int(11) NOT NULL,
  `Receiver_Number` int(11) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `Seen` int(11) NOT NULL,
  `Content` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.phone_sms: ~1 rows (approximately)
/*!40000 ALTER TABLE `phone_sms` DISABLE KEYS */;
INSERT INTO `phone_sms` (`ID`, `Sender_ID`, `Receiver_ID`, `Sender_Number`, `Receiver_Number`, `Timestamp`, `Seen`, `Content`) VALUES
	(6, 12, 6, 10149, 10180, 1658325226, 1, 'Hello this is dum dum message');
/*!40000 ALTER TABLE `phone_sms` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.player_inventory
CREATE TABLE IF NOT EXISTS `player_inventory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Master_Id` int(11) DEFAULT NULL,
  `Acetone` int(11) NOT NULL DEFAULT '0',
  `Calcium` int(11) NOT NULL DEFAULT '0',
  `C4` int(11) NOT NULL DEFAULT '0',
  `Laptop` int(11) NOT NULL DEFAULT '0',
  `Lithium` int(11) NOT NULL DEFAULT '0',
  `Heroin` int(11) NOT NULL DEFAULT '0',
  `Marked_Money` int(11) NOT NULL DEFAULT '0',
  `Meth` int(11) NOT NULL DEFAULT '0',
  `Phone` int(11) NOT NULL DEFAULT '0',
  `Sodium` int(11) NOT NULL DEFAULT '0',
  `Toluene` int(11) NOT NULL DEFAULT '0',
  `Walkie_Talkie` int(11) NOT NULL DEFAULT '0',
  `Water` int(11) NOT NULL DEFAULT '0',
  `Weed` int(11) NOT NULL DEFAULT '0',
  `Weed_Seed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.player_inventory: ~17 rows (approximately)
/*!40000 ALTER TABLE `player_inventory` DISABLE KEYS */;
INSERT INTO `player_inventory` (`ID`, `Master_Id`, `Acetone`, `Calcium`, `C4`, `Laptop`, `Lithium`, `Heroin`, `Marked_Money`, `Meth`, `Phone`, `Sodium`, `Toluene`, `Walkie_Talkie`, `Water`, `Weed`, `Weed_Seed`) VALUES
	(25, 6, 10, 9, 0, 0, 0, 150, 0, 0, 0, 9, 0, 0, 103, 0, 100),
	(26, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27, 4, 53, 0, 0, 0, 0, 0, 22804, 6, 1, 0, 0, 1, 4, 65, 124),
	(28, 5, 0, 0, 0, 0, 0, 0, 9467, 0, 0, 0, 0, 0, 0, 1, 10),
	(29, 3, 0, 0, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(30, 0, 153, 0, 1, 0, 100, 0, 8970, 0, 1, 0, 100, 1, 97, 24, 23),
	(31, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32, 16, 0, 0, 0, 0, 0, 0, 17326, 0, 0, 0, 0, 0, 0, 0, 0),
	(33, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
	(34, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(35, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(36, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `player_inventory` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.property
CREATE TABLE IF NOT EXISTS `property` (
  `propertyid` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) DEFAULT '-1',
  `ownertype` int(11) DEFAULT '0',
  `ownername` varchar(50) DEFAULT 'For Sale',
  `type` tinyint(4) DEFAULT '0',
  `blip` int(11) DEFAULT '0',
  `speciality` tinyint(4) DEFAULT '0',
  `propertyname` varchar(32) DEFAULT 'New Property',
  `price` int(11) DEFAULT '0',
  `entryfee` int(11) DEFAULT '0',
  `locked` tinyint(1) DEFAULT '0',
  `enter_x` float DEFAULT '0',
  `enter_y` float DEFAULT '0',
  `enter_z` float DEFAULT '0',
  `enter_a` float DEFAULT '0',
  `exit_x` float DEFAULT '0',
  `exit_y` float DEFAULT '0',
  `exit_z` float DEFAULT '0',
  `exit_a` float DEFAULT '0',
  `interior` tinyint(4) DEFAULT '0',
  `virtualworld` int(11) DEFAULT '0',
  `outsideint` tinyint(4) DEFAULT '0',
  `outsidevw` int(11) DEFAULT '0',
  `propertysafe` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT '500',
  PRIMARY KEY (`propertyid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table savlinerpg.property: ~9 rows (approximately)
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` (`propertyid`, `ownerid`, `ownertype`, `ownername`, `type`, `blip`, `speciality`, `propertyname`, `price`, `entryfee`, `locked`, `enter_x`, `enter_y`, `enter_z`, `enter_a`, `exit_x`, `exit_y`, `exit_z`, `exit_a`, `interior`, `virtualworld`, `outsideint`, `outsidevw`, `propertysafe`, `stock`) VALUES
	(1, -1, 1, 'For Sale', 0, 0, 0, 'New Property', 150000, 0, 1, 2015.07, -1732.6, 14.2344, 44.4379, 2524.62, -1679.46, 1015.5, 210.439, 1, 0, 0, 0, 0, 500),
	(7, -1, 0, 'San Andreas Government', 2, 19, 0, 'Los Santos Cityhall', 0, 0, 0, 1481.11, -1771.16, 18.7958, -9.71724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500),
	(8, -1, 0, 'For Sale', 2, 30, 0, 'Los Santos Police Station', 0, 0, 0, 1554.79, -1675.65, 16.1953, 71.1235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500),
	(9, -1, 0, 'Special Weapons and Tactics', 2, 30, 0, 'S.O.B HQ', 0, 0, 0, 1654.28, -1655.71, 22.5156, 158.811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500),
	(10, -1, 0, 'San Andreas Government', 2, 0, 0, 'San Andreas State Prison', 0, 0, 0, 1798.27, -1578.74, 14.0908, -72.7446, 1317.42, -895.336, 7.87138, 1.35118, 0, 0, 0, 0, 0, 500),
	(11, -1, 0, 'San Andreas Banks', 2, 52, 0, 'Los Santos Bank', 0, 0, 0, 1467.3, -1011.05, 26.8438, -167.134, -1737.69, 803.001, 145.133, 179.443, 1, 1, 0, 0, 0, 500),
	(12, -1, 0, 'Emergency Medical Services', 2, 22, 0, 'All Saints General Hospital', 0, 0, 0, 1172.54, -1325.36, 15.404, -87.279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500),
	(13, -1, 0, 'Federal Bureau of Investigation', 2, 30, 0, 'Los Santos Field Office', 0, 0, 0, 1430.68, -1482.14, 20.434, -146.085, 652.654, 2539.87, -89.4064, 267.762, 0, 0, 0, 0, 0, 500),
	(14, -1, 0, 'San Andreas Fire Department', 2, 20, 0, 'Los Santos Fire Station', 0, 0, 0, 1368.35, -1804.19, 13.7347, -94.1119, 1342.45, -1794.73, 967.877, 185.866, 0, 0, 0, 0, 0, 500);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.property_storage
CREATE TABLE IF NOT EXISTS `property_storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `propertyid` int(11) DEFAULT NULL,
  `Acetone` int(11) NOT NULL DEFAULT '0',
  `Calcium` int(11) NOT NULL DEFAULT '0',
  `C4` int(11) NOT NULL DEFAULT '0',
  `Laptop` int(11) NOT NULL DEFAULT '0',
  `Lithium` int(11) NOT NULL DEFAULT '0',
  `Heroin` int(11) NOT NULL DEFAULT '0',
  `Marked_Money` int(11) NOT NULL DEFAULT '0',
  `Meth` int(11) NOT NULL DEFAULT '0',
  `Phone` int(11) NOT NULL DEFAULT '0',
  `Sodium` int(11) NOT NULL DEFAULT '0',
  `Toluene` int(11) NOT NULL DEFAULT '0',
  `Walkie_Talkie` int(11) NOT NULL DEFAULT '0',
  `Water` int(11) NOT NULL DEFAULT '0',
  `Weed` int(11) NOT NULL DEFAULT '0',
  `Weed_Seed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.property_storage: ~1 rows (approximately)
/*!40000 ALTER TABLE `property_storage` DISABLE KEYS */;
INSERT INTO `property_storage` (`ID`, `propertyid`, `Acetone`, `Calcium`, `C4`, `Laptop`, `Lithium`, `Heroin`, `Marked_Money`, `Meth`, `Phone`, `Sodium`, `Toluene`, `Walkie_Talkie`, `Water`, `Weed`, `Weed_Seed`) VALUES
	(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `property_storage` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.users
CREATE TABLE IF NOT EXISTS `users` (
  `Master_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Register_Timestamp` int(11) NOT NULL,
  `PosX` float DEFAULT '1786.3',
  `PosY` float DEFAULT '-1892.1',
  `PosZ` float DEFAULT '13.3939',
  `PosA` float DEFAULT '267.538',
  `Health` float DEFAULT '100',
  `Armour` float NOT NULL DEFAULT '0',
  `ACforced` int(11) NOT NULL DEFAULT '0',
  `OnAc` int(11) NOT NULL DEFAULT '0',
  `Skin` int(11) NOT NULL DEFAULT '26',
  `storeSkin` int(11) NOT NULL DEFAULT '26',
  `Level` int(11) NOT NULL DEFAULT '0',
  `Exp` int(11) NOT NULL DEFAULT '0',
  `Exp_Timestamp` int(11) NOT NULL DEFAULT '0',
  `Money` int(11) DEFAULT '0',
  `Staff` int(11) NOT NULL DEFAULT '0',
  `Chatmode` int(11) DEFAULT '0',
  `PublicChat` int(11) NOT NULL DEFAULT '0',
  `AskChat` int(11) NOT NULL DEFAULT '0',
  `RegisteredIP` varchar(50) DEFAULT NULL,
  `LatestIP` varchar(16) DEFAULT NULL,
  `MaskID` int(11) DEFAULT '0',
  `Accent` int(11) DEFAULT '0',
  `Pms` int(11) NOT NULL DEFAULT '1',
  `Knocked` int(11) DEFAULT '0',
  `KnockedTime` int(11) DEFAULT '0',
  PRIMARY KEY (`Master_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table savlinerpg.users: ~23 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`Master_ID`, `Name`, `Password`, `Registered`, `Register_Timestamp`, `PosX`, `PosY`, `PosZ`, `PosA`, `Health`, `Armour`, `ACforced`, `OnAc`, `Skin`, `storeSkin`, `Level`, `Exp`, `Exp_Timestamp`, `Money`, `Staff`, `Chatmode`, `PublicChat`, `AskChat`, `RegisteredIP`, `LatestIP`, `MaskID`, `Accent`, `Pms`, `Knocked`, `KnockedTime`) VALUES
	(3, 'Ragnarok', '$2y$12$KxLzXFnAbVjgLEDvXErRT.9re0K7sepYYMIZWwtmdUmabtK/pzbkO', '2022-07-05 07:38:13', 0, 1214.67, -1354.29, 13.5743, 226.403, 100, 0, 0, 0, 294, 1, 2, 1, 1659653864, 0, 8, 0, 0, 0, NULL, NULL, NULL, 2, 1, 0, 0),
	(4, 'Diego_Starm', '$2y$12$cVjBUDe3KDHMQCazMUW3U.nYhFBWO0xzmxgZdMCtZPkExrC89LHtO', '2022-07-05 07:38:53', 0, 1496.09, -1626.92, 14.5793, 168.433, 95.05, 0, 0, 0, 301, 1, 5, 7, 1660544795, 0, 8, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, 0),
	(5, 'Chuck_Sharif', '$2y$12$Xlj/bUvBY06uRS2zTCLHb.1PUOzv/TCJxgvNTfnobX.2aMRKyO8P6', '2022-07-09 06:43:17', 0, 1920.04, -1762.56, 13.5391, 99.9507, 70, 0, 0, 0, 2, 1, 1, 1, 1659426624, 0, 6, 1, 0, 0, '39.50.144.232', NULL, NULL, 39, 1, 0, 0),
	(6, 'Victor_Amuso', '$2y$12$YyzLbUvKREW3T1TEZCfVb.lQqyX9afO/kroZUqr1agPucLX5hQHAm', '2022-07-10 04:46:25', 0, 1185.22, -1327.25, 13.5734, 170.532, 100, 0, 0, 0, 26, 1, 0, 0, 0, 0, 7, 0, 0, 0, '127.0.0.1', NULL, NULL, 0, 1, 0, 0),
	(12, 'Dum_Dum', '$2y$12$QDX1RjPocRbzOjW3UCLyROIDw.3BuLVFE..jYcOOtqNLVEPEyloou', '2022-07-12 14:19:11', 0, 1188.92, -1331.41, 13.5609, 199.422, 100, 0, 0, 0, 26, 1, 0, 0, 0, NULL, 0, 0, 0, 0, '127.0.0.1', NULL, NULL, 0, 1, 0, 0),
	(13, 'Time_Line', '$2y$12$RTL2ZTbhXSjtRxbGPiDOLu23GvAMLKEigShPUAakazGjikGIjS/ci', '2022-07-13 19:56:30', 0, 1363.55, -1736.46, 14.7798, 320.956, 96, 0, 0, 0, 26, 1, 3, 1, 1659651364, 0, 6, 0, 0, 0, '24.189.68.62', NULL, NULL, 0, 1, 0, 0),
	(14, 'Galax_One', '$2y$12$KC3GKU7EaivMYx.vLBTuXeY.dFJ3XI1RXKceLbt2DsTIGXw0UrwjS', '2022-07-17 16:35:15', 0, 1762.61, -1857.28, 13.4141, 253.972, 100, 0, 0, 0, 26, 1, 0, 0, 0, 0, 0, 0, 0, 0, '127.0.0.1', NULL, NULL, 0, 1, 0, 0),
	(15, 'Adrian_Lloyd', '$2y$12$OjToZUz1KCHpXhS1cTDGWOxh6LKi9MTVb/qBEGrxFDM3usgFh0Zku', '2022-08-01 00:17:12', 1659338232, 1498.34, -1712.05, 14.5469, 284.912, 100, 0, 0, 0, 26, 26, 0, 0, 1659342365, 0, 0, 0, 0, 0, '192.15.65.229', NULL, 0, 0, 1, 0, 0),
	(16, 'Eren_Jatt', '$2y$12$YzCvYiTkRl/mLRHBPTDYZ./lejkm1q/tk5mb2C2nRZSgGXDeS.MRm', '2022-08-01 01:06:26', 1659341186, 661.211, -1229.64, 15.6028, 111.158, 120, 0, 0, 0, -1048066048, 26, 3, 4, 1659717730, 0, 2, 0, 0, 0, '122.161.73.11', NULL, 0, 21, 1, 0, 0),
	(17, 'Tony_Corleone', '$2y$12$P07DYDL3QCzRTEmwaSvpUep4fZPPFqfuTIdA3a7tquQ10Vs0SCndC', '2022-08-01 06:52:16', 1659361936, 1127.88, 286.879, 22.7003, 90.6052, 100, 0, 0, 0, 26, 26, 3, 4, 1659699739, 0, 0, 0, 0, 0, '109.67.149.18', NULL, 0, 0, 1, 0, 0),
	(18, 'Cadious_Hill', '$2y$12$KyXFKhbTY1LFQyjtbFf0Q.LrF.eLXGOLzUlVu60kX.nky1Cz/Yl7u', '2022-08-01 07:12:53', 1659363173, 1490.86, -1741.43, 13.5469, 320.706, 100, 0, 0, 0, 26, 26, 1, 0, 1659709320, 0, 0, 1, 0, 0, '168.167.80.157', NULL, 0, 0, 1, 0, 0),
	(19, 'Robert_Bundy', '$2y$12$ZUjOWy7USSnzaU7BQSjBaOhalS7/MJbFl8RmaElNtum24Cgz216RG', '2022-08-01 15:22:19', 1659392539, 1786.3, -1892.1, 13.3939, 267.538, 100, 0, 0, 0, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, '173.20.221.143', NULL, 0, 0, 1, 0, 0),
	(20, 'Heywood_Jablowme', '$2y$12$a0PNci74ayPwKEzBK0fBRe2vdfq15WT.XH.6Rr8uuDzGDZa5BFdn.', '2022-08-01 15:26:59', 1659392819, 1951.39, -1762.2, 25.8521, 93.2672, 95, 0, 0, 0, 26, 26, 1, 0, 1659478471, 0, 0, 0, 0, 0, '173.20.221.143', NULL, 0, 0, 1, 0, 0),
	(21, 'Macon_Duncan', '$2y$12$ahj4bCzFaUjualT3USCvP.YNpLNaA6rNn0PgcUcx6/Dbgbomk2Cr.', '2022-08-02 05:16:34', 1659442594, 1183.6, -1324.35, 13.1482, 11.5122, 93.73, 0, 0, 0, 26, 26, 1, 1, 1659782708, 0, 1, 0, 0, 0, '103.174.4.192', NULL, 0, 0, 1, 0, 0),
	(22, 'Limited_Limited', '$2y$12$UUnOMRfVZi3TQiTGQlH0SunubgLSo2nIJeZ1ySVhViMsBM29DXYnu', '2022-08-02 05:18:23', 1659442703, 1786.3, -1892.1, 13.3939, 267.538, 100, 0, 0, 0, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, '46.55.238.91', NULL, 0, 0, 1, 0, 0),
	(23, 'Tony_Corelone', '$2y$12$LVHFXlbAUkLtLjbERFj2SOtvkzidp.hoMRQn4a0aoY7JLpSUuT7De', '2022-08-02 15:22:02', 1659478922, 1786.3, -1892.1, 13.3939, 267.538, 100, 0, 0, 0, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, '109.67.172.178', NULL, 0, 0, 1, 0, 0),
	(24, 'Klido_Skater', '$2y$12$YTDxQzHiZTewYUvFLUW0PexT7qCUnklrCw6sWZBZZmKZPArhfhiq2', '2022-08-03 05:44:59', 1659530699, 1516.58, -1695.92, 13.7969, 343.2, 100, 0, 0, 0, 26, 26, 1, 0, 1659780916, 0, 0, 0, 0, 0, '197.16.67.174', NULL, 0, 0, 1, 0, 0),
	(25, 'Alexander_Carter', '$2y$12$QxGxLlHJbRHIWznQckDsaeeWlofDCW6ItIeNW7dDuf4q6y2jtuPaC', '2022-08-03 13:48:02', 1659559682, 1526.71, -1646.28, 13.3828, 154.578, 100, 0, 0, 0, 261, 26, 3, 2, 1659773826, 0, 1, 0, 0, 0, '83.244.9.187', NULL, 0, 0, 1, 0, 0),
	(26, 'Razen_Malsini', '$2y$12$OznKLiDwMTXYYEvLPU3DTeQnuDZ/poAqPRO6jTe03r5vIwQT25UrO', '2022-08-03 23:34:55', 1659594895, 1435.02, -1562.97, 12.9638, 198.174, 88, 0, 0, 0, 26, 26, 0, 0, 1659609754, 0, 4, 0, 0, 0, '27.61.97.45', NULL, 0, 0, 1, 0, 0),
	(27, 'Luppino_Accardo', '$2y$12$LCnYLSbMYC3uUlezO1K0bend1IVkpk3P2jWyqwXqgJfFml4Whf.RO', '2022-08-04 14:28:38', 1659648518, 2516.18, -1926.17, 12.9704, 289.879, 98, 0, 0, 0, 94, 26, 1, 0, 1659653418, 0, 0, 0, 0, 0, '119.63.138.182', NULL, 0, 0, 1, 0, 0),
	(28, 'Ragnarok_test', '$2y$12$RzHtOUOzaC3IRjDSW1LkT.z3i76biU0K0nmAp.BPDqTURz/.Rcig.', '2022-08-04 16:58:24', 1659657504, 1786.3, -1892.1, 13.3939, 267.538, 100, 0, 0, 0, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, '119.160.64.41', NULL, 0, 0, 1, 0, 0),
	(29, 'Fuji_Wung', '$2y$12$UDDGSCLEXivESRTWa0rLSeSF72NJpOlRbehtLjlo71U.ehM9UTZ0a', '2022-08-05 07:19:42', 1659709182, 1786.3, -1892.1, 13.3939, 267.538, 100, 0, 0, 0, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, '168.167.80.157', NULL, 0, 0, 1, 0, 0),
	(30, 'Theon_Parker', '$2y$12$YhL4R0fzZ0bBQVLQZlTMXe.NeugrLLwDMfX6Ca8QiNAQ7OFsuAI5q', '2022-08-05 13:42:48', 1659732168, 1786.3, -1892.1, 13.3939, 267.538, 100, 0, 0, 0, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, '197.29.169.134', NULL, 0, 0, 1, 0, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `Vehicle_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner_ID` int(11) NOT NULL DEFAULT '-1',
  `Owner_Type` int(11) NOT NULL DEFAULT '0',
  `Lock` int(11) NOT NULL DEFAULT '0',
  `Spawned` int(11) NOT NULL DEFAULT '1',
  `Vehicle_X` float NOT NULL DEFAULT '0',
  `Vehicle_Y` float NOT NULL DEFAULT '0',
  `Vehicle_Z` float NOT NULL DEFAULT '0',
  `Virtual_World` int(11) NOT NULL DEFAULT '0',
  `Plate` varchar(50) NOT NULL DEFAULT 'State',
  `Nitro` int(11) NOT NULL DEFAULT '0',
  `Health` float NOT NULL DEFAULT '1000',
  PRIMARY KEY (`Vehicle_ID`),
  UNIQUE KEY `Vehicle_ID` (`Vehicle_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.vehicle: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.wt_channels
CREATE TABLE IF NOT EXISTS `wt_channels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Channel` int(11) NOT NULL,
  `State` int(11) DEFAULT NULL,
  `Owner` int(11) NOT NULL,
  `Description` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.wt_channels: ~4 rows (approximately)
/*!40000 ALTER TABLE `wt_channels` DISABLE KEYS */;
INSERT INTO `wt_channels` (`ID`, `Channel`, `State`, `Owner`, `Description`) VALUES
	(10, 99, 0, 6, ''),
	(11, 56, 0, 12, ''),
	(12, 1, 0, 4, ''),
	(13, 420, 0, 4, '');
/*!40000 ALTER TABLE `wt_channels` ENABLE KEYS */;

-- Dumping structure for table savlinerpg.wt_members
CREATE TABLE IF NOT EXISTS `wt_members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Master_ID` int(11) NOT NULL,
  `Slot` int(11) NOT NULL,
  `Channel` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table savlinerpg.wt_members: ~12 rows (approximately)
/*!40000 ALTER TABLE `wt_members` DISABLE KEYS */;
INSERT INTO `wt_members` (`ID`, `Master_ID`, `Slot`, `Channel`, `Rank`) VALUES
	(14, 6, 1, 99, 4),
	(18, 6, 2, 56, 0),
	(19, 12, 2, 56, 4),
	(20, 12, 1, 99, 0),
	(22, 4, 1, 1, 4),
	(23, 4, 1, 420, 4),
	(25, 4, 3, 10, 0),
	(26, 13, 1, 420, 3),
	(27, 13, 3, 69, 3),
	(28, 4, 2, 69, 0),
	(29, 14, 1, 99, 0),
	(30, 15, 1, 420, 0);
/*!40000 ALTER TABLE `wt_members` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
