# ------------------------------------------------------------
# Add a new column to the Users table
# to check if user email has been verified
# ------------------------------------------------------------

LOCK TABLES Users WRITE;

# ------------------------------------------------------------
# Add new column `verified`
# ------------------------------------------------------------
ALTER TABLE Users
  ADD verified TINYINT(1) NOT NULL DEFAULT 0;

# ------------------------------------------------------------
# Update every existing user to have verified email
# ------------------------------------------------------------
UPDATE Users
  SET verified = 1;

UNLOCK TABLES;