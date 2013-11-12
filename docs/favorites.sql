# ------------------------------------------------------------
# Create table to store customer's favorite dishes
# ------------------------------------------------------------
CREATE TABLE Cust_Fav_Dishes (
  id int(11) NOT NULL AUTO_INCREMENT,
  cust_id int(11) NOT NULL,
  dish_id int(11) NOT NULL,
  PRIMARY KEY (id)
);

# ------------------------------------------------------------
# Create table to store customer's favorite locations
# ------------------------------------------------------------
CREATE TABLE Cust_Fav_Location (
  id int(11) NOT NULL AUTO_INCREMENT,
  cust_id int(11) NOT NULL,
  loc_id int(11) NOT NULL,
  PRIMARY KEY (id)
);