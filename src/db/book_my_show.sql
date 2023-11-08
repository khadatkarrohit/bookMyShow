CREATE DATABASE  IF NOT EXISTS `book_my_show` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `book_my_show`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: book_my_show
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking_master`
--

DROP TABLE IF EXISTS `booking_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_master`
--

LOCK TABLES `booking_master` WRITE;
/*!40000 ALTER TABLE `booking_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_hall_master`
--

DROP TABLE IF EXISTS `cinema_hall_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_hall_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `total_seat` varchar(45) DEFAULT NULL,
  `cinema_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_master_fk_idx` (`cinema_master_id`),
  CONSTRAINT `cinema_master_fk` FOREIGN KEY (`cinema_master_id`) REFERENCES `cinema_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_hall_master`
--

LOCK TABLES `cinema_hall_master` WRITE;
/*!40000 ALTER TABLE `cinema_hall_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_hall_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_master`
--

DROP TABLE IF EXISTS `cinema_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `total_cinema_hall` int DEFAULT NULL,
  `city_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_master_fk_idx` (`city_master_id`),
  CONSTRAINT `city_master_fk` FOREIGN KEY (`city_master_id`) REFERENCES `city_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_master`
--

LOCK TABLES `cinema_master` WRITE;
/*!40000 ALTER TABLE `cinema_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_seat_master`
--

DROP TABLE IF EXISTS `cinema_seat_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_seat_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seat_number` int NOT NULL,
  `type` int DEFAULT NULL,
  `cinema_hall_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_hall_master_id_idx` (`cinema_hall_master_id`),
  CONSTRAINT `cinema_hall_master_id` FOREIGN KEY (`cinema_hall_master_id`) REFERENCES `cinema_hall_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_seat_master`
--

LOCK TABLES `cinema_seat_master` WRITE;
/*!40000 ALTER TABLE `cinema_seat_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_seat_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_master`
--

DROP TABLE IF EXISTS `city_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip_code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_master`
--

LOCK TABLES `city_master` WRITE;
/*!40000 ALTER TABLE `city_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_master`
--

DROP TABLE IF EXISTS `movie_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_master`
--

LOCK TABLES `movie_master` WRITE;
/*!40000 ALTER TABLE `movie_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_master`
--

DROP TABLE IF EXISTS `payment_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `booking_master_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_master_id_idx` (`booking_master_id`),
  CONSTRAINT `booking_master_id` FOREIGN KEY (`booking_master_id`) REFERENCES `booking_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_master`
--

LOCK TABLES `payment_master` WRITE;
/*!40000 ALTER TABLE `payment_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_master`
--

DROP TABLE IF EXISTS `show_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_master`
--

LOCK TABLES `show_master` WRITE;
/*!40000 ALTER TABLE `show_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_seat_master`
--

DROP TABLE IF EXISTS `show_seat_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_seat_master`
--

LOCK TABLES `show_seat_master` WRITE;
/*!40000 ALTER TABLE `show_seat_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_seat_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-09  1:49:41
