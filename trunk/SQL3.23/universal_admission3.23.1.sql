-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2013 at 08:13 PM
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
-- Table structure for table `group_admission`
--

CREATE TABLE IF NOT EXISTS `group_admission` (
  `group_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `no_of_rounds` int(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fees` float DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `FK_group_institute_profile` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_application`
--

CREATE TABLE IF NOT EXISTS `group_application` (
  `group_app_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) DEFAULT '0',
  `applicant_id` int(10) DEFAULT NULL,
  `apply_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT '' COMMENT 'approved/reject/pending',
  `last_updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_app_id`),
  KEY `FK_group_application_student_profile` (`applicant_id`),
  KEY `FK_group_application_group_admission` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_participants_stream_in_admission`
--

CREATE TABLE IF NOT EXISTS `group_participants_stream_in_admission` (
  `part_stream_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) DEFAULT NULL,
  `participant_id` int(10) DEFAULT NULL,
  `branch_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`part_stream_id`),
  KEY `FK_participants_stream_in_group_admission_group` (`group_id`),
  KEY `FK_participants_stream_in_group_admission_institute_profile` (`participant_id`),
  KEY `FK_participants_stream_in_group_admission_institute_branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_paticipants`
--

CREATE TABLE IF NOT EXISTS `group_paticipants` (
  `group_participants_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) DEFAULT NULL,
  `participant_id` int(10) DEFAULT NULL,
  `request_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'time of request sent',
  `status` varchar(50) DEFAULT NULL COMMENT 'accept/reject/pending',
  `update_timestamp` timestamp NULL DEFAULT NULL COMMENT 'Time of status Change',
  PRIMARY KEY (`group_participants_id`),
  KEY `FK_group_paticipants_group` (`group_id`),
  KEY `FK_group_paticipants_institute_profile` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_payment`
--

CREATE TABLE IF NOT EXISTS `group_payment` (
  `group_payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_app_id` int(10) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`group_payment_id`),
  KEY `FK_group_payment_group_application` (`group_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_round`
--

CREATE TABLE IF NOT EXISTS `group_round` (
  `group_round_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) DEFAULT NULL,
  `round_start_date` timestamp NULL DEFAULT NULL,
  `round_end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_round_id`),
  KEY `FK__group_admission` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_seat_allocation`
--

CREATE TABLE IF NOT EXISTS `group_seat_allocation` (
  `seat_allocation_id` int(10) NOT NULL AUTO_INCREMENT,
  `stud_inst_prefer_id` int(10) DEFAULT NULL,
  `round_id` int(10) DEFAULT NULL,
  `acceptance_status` varchar(50) DEFAULT NULL COMMENT 'accepted/rejected/pending',
  PRIMARY KEY (`seat_allocation_id`),
  KEY `FK__student_institute_preferences` (`stud_inst_prefer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_seat_availability`
--

CREATE TABLE IF NOT EXISTS `group_seat_availability` (
  `group_seat_avail_id` int(10) NOT NULL AUTO_INCREMENT,
  `institute_id` int(10) DEFAULT NULL,
  `branch_id` int(10) DEFAULT NULL,
  `total_seats` int(10) DEFAULT '0',
  `available_seats` int(10) DEFAULT '0',
  `allocated_seats` int(10) DEFAULT '0',
  PRIMARY KEY (`group_seat_avail_id`),
  KEY `FK_group_seat_availability_institute_profile` (`institute_id`),
  KEY `FK_group_seat_availability_institute_branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_student_institute_preferences`
--

CREATE TABLE IF NOT EXISTS `group_student_institute_preferences` (
  `stud_inst_prefer_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_app_id` int(10) DEFAULT NULL,
  `institute_id` int(10) DEFAULT NULL,
  `branch_id` int(10) DEFAULT NULL,
  `round_no` int(10) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  PRIMARY KEY (`stud_inst_prefer_id`),
  KEY `FK__group_application` (`group_app_id`),
  KEY `FK_student_institute_preferences_institute_branch` (`branch_id`),
  KEY `FK_student_institute_preferences_institute_profile` (`institute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `institute_branch`
--

