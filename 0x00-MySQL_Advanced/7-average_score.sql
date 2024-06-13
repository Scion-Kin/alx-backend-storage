-- This script creates a stored procedure that computes and stores the average score for a student. 

DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser$$
CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
    -- Initialize variables
    DECLARE total_score INT;
    DECLARE num_corrections INT;
    SET total_score = 0;
    SET num_corrections = 0;

    -- Calculate total score and count of corrections for the user
    SELECT SUM(score), COUNT(score) INTO total_score, num_corrections FROM corrections WHERE user_id = user_id;

    -- Compute average score and update the user's record
    IF num_corrections > 0 THEN
        UPDATE users SET average_score = total_score / num_corrections WHERE id = user_id;
    ELSE
        UPDATE users SET average_score = 0 WHERE id = user_id; -- Set average to 0 if no corrections
    END IF;

END$$
