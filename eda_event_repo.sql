-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.15 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-03-14 19:08:04
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for eda_event_repo
CREATE DATABASE IF NOT EXISTS `eda_event_repo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `eda_event_repo`;


-- Dumping structure for table eda_event_repo.temp_login
CREATE TABLE IF NOT EXISTS `temp_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `active` varchar(50) DEFAULT 'false',
  `status` varchar(50) NOT NULL DEFAULT 'new',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table eda_event_repo.temp_login: ~3 rows (approximately)
/*!40000 ALTER TABLE `temp_login` DISABLE KEYS */;
INSERT INTO `temp_login` (`id`, `username`, `password`, `active`, `status`, `time`) VALUES
	(9, 'pridhvi.kodamasimham@iiitb.org', 'emi', 'false', 'new', '0000-00-00 00:00:00'),
	(10, 'pridhvi.bittu@gmail.com', 'emi', 'false', 'verified', '0000-00-00 00:00:00'),
	(11, 'simaham007@gmail.com', 'emi', 'false', 'verified', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `temp_login` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
