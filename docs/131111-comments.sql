# Create table Comments
# ------------------------------------------------------------

CREATE TABLE `Comments` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`description` varchar(5000) NOT NULL,
`creation_date` DATE NOT NULL,
`created_by` INT(11) NOT NULL,
`location_id` INT (11) NULL,
`dish_id` INT(11) NULL,
PRIMARY KEY(`id`),
FOREIGN KEY (`created_by`) REFERENCES Customers(id) ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (`location_id`) REFERENCES Locations(id) ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (`dish_id`) REFERENCES Dishes(id) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;