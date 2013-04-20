-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2013 at 09:06 AM
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
  `start_date` varchar(50) DEFAULT NULL,
  `end_date` varchar(50) DEFAULT NULL,
  `no_of_rounds` int(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `criteria` varchar(100) DEFAULT NULL,
  `visibility` int(10) DEFAULT '0',
  `group_apply` int(10) NOT NULL DEFAULT '1',
  `fill_preferences` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`),
  KEY `FK_group_institute_profile` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `group_admission`
--

INSERT INTO `group_admission` (`group_id`, `owner_id`, `start_date`, `end_date`, `no_of_rounds`, `title`, `description`, `fees`, `criteria`, `visibility`, `group_apply`, `fill_preferences`) VALUES
(6, 5, '2013-04-21', '2013-05-21', 4, 'MTech Admission', 'MTech Admissions for IIIT''s ...', 1000, 'B.Tech', 0, 1, 1),
(7, 6, '2013-03-15', '2013-04-30', 2, 'MTech ECE Admission', 'Description about the group', 1000, 'B.Tech', 0, 1, 1),
(8, 6, '2013-12-31', '2013-04-02', 1, 'demo', 'Description about the group', 111, '10th', 0, 1, 1),
(9, 5, '2013-03-31', '2013-12-31', 6543, 'I MTECH', 'Description about the group', 654, '10th', 1, 1, 1),
(10, 5, '2013-04-20', '2013-04-27', 3, 'Eminem', 'Description about the group', 10000, '10th', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_application`
--

CREATE TABLE IF NOT EXISTS `group_application` (
  `group_app_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) DEFAULT '0',
  `applicant_id` int(10) DEFAULT NULL,
  `apply_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `application_status` varchar(50) DEFAULT 'pending' COMMENT 'approved/reject/pending',
  `last_updated_on` timestamp NULL DEFAULT NULL,
  `group_application_event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`group_app_id`),
  UNIQUE KEY `my_unique_key` (`group_id`,`applicant_id`),
  KEY `FK_group_application_student_profile` (`applicant_id`),
  KEY `FK_group_application_group_admission` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `group_application`
--

INSERT INTO `group_application` (`group_app_id`, `group_id`, `applicant_id`, `apply_timestamp`, `application_status`, `last_updated_on`, `group_application_event_detected`) VALUES
(2, 9, 7, '2013-04-04 07:26:35', 'approved', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_participants`
--

CREATE TABLE IF NOT EXISTS `group_participants` (
  `group_participants_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) DEFAULT NULL,
  `participant_id` int(10) DEFAULT NULL,
  `request_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'time of request sent',
  `status` varchar(50) DEFAULT 'pending' COMMENT 'accept/reject/pending',
  `update_timestamp` timestamp NULL DEFAULT NULL COMMENT 'Time of status Change',
  PRIMARY KEY (`group_participants_id`),
  KEY `FK_group_paticipants_group` (`group_id`),
  KEY `FK_group_paticipants_institute_profile` (`participant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `group_participants`
--

INSERT INTO `group_participants` (`group_participants_id`, `group_id`, `participant_id`, `request_timestamp`, `status`, `update_timestamp`) VALUES
(9, 6, 5, '2013-04-02 07:10:44', 'accepted', NULL),
(10, 7, 5, '2013-04-02 07:13:13', 'accepted', NULL),
(11, 7, 5, '2013-04-02 07:13:27', 'accepted', NULL),
(12, 6, 6, '2013-04-02 07:15:05', 'accepted', NULL),
(13, 6, 5, '2013-04-03 13:24:57', 'pending', NULL),
(14, 9, 5, '2013-04-03 13:25:06', 'accepted', NULL),
(15, 9, 6, '2013-04-03 13:28:03', 'accepted', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_participants_enroll_courses`
--

CREATE TABLE IF NOT EXISTS `group_participants_enroll_courses` (
  `part_stream_id` int(10) NOT NULL AUTO_INCREMENT,
  `participant_id` int(10) DEFAULT NULL,
  `group_id` int(10) DEFAULT NULL,
  `branch_id` int(10) DEFAULT NULL,
  `group_seats_available` int(10) DEFAULT NULL,
  PRIMARY KEY (`part_stream_id`),
  KEY `FK_participants_stream_in_group_admission_group` (`group_id`),
  KEY `FK_participants_stream_in_group_admission_institute_profile` (`participant_id`),
  KEY `FK_participants_stream_in_group_admission_institute_branch` (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `group_participants_enroll_courses`
--

INSERT INTO `group_participants_enroll_courses` (`part_stream_id`, `participant_id`, `group_id`, `branch_id`, `group_seats_available`) VALUES
(7, 5, 6, 7, 100),
(8, 6, 6, 8, 50),
(9, 5, 9, 7, 99),
(10, 5, 7, 7, 24);

-- --------------------------------------------------------

--
-- Table structure for table `group_payment`
--

CREATE TABLE IF NOT EXISTS `group_payment` (
  `group_payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_app_id` int(10) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT 'pending',
  `group_payment_event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`group_payment_id`),
  KEY `FK_group_payment_group_application` (`group_app_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `group_payment`
--

INSERT INTO `group_payment` (`group_payment_id`, `group_app_id`, `timestamp`, `payment_type`, `payment_status`, `group_payment_event_detected`) VALUES
(2, 2, '2013-04-04 07:27:53', NULL, 'paid', 1);

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
  `acceptance_status` varchar(50) NOT NULL DEFAULT 'pending' COMMENT 'accepted/rejected/pending',
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
  `branch_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`stud_inst_prefer_id`),
  KEY `FK__group_application` (`group_app_id`),
  KEY `FK_student_institute_preferences_institute_branch` (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `group_student_institute_preferences`
--

INSERT INTO `group_student_institute_preferences` (`stud_inst_prefer_id`, `group_app_id`, `branch_id`) VALUES
(3, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `institute_branch`
--

CREATE TABLE IF NOT EXISTS `institute_branch` (
  `branch_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_login` int(10) NOT NULL,
  `degree` varchar(100) DEFAULT NULL,
  `specialization` varchar(50) NOT NULL,
  `branch_description` varchar(500) NOT NULL,
  `seats` varchar(50) NOT NULL,
  `event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`branch_id`),
  KEY `FK_institute_branch_institute_profile` (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `institute_branch`
--

INSERT INTO `institute_branch` (`branch_id`, `id_login`, `degree`, `specialization`, `branch_description`, `seats`, `event_detected`) VALUES
(7, 5, 'M.Tech', 'Computer Science Engineering', 'Only GATE qualified are allowed', '120', 0),
(8, 6, 'M.Tech', 'Electronic and Communication Engineering', 'Foe Electrical Engineers', '50', 0);

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
(5, 'IIITH', '8123160887', 'Eddumailaram', 'Hyderabad', 'Andhra Pradesh', 0),
(6, 'IIITB', '8125681660', 'Electronic city', 'Bangalore', 'Karnataka', 0);

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
  `login_event_detected` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `lastlogin`, `type`, `status`, `login_event_detected`) VALUES
(5, 'pridhvi.bittu@gmail.com', '12345', '2013-04-02 06:59:10', 'institute', 'verified', 1),
(6, 'simaham007@gmail.com', 'aaaaa', '2013-04-02 06:59:56', 'institute', 'verified', 1),
(7, 'vikrantsingh.it@gmail.com', 'aaaaa', '2013-04-02 07:17:56', 'student', 'verified', 1),
(8, 'vikrant.bisen@gmail.com', 'aaaaa', '2013-04-02 07:18:26', 'student', 'verified', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `prerequisites`
--

INSERT INTO `prerequisites` (`prerequisites_id`, `branch_id`, `list_degree_id`, `percentage`) VALUES
(7, 7, 1, 85),
(8, 8, 2, 75);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `student_education`
--

INSERT INTO `student_education` (`stud_edu_id`, `id_login`, `institute_name`, `degree`, `start_year`, `end_year`, `specialization`, `percentage`, `event_detected`) VALUES
(1, 7, 'kk', '10th', '', '', 'CSE', '11', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student_profile`
--

INSERT INTO `student_profile` (`stud_profile_id`, `student_id`, `name`, `mobileno`, `address`, `city`, `state`, `dob`, `summary`, `event_detected`) VALUES
(2, 7, 'Vikrantsingh', '7777777777777', 'Nanded, MH', 'Bangalore', 'Karnataka', '1989-04-29', '', 0),
(3, 8, 'VIKEE', '999999999999', 'PUNE ', 'Bangalore', 'Karnataka', '2008-12-31', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion`
--

CREATE TABLE IF NOT EXISTS `suggestion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `institute_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__institute_profile` (`institute_id`),
  KEY `FK__student_profile` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_group_details`
--
CREATE TABLE IF NOT EXISTS `view_group_details` (
`group_app_id` int(10)
,`group_id` int(10)
,`branch_id` int(10)
,`event_detected` int(10)
,`participant_id` int(10)
,`owner_id` int(10)
,`start_date` varchar(50)
,`end_date` varchar(50)
,`no_of_rounds` int(10)
,`title` varchar(100)
,`description` varchar(500)
,`fees` int(11)
,`criteria` varchar(100)
,`visibility` int(10)
,`group_apply` int(10)
,`fill_preferences` int(10)
,`group_participants_id` int(10)
,`request_timestamp` timestamp
,`status` varchar(50)
,`update_timestamp` timestamp
,`part_stream_id` int(10)
,`group_seats_available` int(10)
,`institute_id` int(10)
,`institute_name` varchar(100)
,`contact_no` varchar(50)
,`address` varchar(100)
,`city` varchar(100)
,`state` varchar(100)
,`id_login` int(10)
,`degree` varchar(100)
,`specialization` varchar(50)
,`branch_description` varchar(500)
,`seats` varchar(50)
,`applicant_id` int(10)
,`apply_timestamp` timestamp
,`application_status` varchar(50)
,`last_updated_on` timestamp
,`group_application_event_detected` int(10)
,`group_payment_id` int(10)
,`timestamp` timestamp
,`payment_type` varchar(50)
,`payment_status` varchar(50)
,`group_payment_event_detected` int(10)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_group_details_without_applicants`
--
CREATE TABLE IF NOT EXISTS `view_group_details_without_applicants` (
`branch_id` int(10)
,`event_detected` int(10)
,`group_id` int(10)
,`participant_id` int(10)
,`owner_id` int(10)
,`start_date` varchar(50)
,`end_date` varchar(50)
,`no_of_rounds` int(10)
,`title` varchar(100)
,`description` varchar(500)
,`fees` int(11)
,`criteria` varchar(100)
,`visibility` int(10)
,`group_apply` int(10)
,`group_participants_id` int(10)
,`request_timestamp` timestamp
,`status` varchar(50)
,`update_timestamp` timestamp
,`part_stream_id` int(10)
,`group_seats_available` int(10)
,`institute_id` int(10)
,`institute_name` varchar(100)
,`contact_no` varchar(50)
,`address` varchar(100)
,`city` varchar(100)
,`state` varchar(100)
,`id_login` int(10)
,`degree` varchar(100)
,`specialization` varchar(50)
,`branch_description` varchar(500)
,`seats` varchar(50)
);
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
-- Structure for view `view_group_details`
--
DROP TABLE IF EXISTS `view_group_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_group_details` AS select `group_application`.`group_app_id` AS `group_app_id`,`group_admission`.`group_id` AS `group_id`,`group_participants_enroll_courses`.`branch_id` AS `branch_id`,`institute_profile`.`event_detected` AS `event_detected`,`group_participants`.`participant_id` AS `participant_id`,`group_admission`.`owner_id` AS `owner_id`,`group_admission`.`start_date` AS `start_date`,`group_admission`.`end_date` AS `end_date`,`group_admission`.`no_of_rounds` AS `no_of_rounds`,`group_admission`.`title` AS `title`,`group_admission`.`description` AS `description`,`group_admission`.`fees` AS `fees`,`group_admission`.`criteria` AS `criteria`,`group_admission`.`visibility` AS `visibility`,`group_admission`.`group_apply` AS `group_apply`,`group_admission`.`fill_preferences` AS `fill_preferences`,`group_participants`.`group_participants_id` AS `group_participants_id`,`group_participants`.`request_timestamp` AS `request_timestamp`,`group_participants`.`status` AS `status`,`group_participants`.`update_timestamp` AS `update_timestamp`,`group_participants_enroll_courses`.`part_stream_id` AS `part_stream_id`,`group_participants_enroll_courses`.`group_seats_available` AS `group_seats_available`,`institute_profile`.`institute_id` AS `institute_id`,`institute_profile`.`institute_name` AS `institute_name`,`institute_profile`.`contact_no` AS `contact_no`,`institute_profile`.`address` AS `address`,`institute_profile`.`city` AS `city`,`institute_profile`.`state` AS `state`,`institute_branch`.`id_login` AS `id_login`,`institute_branch`.`degree` AS `degree`,`institute_branch`.`specialization` AS `specialization`,`institute_branch`.`branch_description` AS `branch_description`,`institute_branch`.`seats` AS `seats`,`group_application`.`applicant_id` AS `applicant_id`,`group_application`.`apply_timestamp` AS `apply_timestamp`,`group_application`.`application_status` AS `application_status`,`group_application`.`last_updated_on` AS `last_updated_on`,`group_application`.`group_application_event_detected` AS `group_application_event_detected`,`group_payment`.`group_payment_id` AS `group_payment_id`,`group_payment`.`timestamp` AS `timestamp`,`group_payment`.`payment_type` AS `payment_type`,`group_payment`.`payment_status` AS `payment_status`,`group_payment`.`group_payment_event_detected` AS `group_payment_event_detected` from ((((((`group_admission` join `group_participants` on((`group_admission`.`group_id` = `group_participants`.`group_id`))) join `group_participants_enroll_courses` on(((`group_admission`.`group_id` = `group_participants_enroll_courses`.`group_id`) and (`group_participants`.`participant_id` = `group_participants_enroll_courses`.`participant_id`)))) join `institute_profile` on((`institute_profile`.`institute_id` = `group_participants`.`participant_id`))) join `institute_branch` on(((`group_participants_enroll_courses`.`branch_id` = `institute_branch`.`branch_id`) and (`institute_profile`.`event_detected` = `institute_branch`.`event_detected`)))) join `group_application` on((`group_admission`.`group_id` = `group_application`.`group_id`))) join `group_payment` on((`group_application`.`group_app_id` = `group_payment`.`group_app_id`))) WITH CASCADED CHECK OPTION;

-- --------------------------------------------------------

--
-- Structure for view `view_group_details_without_applicants`
--
DROP TABLE IF EXISTS `view_group_details_without_applicants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_group_details_without_applicants` AS select `group_participants_enroll_courses`.`branch_id` AS `branch_id`,`institute_profile`.`event_detected` AS `event_detected`,`group_admission`.`group_id` AS `group_id`,`group_participants`.`participant_id` AS `participant_id`,`group_admission`.`owner_id` AS `owner_id`,`group_admission`.`start_date` AS `start_date`,`group_admission`.`end_date` AS `end_date`,`group_admission`.`no_of_rounds` AS `no_of_rounds`,`group_admission`.`title` AS `title`,`group_admission`.`description` AS `description`,`group_admission`.`fees` AS `fees`,`group_admission`.`criteria` AS `criteria`,`group_admission`.`visibility` AS `visibility`,`group_admission`.`group_apply` AS `group_apply`,`group_participants`.`group_participants_id` AS `group_participants_id`,`group_participants`.`request_timestamp` AS `request_timestamp`,`group_participants`.`status` AS `status`,`group_participants`.`update_timestamp` AS `update_timestamp`,`group_participants_enroll_courses`.`part_stream_id` AS `part_stream_id`,`group_participants_enroll_courses`.`group_seats_available` AS `group_seats_available`,`institute_profile`.`institute_id` AS `institute_id`,`institute_profile`.`institute_name` AS `institute_name`,`institute_profile`.`contact_no` AS `contact_no`,`institute_profile`.`address` AS `address`,`institute_profile`.`city` AS `city`,`institute_profile`.`state` AS `state`,`institute_branch`.`id_login` AS `id_login`,`institute_branch`.`degree` AS `degree`,`institute_branch`.`specialization` AS `specialization`,`institute_branch`.`branch_description` AS `branch_description`,`institute_branch`.`seats` AS `seats` from ((((`group_admission` join `group_participants` on((`group_admission`.`group_id` = `group_participants`.`group_id`))) join `group_participants_enroll_courses` on(((`group_admission`.`group_id` = `group_participants_enroll_courses`.`group_id`) and (`group_participants`.`participant_id` = `group_participants_enroll_courses`.`participant_id`)))) join `institute_profile` on((`institute_profile`.`institute_id` = `group_participants`.`participant_id`))) join `institute_branch` on(((`group_participants_enroll_courses`.`branch_id` = `institute_branch`.`branch_id`) and (`institute_profile`.`event_detected` = `institute_branch`.`event_detected`)))) WITH CASCADED CHECK OPTION;

-- --------------------------------------------------------

--
-- Structure for view `view_prerequisites`
--
DROP TABLE IF EXISTS `view_prerequisites`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_prerequisites` AS select `prerequisites`.`list_degree_id` AS `list_degree_id`,`prerequisites`.`prerequisites_id` AS `prerequisites_id`,`prerequisites`.`branch_id` AS `branch_id`,`prerequisites`.`percentage` AS `percentage`,`list_of_degree_specialisation`.`degree` AS `degree`,`list_of_degree_specialisation`.`specialization` AS `specialization` from (`prerequisites` join `list_of_degree_specialisation` on((`prerequisites`.`list_degree_id` = `list_of_degree_specialisation`.`list_degree_id`))) WITH CASCADED CHECK OPTION;

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
  ADD CONSTRAINT `FK_group_application_group_admission` FOREIGN KEY (`group_id`) REFERENCES `group_admission` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_group_application_student_profile` FOREIGN KEY (`applicant_id`) REFERENCES `student_profile` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_participants`
--
ALTER TABLE `group_participants`
  ADD CONSTRAINT `FK_group_paticipants_group` FOREIGN KEY (`group_id`) REFERENCES `group_admission` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_group_paticipants_institute_profile` FOREIGN KEY (`participant_id`) REFERENCES `institute_profile` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_participants_enroll_courses`
--
ALTER TABLE `group_participants_enroll_courses`
  ADD CONSTRAINT `FK_participants_stream_in_group_admission_group` FOREIGN KEY (`group_id`) REFERENCES `group_admission` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_participants_stream_in_group_admission_institute_branch` FOREIGN KEY (`branch_id`) REFERENCES `institute_branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_participants_stream_in_group_admission_institute_profile` FOREIGN KEY (`participant_id`) REFERENCES `institute_profile` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
