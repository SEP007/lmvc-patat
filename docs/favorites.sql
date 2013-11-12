# ------------------------------------------------------------
# Create table to store customer's favorite dishes
# ------------------------------------------------------------
CREATE TABLE Cust_Fav_Dishes (
  cust_id int(11) NOT NULL,
  dish_id int(11) NOT NULL,
  PRIMARY KEY (cust_id, dish_id)
);

# ------------------------------------------------------------
# Create table to store customer's favorite locations
# ------------------------------------------------------------
CREATE TABLE Cust_Fav_Location (
  cust_id int(11) NOT NULL,
  loc_id int(11) NOT NULL,
  PRIMARY KEY (cust_id,  loc_id)
);