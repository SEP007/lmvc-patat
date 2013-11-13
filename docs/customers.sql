# ------------------------------------------------------------
# Create table Customers
# ------------------------------------------------------------
CREATE TABLE Customers (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES Users (id)
  ON DELETE CASCADE
);