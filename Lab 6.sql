use sakila;

-- Add the new table from 2020
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- Enable local_infile
show variables like 'local_infile';
set global local_infile = 1;

-- Load data from CSV into the new table
load local data by ?? -- no idea how to put this
into table films_2020
fields terminated by ',' enclosed by '"'
lines terminated by '\n'
ignore 1 rows; -- Skip header row if it exists in your CSV

-- Update rental_duration
update films_2020 set rental_duration = 3, rental_rate = 2.99, replacement_cost = 8.99 where release_year = 2020;

