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
  (1,1,'Ceasars Salad','The one Anya eats every day!','8,20','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',0),
  (2,2,'Köttbullar','These round meatballs containing different types of meat.','7,00','d9e0ada312237ed75f5c7d57eb054037d4cb4c8d.png',0),
  (3,3,'Kebab','Sliced down a freshly backed massive piece of meat.','1,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (4,4,'Yogurt','For the slim ones - or the ones who wanna.','15,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (5,5,'Pizza Salami','Dough, some tomatoes with mozarella on top and horse meat inbetween.','1000000','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (6,6,'Vegetarian lasagna','Take away all the good things of a lasagne and you are left with this.','12,99','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (7,7,'Steamed coalfish loin','Browned butter, horseradish, shrimps.','2,99','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (8,8,'Red wine braised ox cheek, baked turnip','Let it sink in and assume its awesome!','3,33','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (9,9,'Chicken Piccata with Pasta','Picata is calf and pasta is pasta add some chicken and there you have it.','6,66','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (10,10,'Mom’s Flank Steak with Whiskey Marinade','I just need the whisky of this, thanks!','8,50','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (11,11,'Meat Loaf','He is not only singing, its also a big piece of meat.','2,11','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (12,12,'Creamy Cajun Chicken Pasta','2 boneless skinless chicken breast halves, cut into thin strips.','5,10','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (13,13,'Pizza','Chose any pizza on the planet, we make it!','7,12','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (14,14,'Pita','Sweet corn, meat and sauce wrapped in some bread.','11,11','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (15,15,'Portobello Mushroom Pizza','Biggest mushroom you have ever seen filled with vegetables.','3,50','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (16,16,'Soup','Water with some taste, yay!','3,50','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (17,17,'Baked Avocado and Egg','Serve with whatever fresh herbs or other toppings.','3,50','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (18,18,'Caprese Melts','Fresh sourdough bread, brushed with olive oil and topped with with basil, tomatoes, and mozzarella cheese.','5,55','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (19,19,'Bouletten','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.','4,44','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (20,10,'Insalata Pizza','With garlic, cheese, onions, tomatoes, olives, and basil.','7,11','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (21,21,'Spaghetti','Native pronounce it spaschetti with meatball, tomatoe sauce.','11,11','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (22,22,'Green Chile-Chicken Casserole','Little bit spicy, a little bit creamy, and a lot filling.','9,99','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (23,23,'German Chocolate Cupcake','Chocolate, caramel more chocolate and less healthy stuff.','9,99','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (24,24,'Persian Love Cake','It is pink, creamy and yummy tasty. Try it!','10,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (25,25,'Fish tacos','Colorful fish tacos, light and easy pastas.','5,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (26,26,'Pesto Chicken Florentine','Extremely rich combination of chicken, spinach and creamy pesto sauce.','5,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (27,27,'Fresh Tomato Salsa','Tomatoes, onion, chili peppers, cilantro, salt, and lime juice.','4,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (28,28,'Pancakes','Pancakes with any topping of your buffet.','5,00','093fe6588c61ad8dcf22b93931cb80798ccb5630.jpg',1),
  (29,29,'Suhsi','Everybody knows what it is and its not enough for anybody.','2,22','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (30,30,'Bones','Hard to bite, hard to takle but full of nutrition.','3,33','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (31,31,'Crostini','For a minorly sesevere starvation, pea & broad bean purée with pecorino','7,77','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1),
  (32,32,'Fish n Chips','Wrapped in a lovely old newspaper we serve originaly old fish with oily chips.','4,00','ea2efc6d7c9e7480ced6098cc006b7d61629cb0e.png',1);

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
  (1,1,'11.968906','57.699718',NULL,'Administrator','administrator','Göteborg',41134,'Vasaplatsen 3'),
  (2,2,'11.967096','57.699641',NULL,'Franks Snackbar','franks-snackbar','Göteborg',41134,'Storgatan 21'),
  (3,3,'11.967462','57.696821',NULL,'Klaus Snackbar','klaussnackbar','Göteborg',41134,'Engelbrektsgatan 6'),
  (4,4,'11.961354','57.692760',NULL,'Dudes Snackbar','dudes-snackbar','Göteborg',41134,'Brunnsgatan 23'),
  (5,5,'11.958177','57.693474',NULL,'Freds Snackbar','freds-snackbar','Göteborg',41134,'Västergatan 11'),
  (6,6,'11.948367','57.696535',NULL,'Bennys Snackbar','bennys-snackbar','Göteborg',41134,'Prinsgatan 42'),
  (7,7,'11.951527','57.699389',NULL,'Gerds Snackbar','gerds-snackbar','Göteborg',41134,'Andra Långgatan 3'),
  (8,8,'11.949818','57.699340',NULL,'Friespalace','fries-palace','Göteborg',41134,'Andra Långgatan 11'),
  (9,9,'11.945449','57.698693',NULL,'Burgerhouse','buerger-house','Göteborg',41134,'Andra Långgatan 30'),
  (10,10,'11.953443','57.693833',NULL,'Kebabplace','kebab-place','Göteborg',41134,'Majorsgatan 10'),
  (11,11,'11.942427','57.695985',NULL,'Thomas Corner','thoams-corner','Göteborg',41134,'Fjällgatan 13'),
  (12,12,'11.928840','57.691754',NULL,'Stephans Taverna','stephan-taverna','Göteborg',41134,'Vingagatan 22'),
  (13,13,'11.976409','57.693644',NULL,'Xenas Sword','xenas-sword','Göteborg',41134,'Gibraltargatan 5'),
  (14,14,'11.976995','57.693143',NULL,'Rottenmeat','rotten-meat','Göteborg',41134,'Gibraltargatan 10'),
  (15,15,'11.977514','57.692475',NULL,'With everything','with-everything','Göteborg',41134,'Gibraltargatan 15'),
  (16,16,'11.986779','57.688250',NULL,'Gregisk Food','grekisk-food','Göteborg',41134,'Lemansgatan 15'),
  (17,17,'11.964565','57.685487',NULL,'Olis Minced Meat Heaven','olis','Göteborg',41134,'Guldhedsgatan 11'),
  (18,18,'11.936503','57.704777',NULL,'At the racing Schnitzel','at-the-racing-snitzel','Göteborg',41134,'Utvecklingsgatan 3'),
  (19,19,'11.940066','57.705702',NULL,'Porno Chips','porno-chips','Göteborg',41134,'Lindholmspiren 23'),
  (20,10,'11.928299','57.707586',NULL,'Salad bar','salad-bar','Göteborg',41134,'Miraplan 11'),
  (21,21,'11.929486','57.708077',NULL,'Saussage Kingdom','saussage-kingdom','Göteborg',41134,'Ceresgatan 11'),
  (22,22,'11.930683','57.705797',NULL,'Le Bistro de la Currwurst','le-bistro','Göteborg',41134,'Förmansgatan 22'),
  (23,23,'12.004393','57.694193',NULL,'Curry Chaos','curry-chaos','Göteborg',41134,'Arbogatan 22'),
  (24,24,'11.909159','57.718018',NULL,'Roadkill Elk','road-kill-elk','Göteborg',41134,'Örebrogatan 22'),
  (25,25,'11.911335','57.722359',NULL,'Booted Cat','booted-cat','Göteborg',41134,'Kalmargatan 11'),
  (26,26,'11.905132','57.716293',NULL,'Foodbar','food-bar','Göteborg',41134,'Baltzersgatan 11'),
  (27,27,'11.882082','57.706925',NULL,'Yummy','yummy','Göteborg',41134,'Ruskvädersgatan 11'),
  (28,28,'11.981521','57.706196',NULL,'Anti Eco','anti-eco','Göteborg',41134,'UIlivigatan 11'),
  (29,29,'11.987599','57.706964',NULL,'Stuff it in','stuff-it-in','Göteborg',41134,'UIlivigatan 21'),
  (30,30,'11.974560','57.708870',NULL,'Schnitzelking','snitzel-king','Göteborg',41134,'UIlivigatan 31'),
  (31,31,'11.976668','57.704439',NULL,'Hot-Chilli-Station','hot-chilli-station','Göteborg',41134,'Nya Allén 23'),
  (32,32,'11.976668','57.704439',NULL,'Mac-Spicy','mac-spicy','Göteborg',41134,'Nya Allén 42'),
  (33,48,'11.976668','57.704439',NULL,'Mac-Tobi','mac-tobi','Göteborg',41134,'Studiegangen 3');

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

INSERT INTO `Users` (`id`, `username`, `fullname`, `email`, `phone`, `mobile`, `password`, `verified`)
  VALUES
  (1,'tobisbuergerisland','Tobis Burgerisland','info@patat.com','+49 89 244 124-0','','51eac6b471a284d3341d8c0c63d0f1a286262a18', 1),
  (2,'frankssnackbar','Franks Snackbar','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (3,'klaussnackbar','Klaus Snackbar','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (4,'duessnackbar','Dudes Snackbar','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (5,'fredssnackbar','Freds Snackbar','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (6,'bennyssnackbar','Bennys Snackbar','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (7,'gerdssnackbar','Gerds Snackbar','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (8,'friespalace','Friesplace','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (9,'buergerhouse','Burgerhouse','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (10,'kebabplace','Kebabplace','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (11,'thoamscorner','Thomas Corner','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (12,'stephantaverna','Stephans Taverna','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (13,'xenassword','Xenas Sword','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (14,'rottenmeat','Rottenmeat','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (15,'witheverything','With everything','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (16,'grekiskfood','Gregisk Food','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (17,'olis','Olis Minced Meat Heaven','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (18,'attheracingsnitzel','At the racing Schnitzel','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (19,'pornochips','Porno Chips','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (20,'saladbar','Salad bar','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (21,'saussagekingdom','Saussage Kingdom','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (22,'lebistro','Le Bistro de la Currwurst','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (23,'currychaos','Curry Chaos','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (24,'roadkillelk','Roadkill Elk','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (25,'bootedcat','Booted Cat','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (26,'foodbar','Foodbar','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (27,'yummy','Yummy','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (28,'antieco','Anti Eco','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (29,'stuffitin','Stuff it in','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (30,'snitzelking','Schnitzelking','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (31,'hotchillistation','Hot-Chilli-Station','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (32,'macspicy','Mac-Spicy','info@patat.com','+49 89 244 124-0',NULL,'40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
  (47,'dolce04','Christian Koch','christian.koch@scandio.de','09892441240','09892441240','262c0d769dfb82c09b39845bf62e951003748251', 1),
  (48,'tdeekens','Tobias Deekens','tobias.deekens@gmail.com','','','40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1);

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table Comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Comments`;

CREATE TABLE `Comments` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`description` varchar(500) NOT NULL,
`creation_date` DATE NOT NULL,
`created_by` INT(11) NOT NULL,
`location_id` INT (11) NULL,
`dish_id` INT(11) NULL,
PRIMARY KEY(`id`),
FOREIGN KEY (`created_by`) REFERENCES Customers(id) ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (`location_id`) REFERENCES Locations(id) ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (`dish_id`) REFERENCES Dishes(id) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
