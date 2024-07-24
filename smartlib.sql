-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Library_management_system
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.20.04.3

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) DEFAULT NULL,
  `author_img` varchar(255) DEFAULT NULL,
  `author_desc` text,
  `creadted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Don Norman\n','/uploads/auth.webp','Donald Arthur Norman is an American researcher, professor, and author. Norman is the director of The Design Lab at University of California, San Diego. He is best known for his books on design, especially The Design of Everyday Things. ','2024-04-15 06:54:21',NULL),(2,'collan hover','/uploads/auth.webp','She is currently best fiction writer in newyork times .','2024-04-15 06:54:21',NULL),(3,'Munshi Prem Chand','image.png','Premchand worked as a teacher until 1921, when he joined Mohandas K. Gandhi\'s \nNoncooperation Movement. As a writer, he first gained renown for his Urdu-language novels and short \nstories. Except in Bengal, the short story had not been an accepted literary form in northern \nIndia until Premchand\'s works appeared','2024-04-20 06:03:50',NULL),(4,'Chitra Banerjee','image.png','She is a Professor of Creative Writing at Houston University and has \ntaught at Diablo College and Foothill College in California','2024-04-20 06:03:50',NULL),(5,'Héctor García','image.png','Héctor García and Francesc Miralles are the coauthors of The Book of Ichigo Ichie and The Four-Way Path. Héctor is a citizen of Japan, where he has lived for over a \ndecade, and is the author of A Geek in Japan, a #1 bestseller in Japan.','2024-04-20 06:03:50',NULL),(6,'Mayur Kalbag','image.png','Mayur Vivek Kalbag is one of the \'leading international trainers\' from Mumbai, India. He has been imparting his knowledge and skills on subjects related to Management Development, Advanced leadership & enhancing Organizational\n Productivity through Human Capital Development since the past 20 years.','2024-04-20 06:03:50',NULL);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_author`
--

