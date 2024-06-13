-- This script creates an index on the table names and the first letter of name and the score

CREATE INDEX idx_name_first_score ON names (names(1), score);
