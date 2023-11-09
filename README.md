# Book My Show Database Structure
Bookmyshow is a ticketing platform where you can book tickets for a movie show.

## Quick Start

```bash
CREATE DATABASE  IF NOT EXISTS `book_my_show` ;
USE `book_my_show`;

DROP TABLE IF EXISTS `booking_master`;

CREATE TABLE `booking_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_of_seat` int NOT NULL,
  `time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_master_id` int NOT NULL,
  `show_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_master_fk_idx` (`user_master_id`),
  KEY `show_master_fk_idx` (`show_master_id`),
  CONSTRAINT `show_master_fk` FOREIGN KEY (`show_master_id`) REFERENCES `show_master` (`id`),
  CONSTRAINT `user_master_fk` FOREIGN KEY (`user_master_id`) REFERENCES `user_master` (`id`)
) ;

DROP TABLE IF EXISTS `cinema_hall_master`;
CREATE TABLE `cinema_hall_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `total_seat` varchar(45) DEFAULT NULL,
  `cinema_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_master_fk_idx` (`cinema_master_id`),
  CONSTRAINT `cinema_master_fk` FOREIGN KEY (`cinema_master_id`) REFERENCES `cinema_master` (`id`)
);

INSERT INTO `cinema_hall_master` VALUES (1,'Screen A','180',1),(2,'Screen B','120',1),(3,'Screen C','150',1),(4,'Screen 1','100',2),(5,'Screen 2','120',2),(6,'Screen 3','160',2),(7,'Screen A','200',3),(8,'Screen Gold','150',4),(9,'Screen Silver','100',4),(10,'Screen A','80',5),(11,'Screen B','250',5),(12,'Screen C','140',5),(13,'Screen A','180',6),(14,'Screen B','120',6),(15,'Screen C','150',7),(16,'Screen A','180',7),(17,'Screen B','120',7);

DROP TABLE IF EXISTS `cinema_master`;

CREATE TABLE `cinema_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `total_cinema_hall` int DEFAULT NULL,
  `city_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_master_fk_idx` (`city_master_id`),
  CONSTRAINT `city_master_fk` FOREIGN KEY (`city_master_id`) REFERENCES `city_master` (`id`)
);

INSERT INTO `cinema_master` VALUES (1,'PVR 1',3,1),(2,'Inox 1',3,1),(3,'Sudama Talkies',1,1),(4,'PVR Cinemas',2,2),(5,'Carnival Cinemas',3,2),(6,'PVR Icon Cinemas',2,3),(7,'Cinepolis Cinema',3,3);

DROP TABLE IF EXISTS `cinema_seat_master`;

CREATE TABLE `cinema_seat_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seat_number` int NOT NULL,
  `type` int DEFAULT NULL,
  `cinema_hall_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_hall_master_id_idx` (`cinema_hall_master_id`),
  CONSTRAINT `cinema_hall_master_id` FOREIGN KEY (`cinema_hall_master_id`) REFERENCES `cinema_hall_master` (`id`)
);

DROP TABLE IF EXISTS `city_master`;

CREATE TABLE `city_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip_code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `city_master` VALUES (1,'Nagpur','Maharashtra','440022'),(2,'Hyderabad','Telangana','500034'),(3,'Mumbai','Maharashtra','400068');

DROP TABLE IF EXISTS `movie_master`;

CREATE TABLE `movie_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `duration` int NOT NULL,
  `language` varchar(45) NOT NULL,
  `release_date` datetime NOT NULL,
  `country` varchar(45) NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `movie_master` VALUES (1,'Animal','test',150,'Hindi','2023-03-25 00:00:00','India','action'),(2,'Godzilla','test',160,'English','2023-04-12 00:00:00','America','adventure'),(3,'Archies','test',145,'Hindi','2023-12-12 00:00:00','India','comedy'),(4,'Bahubali','test',180,'English','2023-01-12 00:00:00','India','action');

DROP TABLE IF EXISTS `payment_master`;

CREATE TABLE `payment_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `booking_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_master_id_idx` (`booking_master_id`),
  CONSTRAINT `booking_master_id` FOREIGN KEY (`booking_master_id`) REFERENCES `booking_master` (`id`)
);

DROP TABLE IF EXISTS `show_master`;

CREATE TABLE `show_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `cinema_hall_master_id` int NOT NULL,
  `movie_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_hall_master_fk_idx` (`cinema_hall_master_id`),
  KEY `movie_master_fk_idx` (`movie_master_id`),
  CONSTRAINT `cinema_hall_master_fk` FOREIGN KEY (`cinema_hall_master_id`) REFERENCES `cinema_hall_master` (`id`),
  CONSTRAINT `movie_master_fk` FOREIGN KEY (`movie_master_id`) REFERENCES `movie_master` (`id`)
);

INSERT INTO `show_master` VALUES (1,'2023-09-11 00:00:00','2023-09-11 12:00:00','2023-09-11 14:30:00',1,1),(2,'2023-09-11 00:00:00','2023-09-11 10:00:00','2023-09-11 12:30:00',8,1),(3,'2023-09-11 00:00:00','2023-09-11 14:00:00','2023-09-11 16:30:00',15,1),(4,'2023-09-11 00:00:00','2023-09-11 12:00:00','2023-09-11 14:40:00',1,2),(5,'2023-09-12 00:00:00','2023-09-11 10:00:00','2023-09-11 12:40:00',8,2),(6,'2023-09-12 00:00:00','2023-09-11 14:00:00','2023-09-11 16:40:00',15,2);

DROP TABLE IF EXISTS `show_seat_master`;

CREATE TABLE `show_seat_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int DEFAULT NULL,
  `price` int NOT NULL,
  `cinema_seat_master_id` int NOT NULL,
  `show_master_id` int NOT NULL,
  `booking_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_seat_master_idx` (`cinema_seat_master_id`),
  KEY `show_master_fk_idx` (`show_master_id`),
  KEY `booking_master_id_idx` (`booking_master_id`),
  CONSTRAINT `booking_fk` FOREIGN KEY (`booking_master_id`) REFERENCES `booking_master` (`id`),
  CONSTRAINT `cinema_mast_fk` FOREIGN KEY (`cinema_seat_master_id`) REFERENCES `cinema_seat_master` (`id`),
  CONSTRAINT `show_mast_fk` FOREIGN KEY (`show_master_id`) REFERENCES `show_master` (`id`)
);

DROP TABLE IF EXISTS `user_master`;

CREATE TABLE `user_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int DEFAULT '1',
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`)
);
```
