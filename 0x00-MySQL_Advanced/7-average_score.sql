-- This script creates a stored procedure that computes and stores the average score for a student. 

DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser$$
CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
    DECLARE total_score INT DEFAULT 0;
    DECLARE num_corrections INT DEFAULT 0;

    -- Calculate total score and count of corrections for the user
    SELECT SUM(score), COUNT(score) INTO total_score, num_corrections FROM corrections WHERE corrections.user_id = user_id;

    UPDATE users SET users.average_score = IF(num_corrections = 0, 0, total_score / num_corrections) WHERE users.id = user_id;

END$$
