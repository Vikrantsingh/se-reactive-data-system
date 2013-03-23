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
-- Database: `eda`
--

-- --------------------------------------------------------

--
-- Table structure for table `col_constraint`
--

CREATE TABLE IF NOT EXISTS `col_constraint` (
  `col_id` int(5) NOT NULL,
  `db_event_id` int(10) NOT NULL,
  `col_name` varchar(30) NOT NULL,
  `col_val` varchar(30) DEFAULT NULL,
  `col_expr` varchar(30) DEFAULT NULL,
  `is_expr` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`col_id`),
  KEY `col_access_ibfk_1` (`db_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `database_info`
--

CREATE TABLE IF NOT EXISTS `database_info` (
  `database_id` int(10) NOT NULL AUTO_INCREMENT,
  `database_name` varchar(50) NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`database_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `database_info`
--

INSERT INTO `database_info` (`database_id`, `database_name`, `hostname`, `port`, `username`, `password`) VALUES
(1, 'universal_admission', 'locahost', 3306, 'root', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `db_event`
--

CREATE TABLE IF NOT EXISTS `db_event` (
  `event_id` int(10) NOT NULL,
  `database_id` int(11) NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '0',
  `table_name` varchar(20) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `FK_db_event_database_info` (`database_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_event`
--

INSERT INTO `db_event` (`event_id`, `database_id`, `status`, `table_name`) VALUES
(47, 1, 0, 'login');

-- --------------------------------------------------------

--
-- Stand-in structure for view `db_event_view_summary`
--
CREATE TABLE IF NOT EXISTS `db_event_view_summary` (
`event_id` int(10)
,`database_id` int(10)
,`database_name` varchar(50)
,`hostname` varchar(50)
,`port` int(11)
,`username` varchar(50)
,`password` varchar(50)
,`status` int(10)
,`table_name` varchar(20)
,`db_event_id` int(10)
,`constraints` varchar(300)
,`reaction_id` int(10)
,`reaction_name` varchar(100)
,`reaction_type` varchar(10)
,`sql_query` varchar(200)
,`function_name` varchar(100)
);
-- --------------------------------------------------------

--
-- Table structure for table `dynamic_func`
--

CREATE TABLE IF NOT EXISTS `dynamic_func` (
  `dynamic_funcID` int(11) NOT NULL,
  `query` varchar(300) NOT NULL,
  `func_parametersID` int(11) NOT NULL,
  PRIMARY KEY (`dynamic_funcID`),
  UNIQUE KEY `dynamic_funcID_UNIQUE` (`dynamic_funcID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(50) NOT NULL,
  `event_type` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_type`, `status`) VALUES
(47, 'loginAction', 'DB', 0);

-- --------------------------------------------------------

--
-- Table structure for table `function_parameters`
--

CREATE TABLE IF NOT EXISTS `function_parameters` (
  `func_parametersID` int(11) NOT NULL,
  `data_type` varchar(45) NOT NULL,
  `order` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `Function_actionID` int(11) NOT NULL,
  PRIMARY KEY (`func_parametersID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reaction`
--

CREATE TABLE IF NOT EXISTS `reaction` (
  `reaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL,
  `reaction_name` varchar(100) DEFAULT NULL,
  `reaction_type` varchar(10) NOT NULL,
  `sql_query` varchar(200) DEFAULT NULL,
  `function_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reaction_id`),
  KEY `FK_reaction_events` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `reaction`
--

INSERT INTO `reaction` (`reaction_id`, `event_id`, `reaction_name`, `reaction_type`, `sql_query`, `function_name`) VALUES
(14, 47, 'sendmail', 'FUNCTION', '', 'app.admission.SignUp.mailConformation');

-- --------------------------------------------------------

--
-- Table structure for table `row_filter`
--

CREATE TABLE IF NOT EXISTS `row_filter` (
  `db_event_id` int(10) NOT NULL,
  `constraints` varchar(300) NOT NULL,
  KEY `row_filter_ibfk_1` (`db_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `row_filter`
--

INSERT INTO `row_filter` (`db_event_id`, `constraints`) VALUES
(47, ' status = ''new'' ');

-- --------------------------------------------------------

--
-- Table structure for table `static_func`
--

CREATE TABLE IF NOT EXISTS `static_func` (
  `static_funcID` int(11) NOT NULL,
  `Value` varchar(100) NOT NULL,
  `func_parametersID` int(11) NOT NULL,
  PRIMARY KEY (`static_funcID`),
  UNIQUE KEY `static_funcID_UNIQUE` (`static_funcID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time_event`
--

CREATE TABLE IF NOT EXISTS `time_event` (
  `event_id` int(10) NOT NULL,
  `time_event_id` int(10) NOT NULL,
  `periodic` varchar(20) NOT NULL,
  `time_assigned` time NOT NULL,
  `date_check` date NOT NULL,
  PRIMARY KEY (`time_event_id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `time_event_view_summary`
--
CREATE TABLE IF NOT EXISTS `time_event_view_summary` (
`database_id` int(10)
,`database_name` varchar(50)
,`hostname` varchar(50)
,`port` int(11)
,`username` varchar(50)
,`password` varchar(50)
,`event_id` int(10)
,`status` int(10)
,`table_name` varchar(20)
,`db_event_id` int(10)
,`constraints` varchar(300)
);
-- --------------------------------------------------------

--
-- Structure for view `db_event_view_summary`
--
DROP TABLE IF EXISTS `db_event_view_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_event_view_summary` AS select `db_event`.`event_id` AS `event_id`,`database_info`.`database_id` AS `database_id`,`database_info`.`database_name` AS `database_name`,`database_info`.`hostname` AS `hostname`,`database_info`.`port` AS `port`,`database_info`.`username` AS `username`,`database_info`.`password` AS `password`,`db_event`.`status` AS `status`,`db_event`.`table_name` AS `table_name`,`row_filter`.`db_event_id` AS `db_event_id`,`row_filter`.`constraints` AS `constraints`,`reaction`.`reaction_id` AS `reaction_id`,`reaction`.`reaction_name` AS `reaction_name`,`reaction`.`reaction_type` AS `reaction_type`,`reaction`.`sql_query` AS `sql_query`,`reaction`.`function_name` AS `function_name` from (((`database_info` join `db_event` on((`database_info`.`database_id` = `db_event`.`database_id`))) join `row_filter` on((`db_event`.`event_id` = `row_filter`.`db_event_id`))) join `reaction` on((`db_event`.`event_id` = `reaction`.`event_id`))) WITH CASCADED CHECK OPTION;

-- --------------------------------------------------------

--
-- Structure for view `time_event_view_summary`
--
DROP TABLE IF EXISTS `time_event_view_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `time_event_view_summary` AS select `database_info`.`database_id` AS `database_id`,`database_info`.`database_name` AS `database_name`,`database_info`.`hostname` AS `hostname`,`database_info`.`port` AS `port`,`database_info`.`username` AS `username`,`database_info`.`password` AS `password`,`db_event`.`event_id` AS `event_id`,`db_event`.`status` AS `status`,`db_event`.`table_name` AS `table_name`,`row_filter`.`db_event_id` AS `db_event_id`,`row_filter`.`constraints` AS `constraints` from ((`database_info` join `db_event` on((`database_info`.`database_id` = `db_event`.`database_id`))) join `row_filter` on((`db_event`.`event_id` = `row_filter`.`db_event_id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `col_constraint`
--
ALTER TABLE `col_constraint`
  ADD CONSTRAINT `col_constraint_ibfk_1` FOREIGN KEY (`db_event_id`) REFERENCES `db_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_event`
--
ALTER TABLE `db_event`
  ADD CONSTRAINT `db_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_db_event_database_info` FOREIGN KEY (`database_id`) REFERENCES `database_info` (`database_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `reaction`
--
ALTER TABLE `reaction`
  ADD CONSTRAINT `FK_reaction_events` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `row_filter`
--
ALTER TABLE `row_filter`
  ADD CONSTRAINT `row_filter_ibfk_1` FOREIGN KEY (`db_event_id`) REFERENCES `db_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `time_event`
--
ALTER TABLE `time_event`
  ADD CONSTRAINT `time_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
