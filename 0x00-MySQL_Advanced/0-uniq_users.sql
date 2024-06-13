-- This creates a users table for any database

CREATE TABLE IF NOT EXISTS `users` (`id` INT AUTOINCREMENT NOT NULL PRIMARY KEY,
`email` VARCHAR(255) NOT NULL UNIQUE, `name` VARCHAR(255))
