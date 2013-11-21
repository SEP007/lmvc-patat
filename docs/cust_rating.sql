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

# Update table Dishes
# ------------------------------------------------------------

ALTER TABLE `Dishes`
ADD COLUMN rating DECIMAL(3,2) NULL;

ALTER TABLE `Dishes`
ADD COLUMN num_rates int(11) NULL;