DROP TABLE IF EXISTS `books_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_author` (
  `books_author_id` int NOT NULL AUTO_INCREMENT,
  `prime_book_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  PRIMARY KEY (`books_author_id`),
  KEY `prime_book_id` (`prime_book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_author_ibfk_1` FOREIGN KEY (`prime_book_id`) REFERENCES `books_detail` (`prime_book_id`) ON DELETE CASCADE,
  CONSTRAINT `books_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_author`
--

LOCK TABLES `books_author` WRITE;
/*!40000 ALTER TABLE `books_author` DISABLE KEYS */;
INSERT INTO `books_author` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,1),(5,5,1),(6,7,1),(7,8,5),(8,6,3);
/*!40000 ALTER TABLE `books_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_detail`
--

DROP TABLE IF EXISTS `books_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_detail` (
  `prime_book_id` int NOT NULL AUTO_INCREMENT,
  `book_title` varchar(255) DEFAULT NULL,
  `book_desc` text,
  `genre_id` int DEFAULT NULL,
  `book_img` varchar(255) DEFAULT NULL,
  `book_publication` varchar(255) DEFAULT NULL,
  `book_publication_year` year DEFAULT NULL,
  `book_ISBN` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT NULL,
  `books_lang` varchar(255) DEFAULT NULL,
  `total_book` int DEFAULT NULL,
  `remaining_book` int DEFAULT NULL,
  `isdeleted` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`prime_book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_detail`
--

LOCK TABLES `books_detail` WRITE;
/*!40000 ALTER TABLE `books_detail` DISABLE KEYS */;
INSERT INTO `books_detail` VALUES (1,'The Design of Everyday Things','The Design of Everyday Things is a best-selling book by cognitive scientist and usability engineer Donald Norman about how design serves as the communication between object and user, and how to optimize that conduit of communication in order to make the experience of using the object pleasurable.',6,'/uploads/image.png','Basic Books',1988,'978-0-465-06710-7','2024-04-15 06:49:46',NULL,'English',NULL,NULL,0,'0000-00-00 00:00:00'),(2,'Palace of illusion','This book containes the story of mahabharata from Draupadi\'s point of view',1,'/uploads/related1.jpg','Pan Macmillan India',2008,'asddf','2024-04-15 06:49:46',NULL,'English',NULL,NULL,0,'0000-00-00 00:00:00'),(3,'Aghori','This book describe about the mystries life of aghories',2,'/uploads/related2.jpg','	Mayur Kalbag',2022,'dfgf','2024-04-15 06:49:46',NULL,'English',NULL,NULL,0,'0000-00-00 00:00:00'),(4,'Ikigai','The Japanese Secret to a Long and Happy Life',3,'/uploads/related3.jpg','sadffh',2017,'sdfgd','2024-04-15 06:49:46',NULL,'English',NULL,NULL,0,'0000-00-00 00:00:00'),(5,'Push ki raat',' This is the story of a tenant farmer named Halku and his plight against land lordship prevalent in those times',4,'/uploads/related4.jpg','Raj Shree Prakashan',2016,'asffdf','2024-04-15 06:49:46',NULL,'English',NULL,NULL,0,'0000-00-00 00:00:00'),(6,'never never','this is fiction book.',5,'/uploads/related5.png','newyorkbook',2022,'uhfsduoihfvoidshv','2024-04-15 06:49:46',NULL,'English',NULL,NULL,0,'0000-00-00 00:00:00'),(7,'La Psicologia de Los Objetos Cotidianos','Sorprendente la exactitud con la que el autor precio en futuro. Leer el libro más de 15 años después de ser escrito y ver cómo el autor no solo adivino el futuro sino que los errores de diseño que predijo son cierto hace que el libro sea muy ilustrativo',6,'/uploads/la_psico_.jpg','Editorial Nerea,',2014,'8489569185','2024-04-18 12:09:43',NULL,'Spanish',NULL,NULL,0,'0000-00-00 00:00:00'),(8,'Design for a Better World','Design for a Better World',1,'/uploads/designforworld.jpg','The MIT Press ',NULL,' ‎ 0262047950','2024-04-18 12:13:17',NULL,' ‎ English',NULL,NULL,0,'0000-00-00 00:00:00'),(9,'atomic habits','tisjcndivnhsduigvuidghfffffffasdfuhsdfuihsduivfhsuidfvhfuidvhuidfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',5,'/uploads/image-1714030105619-257312306-imresizer-1714030089227.jpg','JAMES CLEAR',2020,'123456pqrs','2024-04-25 07:28:25',NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `books_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_log`
--

DROP TABLE IF EXISTS `books_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_log` (
  `borrowed_id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `borrow_date` timestamp NULL DEFAULT NULL,
  `return_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`borrowed_id`),
  KEY `reader_id` (`reader_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `books_log_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `books_log_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `inventory` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_log`
--

LOCK TABLES `books_log` WRITE;
/*!40000 ALTER TABLE `books_log` DISABLE KEYS */;
INSERT INTO `books_log` VALUES (1,1,1,'2024-04-10 05:47:54','2024-04-24 14:08:04','return','2024-04-10 05:47:54','2024-04-24 14:08:04'),(2,22,3,'2024-04-01 05:47:54','2024-04-24 14:09:14','return','2024-04-10 05:47:54','2024-04-24 14:09:14'),(4,4,11,'2024-04-10 05:47:54','2024-04-24 14:41:43','return','2024-04-10 05:47:54','2024-04-24 14:41:43'),(5,5,15,'2024-04-10 05:47:54','2024-04-25 05:22:11','return','2024-04-10 05:47:54','2024-04-25 05:22:11'),(6,22,4,'2024-04-15 06:47:54','2024-05-01 08:52:38','return','2024-04-15 06:47:54','2024-05-01 08:52:38'),(7,22,12,'2024-04-14 06:47:54',NULL,'pending','2024-04-14 06:47:54','2024-04-14 06:47:54'),(8,22,17,'2024-03-13 06:47:54',NULL,'pending','2024-03-13 06:47:54','2024-03-13 06:47:54'),(9,22,22,'2024-04-12 06:47:54',NULL,'pending','2024-04-12 06:47:54','2024-04-12 06:47:54'),(10,22,26,'2024-04-12 06:47:54',NULL,'pending','2024-04-12 06:47:54','2024-04-12 06:47:54'),(11,22,27,'2024-04-11 06:47:54',NULL,'pending','2024-04-11 06:47:54','2024-04-11 06:47:54'),(12,1,7,'2024-04-20 06:12:33','2024-04-24 14:08:09','return','2024-04-20 06:12:33','2024-04-24 14:08:09'),(14,1,17,'2024-04-20 06:12:33',NULL,'pending','2024-04-20 06:12:33','2024-04-20 06:12:33'),(15,22,21,'2024-04-20 06:12:33',NULL,'pending','2024-04-20 06:12:33','2024-04-20 06:12:33'),(20,3,1,'2024-04-20 06:12:38',NULL,'return','2024-04-20 06:12:38','2024-04-20 06:12:38'),(22,3,6,'2024-04-20 06:12:38',NULL,'pending','2024-04-20 06:12:38','2024-04-20 06:12:38'),(24,5,15,'2024-04-20 06:12:38',NULL,'pending','2024-04-20 06:12:38','2024-04-20 06:12:38'),(25,10,28,NULL,NULL,'return','2024-04-29 09:47:08','2024-04-29 09:47:08');
/*!40000 ALTER TABLE `books_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`comment_id`),
  KEY `reader_id` (`reader_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `inventory` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,'is it worth reading,i want ot read it again so i can understand more and get  deep learning of design modules.','2024-03-15 11:45:37','2024-04-15 11:45:37'),(2,2,1,'Very nice book','2024-02-15 11:46:01','2024-04-15 11:46:01'),(3,3,1,'good book','2024-04-15 11:53:27','2024-04-15 11:53:27'),(4,4,1,'is it helpful to youngstors','2024-01-15 11:53:53','2024-04-15 11:53:53'),(5,1,1,'hdfkgsvgdfyhvg','2024-05-15 11:53:53','2024-04-19 09:42:22'),(6,2,1,'erwerttyiuoipoipodcvdfsvgfdghbfgh','2024-07-15 11:53:53','2024-04-19 09:42:22'),(7,6,1,'bhangarrrrrr book che','2024-04-19 13:39:33','2024-04-19 13:39:33'),(8,6,1,'','2024-04-20 09:53:45','2024-04-20 09:53:45'),(15,2,1,'hi this is book','2024-04-24 13:27:36','2024-04-24 13:27:36'),(16,10,1,'hi','2024-04-24 13:51:06','2024-04-24 13:51:06'),(17,10,1,'this is very good book','2024-04-24 14:35:06','2024-04-24 14:35:06'),(18,10,1,'dfghdh','2024-04-29 04:31:18','2024-04-29 04:31:18'),(19,10,5,'hi','2024-04-29 06:07:23','2024-04-29 06:07:23'),(20,10,8,'this is design book','2024-04-29 06:14:03','2024-04-29 06:14:03'),(21,10,2,'heyy','2024-04-29 06:14:21','2024-04-29 06:14:21'),(22,7,3,'hellu','2024-04-29 09:54:53','2024-04-29 09:54:53'),(23,7,3,'nice book','2024-04-29 09:56:23','2024-04-29 09:56:23'),(24,10,3,'this','2024-04-29 10:07:56','2024-04-29 10:07:56'),(25,10,3,'avc','2024-04-29 10:08:41','2024-04-29 10:08:41'),(26,10,3,'csdvzsvzv','2024-04-29 10:09:15','2024-04-29 10:09:15'),(27,10,3,'abcd','2024-04-29 10:13:03','2024-04-29 10:13:03'),(28,10,3,'cxv scv sdvds','2024-04-29 10:14:03','2024-04-29 10:14:03'),(29,10,3,'4545858588','2024-04-29 10:15:55','2024-04-29 10:15:55'),(30,7,3,'bro','2024-04-29 11:29:33','2024-04-29 11:29:33'),(31,7,3,'bye','2024-04-29 11:30:12','2024-04-29 11:30:12'),(32,7,3,'this is Coment','2024-04-29 11:31:13','2024-04-29 11:31:13'),(33,7,3,'yah','2024-04-29 11:33:12','2024-04-29 11:33:12'),(34,7,3,'socket is working','2024-04-29 11:35:26','2024-04-29 11:35:26'),(35,7,3,'ok now socket is working or not','2024-04-29 11:37:19','2024-04-29 11:37:19'),(36,7,3,'ok user','2024-04-29 11:40:23','2024-04-29 11:40:23'),(37,10,2,'This is very nice book to read and i enjoyed a lot.','2024-04-29 11:52:51','2024-04-29 11:52:51'),(38,10,2,'hi','2024-04-29 11:55:01','2024-04-29 11:55:01'),(39,10,2,'dyhvdhvsivb','2024-04-29 11:55:35','2024-04-29 11:55:35'),(40,10,2,'5636546546546','2024-04-29 11:55:47','2024-04-29 11:55:47'),(41,10,3,'heyy bro','2024-04-29 11:59:17','2024-04-29 11:59:17'),(42,10,3,'ergrgthfnhdghndghmnhgmhjmh','2024-04-29 12:00:08','2024-04-29 12:00:08'),(43,10,3,'12345678910','2024-04-29 12:01:48','2024-04-29 12:01:48'),(44,7,4,'hi','2024-04-29 12:04:35','2024-04-29 12:04:35'),(45,7,4,'214254','2024-04-29 12:04:48','2024-04-29 12:04:48'),(46,7,4,'369','2024-04-29 12:05:07','2024-04-29 12:05:07'),(47,7,4,'693','2024-04-29 12:05:27','2024-04-29 12:05:27'),(48,7,4,'hi','2024-04-29 12:06:11','2024-04-29 12:06:11'),(49,7,4,'this','2024-04-29 12:07:38','2024-04-29 12:07:38'),(50,7,4,'514','2024-04-29 12:09:28','2024-04-29 12:09:28'),(51,7,4,'hey','2024-04-29 12:11:41','2024-04-29 12:11:41'),(52,7,4,'this','2024-04-29 12:12:06','2024-04-29 12:12:06'),(53,7,4,'frgdfgdfvgdf','2024-04-29 12:12:40','2024-04-29 12:12:40'),(54,7,4,'vvvvvvvvvvvvvv','2024-04-29 12:13:11','2024-04-29 12:13:11'),(55,10,2,'ji','2024-04-29 12:20:05','2024-04-29 12:20:05'),(56,10,2,'dascfsdvfsd','2024-04-29 12:20:49','2024-04-29 12:20:49'),(57,10,2,'bhfgbnfnnn','2024-04-29 12:21:16','2024-04-29 12:21:16'),(58,10,2,'vdfvdfbb','2024-04-29 12:22:10','2024-04-29 12:22:10'),(59,10,2,'kukuikuikuik','2024-04-29 12:23:29','2024-04-29 12:23:29'),(60,10,2,'123456789','2024-04-29 12:25:21','2024-04-29 12:25:21'),(61,10,2,'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqq','2024-04-29 12:25:49','2024-04-29 12:25:49'),(62,10,2,'7777777777777777','2024-04-29 12:26:09','2024-04-29 12:26:09'),(63,10,5,'book','2024-04-29 12:33:25','2024-04-29 12:33:25'),(64,10,1,'hey whatsup bro','2024-04-29 12:37:07','2024-04-29 12:37:07'),(65,10,3,'nice book','2024-04-30 04:20:20','2024-04-30 04:20:20'),(66,10,7,'bhuuoi','2024-04-30 05:19:20','2024-04-30 05:19:20'),(67,10,1,'1212121212','2024-04-30 06:32:41','2024-04-30 06:32:41'),(68,10,1,'vsdvdffdfgbhghbfgh','2024-04-30 06:32:55','2024-04-30 06:32:55'),(69,7,7,'hi this is bhavin','2024-04-30 07:19:02','2024-04-30 07:19:02'),(70,10,1,'cghjdtuk','2024-04-30 14:39:02','2024-04-30 14:39:02'),(71,7,2,'xfgnjhxfghnjfj111111111','2024-05-01 05:27:59','2024-05-01 05:27:59'),(72,10,7,'hi','2024-05-01 06:01:29','2024-05-01 06:01:29'),(73,10,8,'Alex is commenting','2024-05-01 06:06:00','2024-05-01 06:06:00'),(74,1,1,'nice book','2024-05-24 04:19:00','2024-05-24 04:19:00'),(75,1,1,'fghfghfgh','2024-05-24 04:25:05','2024-05-24 04:25:05'),(76,1,1,'fhfghfghfg','2024-05-24 04:25:07','2024-05-24 04:25:07'),(77,3,3,'5','2024-05-24 05:28:50','2024-05-24 05:28:50');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `upload_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `isliked` tinyint(1) DEFAULT '0',
  `uploaded_text` varchar(255) DEFAULT NULL,
  `uploaded_filepath` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`upload_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `community_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,1,0,'hhhhhhhhhhhhh','','2024-05-03 06:32:24',NULL),(2,3,0,'good morning','','2024-05-03 06:35:03',NULL),(3,3,0,'nice to meet you all','/comuploads/1714718124685-stranj-1.jpg','2023-05-03 06:35:24',NULL),(8,1,0,NULL,'','2024-05-24 05:50:07',NULL);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contributed_books`
--

DROP TABLE IF EXISTS `contributed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contributed_books` (
  `contributed_id` int NOT NULL AUTO_INCREMENT,
  `contributed_book_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contributed_id`),
  KEY `user_id` (`user_id`),
  KEY `contributed_book_id` (`contributed_book_id`),
  CONSTRAINT `contributed_books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `contribution` (`user_id`),
  CONSTRAINT `contributed_books_ibfk_2` FOREIGN KEY (`contributed_book_id`) REFERENCES `books_detail` (`prime_book_id`),
  CONSTRAINT `contributed_books_ibfk_3` FOREIGN KEY (`contributed_id`) REFERENCES `contribution` (`contro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contributed_books`
--

LOCK TABLES `contributed_books` WRITE;
/*!40000 ALTER TABLE `contributed_books` DISABLE KEYS */;
INSERT INTO `contributed_books` VALUES (2,1,1,'2024-04-18 04:07:35',NULL),(3,6,1,'2024-04-18 04:07:35',NULL);
/*!40000 ALTER TABLE `contributed_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribution`
--

DROP TABLE IF EXISTS `contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribution` (
  `contro_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `reason_id` int DEFAULT NULL,
  `sel_cat` varchar(255) DEFAULT NULL,
  `sel_lan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contro_id`),
  KEY `user_id` (`user_id`),
  KEY `reason_id` (`reason_id`),
  CONSTRAINT `contribution_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `contribution_ibfk_2` FOREIGN KEY (`reason_id`) REFERENCES `reasonforcontro` (`reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution`
--

LOCK TABLES `contribution` WRITE;
/*!40000 ALTER TABLE `contribution` DISABLE KEYS */;
INSERT INTO `contribution` VALUES (1,'the core',10,'alert newton',5,'Design','English','2024-04-17 12:45:04',NULL),(2,'the design of everyday things',2,'Don Norman',3,'Design','English','2024-04-18 04:05:35',NULL),(3,'the design of everyday things',2,'Don Norman',3,'Design','English','2024-04-18 04:06:13',NULL),(4,'the design of everyday things',1,'Don Norman',3,'Design','English','2024-04-18 04:07:04',NULL),(5,'never never',1,'collan hover',2,'fiction','English','2024-04-18 04:07:04',NULL),(6,'rasdhar',1,'zaverchand meghani',6,'Fantasy','English','2024-04-18 06:29:24',NULL),(7,'science',1,'sdsdv sdvdv',4,'Design','Spanish','2024-04-18 07:13:42',NULL),(8,'november 9',1,'dv dvdfv',2,'Fantasy','English','2024-04-18 07:28:01',NULL),(9,'manni ni bhavai',1,'pannalal patel',2,'Fantasy','English','2024-04-23 06:46:00',NULL),(10,'The lion King',1,'Donovan Arthur',4,'Fantasy','English','2024-04-24 14:36:44',NULL);
/*!40000 ALTER TABLE `contribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Fiction','2024-04-15 06:39:31','2024-04-15 06:39:31'),(2,'Noval','2024-04-15 06:39:31','2024-04-15 06:39:31'),(3,'Mystry','2024-04-15 06:39:31','2024-04-15 06:39:31'),(4,'Thriller','2024-04-15 06:39:31','2024-04-15 06:39:31'),(5,'Horror','2024-04-15 06:39:31','2024-04-15 06:39:31'),(6,'Design','2024-04-15 06:39:31','2024-04-15 06:39:31');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `prime_book_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT NULL,
  `availability_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `prime_book_id` (`prime_book_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`prime_book_id`) REFERENCES `books_detail` (`prime_book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,'2024-04-15 07:09:44',NULL,'0'),(2,2,'2024-04-15 12:30:37',NULL,'0'),(3,3,'2024-04-15 12:30:46',NULL,'0'),(4,4,'2024-04-15 12:30:53',NULL,'0'),(5,4,'2024-04-15 12:30:57',NULL,'0'),(6,4,'2024-04-15 12:30:58',NULL,'0'),(7,3,'2024-04-15 12:31:02',NULL,'0'),(8,1,'2024-04-15 12:31:02',NULL,'0'),(9,7,'2024-04-15 12:31:02',NULL,'0'),(10,2,'2024-04-10 05:47:54',NULL,'0'),(11,3,'2024-04-10 05:47:54',NULL,'0'),(12,3,'2024-04-10 05:47:54',NULL,'0'),(13,3,'2024-04-10 05:47:54',NULL,'0'),(14,3,'2024-04-10 05:47:54',NULL,'0'),(15,3,'2024-04-10 05:47:54',NULL,'0'),(16,4,'2024-04-10 05:47:54',NULL,'0'),(17,4,'2024-04-10 05:47:54',NULL,'0'),(18,4,'2024-04-10 05:47:54',NULL,'0'),(19,4,'2024-04-10 05:47:54',NULL,'0'),(20,4,'2024-04-10 05:47:54',NULL,'0'),(21,5,'2024-04-10 05:47:54',NULL,'0'),(22,5,'2024-04-10 05:47:54',NULL,'0'),(23,5,'2024-04-10 05:47:54',NULL,'0'),(24,5,'2024-04-10 05:47:54',NULL,'0'),(25,5,'2024-04-10 05:47:54',NULL,'0'),(26,6,'2024-04-10 05:47:54',NULL,'0'),(27,7,'2024-04-10 05:47:54',NULL,'0'),(28,8,'2024-04-10 05:47:54',NULL,'0');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `lang_id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempt`
--

DROP TABLE IF EXISTS `login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempt` (
  `attempt_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `login_timestamp` timestamp NULL DEFAULT NULL,
  `login_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attempt_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_attempt_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempt`
--

LOCK TABLES `login_attempt` WRITE;
/*!40000 ALTER TABLE `login_attempt` DISABLE KEYS */;
INSERT INTO `login_attempt` VALUES (1,8,NULL,'1'),(2,8,NULL,'1'),(3,8,NULL,'0'),(4,8,NULL,'1'),(5,9,NULL,'1'),(6,10,NULL,'1'),(7,10,NULL,'1'),(8,10,NULL,'1'),(9,10,NULL,'1'),(10,10,NULL,'1'),(11,10,NULL,'1'),(12,10,NULL,'1'),(13,2,NULL,'1'),(14,10,NULL,'1'),(15,2,NULL,'1'),(16,2,NULL,'1'),(17,2,NULL,'1'),(18,10,NULL,'1'),(19,10,NULL,'1'),(20,10,NULL,'1'),(21,2,NULL,'1'),(22,2,NULL,'1'),(23,2,NULL,'1'),(24,10,NULL,'1'),(25,2,NULL,'1'),(26,10,NULL,'1'),(27,10,NULL,'1'),(28,2,NULL,'1'),(29,10,NULL,'0'),(30,10,NULL,'1'),(31,12,NULL,'1'),(32,2,NULL,'1'),(33,10,NULL,'1'),(34,2,NULL,'1'),(35,2,NULL,'1'),(36,10,NULL,'1'),(37,10,NULL,'1'),(38,2,NULL,'1'),(39,10,NULL,'1'),(40,10,NULL,'1'),(41,10,NULL,'1'),(42,2,NULL,'1'),(43,10,NULL,'1'),(44,2,NULL,'1'),(45,2,NULL,'1'),(46,10,NULL,'1'),(47,10,NULL,'1'),(48,2,NULL,'1'),(49,10,NULL,'1'),(50,10,NULL,'1'),(51,10,NULL,'1'),(52,10,NULL,'1'),(53,10,NULL,'1'),(54,10,NULL,'1'),(55,10,NULL,'1'),(56,10,NULL,'0'),(57,10,NULL,'1'),(58,10,NULL,'1'),(59,2,NULL,'1'),(60,10,NULL,'1'),(61,2,NULL,'1'),(62,10,NULL,'1'),(63,2,NULL,'1'),(64,10,NULL,'1'),(65,7,NULL,'1'),(66,7,NULL,'1'),(67,2,NULL,'1'),(68,7,NULL,'1'),(69,10,NULL,'1'),(70,7,NULL,'1'),(71,10,NULL,'1'),(72,7,NULL,'1'),(73,10,NULL,'1'),(74,10,NULL,'0'),(75,10,NULL,'0'),(76,10,NULL,'1'),(77,10,NULL,'1'),(78,10,NULL,'1'),(79,7,NULL,'1'),(80,10,NULL,'1'),(81,10,NULL,'1'),(82,10,NULL,'1'),(83,2,NULL,'1'),(84,10,NULL,'1'),(85,10,NULL,'1'),(86,10,NULL,'1'),(87,10,NULL,'1'),(88,10,NULL,'1'),(89,10,NULL,'1'),(90,10,NULL,'1'),(91,2,NULL,'1'),(92,10,NULL,'1'),(93,10,NULL,'1'),(94,7,NULL,'1'),(95,2,NULL,'1'),(96,10,NULL,'1'),(97,10,NULL,'1'),(98,2,NULL,'1'),(99,10,NULL,'1'),(100,2,NULL,'1'),(101,2,NULL,'0'),(102,2,NULL,'1'),(103,2,NULL,'1'),(104,10,NULL,'1'),(105,10,NULL,'1'),(106,10,NULL,'1'),(107,2,NULL,'1'),(108,10,NULL,'1'),(109,7,NULL,'1'),(110,10,NULL,'1'),(111,10,NULL,'1'),(112,2,NULL,'1'),(113,10,NULL,'1'),(114,2,NULL,'1'),(115,10,NULL,'1'),(116,10,NULL,'1'),(117,10,NULL,'1'),(118,2,NULL,'1'),(119,10,NULL,'1'),(120,10,NULL,'1'),(121,10,NULL,'1'),(122,2,NULL,'1'),(123,10,NULL,'1'),(124,2,NULL,'1'),(125,2,NULL,'1'),(126,10,NULL,'1'),(127,7,NULL,'1'),(128,2,NULL,'1'),(129,10,NULL,'1'),(130,2,NULL,'1'),(131,10,NULL,'1'),(132,7,NULL,'1'),(133,2,NULL,'1'),(134,10,NULL,'1'),(135,10,NULL,'1'),(136,7,NULL,'1'),(137,10,NULL,'1'),(138,2,NULL,'1'),(139,2,NULL,'1'),(140,10,NULL,'1'),(141,10,NULL,'1'),(142,10,NULL,'1'),(143,2,NULL,'1'),(144,10,NULL,'1'),(145,10,NULL,'1'),(146,2,NULL,'1'),(147,10,NULL,'1'),(148,10,NULL,'1'),(149,2,NULL,'1'),(150,10,NULL,'1'),(151,10,NULL,'1'),(152,2,NULL,'1'),(153,10,NULL,'1'),(154,2,NULL,'1'),(155,1,NULL,'0'),(156,10,NULL,'1'),(157,10,NULL,'1'),(158,10,NULL,'1'),(159,2,NULL,'1'),(160,10,NULL,'1'),(161,2,NULL,'1'),(162,10,NULL,'0'),(163,10,NULL,'0'),(164,1,NULL,'0'),(165,10,NULL,'1'),(166,1,NULL,'1'),(167,1,NULL,'1'),(168,2,NULL,'1'),(169,16,NULL,'1'),(170,16,NULL,'1'),(171,3,NULL,'1'),(172,1,NULL,'1'),(173,2,NULL,'1'),(174,1,NULL,'1'),(175,2,NULL,'1'),(176,3,NULL,'1'),(177,3,NULL,'1'),(178,3,NULL,'1'),(179,1,NULL,'1'),(180,16,NULL,'1'),(181,4,NULL,'1'),(182,3,NULL,'1'),(183,1,NULL,'1'),(184,2,NULL,'1'),(185,4,NULL,'1'),(186,2,NULL,'1'),(187,4,NULL,'1'),(188,3,NULL,'1'),(189,4,NULL,'1'),(190,3,NULL,'1'),(191,4,NULL,'1'),(192,1,NULL,'1'),(193,3,NULL,'1'),(194,4,NULL,'1'),(195,2,NULL,'1'),(196,3,NULL,'1'),(197,1,NULL,'1'),(198,2,NULL,'1'),(199,2,NULL,'1'),(200,3,NULL,'1'),(201,2,NULL,'1'),(202,3,NULL,'1'),(203,1,NULL,'1'),(204,3,NULL,'1'),(205,4,NULL,'1'),(206,4,NULL,'1'),(207,3,NULL,'1'),(208,2,NULL,'1'),(209,3,NULL,'1'),(210,2,NULL,'1'),(211,3,NULL,'1'),(212,2,NULL,'1'),(213,3,NULL,'1'),(214,1,NULL,'1'),(215,2,NULL,'1'),(216,3,NULL,'1'),(217,3,NULL,'1'),(218,2,NULL,'1'),(219,3,NULL,'1'),(220,2,NULL,'1'),(221,3,NULL,'1'),(222,3,NULL,'1'),(223,3,NULL,'1'),(224,2,NULL,'1'),(225,3,NULL,'1'),(226,1,NULL,'1'),(227,4,NULL,'1'),(228,2,NULL,'1'),(229,3,NULL,'1'),(230,2,NULL,'1'),(231,3,NULL,'1'),(232,2,NULL,'1'),(233,3,NULL,'1'),(234,3,NULL,'1'),(235,3,NULL,'1'),(236,3,NULL,'1'),(237,3,NULL,'1'),(238,1,NULL,'1'),(239,3,NULL,'1'),(240,3,NULL,'1'),(241,3,NULL,'1'),(242,3,NULL,'1'),(243,1,NULL,'1'),(244,1,NULL,'1'),(245,1,NULL,'1'),(246,21,NULL,'1'),(247,3,NULL,'1'),(248,1,NULL,'1'),(249,1,NULL,'1'),(250,1,NULL,'1'),(251,1,NULL,'1'),(252,1,NULL,'1'),(253,1,NULL,'1'),(254,1,NULL,'1'),(255,1,NULL,'1'),(256,1,NULL,'1'),(257,1,NULL,'1'),(258,1,NULL,'1'),(259,1,NULL,'1'),(260,1,NULL,'1'),(261,1,NULL,'1'),(262,1,NULL,'1'),(263,1,NULL,'1'),(264,1,NULL,'1'),(265,22,NULL,'1'),(266,22,NULL,'1'),(267,1,NULL,'1'),(268,1,NULL,'1'),(269,1,NULL,'1'),(270,1,NULL,'1'),(271,1,NULL,'1');
/*!40000 ALTER TABLE `login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_master`
--

DROP TABLE IF EXISTS `login_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_master` (
  `attempt_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `login_timestamp` timestamp NULL DEFAULT (now()),
  `login_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attempt_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_master_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_master`
--

LOCK TABLES `login_master` WRITE;
/*!40000 ALTER TABLE `login_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  `send_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_1_idx` (`ticket_id`),
  CONSTRAINT `fk_message_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (45,288579,'hii','2024-04-30 06:40:07',1),(46,288579,'ya tell me your issue','2024-04-30 06:40:21',12),(47,288579,'i have design issur','2024-04-30 06:40:33',1),(48,288579,'media query is not support','2024-04-30 06:40:48',1),(49,288579,'it show non data','2024-04-30 06:41:01',1),(50,288579,'can you fixed it','2024-04-30 06:41:12',1),(51,288579,'let me check','2024-04-30 06:41:21',12),(52,288579,'please wait for some time','2024-04-30 06:41:31',12),(53,288579,'user','2024-04-30 13:26:28',2),(54,766824,'hi','2024-05-01 04:34:42',2),(55,192629,'vdfvdb','2024-05-01 12:16:53',10),(56,288579,'hello','2024-05-02 06:37:23',10),(57,766824,'yes','2024-05-02 07:27:53',10),(58,288579,'yessssss','2024-05-02 07:28:40',2),(59,288579,'tell me your query','2024-05-02 07:28:50',2),(60,940299,'hello','2024-05-02 10:43:59',4),(61,940299,'yesss plz say','2024-05-02 10:44:35',2),(62,553838,'heyyyyyyyy','2024-05-03 06:32:44',1),(63,630903,'yes this is launched yesterday wait ','2024-05-03 06:40:31',2),(64,590566,'yes sure why not','2024-05-03 06:41:04',2);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nested_comments`
--

DROP TABLE IF EXISTS `nested_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nested_comments` (
  `nested_comment_id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `nested_comment` varchar(255) DEFAULT NULL,
  `reader_id` int DEFAULT NULL,
  `oncommented_reader_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nested_comment_id`),
  KEY `comment_id` (`comment_id`),
  KEY `book_id` (`book_id`),
  KEY `reader_id` (`reader_id`),
  CONSTRAINT `nested_comments_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`),
  CONSTRAINT `nested_comments_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `inventory` (`book_id`),
  CONSTRAINT `nested_comments_ibfk_3` FOREIGN KEY (`reader_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nested_comments`
--

LOCK TABLES `nested_comments` WRITE;
/*!40000 ALTER TABLE `nested_comments` DISABLE KEYS */;
INSERT INTO `nested_comments` VALUES (1,1,1,'yes,it is woth reading',3,1,'2024-03-15 11:45:37',NULL),(2,1,1,'yes,very much',5,2,'2024-03-15 11:45:37',NULL),(3,1,1,'dvsvsdv',1,1,'2024-03-15 11:45:37',NULL),(4,1,1,'iiiiiiiiiiii',2,1,'2024-03-15 11:45:37',NULL),(5,1,1,'jjjjjjjjjjjjjjjj',3,1,'2024-03-15 11:45:37',NULL),(6,1,1,'lllllllllllllll',4,1,'2024-03-15 11:45:37',NULL),(8,2,1,'abcdefght',4,2,'2024-03-15 11:45:37',NULL),(9,2,1,'jfnhdjkvgnhdfvbhndfubh',2,2,'2024-09-15 11:45:37',NULL),(10,2,1,'jfnhdjkvgnhdfvbhndfubh',3,2,'2024-09-15 11:45:37',NULL),(11,7,1,'emm',1,NULL,'2024-09-15 11:45:37',NULL),(12,7,1,'emm',1,NULL,'2024-09-15 11:45:37',NULL),(13,8,1,'kaik comment amr bhai ',1,NULL,NULL,NULL),(14,8,1,'kaik comment amr bhai ',1,NULL,NULL,NULL),(15,6,1,'aavi comment na hoy ',1,NULL,NULL,NULL),(16,6,1,'aavi comment na hoy ',1,NULL,NULL,NULL),(17,7,1,'bow saru',1,NULL,'2024-04-20 11:25:45',NULL),(18,6,1,'erfgfgsdfgbsfgbfgb',1,NULL,'2024-04-20 11:26:43',NULL),(19,1,1,'bdfgbdfgbgf',10,NULL,'2024-04-25 05:14:43',NULL),(20,19,5,'hello',10,NULL,'2024-04-29 06:07:35',NULL),(21,19,5,'ok',10,NULL,'2024-04-29 12:34:55',NULL),(22,19,5,'done',10,NULL,'2024-04-29 12:35:05',NULL),(23,19,5,'done',10,NULL,'2024-04-29 12:35:09',NULL),(24,19,5,'this',10,NULL,'2024-04-29 12:35:28',NULL),(25,63,5,'hi',10,NULL,'2024-04-29 12:35:41',NULL),(26,64,1,'nothing bro',10,NULL,'2024-04-29 12:37:28',NULL),(27,64,1,'65165651465',10,NULL,'2024-04-29 12:37:48',NULL),(28,65,3,'efvefvergbegbeg',10,NULL,'2024-04-30 04:20:39',NULL),(29,65,3,'5275427542752',10,NULL,'2024-04-30 04:20:55',NULL),(30,65,3,'fgjmsrtgnhsrtoi',10,NULL,'2024-04-30 04:21:13',NULL),(31,66,7,'hi',7,NULL,'2024-04-30 07:19:10',NULL),(32,1,1,'hi',10,NULL,'2024-05-01 05:50:39',NULL),(33,69,7,'ih',10,NULL,'2024-05-01 06:02:00',NULL),(34,73,8,'hi this is bhavin',7,NULL,'2024-05-01 06:23:45',NULL),(35,1,1,'69521',10,NULL,'2024-05-01 08:17:01',NULL),(36,71,2,'ftyhfghfgh',10,NULL,'2024-05-02 06:50:00',NULL);
/*!40000 ALTER TABLE `nested_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notify_id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isSeen` int DEFAULT '0',
  `isDeleted` int DEFAULT '0',
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`notify_id`),
  KEY `reader_id` (`reader_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `inventory` (`book_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,10,4,'Dear reader you have borrowed a book named Ikigai on 2024-04-20 you have return book in 0 days otherwise you will penalized with 5rps per day','2024-04-24 11:40:57',0,1,'2024-04-24 13:31:33'),(2,10,14,'Dear reader you have borrowed a book named Aghori on 2024-04-20 you have return book in 0 days otherwise you will penalized with 5rps per day','2024-04-24 11:40:57',1,1,'2024-04-24 13:31:33'),(3,10,19,'Dear reader you have borrowed a book named Ikigai on 2024-04-20 you have return book in 0 days otherwise you will penalized with 5rps per day','2024-04-24 11:40:57',1,1,'2024-04-24 13:31:33'),(4,10,1,'Dear reader you have borrowed a book named The Design of Everyday Things on 2024-04-20 you have return book in 0 days otherwise you will penalized with 5rps per day','2024-04-24 11:40:57',1,1,'2024-04-24 13:31:33'),(5,10,3,'Dear reader you have borrowed a book named Aghori on 2024-04-20 you have return book in 0 days otherwise you will penalized with 5rps per day','2024-04-24 11:40:57',0,1,'2024-04-24 13:31:33'),(6,10,4,'Dear user you have been penalized with Rs 5 for not returning book Ikigai which you have issued on 2024-04-20, you 1 late from the due date','2024-04-25 05:04:25',1,0,NULL),(7,10,14,'Dear user you have been penalized with Rs 5 for not returning book Aghori which you have issued on 2024-04-20, you 1 late from the due date','2024-04-25 05:04:25',1,0,NULL),(8,10,19,'Dear user you have been penalized with Rs 5 for not returning book Ikigai which you have issued on 2024-04-20, you 1 late from the due date','2024-04-25 05:04:25',0,0,NULL),(9,10,1,'Dear user you have been penalized with Rs 5 for not returning book The Design of Everyday Things which you have issued on 2024-04-20, you 1 late from the due date','2024-04-25 05:04:25',0,0,NULL),(10,10,3,'Dear user you have been penalized with Rs 5 for not returning book Aghori which you have issued on 2024-04-20, you 1 late from the due date','2024-04-25 05:04:25',1,0,NULL),(11,2,12,'Dear user you have been penalized with Rs 5 for not returning book Aghori which you have issued on 2024-04-14, you 1 late from the due date','2024-04-25 05:54:20',0,0,NULL),(12,2,17,'Dear user you have been penalized with Rs 5 for not returning book Ikigai which you have issued on 2024-03-13, you 1 late from the due date','2024-04-25 05:54:20',0,0,NULL),(13,2,22,'Dear user you have been penalized with Rs 5 for not returning book Push ki raat which you have issued on 2024-04-12, you 1 late from the due date','2024-04-25 05:54:20',0,0,NULL),(14,2,26,'Dear user you have been penalized with Rs 5 for not returning book never never which you have issued on 2024-04-12, you 1 late from the due date','2024-04-25 05:54:20',0,0,NULL),(15,2,27,'Dear user you have been penalized with Rs 5 for not returning book La Psicologia de Los Objetos Cotidianos which you have issued on 2024-04-11, you 1 late from the due date','2024-04-25 05:54:20',0,0,NULL),(16,10,4,'Dear user you have been penalized with Rs 25 for not returning book Ikigai which you have issued on 2024-04-20, you 5 late from the due date','2024-04-29 03:57:35',1,0,NULL),(17,10,14,'Dear user you have been penalized with Rs 25 for not returning book Aghori which you have issued on 2024-04-20, you 5 late from the due date','2024-04-29 03:57:36',1,0,NULL),(18,10,19,'Dear user you have been penalized with Rs 25 for not returning book Ikigai which you have issued on 2024-04-20, you 5 late from the due date','2024-04-29 03:57:36',0,0,NULL),(19,10,1,'Dear user you have been penalized with Rs 25 for not returning book The Design of Everyday Things which you have issued on 2024-04-20, you 5 late from the due date','2024-04-29 03:57:36',0,0,NULL),(20,10,3,'Dear user you have been penalized with Rs 25 for not returning book Aghori which you have issued on 2024-04-20, you 5 late from the due date','2024-04-29 03:57:36',0,0,NULL),(21,10,4,'Dear user you have been penalized with Rs 30 for not returning book Ikigai which you have issued on 2024-04-20, you 6 late from the due date','2024-04-30 04:34:49',0,0,NULL),(22,10,14,'Dear user you have been penalized with Rs 30 for not returning book Aghori which you have issued on 2024-04-20, you 6 late from the due date','2024-04-30 04:34:49',0,0,NULL),(23,10,19,'Dear user you have been penalized with Rs 30 for not returning book Ikigai which you have issued on 2024-04-20, you 6 late from the due date','2024-04-30 04:34:49',0,0,NULL),(24,10,1,'Dear user you have been penalized with Rs 30 for not returning book The Design of Everyday Things which you have issued on 2024-04-20, you 6 late from the due date','2024-04-30 04:34:49',0,0,NULL),(25,10,3,'Dear user you have been penalized with Rs 30 for not returning book Aghori which you have issued on 2024-04-20, you 6 late from the due date','2024-04-30 04:34:49',0,0,NULL),(26,10,4,'Dear user you have been penalized with Rs 35 for not returning book Ikigai which you have issued on 2024-04-20, you 7 late from the due date','2024-05-01 04:03:53',0,0,NULL),(27,10,14,'Dear user you have been penalized with Rs 35 for not returning book Aghori which you have issued on 2024-04-20, you 7 late from the due date','2024-05-01 04:03:53',1,0,NULL),(28,10,19,'Dear user you have been penalized with Rs 35 for not returning book Ikigai which you have issued on 2024-04-20, you 7 late from the due date','2024-05-01 04:03:53',1,0,NULL),(29,10,1,'Dear user you have been penalized with Rs 35 for not returning book The Design of Everyday Things which you have issued on 2024-04-20, you 7 late from the due date','2024-05-01 04:03:53',1,0,NULL),(30,10,3,'Dear user you have been penalized with Rs 35 for not returning book Aghori which you have issued on 2024-04-20, you 7 late from the due date','2024-05-01 04:03:53',1,1,'2024-05-01 04:07:56'),(31,2,12,'Dear user you have been penalized with Rs 65 for not returning book Aghori which you have issued on 2024-04-14, you 13 late from the due date','2024-05-01 04:35:09',0,0,NULL),(32,2,17,'Dear user you have been penalized with Rs 225 for not returning book Ikigai which you have issued on 2024-03-13, you 45 late from the due date','2024-05-01 04:35:09',0,0,NULL),(33,2,22,'Dear user you have been penalized with Rs 75 for not returning book Push ki raat which you have issued on 2024-04-12, you 15 late from the due date','2024-05-01 04:35:09',0,0,NULL),(34,2,26,'Dear user you have been penalized with Rs 75 for not returning book never never which you have issued on 2024-04-12, you 15 late from the due date','2024-05-01 04:35:09',0,0,NULL),(35,2,27,'Dear user you have been penalized with Rs 80 for not returning book La Psicologia de Los Objetos Cotidianos which you have issued on 2024-04-11, you 16 late from the due date','2024-05-01 04:35:09',0,0,NULL),(36,10,19,'Dear user you have been penalized with Rs 40 for not returning book Ikigai which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 06:28:07',0,0,NULL),(37,10,1,'Dear user you have been penalized with Rs 40 for not returning book The Design of Everyday Things which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 06:28:07',0,0,NULL),(38,10,3,'Dear user you have been penalized with Rs 40 for not returning book Aghori which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 06:28:07',0,0,NULL),(39,1,12,'Dear user you have been penalized with Rs 40 for not returning book Aghori which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 09:19:37',0,0,NULL),(40,1,17,'Dear user you have been penalized with Rs 40 for not returning book Ikigai which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 09:19:37',0,0,NULL),(41,1,21,'Dear user you have been penalized with Rs 40 for not returning book Push ki raat which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 09:19:37',0,0,NULL),(42,1,25,'Dear user you have been penalized with Rs 40 for not returning book Push ki raat which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 09:19:37',0,0,NULL),(43,3,6,'Dear user you have been penalized with Rs 40 for not returning book Ikigai which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 09:28:20',0,0,NULL),(44,4,11,'Dear user you have been penalized with Rs 40 for not returning book Aghori which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 10:26:10',0,0,NULL),(45,3,1,'Dear user you have been penalized with Rs 40 for not returning book The Design of Everyday Things which you have issued on 2024-04-20, you 8 late from the due date','2024-05-02 12:19:53',0,0,NULL),(46,3,1,'Dear user you have been penalized with Rs 45 for not returning book The Design of Everyday Things which you have issued on 2024-04-20, you 9 late from the due date','2024-05-03 04:45:49',0,0,NULL),(47,3,6,'Dear user you have been penalized with Rs 45 for not returning book Ikigai which you have issued on 2024-04-20, you 9 late from the due date','2024-05-03 04:45:49',0,0,NULL),(48,1,17,'Dear user you have been penalized with Rs 45 for not returning book Ikigai which you have issued on 2024-04-20, you 9 late from the due date','2024-05-03 04:51:48',0,0,NULL),(49,1,21,'Dear user you have been penalized with Rs 45 for not returning book Push ki raat which you have issued on 2024-04-20, you 9 late from the due date','2024-05-03 04:51:48',0,0,NULL),(50,2,12,'Dear user you have been penalized with Rs 75 for not returning book Aghori which you have issued on 2024-04-14, you 15 late from the due date','2024-05-03 08:32:03',0,0,NULL),(51,2,17,'Dear user you have been penalized with Rs 235 for not returning book Ikigai which you have issued on 2024-03-13, you 47 late from the due date','2024-05-03 08:32:03',0,0,NULL),(52,2,22,'Dear user you have been penalized with Rs 85 for not returning book Push ki raat which you have issued on 2024-04-12, you 17 late from the due date','2024-05-03 08:32:03',0,0,NULL),(53,2,26,'Dear user you have been penalized with Rs 85 for not returning book never never which you have issued on 2024-04-12, you 17 late from the due date','2024-05-03 08:32:03',0,0,NULL),(54,2,27,'Dear user you have been penalized with Rs 90 for not returning book La Psicologia de Los Objetos Cotidianos which you have issued on 2024-04-11, you 18 late from the due date','2024-05-03 08:32:03',0,0,NULL),(55,1,17,'Dear user you have been penalized with Rs 145 for not returning book Ikigai which you have issued on 2024-04-20, you 29 late from the due date','2024-05-23 13:44:21',0,0,NULL),(56,1,21,'Dear user you have been penalized with Rs 145 for not returning book Push ki raat which you have issued on 2024-04-20, you 29 late from the due date','2024-05-23 13:44:21',0,0,NULL),(57,1,17,'Dear user you have been penalized with Rs 150 for not returning book Ikigai which you have issued on 2024-04-20, you 30 late from the due date','2024-05-24 12:08:27',0,0,NULL),(58,1,21,'Dear user you have been penalized with Rs 150 for not returning book Push ki raat which you have issued on 2024-04-20, you 30 late from the due date','2024-05-24 12:08:27',0,0,NULL),(59,1,17,'Dear user you have been penalized with Rs 215 for not returning book Ikigai which you have issued on 2024-04-20, you 43 late from the due date','2024-06-06 08:28:31',0,0,NULL),(60,1,21,'Dear user you have been penalized with Rs 215 for not returning book Push ki raat which you have issued on 2024-04-20, you 43 late from the due date','2024-06-06 08:28:31',0,0,NULL),(61,1,17,'Dear user you have been penalized with Rs 455 for not returning book Ikigai which you have issued on 2024-04-20, you 91 late from the due date','2024-07-24 05:41:00',0,0,NULL);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `inventory` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,1,5,'2024-04-15 07:16:17',NULL),(2,2,2,4,'2024-04-15 07:16:18',NULL),(3,3,3,3,'2024-04-15 07:16:19',NULL),(4,4,4,2,'2024-04-15 07:16:20',NULL),(5,5,5,1,'2024-04-15 07:16:21',NULL),(6,10,1,5,'2024-04-15 07:16:21',NULL),(7,1,8,5,'2024-04-15 07:16:21',NULL);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reading_status`
--

DROP TABLE IF EXISTS `reading_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reading_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `read_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`status_id`),
  KEY `reader_id` (`reader_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `reading_status_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reading_status_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `inventory` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reading_status`
--

LOCK TABLES `reading_status` WRITE;
/*!40000 ALTER TABLE `reading_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `reading_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reasonforcontro`
--

DROP TABLE IF EXISTS `reasonforcontro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reasonforcontro` (
  `reason_id` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reasonforcontro`
--

LOCK TABLES `reasonforcontro` WRITE;
/*!40000 ALTER TABLE `reasonforcontro` DISABLE KEYS */;
INSERT INTO `reasonforcontro` VALUES (1,'Need For Reasearch','2024-04-17 12:35:59',NULL),(2,'Book not Available','2024-04-17 12:35:59',NULL),(3,'Proffesional Development','2024-04-17 12:35:59',NULL),(4,'For Fun','2024-04-17 12:35:59',NULL),(5,'For Academics','2024-04-17 12:35:59',NULL),(6,'Other','2024-04-17 12:35:59',NULL);
/*!40000 ALTER TABLE `reasonforcontro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`request_id`),
  KEY `reader_id` (`reader_id`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensation`
--

DROP TABLE IF EXISTS `sensation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensation` (
  `sensation_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `sensation_title` varchar(255) DEFAULT NULL,
  `sensation_desc` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `isDeleted` int DEFAULT '0',
  PRIMARY KEY (`sensation_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `sensation_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensation`
--

LOCK TABLES `sensation` WRITE;
/*!40000 ALTER TABLE `sensation` DISABLE KEYS */;
INSERT INTO `sensation` VALUES (1,2,'dfgdfgdfg','dfgdfgdfgdfgdg','2024-05-03 05:51:18',NULL,0),(2,2,'hello','new books are now available','2024-05-03 06:43:27',NULL,0);
/*!40000 ALTER TABLE `sensation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensation_comments`
--

DROP TABLE IF EXISTS `sensation_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensation_comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `sensation_id` int DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `isDeleted` int DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `sensation_id` (`sensation_id`),
  CONSTRAINT `sensation_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `sensation_comments_ibfk_2` FOREIGN KEY (`sensation_id`) REFERENCES `sensation` (`sensation_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensation_comments`
--

LOCK TABLES `sensation_comments` WRITE;
/*!40000 ALTER TABLE `sensation_comments` DISABLE KEYS */;
INSERT INTO `sensation_comments` VALUES (1,3,1,'yeahhhhh','2024-05-03 06:31:41',NULL,0),(2,3,1,'nice','2024-05-03 08:41:21',NULL,0);
/*!40000 ALTER TABLE `sensation_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensation_images`
--

DROP TABLE IF EXISTS `sensation_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensation_images` (
  `sen_img_id` int NOT NULL AUTO_INCREMENT,
  `img_path` varchar(255) DEFAULT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `sensation_id` int DEFAULT NULL,
  PRIMARY KEY (`sen_img_id`),
  KEY `sensation_id` (`sensation_id`),
  CONSTRAINT `sensation_images_ibfk_1` FOREIGN KEY (`sensation_id`) REFERENCES `sensation` (`sensation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensation_images`
--

LOCK TABLES `sensation_images` WRITE;
/*!40000 ALTER TABLE `sensation_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensation_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensation_likes`
--

DROP TABLE IF EXISTS `sensation_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensation_likes` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `sensation_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `isDeleted` int DEFAULT '0',
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `sensation_id` (`sensation_id`),
  CONSTRAINT `sensation_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `sensation_likes_ibfk_2` FOREIGN KEY (`sensation_id`) REFERENCES `sensation` (`sensation_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensation_likes`
--

LOCK TABLES `sensation_likes` WRITE;
/*!40000 ALTER TABLE `sensation_likes` DISABLE KEYS */;
INSERT INTO `sensation_likes` VALUES (1,3,1,'2024-05-03 06:31:32',NULL,0),(2,3,2,'2024-05-03 08:41:14',NULL,0);
/*!40000 ALTER TABLE `sensation_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ticket_status_1_idx` (`ticket_id`),
  CONSTRAINT `fk_ticket_status_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_status`
--

LOCK TABLES `ticket_status` WRITE;
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
INSERT INTO `ticket_status` VALUES (6,288579,'Open',NULL),(7,553838,'Open',NULL),(8,192629,'Open',NULL),(9,766824,'Open',NULL),(10,646911,'Open',NULL),(11,595637,'Open',NULL),(12,940299,'Open',NULL),(13,630903,'Open',NULL),(14,590566,'Open',NULL),(15,962540,'Open',NULL);
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `issue` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `issue_img` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_tickets_1` (`user_id`),
  CONSTRAINT `fk_tickets_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=962541 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (192629,10,'network','fdfmasnjfadfnjkgjkg','/uploads/file-1714471325983-631579922-4.png','2024-04-30 04:32:05'),(288579,10,'design','fsfgasgdgdg','/uploads/file-1714384769721-959309304-2.png','2024-04-29 04:29:29'),(553838,1,'network','fdfmasnjfadfnjkgjkg','/uploads/file-1714471293806-761435773-4.png','2024-04-30 04:31:33'),(590566,3,'need to another copy of book','can i get',NULL,'2024-05-03 06:39:47'),(595637,7,'bhnagar ui che tamari library nu','rtgsfbgfgfdsgfgf','/uploads/file-1714537494036-324039119-bookato','2024-05-01 04:24:54'),(630903,3,'books is very nice but very old','can i get new copy of it',NULL,'2024-05-03 06:38:14'),(646911,10,'bhnagar ui che tamari library nu','color bakvas che bhaio ane beheno','/uploads/file-1714483514893-134790518-myw3sch','2024-04-30 13:25:14'),(766824,10,'bhnagar ui che tamari library nu','color bakvas che bhaio ane beheno','/uploads/file-1714483479651-229160548-myw3sch','2024-04-30 13:24:39'),(940299,4,'dgdfg','dfgdfgdfgd','/uploads/file-1714646632370-31989970-stranj-1','2024-05-02 10:43:52'),(962540,3,'asdfsd','sdfsdfsdf',NULL,'2024-05-03 08:41:36');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_img`
--

DROP TABLE IF EXISTS `user_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_img` (
  `user_img_id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `isDeleted` int DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_img_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_img_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_img`
--

LOCK TABLES `user_img` WRITE;
/*!40000 ALTER TABLE `user_img` DISABLE KEYS */;
INSERT INTO `user_img` VALUES (1,'user_img-1713853839095-703770338-images.jpeg','images.jpeg','/user_img-1713853839095-703770338-images.jpeg',1,1,'2024-05-02 09:28:31','2024-04-23 06:30:39'),(2,'user_img-1713853877349-921929009-images.jpeg','images.jpeg','/user_img-1713853877349-921929009-images.jpeg',1,1,'2024-05-02 09:29:52','2024-04-23 06:31:17'),(3,'user_img-1713853885075-109334024-images.jpeg','images.jpeg','/user_img-1713853885075-109334024-images.jpeg',1,1,'2024-05-02 09:31:43','2024-04-23 06:31:25'),(4,'./uploads/user_img-1713529605876-204201356-girl1.jpeg','fafsdf','/uploads/user_img-1713529605876-204201356-girl1.jpeg',10,1,'2024-04-24 13:32:19','2024-04-23 06:31:25'),(5,'user_img-1713965791507-175610588-images.jpeg','images.jpeg','/uploads/user_img-1713965791507-175610588-images.jpeg',10,1,'2024-04-29 05:09:59','2024-04-24 13:36:31'),(6,'user_img-1713965912200-412537875-images.jpeg','images.jpeg','/uploads/user_img-1713527975841-120500647-boy2.jpeg',10,0,NULL,'2024-04-24 13:38:32'),(7,'user_img-1714367455211-65537010-images.jpeg','images.jpeg','/uploads/user_img-1714367455211-65537010-images.jpeg',10,NULL,NULL,'2024-04-29 05:10:55'),(8,'user_img-1714367476699-358862748-myw3schoolsimage.jpg','myw3schoolsimage.jpg','/uploads/user_img-1714367476699-358862748-myw3schoolsimage.jpg',10,NULL,NULL,'2024-04-29 05:11:16'),(9,'user_img-1714384216182-629049149-images.jpeg','images.jpeg','/uploads/user_img-1714384216182-629049149-images.jpeg',7,0,NULL,'2024-04-29 09:50:16'),(10,'user_img-1714642032090-368208706-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642032090-368208706-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:12'),(11,'user_img-1714642038291-946939066-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642038291-946939066-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:18'),(12,'user_img-1714642042204-925687820-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642042204-925687820-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:22'),(13,'user_img-1714642064850-551480839-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642064850-551480839-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:44'),(14,'user_img-1714642070360-967518161-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642070360-967518161-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:50'),(15,'user_img-1714642071048-618266570-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642071048-618266570-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:51'),(16,'user_img-1714642071295-691780549-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642071295-691780549-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:51'),(17,'user_img-1714642071647-322675644-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642071647-322675644-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:51'),(18,'user_img-1714642071856-981619608-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642071856-981619608-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:51'),(19,'user_img-1714642072015-207011296-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714642072015-207011296-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 09:27:52'),(20,'user_img-1714642315790-952332048-girl.png','girl.png','./uploads/user_img-1714642315790-952332048-girl.png',1,NULL,NULL,'2024-05-02 09:31:55'),(21,'user_img-1714642318819-78361967-girl.png','girl.png','./uploads/user_img-1714642318819-78361967-girl.png',1,NULL,NULL,'2024-05-02 09:31:58'),(22,'user_img-1714644663358-592679461-girl.png','girl.png','./uploads/user_img-1714644663358-592679461-girl.png',3,NULL,NULL,'2024-05-02 10:11:03'),(23,'user_img-1714644670381-271751970-girl.png','girl.png','./uploads/user_img-1714644670381-271751970-girl.png',3,NULL,NULL,'2024-05-02 10:11:10'),(24,'user_img-1714645114714-484177886-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714645114714-484177886-mineimg-1.jpeg',16,NULL,NULL,'2024-05-02 10:18:34'),(25,'user_img-1714645303553-209796414-stranj-1.jpg','stranj-1.jpg','./uploads/user_img-1714645303553-209796414-stranj-1.jpg',16,NULL,NULL,'2024-05-02 10:21:43'),(26,'user_img-1714645310733-44286402-stranj-1.jpg','stranj-1.jpg','./uploads/user_img-1714645310733-44286402-stranj-1.jpg',16,NULL,NULL,'2024-05-02 10:21:50'),(27,'user_img-1714645745143-427481548-girl.png','girl.png','./uploads/user_img-1714645745143-427481548-girl.png',4,1,'2024-05-02 10:37:14','2024-05-02 10:29:05'),(28,'user_img-1714646240761-350272646-mineimg-1.jpeg','mineimg-1.jpeg','./uploads/user_img-1714646240761-350272646-mineimg-1.jpeg',4,0,NULL,'2024-05-02 10:37:20'),(29,'user_img-1714646264283-427177188-img2.png','img2.png','./uploads/user_img-1714646264283-427177188-img2.png',3,0,NULL,'2024-05-02 10:37:44'),(30,'user_img-1714646284465-204741597-girl.png','girl.png','./uploads/user_img-1714646284465-204741597-girl.png',1,1,'2024-05-24 12:08:40','2024-05-02 10:38:04'),(31,'user_img-1716552532582-306075053-girl.png','girl.png','/uploads/user_img-1716552532582-306075053-girl.png',1,1,'2024-05-24 12:14:46','2024-05-24 12:08:52'),(32,'user_img-1716552891771-596527592-girl.png','girl.png','/uploads/user_img-1716552891771-596527592-girl.png',1,0,NULL,'2024-05-24 12:14:51'),(33,'user_img-1721279753200-573552029-girl.png','girl.png','/uploads/user_img-1721279753200-573552029-girl.png',22,0,NULL,'2024-07-18 05:15:53');
/*!40000 ALTER TABLE `user_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `u_fname` varchar(255) DEFAULT NULL,
  `u_lname` varchar(255) DEFAULT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  `u_contact` bigint DEFAULT NULL,
  `u_address` text,
  `u_gender` varchar(255) DEFAULT NULL,
  `u_dob` date DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `u_pass` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `modified_at` timestamp NULL DEFAULT NULL,
  `isdeleted` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pass_updated` tinyint DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Anshika','Soni','anshika@gmail.com',124235546,'Star City','female','2000-05-14',0,'$2a$07$Z3ypi.gMIvdXHv22K0KSo.ZpLl6tO5IFyu0JGvcRfxmLCzeoP6.qm','sdfgdgh','2024-04-15 07:14:32','2024-05-02 09:19:06',0,NULL,1),(2,'Diya','Gupta','diya@gmail.com',124235546,'Star City','female','2001-05-14',1,'$2a$07$mUXvun9FzGc.d51IkNIFV.TNqhKaaHpI1u/GlE1Tcfebyy402ad9u','sdfgdgh','2024-04-15 07:14:32','2024-04-25 07:14:53',0,NULL,0),(3,'Alex','Felix','alex@gmail.com',8160569792,'plot no :2,rameshvar,bhavnagar','male','1994-03-22',1,'$2a$07$v.PCBO2yfA5XB1xngx1M1eFND5JpWX0ehllVumP2IsjQVVFMRm4YW','TDObj3o3egxe','2024-04-23 04:20:44','2024-05-02 09:16:47',0,NULL,1),(4,'puja','moravadiya','puja@abc.com',7845123695,NULL,'female','2002-04-06',1,'$2a$07$Jgc9kaVwb9bfX5iLLf/nPO1usFX9LIqOiqHTJfwsabggDc1flCA96','9nuxTP3TuQKC','2024-05-02 09:21:16',NULL,0,NULL,1),(21,'sefsdfsdfsdf','sdfsdfsdf','asgsddd@yopmail.com',7845129685,NULL,'male','2004-05-14',1,'$2a$07$zT2Zrc9WGsL8hwWXaUdqM.4R88Pn4D0YRIziKyYgwODI1.YveG1Ya','rKWwOVDoQrPC','2024-05-24 09:20:05',NULL,0,NULL,1),(22,'puja','moravadiya','puja@gmail.com',9313003213,NULL,'female','2002-12-01',1,'$2a$07$H4QUucBdbcJgmI284IdDJumU4wEF3/FohSyusRlhyGdjDQrdXdypK','rtQBNPwZ4niP','2024-07-18 05:14:46',NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersPenalty`
--

DROP TABLE IF EXISTS `usersPenalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersPenalty` (
  `penalty_id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `daysLate` int DEFAULT NULL,
  `penalty` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`penalty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersPenalty`
--

LOCK TABLES `usersPenalty` WRITE;
/*!40000 ALTER TABLE `usersPenalty` DISABLE KEYS */;
INSERT INTO `usersPenalty` VALUES (1,1,1,1,5,'2024-04-24 14:07:16',NULL),(2,10,4,7,35,'2024-04-25 05:04:25','2024-05-01 13:24:48'),(3,10,14,7,35,'2024-04-25 05:04:25','2024-05-01 13:24:48'),(4,10,19,8,40,'2024-04-25 05:04:25','2024-05-02 09:00:17'),(5,10,1,8,40,'2024-04-25 05:04:25','2024-05-02 09:00:17'),(6,10,3,8,40,'2024-04-25 05:04:25','2024-05-02 09:00:17'),(7,2,12,15,75,'2024-04-25 05:54:20','2024-05-03 08:32:04'),(8,2,17,47,235,'2024-04-25 05:54:20','2024-05-03 08:32:04'),(9,2,22,17,85,'2024-04-25 05:54:20','2024-05-03 08:32:04'),(10,2,26,17,85,'2024-04-25 05:54:20','2024-05-03 08:32:04'),(11,2,27,18,90,'2024-04-25 05:54:20','2024-05-03 08:32:04'),(12,1,12,8,40,'2024-05-02 09:19:37','2024-05-02 10:38:09'),(13,1,17,91,455,'2024-05-02 09:19:37','2024-07-24 05:41:00'),(14,1,21,43,215,'2024-05-02 09:19:37','2024-06-06 08:28:31'),(15,1,25,8,40,'2024-05-02 09:19:37','2024-05-02 10:38:09'),(16,3,6,9,45,'2024-05-02 09:28:20','2024-05-03 13:26:01'),(17,4,11,8,40,'2024-05-02 10:26:10','2024-05-02 10:44:17'),(18,3,1,9,45,'2024-05-02 12:19:53','2024-05-03 13:26:01');
/*!40000 ALTER TABLE `usersPenalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_lists`
--

DROP TABLE IF EXISTS `watch_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watch_lists` (
  `watchlist_id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `prime_book_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `isDeleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`watchlist_id`),
  KEY `reader_id` (`reader_id`),
  KEY `book_id` (`prime_book_id`),
  CONSTRAINT `watch_lists_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `watch_lists_ibfk_2` FOREIGN KEY (`prime_book_id`) REFERENCES `inventory` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_lists`
--

LOCK TABLES `watch_lists` WRITE;
/*!40000 ALTER TABLE `watch_lists` DISABLE KEYS */;
INSERT INTO `watch_lists` VALUES (82,3,2,'2024-05-02 10:14:50',1),(88,1,3,'2024-05-02 10:17:04',1),(89,16,1,'2024-05-02 10:17:51',0),(90,16,3,'2024-05-02 10:17:55',0),(91,16,5,'2024-05-02 10:17:59',0),(92,4,3,'2024-05-02 11:43:37',1),(93,3,2,'2024-05-02 12:19:42',1),(95,4,1,'2024-05-02 12:20:10',0),(96,4,4,'2024-05-02 12:20:14',0),(99,4,5,'2024-05-03 04:52:08',0),(101,3,1,'2024-05-03 10:26:49',1),(102,3,3,'2024-05-03 10:26:56',1),(103,1,1,'2024-05-03 10:28:35',1),(104,1,4,'2024-05-03 10:28:43',1),(108,1,1,'2024-05-23 13:33:20',1),(109,1,2,'2024-05-23 13:37:21',0),(110,3,3,'2024-05-24 05:27:50',0),(111,1,3,'2024-05-24 10:16:34',0),(112,22,1,'2024-07-18 05:16:41',1),(113,22,1,'2024-07-18 05:18:40',0),(114,22,2,'2024-07-18 05:18:45',0);
/*!40000 ALTER TABLE `watch_lists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-24 11:12:46