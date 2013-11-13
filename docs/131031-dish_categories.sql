# Create table Categories
# ------------------------------------------------------------

CREATE TABLE `Categories` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Prefill table Categories
# ------------------------------------------------------------

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

# Update table Dishes
# ------------------------------------------------------------

ALTER TABLE `Dishes`
ADD COLUMN category_id int(11) NULL,
ADD FOREIGN KEY (category_id) REFERENCES categories(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;
