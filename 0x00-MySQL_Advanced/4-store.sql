-- This script creates a trigger that decreases the quantity of an item after adding a new order

CREATE TRIGGER `decrease` AFTER INSERT ON orders 
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - 1
    WHERE items.name = NEW.item_name
END;