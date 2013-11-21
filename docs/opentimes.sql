# ------------------------------------------------------------
# Create table OpenTimes
# ------------------------------------------------------------
CREATE TABLE 'OpenTimes' (
'id' int(11) NOT NULL AUTO_INCREMENT,
'restaurant_id' int(11) NOT NULL,
'week_day' varchar(255) NOT NULL,
'opening_time' int(11) NOT NULL,
'closing_time' int(11) NOT NULL,
PRIMARY KEY ('id')
FOREIGN KEY ('restaurant_id') REFERENCES Locations(id) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



