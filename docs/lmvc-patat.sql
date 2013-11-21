# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.12)
# Database: lmvc_patat
# Generation Time: 2013-07-23 12:48:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# Dump of table Categories
# ------------------------------------------------------------

CREATE TABLE `Categories` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;

INSERT INTO `Categories` (`id`, `name`)
VALUES
(1, 'Pasta'),
(2, 'Salad'),
(3, 'Meat'),
(4, 'Fish');

/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table Dishes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Dishes`;

CREATE TABLE `Dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `price` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT '',
  `advertised` int(1) NOT NULL,
  `category_id` int(11) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`category_id`) REFERENCES Categories(id) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Dishes` WRITE;
/*!40000 ALTER TABLE `Dishes` DISABLE KEYS */;

INSERT INTO `Dishes` (`id`, `user_id`, `name`, `description`, `price`, `img`, `advertised`)
  VALUES
  (1,1,'Haxe','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','8,20','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',0),
  (2,2,'Pommes','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','7,00','d9e0ada312237ed75f5c7d57eb054037d4cb4c8d.png',0),
  (3,3,'Döner','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','1,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (4,4,'Yogurt','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','15,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (5,5,'Eine Gurke','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','1000000','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (6,6,'Ne Karotte','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','12,99','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (7,7,'Dörum','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','2,99','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (8,8,'Ein ganzes Schwein','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','3,33','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (9,9,'Zeugs','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','6,66','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (10,10,'Bratwurst','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','8,50','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (11,11,'Gyros','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','2,11','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (12,12,'Schnitzel','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','5,10','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (13,13,'Pizza','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','7,12','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (14,14,'Pita','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','11,11','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (15,15,'Halbe Hahn','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','3,50','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (16,16,'Suppe','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','3,50','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (17,17,'Kroketten','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','3,50','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (18,18,'Dicke lange Fritten','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','5,55','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (19,19,'Bouletten','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','4,44','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (20,10,'Salat','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','7,11','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (21,21,'Spaghetti','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','11,11','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (22,22,'Nudelauflauf','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','9,99','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (23,23,'Nudeln','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','9,99','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (24,24,'Döner','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','10,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (25,25,'Döner','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','5,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (26,26,'Yogurt','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','5,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (27,27,'Tasse Milch','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','4,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (28,28,'Haufen Pommes','Ein langes, dickes Stück Haxe mit lecker Kartoffeln min Jung!','5,00','093fe6588c61ad8dcf22b93931cb80798ccb5630.jpg',1),
  (29,29,'Yammi Nudeln','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','2,22','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (30,30,'Knochen','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','3,33','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (31,31,'Eisbein','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','7,77','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (32,32,'Patat','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','4,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (35,2,'Aal','Lange geräucherter Aal!','2,99','beee441151efccd47d3eb2758b4648054fae7c26.jpg',1),
  (36,2,'Haxe','... auch bei uns endlich Haxe!','3,99','39f6f89ebf36f2682dab16bd0147e009dc63cbae.jpg',1),
  (37,40,'Nudeln','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','3,00','94bd4c52608def1edee92a8a336b67dfa07a7e24.jpg',1),
  (38,47,'Zigarette','Tja schnorren ist aus der Mode\r\n','1','02bc4627fc6c69f6558ca88ee0df3c5442ad5e88.jpg',1),
  (39,47,'Venn','Na ja ganz schön teuer ;:- /\\','3','b8546556f73c5b536643d1acb64862fa0f03c91b.jpg',1),
  (40,48,'Ein Konzert?','Geht\'er ab?....','3',NULL,1);

/*!40000 ALTER TABLE `Dishes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Groups`;

CREATE TABLE `Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;

INSERT INTO `Groups` (`id`, `group_name`)
  VALUES
  (1,'Admin'),
  (2,'User');

