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
  `table_name` varchar(50) NOT NULL,
  `surrogate_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `FK_db_event_database_info` (`database_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_event`
--

INSERT INTO `db_event` (`event_id`, `database_id`, `status`, `table_name`, `surrogate_key`) VALUES
(48, 1, 0, 'login', 'id'),
(51, 1, 0, 'group_application', 'group_app_id'),
(52, 1, 0, 'group_payment', 'group_payment_id');

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
,`table_name` varchar(50)
,`surrogate_key` varchar(100)
,`db_event_id` int(10)
,`constraints` varchar(300)
,`reaction_id` int(10)
,`reaction_name` varchar(100)
,`reaction_type` varchar(10)
,`sql_query` varchar(200)
,`function_name` varchar(500)
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_type`, `status`) VALUES
(48, 'loginAction', 'DB', 0),
(51, 'insertGroupPaymentStatusPending', 'DB', 0),
(52, 'setApplicationStatusApproved', 'DB', 0),
(56, 'hellotime', 'TIME', 0),
(57, 'hellotime', 'TIME', 0),
(59, 'RegistrationClosed9', 'TIME', 0),
(60, 'EnableGroupVisiblity9', 'TIME', 0),
(62, 'RegistrationClosed10', 'TIME', 0),
(63, 'StartGroupRegistration10', 'TIME', 0);

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
  `function_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`reaction_id`),
  KEY `FK_reaction_events` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `reaction`
--

INSERT INTO `reaction` (`reaction_id`, `event_id`, `reaction_name`, `reaction_type`, `sql_query`, `function_name`) VALUES
(15, 48, 'sendmail', 'FUNCTION', '', 'app.admission.SignUp.mailConformation'),
(19, 51, 'PaymentStatusPending', 'FUNCTION', '', 'app.admission.PaymentAction.insertGroupPaymentStatusPending'),
(20, 52, 'ApplicationApproval', 'FUNCTION', '', 'app.admission.PaymentAction.setApplicationStatusApproved'),
(24, 56, 'seatAllocate', 'FUNCTION', '', 'app.admission.seatallocation.PreferencesAction.allocateSeat'),
(25, 57, 'seatAllocate', 'FUNCTION', '', 'app.admission.seatallocation.PreferencesAction.allocateSeat'),
(27, 59, 'seatAllocate9', 'FUNCTION', '', 'app.admission.seatallocation.PreferencesAction.allocateSeat'),
(28, 59, 'DisableGroupApply9', 'FUNCTION', '', 'app.admission.TimeEvent.setDisableGroupApply'),
(29, 60, 'setGroupVisiblity9', 'FUNCTION', '', 'app.admission.TimeEvent.setGroupVisible'),
(31, 62, 'seatAllocate10', 'FUNCTION', '', 'app.admission.seatallocation.PreferencesAction.allocateSeat'),
(32, 62, 'DisableGroupApply10', 'FUNCTION', '', 'app.admission.TimeEvent.setDisableGroupApply'),
(33, 63, 'setGroupVisiblity10', 'FUNCTION', '', 'app.admission.TimeEvent.setGroupVisible');

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
(48, ' status = ''new'' '),
(51, ''),
(52, 'payment_status=''paid''');

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
  `time_event_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL,
  `time` datetime NOT NULL,
  `occurred` int(50) NOT NULL DEFAULT '0',
  `periodic` varchar(20) NOT NULL DEFAULT 'no',
  `parameter` int(10) DEFAULT '0',
  PRIMARY KEY (`time_event_id`),
  KEY `time_event_ibfk_1` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `time_event`
--

INSERT INTO `time_event` (`time_event_id`, `event_id`, `time`, `occurred`, `periodic`, `parameter`) VALUES
(1, 56, '2013-04-03 01:50:00', 1, 'no', 6),
(2, 57, '2013-04-03 01:50:00', 1, 'no', 6),
(4, 59, '2013-03-31 00:01:00', 1, 'no', 9),
(5, 60, '2013-03-31 00:01:00', 1, 'no', 9),
(6, 62, '2013-04-27 00:01:00', 0, 'no', 10),
(7, 63, '2013-04-20 00:01:00', 0, 'no', 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `time_event_view_summary`
--
CREATE TABLE IF NOT EXISTS `time_event_view_summary` (
`event_id` int(10)
,`event_name` varchar(50)
,`event_type` varchar(10)
,`status` int(11)
,`time_event_id` int(10)
,`time` datetime
,`occurred` int(50)
,`periodic` varchar(20)
,`parameter` int(10)
,`reaction_id` int(10)
,`reaction_name` varchar(100)
,`reaction_type` varchar(10)
,`sql_query` varchar(200)
,`function_name` varchar(500)
);
-- --------------------------------------------------------

--
-- Structure for view `db_event_view_summary`
--
DROP TABLE IF EXISTS `db_event_view_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_event_view_summary` AS select `db_event`.`event_id` AS `event_id`,`database_info`.`database_id` AS `database_id`,`database_info`.`database_name` AS `database_name`,`database_info`.`hostname` AS `hostname`,`database_info`.`port` AS `port`,`database_info`.`username` AS `username`,`database_info`.`password` AS `password`,`db_event`.`status` AS `status`,`db_event`.`table_name` AS `table_name`,`db_event`.`surrogate_key` AS `surrogate_key`,`row_filter`.`db_event_id` AS `db_event_id`,`row_filter`.`constraints` AS `constraints`,`reaction`.`reaction_id` AS `reaction_id`,`reaction`.`reaction_name` AS `reaction_name`,`reaction`.`reaction_type` AS `reaction_type`,`reaction`.`sql_query` AS `sql_query`,`reaction`.`function_name` AS `function_name` from (((`database_info` join `db_event` on((`database_info`.`database_id` = `db_event`.`database_id`))) join `row_filter` on((`db_event`.`event_id` = `row_filter`.`db_event_id`))) join `reaction` on((`db_event`.`event_id` = `reaction`.`event_id`))) WITH CASCADED CHECK OPTION;

-- --------------------------------------------------------

--
-- Structure for view `time_event_view_summary`
--
DROP TABLE IF EXISTS `time_event_view_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `time_event_view_summary` AS select `events`.`event_id` AS `event_id`,`events`.`event_name` AS `event_name`,`events`.`event_type` AS `event_type`,`events`.`status` AS `status`,`time_event`.`time_event_id` AS `time_event_id`,`time_event`.`time` AS `time`,`time_event`.`occurred` AS `occurred`,`time_event`.`periodic` AS `periodic`,`time_event`.`parameter` AS `parameter`,`reaction`.`reaction_id` AS `reaction_id`,`reaction`.`reaction_name` AS `reaction_name`,`reaction`.`reaction_type` AS `reaction_type`,`reaction`.`sql_query` AS `sql_query`,`reaction`.`function_name` AS `function_name` from ((`events` join `time_event` on((`events`.`event_id` = `time_event`.`event_id`))) join `reaction` on((`events`.`event_id` = `reaction`.`event_id`))) WITH CASCADED CHECK OPTION;

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
  ADD CONSTRAINT `time_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
