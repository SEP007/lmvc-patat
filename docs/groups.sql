# ------------------------------------------------------------
# Update values in the table Groups
# ------------------------------------------------------------

LOCK TABLES Groups WRITE;

# ------------------------------------------------------------
# Change group name from Users to Restaurants
# ------------------------------------------------------------
UPDATE Groups
SET group_name='Restaurant'
WHERE group_name='User';

# ------------------------------------------------------------
# Add new group for Customers
# ------------------------------------------------------------
INSERT INTO Groups(id, group_name)
  VALUES (3, 'Customer');

UNLOCK TABLES;