/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Locations`;

CREATE TABLE `Locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `longitude` varchar(255) NOT NULL DEFAULT '',
  `latitude` varchar(255) NOT NULL,
  `accuracy` varchar(255) DEFAULT '',
  `restaurant` varchar(255) DEFAULT NULL,
  `handle` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip` int(15) NOT NULL,
  `street` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;

INSERT INTO `Locations` (`id`, `user_id`, `longitude`, `latitude`, `accuracy`, `restaurant`, `handle`, `city`, `zip`, `street`)
  VALUES
  (1,1,'11.9406886','57.7074251','24','Administrator','administrator','München',81829,'In der Rosenau 6'),
  (2,2,'11.9406886','57.7074251','24','Franks Imbiss','franks-imbiss','München',81829,'In der Rosenau 6'),
  (3,3,'11.9406886','57.7074251','24','Klaus Imbiss','klausimbiss','München',81829,'In der Rosenau 6'),
  (4,4,'11.9406886','57.7074251','24','Dudes Imbiss','dudes-imbiss','München',81829,'In der Rosenau 6'),
  (5,5,'11.9406886','57.7074251','24','Freds Imbiss','freds-imbiss','München',81829,'In der Rosenau 6'),
  (6,6,'11.9406886','57.7074251','24','Bennys Imbiss','bennys-imbiss','München',81829,'In der Rosenau 6'),
  (7,7,'11.9406886','57.7074251','24','Gerds Imbiss','gerds-imbiss','München',81829,'In der Rosenau 6'),
  (8,8,'11.9406886','57.7074251','24','Friddenbude','friddenbude','München',81829,'In der Rosenau 6'),
  (9,9,'11.9406886','57.7074251','24','Burgerhaus','burgerhaus','München',81829,'In der Rosenau 6'),
  (10,10,'11.9406886','57.7074251','24','Dönerladen','doenerladen','München',81829,'In der Rosenau 6'),
  (11,11,'11.9406886','57.7074251','24','Thomas Ecke','thomas-ecke','München',81829,'In der Rosenau 6'),
  (12,12,'11.9406886','57.7074251','24','Stephans Tränke','stephans-traenke','München',81829,'In der Rosenau 6'),
  (13,13,'11.9406886','57.7074251','24','Xenas Schwert','xenas-schwert','München',81829,'In der Rosenau 6'),
  (14,14,'11.9406886','57.7074251','24','Gammelfleisch','gammelfleisch','München',81829,'In der Rosenau 6'),
  (15,15,'11.9406886','57.7074251','24','Mit allem','mit-allem','München',81829,'In der Rosenau 6'),
  (16,16,'11.9406886','57.7074251','24','Gregisk Food','gregisk-food','München',81829,'In der Rosenau 6'),
  (17,17,'11.9406886','57.7074251','24','Olis Hackepeter Heaven','olis-hackepeter-heaven','München',81829,'In der Rosenau 6'),
  (18,18,'11.9406886','57.7074251','24','Zum rasenden Schnitzel','zum-rasenden-schnitzel','München',81829,'In der Rosenau 6'),
  (19,19,'11.9406886','57.7074251','24','Pornöse Pommes','pornoese-pommes','München',81829,'In der Rosenau 6'),
  (20,10,'11.9406886','57.7074251','24','Zum lachenden Leberkäse','zum-lachenden-leberkaese','München',81829,'In der Rosenau 6'),
  (21,21,'11.9406886','57.7074251','24','Königreich Knackwurst','koenigreich-knackwurst','München',81829,'In der Rosenau 6'),
  (22,22,'11.9406886','57.7074251','24','Le Bistro de la Currwurst','le-bistro-de-la-currywurst','München',81829,'In der Rosenau 6'),
  (23,23,'11.9406886','57.7074251','24','Curry Chaos','curry-chaos','München',81829,'In der Rosenau 6'),
  (24,24,'11.9406886','57.7074251','24','Zum überfahrenen Reh','zum-ueberfahrenen-reh','München',81829,'In der Rosenau 6'),
  (25,25,'11.9406886','57.7074251','24','Zum gestiefelten Kater','zum-gestiefelten-kater','München',81829,'In der Rosenau 6'),
  (26,26,'11.9406886','57.7074251','24','Futterbar','futterbar','München',81829,'In der Rosenau 6'),
  (27,27,'11.9406886','57.7074251','24','Iss Lecker','iss-lecker','München',81829,'In der Rosenau 6'),
  (28,28,'11.9406886','57.7074251','24','Anti Bio','anti-bio','München',81829,'In der Rosenau 6'),
  (29,29,'11.9406886','57.7074251','24','Stopf Rein','stopf-rein','München',81829,'In der Rosenau 6'),
  (30,30,'11.9406886','57.7074251','24','Schnitzelkönig','schnitzelkoenig','München',81829,'In der Rosenau 6'),
  (31,31,'11.9406886','57.7074251','24','Hot-Chilli-Station','hot-chilli-station','München',81829,'In der Rosenau 6'),
  (32,32,'11.9406886','57.7074251','24','Mac-Scharf','mac-scharf','München',81829,'In der Rosenau 6');

/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Roles`;

