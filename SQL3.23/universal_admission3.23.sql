-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2013 at 11:22 AM
-- Server version: 5.5.25
-- PHP Version: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `universal_admission`
--

-- --------------------------------------------------------

--
-- Table structure for table `institute_branch`
--

CREATE TABLE IF NOT EXISTS `institute_branch` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_login` int(10) NOT NULL,
  `degree` varchar(100) DEFAULT NULL,
  `specialization` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `seats` varchar(50) NOT NULL,
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_institute_branch_institute_profile` (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `institute_branch`
--

INSERT INTO `institute_branch` (`id`, `id_login`, `degree`, `specialization`, `description`, `seats`, `event_detected`) VALUES
(1, 1, NULL, 'ECE', 'AWesofghsfgme', '12', 0),
(2, 1, NULL, 'CSE', 'sdfsd', '345', 0),
(3, 1, NULL, 'CSE', '', '', 0),
(4, 1, 'B.Tech', 'Computer Science Engineering', 'feee', '2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `institute_profile`
--

CREATE TABLE IF NOT EXISTS `institute_profile` (
  `institute_id` int(10) NOT NULL,
  `institute_name` varchar(100) NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `event_detected` int(10) DEFAULT '0',
  UNIQUE KEY `Index 1` (`institute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute_profile`
--

INSERT INTO `institute_profile` (`institute_id`, `institute_name`, `contact_no`, `address`, `city`, `state`, `event_detected`) VALUES
(1, 'IIITB12', '81231608872', 'Electronic city2', 'Hyderabad', 'Andhra Pradesh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lastlogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'new',
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `lastlogin`, `type`, `status`, `event_detected`) VALUES
(1, 'pridhvi.bittu@gmail.com', '12345', '2013-03-17 04:45:10', 'institute', 'verified', 0),
(2, 'vikrantsingh.it@gmail.com', 'aaaaa', '2013-03-17 05:44:32', 'student', 'verified', 1),
(3, 'vsr1312@gmail.com', 'aaaaa', '2013-03-18 04:23:21', 'student', 'new', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prerequisites`
--

CREATE TABLE IF NOT EXISTS `prerequisites` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) DEFAULT NULL,
  `degree` int(10) DEFAULT NULL,
  `specialisation` int(10) DEFAULT NULL,
  `percentage` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__institute_branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_education`
--

CREATE TABLE IF NOT EXISTS `student_education` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_login` int(10) NOT NULL,
  `institute_name` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `start_year` varchar(100) NOT NULL,
  `end_year` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `percentage` varchar(100) NOT NULL,
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_student_education_student_profile` (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student_education`
--

INSERT INTO `student_education` (`id`, `id_login`, `institute_name`, `degree`, `start_year`, `end_year`, `specialization`, `percentage`, `event_detected`) VALUES
(1, 2, 'hgfjh', '10th', '2013-12-30', '2013-12-30', 'CSE', '81', 0),
(2, 2, 'kjkjh', '12th', '', '', 'CSE', '99', 0),
(3, 2, 'kjkjh', 'M.Tech', '2013-12-31', '2013-12-31', 'CSE', '81', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_profile`
--

CREATE TABLE IF NOT EXISTS `student_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 1` (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `student_profile`
--

INSERT INTO `student_profile` (`id`, `student_id`, `name`, `mobileno`, `address`, `city`, `state`, `dob`, `summary`, `event_detected`) VALUES
(1, 2, 'abc2', '987672', 'kjhgkhjgk2', 'Bangalore', 'Andhra Pradesh', '2013-12-31', 'jhgjkhgk2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion`
--

CREATE TABLE IF NOT EXISTS `suggestion` (
  `id` int(10) NOT NULL,
  `institute_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__institute_profile` (`institute_id`),
  KEY `FK__student_profile` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `institute_branch`
--
ALTER TABLE `institute_branch`
  ADD CONSTRAINT `FK_institute_branch_institute_profile` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `institute_profile`
--
ALTER TABLE `institute_profile`
  ADD CONSTRAINT `FK_institute_profile_login` FOREIGN KEY (`institute_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prerequisites`
--
ALTER TABLE `prerequisites`
  ADD CONSTRAINT `FK__institute_branch` FOREIGN KEY (`branch_id`) REFERENCES `institute_branch` (`id`);

--
-- Constraints for table `student_education`
--
ALTER TABLE `student_education`
  ADD CONSTRAINT `FK_student_education_student_profile` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_profile`
--
ALTER TABLE `student_profile`
  ADD CONSTRAINT `FK_student_profile_login` FOREIGN KEY (`student_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD CONSTRAINT `FK__institute_profile` FOREIGN KEY (`institute_id`) REFERENCES `institute_profile` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__student_profile` FOREIGN KEY (`student_id`) REFERENCES `student_profile` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
