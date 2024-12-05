DROP DATABASE IF EXISTS `studysmart`;
CREATE DATABASE `studysmart`;
USE `studysmart`;

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Late') NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `instructor` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'CS-157A','Mike Wu','2024-08-14','2024-12-18'),(4,'CS149','Sriram Rao','2024-01-08','2024-12-20');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled`
--

DROP TABLE IF EXISTS `enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled` (
  `user_id` varchar(50) NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled`
--

LOCK TABLES `enrolled` WRITE;
/*!40000 ALTER TABLE `enrolled` DISABLE KEYS */;
INSERT INTO `enrolled` VALUES ('domipo',1),('domipo',4);
/*!40000 ALTER TABLE `enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extracurricular`
--

DROP TABLE IF EXISTS `extracurricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extracurricular` (
  `extracurricular_id` int NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`extracurricular_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extracurricular`
--

LOCK TABLES `extracurricular` WRITE;
/*!40000 ALTER TABLE `extracurricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `extracurricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `value` decimal(5,2) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date_recorded` date NOT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `involvedin`
--

DROP TABLE IF EXISTS `involvedin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `involvedin` (
  `user_id` varchar(50) NOT NULL,
  `extracurricular_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`extracurricular_id`),
  KEY `extracurricular_id` (`extracurricular_id`),
  CONSTRAINT `involvedin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `involvedin_ibfk_2` FOREIGN KEY (`extracurricular_id`) REFERENCES `extracurricular` (`extracurricular_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `involvedin`
--

