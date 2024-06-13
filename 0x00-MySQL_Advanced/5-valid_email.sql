-- This script creates a trigger that resets the attribute valid_email only when the email has been changed

DELIMITER $$
CREATE TRIGGER `reset` BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
NEW.valid_email = 0;
END$$