CREATE TABLE IF NOT EXISTS `institute_branch` (
  `branch_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_login` int(10) NOT NULL,
  `degree` varchar(100) DEFAULT NULL,
  `specialization` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `seats` varchar(50) NOT NULL,
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`branch_id`),
  KEY `FK_institute_branch_institute_profile` (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `institute_branch`
--

INSERT INTO `institute_branch` (`branch_id`, `id_login`, `degree`, `specialization`, `description`, `seats`, `event_detected`) VALUES
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
  PRIMARY KEY (`institute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute_profile`
--

INSERT INTO `institute_profile` (`institute_id`, `institute_name`, `contact_no`, `address`, `city`, `state`, `event_detected`) VALUES
(1, 'IIITB12', '81231608872', 'Electronic city2', 'Hyderabad', 'Andhra Pradesh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `list_of_degree_specialisation`
--

CREATE TABLE IF NOT EXISTS `list_of_degree_specialisation` (
  `list_degree_id` int(11) NOT NULL AUTO_INCREMENT,
  `degree` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  PRIMARY KEY (`list_degree_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `list_of_degree_specialisation`
--

INSERT INTO `list_of_degree_specialisation` (`list_degree_id`, `degree`, `specialization`) VALUES
(1, 'BTech', 'CSE'),
(2, 'BTech', 'ECE');

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
  `prerequisites_id` int(10) NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) DEFAULT NULL,
  `list_degree_id` int(10) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  PRIMARY KEY (`prerequisites_id`),
  KEY `FK_prerequisites_institute_branch` (`branch_id`),
  KEY `FK_prerequisites_list_of_degree_specialisation` (`list_degree_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `prerequisites`
--

INSERT INTO `prerequisites` (`prerequisites_id`, `branch_id`, `list_degree_id`, `percentage`) VALUES
(2, 4, 1, 22),
(3, 1, 2, 77),
(4, 4, 2, 99),
(5, 4, 2, 33);

-- --------------------------------------------------------

--
-- Table structure for table `student_education`
--

CREATE TABLE IF NOT EXISTS `student_education` (
  `stud_edu_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_login` int(10) NOT NULL,
  `institute_name` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `start_year` varchar(100) NOT NULL,
  `end_year` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `percentage` varchar(100) NOT NULL,
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`stud_edu_id`),
  KEY `FK_student_education_student_profile` (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `student_education`
--

INSERT INTO `student_education` (`stud_edu_id`, `id_login`, `institute_name`, `degree`, `start_year`, `end_year`, `specialization`, `percentage`, `event_detected`) VALUES
(1, 2, 'hgfjh', '10th', '2013-12-30', '2013-12-30', 'CSE', '81', 0),
(2, 2, 'kjkjh', '12th', '', '', 'CSE', '99', 0),
(3, 2, 'kjkjh', 'M.Tech', '2013-12-31', '2013-12-31', 'CSE', '81', 0),
(4, 2, 'kkkk', 'B.Tech', '', '', 'CSE', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_profile`
--

CREATE TABLE IF NOT EXISTS `student_profile` (
  `stud_profile_id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`stud_profile_id`),
  UNIQUE KEY `Index 1` (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `student_profile`
--

INSERT INTO `student_profile` (`stud_profile_id`, `student_id`, `name`, `mobileno`, `address`, `city`, `state`, `dob`, `summary`, `event_detected`) VALUES
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

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_prerequisites`
--
CREATE TABLE IF NOT EXISTS `view_prerequisites` (
`list_degree_id` int(10)
,`prerequisites_id` int(10)
,`branch_id` int(10)
,`percentage` float
,`degree` varchar(100)
,`specialization` varchar(100)
);
-- --------------------------------------------------------

--
-- Structure for view `view_prerequisites`
--
DROP TABLE IF EXISTS `view_prerequisites`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_prerequisites` AS select `prerequisites`.`list_degree_id` AS `list_degree_id`,`prerequisites`.`prerequisites_id` AS `prerequisites_id`,`prerequisites`.`branch_id` AS `branch_id`,`prerequisites`.`percentage` AS `percentage`,`list_of_degree_specialisation`.`degree` AS `degree`,`list_of_degree_specialisation`.`specialization` AS `specialization` from (`prerequisites` join `list_of_degree_specialisation` on((`prerequisites`.`list_degree_id` = `list_of_degree_specialisation`.`list_degree_id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_admission`
--
ALTER TABLE `group_admission`
  ADD CONSTRAINT `FK_group_institute_profile` FOREIGN KEY (`owner_id`) REFERENCES `institute_profile` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_application`
--
ALTER TABLE `group_application`
  ADD CONSTRAINT `FK_group_application_student_profile` FOREIGN KEY (`applicant_id`) REFERENCES `student_profile` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_group_application_group_admission` FOREIGN KEY (`group_id`) REFERENCES `group_admission` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_participants_stream_in_admission`
--
ALTER TABLE `group_participants_stream_in_admission`
  ADD CONSTRAINT `FK_participants_stream_in_group_admission_group` FOREIGN KEY (`group_id`) REFERENCES `group_admission` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_participants_stream_in_group_admission_institute_profile` FOREIGN KEY (`participant_id`) REFERENCES `institute_profile` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_participants_stream_in_group_admission_institute_branch` FOREIGN KEY (`branch_id`) REFERENCES `institute_branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_paticipants`
--
ALTER TABLE `group_paticipants`
  ADD CONSTRAINT `FK_group_paticipants_group` FOREIGN KEY (`group_id`) REFERENCES `group_admission` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_group_paticipants_institute_profile` FOREIGN KEY (`participant_id`) REFERENCES `institute_profile` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_payment`
--
ALTER TABLE `group_payment`
  ADD CONSTRAINT `FK_group_payment_group_application` FOREIGN KEY (`group_app_id`) REFERENCES `group_application` (`group_app_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_round`
--
ALTER TABLE `group_round`
  ADD CONSTRAINT `FK__group_admission` FOREIGN KEY (`group_id`) REFERENCES `group_admission` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_seat_allocation`
--
ALTER TABLE `group_seat_allocation`
  ADD CONSTRAINT `FK__student_institute_preferences` FOREIGN KEY (`stud_inst_prefer_id`) REFERENCES `group_student_institute_preferences` (`stud_inst_prefer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_seat_availability`
--
ALTER TABLE `group_seat_availability`
  ADD CONSTRAINT `FK_group_seat_availability_institute_branch` FOREIGN KEY (`branch_id`) REFERENCES `institute_branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_group_seat_availability_institute_profile` FOREIGN KEY (`institute_id`) REFERENCES `institute_profile` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_student_institute_preferences`
--
ALTER TABLE `group_student_institute_preferences`
  ADD CONSTRAINT `FK_student_institute_preferences_institute_branch` FOREIGN KEY (`branch_id`) REFERENCES `institute_branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_student_institute_preferences_institute_profile` FOREIGN KEY (`institute_id`) REFERENCES `institute_profile` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__group_application` FOREIGN KEY (`group_app_id`) REFERENCES `group_application` (`group_app_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `FK_prerequisites_institute_branch` FOREIGN KEY (`branch_id`) REFERENCES `institute_branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_prerequisites_list_of_degree_specialisation` FOREIGN KEY (`list_degree_id`) REFERENCES `list_of_degree_specialisation` (`list_degree_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
