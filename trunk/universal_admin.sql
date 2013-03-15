-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.15 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-03-16 00:06:53
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for universal_admission
CREATE DATABASE IF NOT EXISTS `universal_admission` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `universal_admission`;


-- Dumping structure for table universal_admission.institute_branch
CREATE TABLE IF NOT EXISTS `institute_branch` (
  `id` int(10) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `seats` varchar(50) NOT NULL,
  KEY `FK_institute_branch_institute_profile` (`id`),
  CONSTRAINT `FK_institute_branch_institute_profile` FOREIGN KEY (`id`) REFERENCES `institute_profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table universal_admission.institute_branch: ~0 rows (approximately)
/*!40000 ALTER TABLE `institute_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `institute_branch` ENABLE KEYS */;


-- Dumping structure for table universal_admission.institute_profile
CREATE TABLE IF NOT EXISTS `institute_profile` (
  `id` int(10) NOT NULL,
  `institute_name` varchar(100) NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `FK_institute_profile_login` FOREIGN KEY (`id`) REFERENCES `login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table universal_admission.institute_profile: ~0 rows (approximately)
/*!40000 ALTER TABLE `institute_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `institute_profile` ENABLE KEYS */;


-- Dumping structure for table universal_admission.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lastlogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'new',
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table universal_admission.login: ~1 rows (approximately)
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`id`, `username`, `password`, `lastlogin`, `type`, `status`, `event_detected`) VALUES
	(1, 'abc', 'abc', '2013-03-15 23:47:42', 'student', 'verified', 1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


-- Dumping structure for table universal_admission.student_education
CREATE TABLE IF NOT EXISTS `student_education` (
  `id` int(10) NOT NULL,
  `institute_name` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `start_year` varchar(100) NOT NULL,
  `end_year` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `percentage` varchar(100) NOT NULL,
  KEY `FK_student_education_student_profile` (`id`),
  CONSTRAINT `FK_student_education_student_profile` FOREIGN KEY (`id`) REFERENCES `student_profile` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table universal_admission.student_education: ~0 rows (approximately)
/*!40000 ALTER TABLE `student_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_education` ENABLE KEYS */;


-- Dumping structure for table universal_admission.student_profile
CREATE TABLE IF NOT EXISTS `student_profile` (
  `student_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `summary` varchar(500) NOT NULL,
  UNIQUE KEY `Index 1` (`student_id`),
  CONSTRAINT `FK_student_profile_login` FOREIGN KEY (`student_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table universal_admission.student_profile: ~0 rows (approximately)
/*!40000 ALTER TABLE `student_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_profile` ENABLE KEYS */;


-- Dumping structure for table universal_admission.suggestion
CREATE TABLE IF NOT EXISTS `suggestion` (
  `id` int(10) NOT NULL,
  `institute_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__institute_profile` (`institute_id`),
  KEY `FK__student_profile` (`student_id`),
  CONSTRAINT `FK__institute_profile` FOREIGN KEY (`institute_id`) REFERENCES `institute_profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__student_profile` FOREIGN KEY (`student_id`) REFERENCES `student_profile` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table universal_admission.suggestion: ~0 rows (approximately)
/*!40000 ALTER TABLE `suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestion` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
