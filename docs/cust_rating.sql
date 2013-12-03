# ------------------------------------------------------------
# Create table Cust_Dish_Rating
# ------------------------------------------------------------
CREATE TABLE Cust_Dish_Rating (
  dish_id int(11) NOT NULL,
  cust_id int(11) NOT NULL,
  rating int(11) NULL,
  PRIMARY KEY (dish_id, cust_id),
  FOREIGN KEY (cust_id) REFERENCES Customers (id)
  ON UPDATE CASCADE
  ON DELETE RESTRICT,
  FOREIGN KEY (Dish_id) REFERENCES Dishes (id)
  ON UPDATE CASCADE
  ON DELETE RESTRICT
);
# ------------------------------------------------------------
# Update table Dishes
# ------------------------------------------------------------

ALTER TABLE `Dishes`
ADD COLUMN avg_rating DECIMAL(3,2) NULL;

ALTER TABLE `Dishes`
ADD COLUMN num_votes int(11) NULL;

# ------------------------------------------------------------
# Create table Cust_Location_Rating
# ------------------------------------------------------------
CREATE TABLE Cust_Location_Rating (
  location_id int(11) NOT NULL,
  cust_id int(11) NOT NULL,
  rating int(11) NULL,
  PRIMARY KEY (location_id, cust_id),
  FOREIGN KEY (cust_id) REFERENCES Customers (id)
  ON UPDATE CASCADE
  ON DELETE RESTRICT,
  FOREIGN KEY (location_id) REFERENCES Locations (id)
  ON UPDATE CASCADE
  ON DELETE RESTRICT
);
# ------------------------------------------------------------
# Update table Locations
# ------------------------------------------------------------

ALTER TABLE `Locations`
ADD COLUMN avg_rating DECIMAL(3,2) NULL;

ALTER TABLE `Locations`
ADD COLUMN num_votes int(11) NULL;