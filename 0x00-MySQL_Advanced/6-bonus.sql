-- This script creates a stored procedure AddBonus that adds a new correction for a student

DELIMITER $$
DROP PROCEDURE IF EXISTS `AddBonus`$$
CREATE PROCEDURE `AddBonus` (IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN

    DECLARE proj_id INT;
    SELECT id INTO proj_id FROM projects WHERE `name` = project_name;

    -- If the project does not exist, insert it into the projects table and get the project_id
    IF proj_id IS NULL THEN
        INSERT INTO projects (`name`) VALUES (project_name);
        SET proj_id = LAST_INSERT_ID();
    END IF;

    -- Insert or update the correction for the student
    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, proj_id, score)
    ON DUPLICATE KEY UPDATE score = score;

END$$
