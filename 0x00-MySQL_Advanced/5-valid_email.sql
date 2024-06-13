-- This script creates a trigger that resets the attribute valid_email only when the email has been changed

DELIMITER $$
CREATE TRIGGER `reset` AFTER UPDATE ON users
FOR EACH ROW
BEGIN
UPDATE users
SET valid_email = 0
WHERE id = NEW.id;
END$$