LOCK TABLES `involvedin` WRITE;
/*!40000 ALTER TABLE `involvedin` DISABLE KEYS */;
/*!40000 ALTER TABLE `involvedin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `content` text NOT NULL,
  `created_date` date NOT NULL,
  `last_modified_date` date DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performs`
--

DROP TABLE IF EXISTS `performs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performs` (
  `user_id` varchar(50) NOT NULL,
  `task_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `performs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `performs_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performs`
--

LOCK TABLES `performs` WRITE;
/*!40000 ALTER TABLE `performs` DISABLE KEYS */;
INSERT INTO `performs` VALUES ('domipo',1),('chihuahua',6),('domipo',9),('domipo',11),('domipo',12),('domipo',13);
/*!40000 ALTER TABLE `performs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `task_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`task_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `url` varchar(2083) DEFAULT NULL,
  `display_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (6,1,'https://www.youtube.com/watch?v=RRiRKFIdXL4','Funny video'),(7,7,'https://www.youtube.com/shorts/olr97t2xQ1A','How to deal with aggressive chihuahua'),(8,10,'https://www.youtube.com/','A youtube link');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studies`
--

DROP TABLE IF EXISTS `studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studies` (
  `user_id` varchar(50) NOT NULL,
  `session_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`session_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `studies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `studies_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `studysession` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studies`
--

LOCK TABLES `studies` WRITE;
/*!40000 ALTER TABLE `studies` DISABLE KEYS */;
INSERT INTO `studies` VALUES ('domipo',1),('domipo',2),('domipo',3),('domipo',4),('domipo',5),('domipo',6),('domipo',7),('domipo',8),('domipo',9),('domipo',10),('domipo',11),('domipo',12),('domipo',13),('domipo',14),('domipo',15),('domipo',16),('domipo',17),('domipo',18),('domipo',19),('domipo',20),('domipo',21),('domipo',22),('domipo',23),('domipo',24),('domipo',25),('domipo',26),('domipo',27),('domipo',28),('domipo',29),('domipo',30),('domipo',31),('domipo',32),('domipo',33),('domipo',34),('domipo',35),('domipo',36),('domipo',37),('domipo',38),('domipo',39),('domipo',40),('domipo',41),('domipo',42),('domipo',43),('domipo',44);
/*!40000 ALTER TABLE `studies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studysession`
--

DROP TABLE IF EXISTS `studysession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studysession` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `date_recorded` date NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studysession`
--

LOCK TABLES `studysession` WRITE;
/*!40000 ALTER TABLE `studysession` DISABLE KEYS */;
INSERT INTO `studysession` VALUES (1,'23:00:03','23:00:19','2024-12-02'),(2,'23:16:30','23:16:38','2024-12-02'),(3,'23:35:39','23:35:45','2024-12-02'),(4,'23:55:47','23:56:02','2024-12-02'),(5,'09:00:00','11:30:00','2024-12-02'),(6,'14:00:00','16:00:00','2024-12-02'),(7,'19:00:00','21:00:00','2024-12-01'),(8,'10:00:00','12:30:00','2024-12-01'),(9,'15:00:00','17:30:00','2024-11-30'),(10,'09:30:00','12:00:00','2024-11-29'),(11,'14:00:00','16:30:00','2024-11-29'),(12,'10:00:00','11:30:00','2024-11-28'),(13,'13:00:00','14:30:00','2024-11-27'),(14,'16:00:00','18:00:00','2024-11-27'),(15,'09:00:00','11:00:00','2024-11-25'),(16,'14:00:00','16:00:00','2024-11-25'),(17,'10:00:00','12:00:00','2024-11-24'),(18,'15:00:00','17:00:00','2024-11-24'),(19,'09:30:00','11:30:00','2024-11-23'),(20,'14:30:00','16:30:00','2024-11-23'),(21,'10:00:00','12:00:00','2024-11-22'),(22,'13:00:00','15:00:00','2024-11-21'),(23,'09:00:00','11:00:00','2024-11-18'),(24,'14:00:00','16:30:00','2024-11-18'),(25,'10:00:00','12:00:00','2024-11-17'),(26,'15:00:00','17:00:00','2024-11-17'),(27,'09:30:00','11:30:00','2024-11-16'),(28,'14:30:00','16:00:00','2024-11-16'),(29,'10:00:00','12:30:00','2024-11-15'),(30,'09:00:00','11:00:00','2024-11-11'),(31,'14:00:00','16:00:00','2024-11-11'),(32,'10:00:00','12:00:00','2024-11-10'),(33,'15:00:00','17:30:00','2024-11-10'),(34,'09:30:00','12:00:00','2024-11-09'),(35,'14:30:00','16:30:00','2024-11-09'),(36,'09:00:00','11:30:00','2024-11-04'),(37,'14:00:00','16:00:00','2024-11-04'),(38,'10:00:00','12:30:00','2024-11-03'),(39,'15:00:00','17:00:00','2024-11-03'),(40,'09:30:00','11:30:00','2024-11-02'),(41,'14:30:00','16:30:00','2024-11-02'),(42,'18:19:01','18:19:17','2024-12-03'),(43,'09:00:00','11:00:00','2024-12-03'),(44,'14:00:00','16:00:00','2024-12-03');
/*!40000 ALTER TABLE `studysession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `due_date` date NOT NULL,
  `priority` enum('Low','Medium','High') NOT NULL,
  `status` enum('Pending','Completed','Overdue') NOT NULL,
  `type` varchar(50) NOT NULL,
  `quick_note` varchar(255) DEFAULT NULL,
  `progress` int DEFAULT '0',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Presentation CS157A','Finish 3 to 4 functional requirements for group project before classtime on Thursday','2024-10-21','High','Completed','Group Project','Make sure to finish this before due date',100),(6,'Learn how to bark','bark continously','2024-11-20','Low','Completed','Group Project',NULL,100),(7,'Fight with chiahuahua','chihuahua is a b*tch','2024-11-21','High','Overdue','Assignment','why is the chihuahua so aggressive',50),(9,'Second code review','Implementing about 70% of the project','2024-11-21','Medium','Overdue','Assignment',NULL,0),(10,'testingTask','task task task tsaK KSI ','2024-11-21','Low','Overdue','Assignment','im working harrrddddd????',50),(11,'Final Demo Project','Finish 90% project','2024-12-03','Medium','Pending','Group Project',NULL,0),(12,'Final Exam CS-157A','every chapter','2024-12-02','Low','Pending','Assignment',NULL,0),(13,'Task from the past','this is past','2024-12-01','Low','Overdue','Assignment',NULL,0);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasktodo`
--

DROP TABLE IF EXISTS `tasktodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasktodo` (
  `course_id` int NOT NULL,
  `task_id` int NOT NULL,
  PRIMARY KEY (`course_id`,`task_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `tasktodo_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `tasktodo_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasktodo`
--

LOCK TABLES `tasktodo` WRITE;
/*!40000 ALTER TABLE `tasktodo` DISABLE KEYS */;
INSERT INTO `tasktodo` VALUES (4,1);
/*!40000 ALTER TABLE `tasktodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_created_date` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('chihuahua','Chihuahua','chihua@shiba.com','123','2024-11-20'),('chowmein','chowmein@gmail.com','Chow Mein','123456','2024-12-02'),('corgi','corgiCorgi','corgi@gmail.com','123','2024-11-20'),('domipo','minhphongdo','domipo1052@gmail.com','123','2024-10-14'),('friedRice','Fried Rice','friedrice@email.com','123','2024-12-02'),('gerdnang','gerd nang','gerdnang@gmail.com','456','2024-12-02'),('minh','minhphongdo','123@gmail.com','123','2024-10-22'),('shiba','shibashiba','shiba-inu@gmail.com','123','2024-11-20');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 19:17:39