CREATE TABLE `Roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;

INSERT INTO `Roles` (`id`, `role_name`)
  VALUES
  (1,'Read'),
  (2,'Edit'),
  (3,'Delete');

/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User_to_Groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User_to_Groups`;

CREATE TABLE `User_to_Groups` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User_to_Groups` WRITE;
/*!40000 ALTER TABLE `User_to_Groups` DISABLE KEYS */;

INSERT INTO `User_to_Groups` (`user_id`, `group_id`)
  VALUES
  (1,1),
  (1,2);

/*!40000 ALTER TABLE `User_to_Groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User_to_Roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User_to_Roles`;

CREATE TABLE `User_to_Roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User_to_Roles` WRITE;
/*!40000 ALTER TABLE `User_to_Roles` DISABLE KEYS */;

INSERT INTO `User_to_Roles` (`user_id`, `role_id`)
  VALUES
  (1,1),
  (1,2),
  (1,3);

/*!40000 ALTER TABLE `User_to_Roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT 'NOT NULL',
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`id`, `username`, `fullname`, `email`, `phone`, `mobile`, `password`)
  VALUES
  (1,'tobisbuergerinsel','Tobis Burgerinsel','info@buergerinsel.de','+49 89 244 124-0','','51eac6b471a284d3341d8c0c63d0f1a286262a18'),
  (2,'franksimbiss','Franks Imbiss','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (3,'klausimbiss','Klaus Imbiss','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (4,'duesimbiss','Dudes Imbiss','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (5,'fredsimbiss','Freds Imbiss','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (6,'bennysimbiss','Bennys Imbiss','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (7,'gerdsimbiss','Gerds Imbiss','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (8,'frittenbude','Friddenbude','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (9,'buergerhaus','Burgerhaus','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (10,'doenerladen','Dönerladen','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (11,'thoamsecke','Thomas Ecke','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (12,'stephanstraenke','Stephans Tränke','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (13,'xenasschwert','Xenas Schwert','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (14,'gammelfleisch','Gammelfleisch','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (15,'mitallem','Mit allem','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (16,'grekiskfood','Gregisk Food','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (17,'olis','Olis Hackepeter Heaven','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (18,'zumrasendenschnitzel','Zum rasenden Schnitzel','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (19,'pornoesepommes','Pornöse Pommes','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (20,'zumlachendenleberkaese','Zum lachenden Leberkäse','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (21,'koenigreichknackwurst','Königreich Knackwurst','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (22,'lebistro','Le Bistro de la Currwurst','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (23,'currychaos','Curry Chaos','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (24,'zumueberfahrenenreh','Zum überfahrenden Reh','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (25,'zumgestiefeltenkater','Zum gestiefelten Kater','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (26,'futterbar','Futterbar','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (27,'isslecker','Iss Lecker','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (28,'antibio','Anti Bio','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (29,'stopfrein','Stopf Rein','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (30,'snitzelkoenig','Schnitzelkönig','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (31,'hotchillistation','Hot-Chilli-Station','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (32,'macscharf','Mac-Scharf','info@scandio.de','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
  (47,'dolce04','Christian Koch','christian.koch@scandio.de','09892441240','09892441240','262c0d769dfb82c09b39845bf62e951003748251'),
  (48,'tdeekens','Tobias Deekens','tobias.deekens@gmail.com','','','40bd001563085fc35165329ea1ff5c5ecbdbbeef');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
