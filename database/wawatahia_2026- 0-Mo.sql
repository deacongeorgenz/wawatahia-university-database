-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: wawatahia
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course_table`
--

DROP TABLE IF EXISTS `course_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_table` (
  `CourseID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `FacultyID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `FacultyID` (`FacultyID`),
  CONSTRAINT `course_table_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty_table` (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_table`
--

LOCK TABLES `course_table` WRITE;
/*!40000 ALTER TABLE `course_table` DISABLE KEYS */;
INSERT INTO `course_table` VALUES ('AE606','Automotive Engineering Lvl 6','NZU712'),('APL67','Gravity and Physics','NZU404'),('ME404','Mechanical Engineering Lvl 4','NZU404'),('TM888','Temporal Mechanics 101','NZU712'),('WT808','Warp Theory Tier 8','NZU767');
/*!40000 ALTER TABLE `course_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_table`
--

DROP TABLE IF EXISTS `faculty_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_table` (
  `FacultyID` varchar(20) NOT NULL,
  `FacultyName` varchar(100) NOT NULL,
  `HoFName` varchar(100) NOT NULL,
  `NumberOfStudents` int NOT NULL,
  PRIMARY KEY (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_table`
--

LOCK TABLES `faculty_table` WRITE;
/*!40000 ALTER TABLE `faculty_table` DISABLE KEYS */;
INSERT INTO `faculty_table` VALUES ('NZU404','Theoretical Physics','Sheldon Cooper',518),('NZU712','Advanced Automotive','Ken Block',722),('NZU767','Warp Theory','Leah Brahms',855);
/*!40000 ALTER TABLE `faculty_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_course`
--

DROP TABLE IF EXISTS `professor_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_course` (
  `ProfessorID` varchar(20) NOT NULL,
  `CourseID` varchar(20) NOT NULL,
  PRIMARY KEY (`ProfessorID`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `professor_course_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor_table` (`ProfessorID`),
  CONSTRAINT `professor_course_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course_table` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_course`
--

LOCK TABLES `professor_course` WRITE;
/*!40000 ALTER TABLE `professor_course` DISABLE KEYS */;
INSERT INTO `professor_course` VALUES ('WU1955','AE606'),('WU1643','APL67'),('WU1905','ME404'),('WU1955','TM888'),('WU1701','WT808');
/*!40000 ALTER TABLE `professor_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_table`
--

DROP TABLE IF EXISTS `professor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_table` (
  `ProfessorID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `FacultyID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ProfessorID`),
  KEY `FacultyID` (`FacultyID`),
  CONSTRAINT `professor_table_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty_table` (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_table`
--

LOCK TABLES `professor_table` WRITE;
/*!40000 ALTER TABLE `professor_table` DISABLE KEYS */;
INSERT INTO `professor_table` VALUES ('WU1643','Isaac Newton','07-566-2131','I.Newton@WU.ac.nz','NZU404'),('WU1701','Geordie LaForge','07-448-8555','G.LaForge@WU.ac.nz','NZU404'),('WU1905','Albert Einstein','07-574-8082','A.Einstein@WU.ac.nz','NZU404'),('WU1955','Emmett Brown','07-999-1111','E.Brown@WU.ac.nz','NZU404');
/*!40000 ALTER TABLE `professor_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_table`
--

DROP TABLE IF EXISTS `project_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_table` (
  `ProjectID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  `ProfessorID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ProjectID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `project_table_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor_table` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_table`
--

LOCK TABLES `project_table` WRITE;
/*!40000 ALTER TABLE `project_table` DISABLE KEYS */;
INSERT INTO `project_table` VALUES ('999','Mary Test Project','Inserted by Mary for role testing','2026-01-01','2026-06-30',5000.00,'WU1955'),('CRO17','Chronoton Cultivation and Tachyon Harvesting','Design and build an apparatus to cultivate chronoton particles and harvest tachyon particles to be used in temporal tunneling.','2026-06-01','2026-09-30',37000.00,'WU1905'),('HCT12','Hydrogen Cell technology','Design and build a next generation hydrogen cell engine','2026-05-25','2026-08-03',16500.00,'WU1955'),('Si07','Structural Integrity','Design a structural integrity field to be used in starship integrated systems','2026-05-04','2026-07-27',45000.00,'WU1701'),('TBT88','Tractor Beam Technology','Apply graviton and physics knowledge to design, build, and test a tractor beam','2026-09-19','2026-12-25',22500.00,'WU1643'),('WPC46','Warp Plasma Containment','Design magnetic containment for warp plasma','2026-05-01','2026-07-26',12500.00,'WU1955');
/*!40000 ALTER TABLE `project_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course` (
  `NSN` varchar(20) NOT NULL,
  `CourseID` varchar(20) NOT NULL,
  PRIMARY KEY (`NSN`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`NSN`) REFERENCES `student_table` (`NSN`),
  CONSTRAINT `student_course_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course_table` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES ('NSN897654','APL67'),('NSN211015','ME404'),('NSN224996','ME404'),('NSN007007','WT808'),('NSN555667','WT808');
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_table`
--

DROP TABLE IF EXISTS `student_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_table` (
  `NSN` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `FacultyID` varchar(20) DEFAULT NULL,
  `ProjectID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NSN`),
  KEY `FacultyID` (`FacultyID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `student_table_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty_table` (`FacultyID`),
  CONSTRAINT `student_table_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `project_table` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_table`
--

LOCK TABLES `student_table` WRITE;
/*!40000 ALTER TABLE `student_table` DISABLE KEYS */;
INSERT INTO `student_table` VALUES ('NSN007007','Hemi Bond','imaspy@gotcha.com','NZU767','WPC46'),('NSN211015','Aria Thompson','aritom@gratly.com','NZU404','CRO17'),('NSN224996','Liam Faulkner','liamlean@fitpro.co.nz','NZU404','CRO17'),('NSN555667','Hana Patel','imoutofhere@getgone.com','NZU767','Si07'),('NSN897654','Rangi Mason','rangus12@biffs.co.nz','NZU404','TBT88');
/*!40000 ALTER TABLE `student_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-06  8:15:02
