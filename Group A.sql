-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: GROUPA
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `CAMPUS`
--

DROP TABLE IF EXISTS `CAMPUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAMPUS` (
  `name` varchar(20) NOT NULL,
  `address` varchar(60) NOT NULL,
  `distance` float(6,2) NOT NULL,
  `bus` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPUS`
--

LOCK TABLES `CAMPUS` WRITE;
/*!40000 ALTER TABLE `CAMPUS` DISABLE KEYS */;
INSERT INTO `CAMPUS` VALUES ('Toronto','1 Main St',4.00,'Main Line'),('Vancouver','54 First St',3.70,'Circulator');
/*!40000 ALTER TABLE `CAMPUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLUB`
--

DROP TABLE IF EXISTS `CLUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLUB` (
  `name` varchar(20) NOT NULL,
  `campus` varchar(20) NOT NULL,
  `building` varchar(20) NOT NULL,
  `phone_number` char(10) NOT NULL,
  PRIMARY KEY (`name`,`campus`),
  KEY `campus` (`campus`),
  CONSTRAINT `CLUB_ibfk_1` FOREIGN KEY (`campus`) REFERENCES `CAMPUS` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLUB`
--

LOCK TABLES `CLUB` WRITE;
/*!40000 ALTER TABLE `CLUB` DISABLE KEYS */;
INSERT INTO `CLUB` VALUES ('Top','Toronto','Blasian','555-1234'),('Varsity','Vancouver','Corder','555-5678');
/*!40000 ALTER TABLE `CLUB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMITTEE`
--

DROP TABLE IF EXISTS `COMMITTEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMITTEE` (
  `name` varchar(20) NOT NULL,
  `faculty` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `frequency` varchar(20) NOT NULL,
  PRIMARY KEY (`name`,`faculty`),
  KEY `faculty` (`faculty`),
  CONSTRAINT `COMMITTEE_ibfk_1` FOREIGN KEY (`faculty`) REFERENCES `FACULTY` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMITTEE`
--

LOCK TABLES `COMMITTEE` WRITE;
/*!40000 ALTER TABLE `COMMITTEE` DISABLE KEYS */;
INSERT INTO `COMMITTEE` VALUES ('Advisory','Humanities','Important','Bimonthly'),('Advisory','Science','Important','Bimonthly'),('Health and Safety','Humanities','Important','Annually');
/*!40000 ALTER TABLE `COMMITTEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COURSE`
--

DROP TABLE IF EXISTS `COURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COURSE` (
  `code` char(4) NOT NULL,
  `title` varchar(20) NOT NULL,
  `program` char(4) NOT NULL,
  `hours` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `program` (`program`),
  CONSTRAINT `COURSE_ibfk_1` FOREIGN KEY (`program`) REFERENCES `PROGRAM` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COURSE`
--

LOCK TABLES `COURSE` WRITE;
/*!40000 ALTER TABLE `COURSE` DISABLE KEYS */;
INSERT INTO `COURSE` VALUES ('E100','Intro to English','ENGL',3),('E200','Poetry','ENGL',3),('M130','Basics','MECH',4),('P100','Intro to Physics','PHSX',3),('P210','Intermediate Physics','PHSX',3);
/*!40000 ALTER TABLE `COURSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACULTY`
--

DROP TABLE IF EXISTS `FACULTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FACULTY` (
  `name` varchar(20) NOT NULL,
  `dean` varchar(20) NOT NULL,
  `building` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACULTY`
--

LOCK TABLES `FACULTY` WRITE;
/*!40000 ALTER TABLE `FACULTY` DISABLE KEYS */;
INSERT INTO `FACULTY` VALUES ('Humanities','Carl Sagan','Dunkin'),('Science','Teresa Small','Moon');
/*!40000 ALTER TABLE `FACULTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LECTURER`
--

DROP TABLE IF EXISTS `LECTURER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LECTURER` (
  `id` char(10) NOT NULL,
  `supervisor` char(10) DEFAULT NULL,
  `title` varchar(20) NOT NULL,
  `office_room` char(10) NOT NULL,
  `school` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school` (`school`),
  CONSTRAINT `LECTURER_ibfk_1` FOREIGN KEY (`school`) REFERENCES `SCHOOL` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LECTURER`
--

LOCK TABLES `LECTURER` WRITE;
/*!40000 ALTER TABLE `LECTURER` DISABLE KEYS */;
INSERT INTO `LECTURER` VALUES ('1231231231','9879879879','Professor','340','Natural Science','Chad Warden'),('4564564564','9879879879','Professor','220','Engineering','Bob Roberts'),('9879879879',NULL,'Professor','112','Writing','Anthony Perez');
/*!40000 ALTER TABLE `LECTURER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LECTURER_COMMITTEE`
--

DROP TABLE IF EXISTS `LECTURER_COMMITTEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LECTURER_COMMITTEE` (
  `lecturer_id` char(10) NOT NULL,
  `committee_name` varchar(20) NOT NULL,
  `faculty` varchar(20) NOT NULL,
  PRIMARY KEY (`lecturer_id`,`committee_name`,`faculty`),
  KEY `committee_name` (`committee_name`),
  KEY `faculty` (`faculty`),
  CONSTRAINT `LECTURER_COMMITTEE_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `LECTURER` (`id`),
  CONSTRAINT `LECTURER_COMMITTEE_ibfk_2` FOREIGN KEY (`committee_name`) REFERENCES `COMMITTEE` (`name`),
  CONSTRAINT `LECTURER_COMMITTEE_ibfk_3` FOREIGN KEY (`faculty`) REFERENCES `FACULTY` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LECTURER_COMMITTEE`
--

LOCK TABLES `LECTURER_COMMITTEE` WRITE;
/*!40000 ALTER TABLE `LECTURER_COMMITTEE` DISABLE KEYS */;
INSERT INTO `LECTURER_COMMITTEE` VALUES ('1231231231','Advisory','Science'),('4564564564','Advisory','Science'),('9879879879','Advisory','Humanities'),('1231231231','Health and Safety','Science');
/*!40000 ALTER TABLE `LECTURER_COMMITTEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREREQUISITE`
--

DROP TABLE IF EXISTS `PREREQUISITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PREREQUISITE` (
  `course_code` char(4) NOT NULL,
  `prerequisite_code` char(4) NOT NULL,
  PRIMARY KEY (`course_code`,`prerequisite_code`),
  KEY `prerequisite_code` (`prerequisite_code`),
  CONSTRAINT `PREREQUISITE_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `COURSE` (`code`),
  CONSTRAINT `PREREQUISITE_ibfk_2` FOREIGN KEY (`prerequisite_code`) REFERENCES `COURSE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREREQUISITE`
--

LOCK TABLES `PREREQUISITE` WRITE;
/*!40000 ALTER TABLE `PREREQUISITE` DISABLE KEYS */;
INSERT INTO `PREREQUISITE` VALUES ('E200','E100'),('P210','P100');
/*!40000 ALTER TABLE `PREREQUISITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROGRAM`
--

DROP TABLE IF EXISTS `PROGRAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROGRAM` (
  `code` char(4) NOT NULL,
  `title` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL,
  `duration` varchar(3) NOT NULL,
  `school` varchar(20) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `school` (`school`),
  CONSTRAINT `PROGRAM_ibfk_1` FOREIGN KEY (`school`) REFERENCES `SCHOOL` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROGRAM`
--

LOCK TABLES `PROGRAM` WRITE;
/*!40000 ALTER TABLE `PROGRAM` DISABLE KEYS */;
INSERT INTO `PROGRAM` VALUES ('ENGL','English','Undergrad','125','Writing'),('MECH','Mech Engineering','Undergrad','130','Engineering'),('PHSX','Physics','Undergrad','130','Natural Science');
/*!40000 ALTER TABLE `PROGRAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCHOOL`
--

DROP TABLE IF EXISTS `SCHOOL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCHOOL` (
  `name` varchar(20) NOT NULL,
  `faculty` varchar(20) NOT NULL,
  `campus` varchar(20) NOT NULL,
  `building` varchar(20) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `faculty` (`faculty`),
  KEY `campus` (`campus`),
  CONSTRAINT `SCHOOL_ibfk_1` FOREIGN KEY (`faculty`) REFERENCES `FACULTY` (`name`),
  CONSTRAINT `SCHOOL_ibfk_2` FOREIGN KEY (`campus`) REFERENCES `CAMPUS` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHOOL`
--

LOCK TABLES `SCHOOL` WRITE;
/*!40000 ALTER TABLE `SCHOOL` DISABLE KEYS */;
INSERT INTO `SCHOOL` VALUES ('Engineering','Science','Toronto','Mallott'),('Natural Science','Science','Toronto','Eaton'),('Writing','Humanities','Vancouver','Fraser');
/*!40000 ALTER TABLE `SCHOOL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECTION`
--

DROP TABLE IF EXISTS `SECTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SECTION` (
  `id` char(10) NOT NULL,
  `lecturer_id` char(10) NOT NULL,
  `course_code` char(4) NOT NULL,
  `building` varchar(20) NOT NULL,
  `room` varchar(8) NOT NULL,
  `time` char(9) NOT NULL,
  `day` varchar(10) NOT NULL,
  `year` char(4) NOT NULL,
  `semester` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_id` (`lecturer_id`),
  KEY `course_code` (`course_code`),
  CONSTRAINT `SECTION_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `LECTURER` (`id`),
  CONSTRAINT `SECTION_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `COURSE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECTION`
--

LOCK TABLES `SECTION` WRITE;
/*!40000 ALTER TABLE `SECTION` DISABLE KEYS */;
INSERT INTO `SECTION` VALUES ('3332224444','4564564564','M130','Mallott','215','1330-1500','MW','2020','SU'),('6668887777','9879879879','E200','Fraser','387','800-915','TuTh','2020','SP'),('9876543210','1231231231','P100','Fraser','154','1410-1500','MWF','2019','FA');
/*!40000 ALTER TABLE `SECTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPORT`
--

DROP TABLE IF EXISTS `SPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPORT` (
  `club` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`club`,`name`),
  CONSTRAINT `SPORT_ibfk_1` FOREIGN KEY (`club`) REFERENCES `CLUB` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPORT`
--

LOCK TABLES `SPORT` WRITE;
/*!40000 ALTER TABLE `SPORT` DISABLE KEYS */;
INSERT INTO `SPORT` VALUES ('Top','Rowing'),('Varsity','Football'),('Varsity','Soccer');
/*!40000 ALTER TABLE `SPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STUDENT`
--

DROP TABLE IF EXISTS `STUDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STUDENT` (
  `id` char(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `program` char(4) NOT NULL,
  `gpa` float(3,2) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `program` (`program`),
  CONSTRAINT `STUDENT_ibfk_1` FOREIGN KEY (`program`) REFERENCES `PROGRAM` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDENT`
--

LOCK TABLES `STUDENT` WRITE;
/*!40000 ALTER TABLE `STUDENT` DISABLE KEYS */;
INSERT INTO `STUDENT` VALUES ('1324567890','Bob Smith','PHSX',3.71,'1980-01-01'),('3338884444','Rob Roy','ENGL',4.00,'1988-09-24'),('4445556666','Jane Doe','MECH',1.88,'2000-10-15'),('4564564567','Jimmy Buffet','MECH',3.10,'1991-11-05'),('7778889999','Burt Mackin','PHSX',2.50,'1984-12-01');
/*!40000 ALTER TABLE `STUDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STUDENT_COURSE`
--

DROP TABLE IF EXISTS `STUDENT_COURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STUDENT_COURSE` (
  `section_id` char(10) NOT NULL,
  `student_id` char(10) NOT NULL,
  `grade` float(4,2) NOT NULL,
  PRIMARY KEY (`student_id`,`section_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `STUDENT_COURSE_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `SECTION` (`id`),
  CONSTRAINT `STUDENT_COURSE_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `STUDENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDENT_COURSE`
--

LOCK TABLES `STUDENT_COURSE` WRITE;
/*!40000 ALTER TABLE `STUDENT_COURSE` DISABLE KEYS */;
INSERT INTO `STUDENT_COURSE` VALUES ('9876543210','1324567890',92.74),('6668887777','4445556666',84.00),('6668887777','4564564567',83.54),('3332224444','7778889999',64.55);
/*!40000 ALTER TABLE `STUDENT_COURSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'GROUPA'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-16 21:52:08
