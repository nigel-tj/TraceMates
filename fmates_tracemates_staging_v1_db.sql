-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2016 at 10:52 AM
-- Server version: 5.5.52-cll
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fmates_tracemates_staging_v1_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `surname` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `phone` varchar(128) NOT NULL DEFAULT '',
  `address` varchar(128) NOT NULL DEFAULT '',
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`customer_id`),
  UNIQUE KEY `customer_id` (`customer_id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_id`, `name`, `surname`, `email`, `phone`, `address`, `creation_time`, `modified_time`) VALUES
(1, 'customer_id1', 'Customer', 'Surnae', 'Email', '071123456789', 'Customer Address', '2016-10-06 19:24:22', '2016-10-06 19:24:48');

--
-- Triggers `customer`
--
DROP TRIGGER IF EXISTS `customer_creation`;
DELIMITER //
CREATE TRIGGER `customer_creation` BEFORE INSERT ON `customer`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = ifnull(new.modified_time,UTC_TIMESTAMP());
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `customer_update`;
DELIMITER //
CREATE TRIGGER `customer_update` BEFORE UPDATE ON `customer`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = UTC_TIMESTAMP();
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_parcel`
--

CREATE TABLE IF NOT EXISTS `customer_parcel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_parcel_id` varchar(128) NOT NULL DEFAULT '',
  `customer_id` varchar(128) NOT NULL DEFAULT '',
  `parcel_id` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`customer_parcel_id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `customer_parcel_id` (`customer_parcel_id`) USING BTREE,
  UNIQUE KEY `customer_parcel` (`customer_id`,`parcel_id`) USING BTREE,
  KEY `customer_parcel_parcel` (`parcel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `customer_parcel`
--

INSERT INTO `customer_parcel` (`id`, `customer_parcel_id`, `customer_id`, `parcel_id`) VALUES
(1, 'customer_parcel_id1', 'customer_id1', 'parcel_id1'),
(4, 'customer_parcel_id2', 'customer_id1', 'parcel_id2'),
(5, 'customer_parcel_id3', 'customer_id1', 'parcel_id3'),
(6, 'customer_parcel_id4', 'customer_id1', 'parcel_id4');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `surname` varchar(128) NOT NULL DEFAULT '',
  `phone` varchar(128) NOT NULL DEFAULT '',
  `address` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`driver_id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `driver_id` (`driver_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `driver_id`, `name`, `surname`, `phone`, `address`, `email`, `creation_time`, `modified_time`) VALUES
(1, 'driver_id1', 'Driver Name', '', 'Driver Phone', 'Address', '', '2016-10-06 19:21:52', '2016-10-06 19:21:52');

--
-- Triggers `driver`
--
DROP TRIGGER IF EXISTS `driver_creation`;
DELIMITER //
CREATE TRIGGER `driver_creation` BEFORE INSERT ON `driver`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = ifnull(new.modified_time,UTC_TIMESTAMP());
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `driver_update`;
DELIMITER //
CREATE TRIGGER `driver_update` BEFORE UPDATE ON `driver`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = UTC_TIMESTAMP();
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` varchar(128) NOT NULL DEFAULT '',
  `longitude` varchar(128) NOT NULL DEFAULT '',
  `latitude` varchar(128) NOT NULL DEFAULT '',
  `street_address` varchar(128) DEFAULT '',
  `neighbourhood` varchar(128) DEFAULT '',
  `city` varchar(128) DEFAULT '',
  `region` varchar(128) DEFAULT '',
  `country` varchar(128) DEFAULT '',
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`location_id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `location_id` (`location_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location_id`, `longitude`, `latitude`, `street_address`, `neighbourhood`, `city`, `region`, `country`, `creation_time`, `modified_time`) VALUES
(4, 'tracker_id1', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(5, 'location_57f431958f845', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(6, 'location_57f4319e8f68c', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(7, 'location_57f431a84a4ec', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(8, 'location_57f431aa2237d', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(9, 'location_57f431ab1ae29', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(10, 'location_57f431ac4a467', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(11, 'location_57f431ad1600d', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(12, 'location_57f431adb1211', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(13, 'location_57f431b2983f9', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(14, 'location_57f431b3e04cb', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(15, 'location_57f431b49ef0c', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(16, 'location_57f432b8deb80', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-04 22:52:40', '2016-10-04 22:52:40'),
(17, 'location_57f432be57f93', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-04 22:52:46', '2016-10-04 22:52:46'),
(18, 'location_57f432bf76a9b', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-04 22:52:47', '2016-10-04 22:52:47'),
(19, 'location_57f432c0f3e30', 'longitude', 'latitude', NULL, NULL, NULL, NULL, NULL, '2016-10-04 22:52:48', '2016-10-04 22:52:48'),
(20, 'location_57f59fcadc96d', 'longitude2', 'latityde2', NULL, NULL, NULL, NULL, NULL, '2016-10-06 00:50:18', '2016-10-06 00:50:18'),
(21, 'location_57f59fcc4c0da', 'longitude2', 'latityde2', NULL, NULL, NULL, NULL, NULL, '2016-10-06 00:50:20', '2016-10-06 00:50:20'),
(22, 'location_57f5a55fcafde', '18.4728921577506', '-33.95210910126', '', '', '', NULL, '', '2016-10-06 01:14:07', '2016-10-06 01:14:07'),
(23, 'location_57f5a56ed5de2', '18.4728921577506', '-33.95210910126', '', '', '', NULL, '', '2016-10-06 01:14:22', '2016-10-06 01:14:22'),
(24, 'location_57f5a57ddb96e', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:14:37', '2016-10-06 01:14:37'),
(25, 'location_57f5a58cc904f', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:14:52', '2016-10-06 01:14:52'),
(26, 'location_57f5a59bca76b', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:15:07', '2016-10-06 01:15:07'),
(27, 'location_57f5a5aacb5da', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:15:22', '2016-10-06 01:15:22'),
(28, 'location_57f5a5b9cbf11', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:15:37', '2016-10-06 01:15:37'),
(29, 'location_57f5a5c8f310a', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:15:52', '2016-10-06 01:15:52'),
(30, 'location_57f5a5d7f03d4', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:16:07', '2016-10-06 01:16:07'),
(31, 'location_57f5a5e6d0da3', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:16:22', '2016-10-06 01:16:22'),
(32, 'location_57f5a5f5c9554', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:16:37', '2016-10-06 01:16:37'),
(33, 'location_57f5a604cf377', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:16:52', '2016-10-06 01:16:52'),
(34, 'location_57f5a6140a034', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:17:08', '2016-10-06 01:17:08'),
(35, 'location_57f5a622cc2ee', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:17:22', '2016-10-06 01:17:22'),
(36, 'location_57f5a631c7d60', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:17:37', '2016-10-06 01:17:37'),
(37, 'location_57f5a640c9426', '18.4728398546749', '-33.9521334506887', '', '', '', NULL, '', '2016-10-06 01:17:52', '2016-10-06 01:17:52'),
(38, 'location_57f5a6d47273f', '', '', '', '', '', NULL, '', '2016-10-06 01:20:20', '2016-10-06 01:20:20'),
(39, 'location_57f5a6e33621b', '18.4728398546749', '-33.9521334506887', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:20:35', '2016-10-06 01:20:35'),
(40, 'location_57f5a6f22a877', '18.4727040678435', '-33.9522246038857', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:20:50', '2016-10-06 01:20:50'),
(41, 'location_57f5a7012d72c', '18.4727040678435', '-33.9522246038857', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:21:05', '2016-10-06 01:21:05'),
(42, 'location_57f5a71032b75', '18.4727184847169', '-33.952200254457', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:21:20', '2016-10-06 01:21:20'),
(43, 'location_57f5a71f20cc1', '18.4727184847169', '-33.952200254457', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:21:35', '2016-10-06 01:21:35'),
(44, 'location_57f5a7677b126', '18.4727184847169', '-33.952200254457', '', '', '', NULL, '', '2016-10-06 01:22:47', '2016-10-06 01:22:47'),
(45, 'location_57f5a773db458', '18.4728998691016', '-33.952255742656', '', '', '', NULL, '', '2016-10-06 01:22:59', '2016-10-06 01:22:59'),
(46, 'location_57f5a79595abe', '18.4728090092712', '-33.9521865500453', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:23:33', '2016-10-06 01:23:33'),
(47, 'location_57f5a7a3c0843', '18.4727961011403', '-33.9521855861265', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:23:47', '2016-10-06 01:23:47'),
(48, 'location_57f5a7b329923', '18.472763663175', '-33.9521477837432', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:24:03', '2016-10-06 01:24:03'),
(49, 'location_57f5a7c1c0d7f', '18.472763663175', '-33.9521477837432', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:24:17', '2016-10-06 01:24:17'),
(50, 'location_57f5a7d0dc179', '18.472763663175', '-33.9521477837432', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:24:32', '2016-10-06 01:24:32'),
(51, 'location_57f5a7dfe04f9', '18.472763663175', '-33.9521477837432', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:24:47', '2016-10-06 01:24:47'),
(52, 'location_57f5a9d24833f', '18.4726775810295', '-33.9522308064941', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:33:06', '2016-10-06 01:33:06'),
(53, 'location_57f5a9e193227', '18.4726775810295', '-33.9522308064941', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:33:21', '2016-10-06 01:33:21'),
(54, 'location_57f5a9f03a647', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:33:36', '2016-10-06 01:33:36'),
(55, 'location_57f5a9ff3df3a', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:33:51', '2016-10-06 01:33:51'),
(56, 'location_57f5aa0e47d47', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:34:06', '2016-10-06 01:34:06'),
(57, 'location_57f5aa1d36e48', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:34:21', '2016-10-06 01:34:21'),
(58, 'location_57f5aa2ca600f', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:34:36', '2016-10-06 01:34:36'),
(59, 'location_57f5aa3b5df6c', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:34:51', '2016-10-06 01:34:51'),
(60, 'location_57f5aa4a5f98d', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:35:06', '2016-10-06 01:35:06'),
(61, 'location_57f5aa593ee1d', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:35:21', '2016-10-06 01:35:21'),
(62, 'location_57f5aa684adb4', '18.4726930037313', '-33.9522037329468', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:35:36', '2016-10-06 01:35:36'),
(63, 'location_57f5aa7738637', '18.4727019723677', '-33.9521844545695', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:35:51', '2016-10-06 01:35:51'),
(64, 'location_57f5aa8653b3d', '18.4727019723677', '-33.9521844545695', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:36:06', '2016-10-06 01:36:06'),
(65, 'location_57f5aa955b40b', '18.4727019723677', '-33.9521844545695', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:36:21', '2016-10-06 01:36:21'),
(66, 'location_57f5aaa44fe37', '18.4727019723677', '-33.9521844545695', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:36:36', '2016-10-06 01:36:36'),
(67, 'location_57f5aab33b89c', '18.4727019723677', '-33.9521844545695', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:36:51', '2016-10-06 01:36:51'),
(68, 'location_57f5aac2a09c3', '18.4727019723677', '-33.9521844545695', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:37:06', '2016-10-06 01:37:06'),
(69, 'location_57f5aad146e82', '18.4727019723677', '-33.9521844545695', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:37:21', '2016-10-06 01:37:21'),
(70, 'location_57f5ac0a1c0c7', '18.4727056604051', '-33.9522349974457', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:42:34', '2016-10-06 01:42:34'),
(71, 'location_57f5ac18863f0', '18.4727190714502', '-33.9522236399669', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:42:48', '2016-10-06 01:42:48'),
(72, 'location_57f5ac279cbec', '18.4727190714502', '-33.9522236399669', '3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:43:03', '2016-10-06 01:43:03'),
(73, 'location_57f5ac36ae2b5', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:43:18', '2016-10-06 01:43:18'),
(74, 'location_57f5ac45983f3', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:43:33', '2016-10-06 01:43:33'),
(75, 'location_57f5ac549fcde', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:43:48', '2016-10-06 01:43:48'),
(76, 'location_57f5ac63bf3ea', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:44:03', '2016-10-06 01:44:03'),
(77, 'location_57f5ac72943d3', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:44:18', '2016-10-06 01:44:18'),
(78, 'location_57f5ac81bee0a', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:44:33', '2016-10-06 01:44:33'),
(79, 'location_57f5ac911d57d', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:44:49', '2016-10-06 01:44:49'),
(80, 'location_57f5ac9fbc57e', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:45:03', '2016-10-06 01:45:03'),
(81, 'location_57f5acaee1de6', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:45:18', '2016-10-06 01:45:18'),
(82, 'location_57f5acbda6260', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:45:33', '2016-10-06 01:45:33'),
(83, 'location_57f5accca856d', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:45:48', '2016-10-06 01:45:48'),
(84, 'location_57f5acdbb4507', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:46:03', '2016-10-06 01:46:03'),
(85, 'location_57f5acea95d70', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:46:18', '2016-10-06 01:46:18'),
(86, 'location_57f5acf98809a', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:46:33', '2016-10-06 01:46:33'),
(87, 'location_57f5ad090d5cc', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:46:49', '2016-10-06 01:46:49'),
(88, 'location_57f5ad17a7c7c', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:47:03', '2016-10-06 01:47:03'),
(89, 'location_57f5ad2690a89', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:47:18', '2016-10-06 01:47:18'),
(90, 'location_57f5ad3596552', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:47:33', '2016-10-06 01:47:33'),
(91, 'location_57f5ad44872e4', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:47:48', '2016-10-06 01:47:48'),
(92, 'location_57f5ad53d5daf', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:48:03', '2016-10-06 01:48:03'),
(93, 'location_57f5ad629db00', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:48:18', '2016-10-06 01:48:18'),
(94, 'location_57f5ad71b6c58', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:48:33', '2016-10-06 01:48:33'),
(95, 'location_57f5ad80a062c', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:48:48', '2016-10-06 01:48:48'),
(96, 'location_57f5ad8f91b80', '18.4727411158555', '-33.9522100612837', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:49:03', '2016-10-06 01:49:03'),
(97, 'location_57f5ae98a43c4', '18.4728173911744', '-33.9522647532019', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:53:28', '2016-10-06 01:53:28'),
(98, 'location_57f5aea7b442a', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:53:43', '2016-10-06 01:53:43'),
(99, 'location_57f5aeb687e11', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:53:58', '2016-10-06 01:53:58'),
(100, 'location_57f5aec5edef5', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:54:13', '2016-10-06 01:54:13'),
(101, 'location_57f5aed48f809', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:54:28', '2016-10-06 01:54:28'),
(102, 'location_57f5aee3ae42f', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:54:43', '2016-10-06 01:54:43'),
(103, 'location_57f5aef2844fe', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:54:58', '2016-10-06 01:54:58'),
(104, 'location_57f5af01d81e0', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:55:13', '2016-10-06 01:55:13'),
(105, 'location_57f5af10f3dc6', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:55:28', '2016-10-06 01:55:28'),
(106, 'location_57f5af1f93cea', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:55:43', '2016-10-06 01:55:43'),
(107, 'location_57f5af2ea15d7', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:55:58', '2016-10-06 01:55:58'),
(108, 'location_57f5af3e06a34', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:56:14', '2016-10-06 01:56:14'),
(109, 'location_57f5af4c91647', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:56:28', '2016-10-06 01:56:28'),
(110, 'location_57f5af5c02ac7', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:56:44', '2016-10-06 01:56:44'),
(111, 'location_57f5af6abcee9', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:56:58', '2016-10-06 01:56:58'),
(112, 'location_57f5af799189b', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:57:13', '2016-10-06 01:57:13'),
(113, 'location_57f5af88b2469', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:57:28', '2016-10-06 01:57:28'),
(114, 'location_57f5af97bbb78', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:57:43', '2016-10-06 01:57:43'),
(115, 'location_57f5afa6d01ea', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:57:58', '2016-10-06 01:57:58'),
(116, 'location_57f5afb5a0393', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:58:13', '2016-10-06 01:58:13'),
(117, 'location_57f5afc505e98', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:58:29', '2016-10-06 01:58:29'),
(118, 'location_57f5afd391f4d', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:58:43', '2016-10-06 01:58:43'),
(119, 'location_57f5afe29bd4b', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:58:58', '2016-10-06 01:58:58'),
(120, 'location_57f5aff1d27c2', '18.4728433750742', '-33.9521696605104', '1â€“3 Hill Road, Southern Suburbs, WC, 7700, South Africa', '', '', NULL, '', '2016-10-06 01:59:13', '2016-10-06 01:59:13'),
(121, 'location_57f5f8b1eaff1', '18.596376446488', '-33.9692236002118', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:09:37', '2016-10-06 07:09:37'),
(122, 'location_57f5f8c12ef1a', '18.5964000132814', '-33.9692297984332', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:09:53', '2016-10-06 07:09:53'),
(123, 'location_57f5f8d007c1a', '18.5964245222841', '-33.9691952345164', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:10:08', '2016-10-06 07:10:08'),
(124, 'location_57f5f8dfdf09d', '18.5963603529482', '-33.969179446307', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:10:23', '2016-10-06 07:10:23'),
(125, 'location_57f5f8ee0c1d9', '18.5963882050109', '-33.9691793247759', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:10:38', '2016-10-06 07:10:38'),
(126, 'location_57f5f8fd9e6f7', '18.5963322637488', '-33.9691416110422', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:10:53', '2016-10-06 07:10:53'),
(127, 'location_57f5f90c2ae92', '18.5963466813812', '-33.9691899594765', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:11:08', '2016-10-06 07:11:08'),
(128, 'location_57f5f919c4ad5', '18.5965141125215', '-33.9692418920666', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:11:21', '2016-10-06 07:11:21'),
(129, 'location_57f5f92a100a5', '18.5963988937363', '-33.9692465341024', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:11:38', '2016-10-06 07:11:38'),
(130, 'location_57f5f93a11d8b', '18.5963510039226', '-33.9691309607354', 'Cape Town Airport, Matroosfontein, WC, 7490, South Africa', '', '', NULL, '', '2016-10-06 07:11:54', '2016-10-06 07:11:54'),
(131, 'location_57f974306ef6f', '-122.03478372', '37.33195781', '10627 Bandley Dr, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:33:20', '2016-10-08 22:33:20'),
(132, 'location_57f9743f6a221', '-122.03464043', '37.3309564', '10525â€“10599 Bandley Dr, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:33:35', '2016-10-08 22:33:35'),
(133, 'location_57f9744f7bc78', '-122.03445214', '37.33026582', '10503â€“10523 Bandley Dr, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:33:51', '2016-10-08 22:33:51'),
(134, 'location_57f9745d66c91', '-122.03337161', '37.33019492', '20484â€“20520 Mariani Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:34:05', '2016-10-08 22:34:05'),
(135, 'location_57f9746c6c0cd', '-122.03260685', '37.33018628', '20484â€“20520 Mariani Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:34:20', '2016-10-08 22:34:20'),
(136, 'location_57f9747b6c720', '-122.03260685', '37.33018628', '20484â€“20520 Mariani Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:34:35', '2016-10-08 22:34:35'),
(137, 'location_57f9748b0b633', '-122.03199217', '37.33014709', '20462â€“20482 Mariani Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:34:51', '2016-10-08 22:34:51'),
(138, 'location_57f97499bebfd', '-122.03072155', '37.33041495', '20450 Mariani Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:35:05', '2016-10-08 22:35:05'),
(139, 'location_57f974a8708d1', '-122.03072948', '37.33133995', 'Apple Inc., 1 Infinite Loop, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:35:20', '2016-10-08 22:35:20'),
(140, 'location_57f974b7a9e4c', '-122.03043593', '37.33165582', 'Apple Inc., 1 Infinite Loop, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:35:35', '2016-10-08 22:35:35'),
(141, 'location_57f974c6a55be', '-122.03033803', '37.33165577', 'Apple Inc., 1 Infinite Loop, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:35:50', '2016-10-08 22:35:50'),
(142, 'location_57f974d570dff', '-122.03064682', '37.33065643', 'Apple Inc., Infinite Loop, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:36:05', '2016-10-08 22:36:05'),
(143, 'location_57f974e46f163', '-122.029858', '37.3304394', '20400â€“20402 Mariani Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:36:20', '2016-10-08 22:36:20'),
(144, 'location_57f974f371b64', '-122.02881946', '37.33024141', 'Mariani Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:36:35', '2016-10-08 22:36:35'),
(145, 'location_57f97509659b3', '-122.02844723', '37.33023864', 'Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:36:57', '2016-10-08 22:36:57'),
(146, 'location_57f97516b1f61', '18.4727706073369', '-33.9521019220435', NULL, NULL, NULL, NULL, NULL, '2016-10-08 22:37:10', '2016-10-08 22:37:10'),
(147, 'location_57f9751714baf', '18.4727706073369', '-33.9521019220435', NULL, NULL, NULL, NULL, NULL, '2016-10-08 22:37:11', '2016-10-08 22:37:11'),
(148, 'location_57f97517a5e93', '-122.0257753', '37.33019022', '20156 Merritt Dr, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:37:11', '2016-10-08 22:37:11'),
(149, 'location_57f975267d2aa', '18.47289307976', '-33.9521307265702', NULL, NULL, NULL, NULL, NULL, '2016-10-08 22:37:26', '2016-10-08 22:37:26'),
(150, 'location_57f97526a00d2', '-122.02445635', '37.3301953', '20094 Merritt Dr, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:37:26', '2016-10-08 22:37:26'),
(151, 'location_57f975352501e', '18.47289307976', '-33.9521307265702', NULL, NULL, NULL, NULL, NULL, '2016-10-08 22:37:41', '2016-10-08 22:37:41'),
(152, 'location_57f975359e2d7', '-122.02344987', '37.33023256', '20016â€“20056 Merritt Dr, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:37:41', '2016-10-08 22:37:41'),
(153, 'location_57f9754574de3', '-122.02322912', '37.33074384', '10541 N Blaney Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:37:57', '2016-10-08 22:37:57'),
(154, 'location_57f9755395256', '-122.02320924', '37.33177031', '10554â€“10596 N Blaney Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:38:11', '2016-10-08 22:38:11'),
(155, 'location_57f975628f876', '-122.0234658', '37.33261978', '10614 N Blaney Ave, Cupertino, CA  95014, United States', NULL, NULL, NULL, NULL, '2016-10-08 22:38:26', '2016-10-08 22:38:26'),
(156, 'location_57f9756ece0eb', '18.4728088521679', '-33.9520007689205', NULL, NULL, NULL, NULL, NULL, '2016-10-08 22:38:38', '2016-10-08 22:38:38'),
(157, 'location_57f9757174cc8', '18.4727833606475', '-33.9519742783475', NULL, NULL, NULL, NULL, NULL, '2016-10-08 22:38:41', '2016-10-08 22:38:41'),
(158, 'location_57f9757feef98', '18.4729986079209', '-33.9522256935332', NULL, NULL, NULL, NULL, NULL, '2016-10-08 22:38:55', '2016-10-08 22:38:55'),
(159, 'location_57f9758f0fb5a', '18.4730005357587', '-33.9522531023565', NULL, NULL, NULL, NULL, NULL, '2016-10-08 22:39:11', '2016-10-08 22:39:11'),
(160, 'location_57f975b236214', '18.4729085024618', '-33.9522638731021', '5 York Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:39:46', '2016-10-08 22:39:46'),
(161, 'location_57f975c04b2c5', '18.4729092568331', '-33.952174983019', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:40:00', '2016-10-08 22:40:00'),
(162, 'location_57f975ceebb29', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:40:14', '2016-10-08 22:40:14'),
(163, 'location_57f975ddddeed', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:40:29', '2016-10-08 22:40:29'),
(164, 'location_57f975ecea660', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:40:44', '2016-10-08 22:40:44'),
(165, 'location_57f975fc61794', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:41:00', '2016-10-08 22:41:00'),
(166, 'location_57f9760aeb2a5', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:41:14', '2016-10-08 22:41:14'),
(167, 'location_57f97619dd921', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:41:29', '2016-10-08 22:41:29'),
(168, 'location_57f9762904639', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:41:45', '2016-10-08 22:41:45'),
(169, 'location_57f976384a0aa', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:42:00', '2016-10-08 22:42:00'),
(170, 'location_57f976470d888', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:42:15', '2016-10-08 22:42:15'),
(171, 'location_57f97655dfb8c', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:42:29', '2016-10-08 22:42:29'),
(172, 'location_57f97664ee2c0', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:42:44', '2016-10-08 22:42:44'),
(173, 'location_57f9767447c3b', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:43:00', '2016-10-08 22:43:00'),
(174, 'location_57f97682d65ee', '18.4728858713233', '-33.9521928364727', '12 Upper Liesbeek Road, Southern Suburbs, WC, 7700, South Africa', NULL, NULL, NULL, NULL, '2016-10-08 22:43:14', '2016-10-08 22:43:14');

--
-- Triggers `location`
--
DROP TRIGGER IF EXISTS `location_creation`;
DELIMITER //
CREATE TRIGGER `location_creation` BEFORE INSERT ON `location`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = ifnull(new.modified_time,UTC_TIMESTAMP());
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `location_update`;
DELIMITER //
CREATE TRIGGER `location_update` BEFORE UPDATE ON `location`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = UTC_TIMESTAMP();
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `parcel`
--

CREATE TABLE IF NOT EXISTS `parcel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcel_id` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `parcel_details` text,
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`parcel_id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `parcel_id` (`parcel_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `parcel`
--

INSERT INTO `parcel` (`id`, `parcel_id`, `name`, `parcel_details`, `creation_time`, `modified_time`) VALUES
(1, 'parcel_id1', 'Parcel 1', '', '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(2, 'parcel_id2', 'Parcel 2', '', '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(3, 'parcel_id3', 'Parcel 3', '', '2016-10-05 01:21:10', '2016-10-05 01:21:10'),
(4, 'parcel_id4', 'Parcel 4', '', '2016-10-05 01:21:10', '2016-10-05 01:21:10');

--
-- Triggers `parcel`
--
DROP TRIGGER IF EXISTS `parcel_creation`;
DELIMITER //
CREATE TRIGGER `parcel_creation` BEFORE INSERT ON `parcel`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = ifnull(new.modified_time,UTC_TIMESTAMP());
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `parcel_update`;
DELIMITER //
CREATE TRIGGER `parcel_update` BEFORE UPDATE ON `parcel`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = UTC_TIMESTAMP();
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` varchar(128) NOT NULL DEFAULT '',
  `tracker_start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tracker_stop_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tracker_id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `tracker_id` (`tracker_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`id`, `tracker_id`, `tracker_start_time`, `tracker_stop_time`, `creation_time`, `modified_time`) VALUES
(1, 'tracker_id1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-10-05 01:21:10', '2016-10-05 01:21:10');

--
-- Triggers `tracker`
--
DROP TRIGGER IF EXISTS `tracker_creation`;
DELIMITER //
CREATE TRIGGER `tracker_creation` BEFORE INSERT ON `tracker`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = ifnull(new.modified_time,UTC_TIMESTAMP());
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tracker_update`;
DELIMITER //
CREATE TRIGGER `tracker_update` BEFORE UPDATE ON `tracker`
 FOR EACH ROW Begin
set new.creation_time = ifnull(new.creation_time,UTC_TIMESTAMP());
set new.modified_time = UTC_TIMESTAMP();
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tracker_location`
--

CREATE TABLE IF NOT EXISTS `tracker_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_location_id` varchar(128) NOT NULL DEFAULT '',
  `tracker_id` varchar(128) NOT NULL DEFAULT '',
  `location_id` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tracker_location_id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `tracker_location_id` (`tracker_location_id`) USING BTREE,
  UNIQUE KEY `tracker_location` (`tracker_id`,`location_id`) USING BTREE,
  KEY `tracker_location_location` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=173 ;

--
-- Dumping data for table `tracker_location`
--

INSERT INTO `tracker_location` (`id`, `tracker_location_id`, `tracker_id`, `location_id`) VALUES
(3, 'tracker_location_57f431958fb7b', 'tracker_id1', 'location_57f431958f845'),
(4, 'tracker_location_57f4319e8f9fe', 'tracker_id1', 'location_57f4319e8f68c'),
(5, 'tracker_location_57f431a84a82d', 'tracker_id1', 'location_57f431a84a4ec'),
(6, 'tracker_location_57f431aa22c5f', 'tracker_id1', 'location_57f431aa2237d'),
(7, 'tracker_location_57f431ab1b4eb', 'tracker_id1', 'location_57f431ab1ae29'),
(8, 'tracker_location_57f431ac4aa63', 'tracker_id1', 'location_57f431ac4a467'),
(9, 'tracker_location_57f431ad16846', 'tracker_id1', 'location_57f431ad1600d'),
(10, 'tracker_location_57f431adb137b', 'tracker_id1', 'location_57f431adb1211'),
(11, 'tracker_location_57f431b298816', 'tracker_id1', 'location_57f431b2983f9'),
(12, 'tracker_location_57f431b3e09b1', 'tracker_id1', 'location_57f431b3e04cb'),
(13, 'tracker_location_57f431b49f5b5', 'tracker_id1', 'location_57f431b49ef0c'),
(14, 'tracker_location_57f432b8df371', 'tracker_id1', 'location_57f432b8deb80'),
(15, 'tracker_location_57f432be585db', 'tracker_id1', 'location_57f432be57f93'),
(16, 'tracker_location_57f432bf771c6', 'tracker_id1', 'location_57f432bf76a9b'),
(17, 'tracker_location_57f432c10003c', 'tracker_id1', 'location_57f432c0f3e30'),
(18, 'tracker_location_57f59fcb07bf1', 'tracker_id1', 'location_57f59fcadc96d'),
(19, 'tracker_location_57f59fcc6757e', 'tracker_id1', 'location_57f59fcc4c0da'),
(20, 'tracker_location_57f5a55fe7923', 'tracker_id1', 'location_57f5a55fcafde'),
(21, 'tracker_location_57f5a56ee78dc', 'tracker_id1', 'location_57f5a56ed5de2'),
(22, 'tracker_location_57f5a57df14ce', 'tracker_id1', 'location_57f5a57ddb96e'),
(23, 'tracker_location_57f5a58ce8b04', 'tracker_id1', 'location_57f5a58cc904f'),
(24, 'tracker_location_57f5a59be68e9', 'tracker_id1', 'location_57f5a59bca76b'),
(25, 'tracker_location_57f5a5aae39de', 'tracker_id1', 'location_57f5a5aacb5da'),
(26, 'tracker_location_57f5a5b9e11f7', 'tracker_id1', 'location_57f5a5b9cbf11'),
(27, 'tracker_location_57f5a5c9111c0', 'tracker_id1', 'location_57f5a5c8f310a'),
(28, 'tracker_location_57f5a5d80effb', 'tracker_id1', 'location_57f5a5d7f03d4'),
(29, 'tracker_location_57f5a5e6e69f9', 'tracker_id1', 'location_57f5a5e6d0da3'),
(30, 'tracker_location_57f5a5f5dc426', 'tracker_id1', 'location_57f5a5f5c9554'),
(31, 'tracker_location_57f5a604e5538', 'tracker_id1', 'location_57f5a604cf377'),
(32, 'tracker_location_57f5a6141e660', 'tracker_id1', 'location_57f5a6140a034'),
(33, 'tracker_location_57f5a622ddfa8', 'tracker_id1', 'location_57f5a622cc2ee'),
(34, 'tracker_location_57f5a631db4de', 'tracker_id1', 'location_57f5a631c7d60'),
(35, 'tracker_location_57f5a640dea11', 'tracker_id1', 'location_57f5a640c9426'),
(36, 'tracker_location_57f5a6d48e108', 'tracker_id1', 'location_57f5a6d47273f'),
(37, 'tracker_location_57f5a6e366cb7', 'tracker_id1', 'location_57f5a6e33621b'),
(38, 'tracker_location_57f5a6f247850', 'tracker_id1', 'location_57f5a6f22a877'),
(39, 'tracker_location_57f5a70153387', 'tracker_id1', 'location_57f5a7012d72c'),
(40, 'tracker_location_57f5a71057219', 'tracker_id1', 'location_57f5a71032b75'),
(41, 'tracker_location_57f5a71f57508', 'tracker_id1', 'location_57f5a71f20cc1'),
(42, 'tracker_location_57f5a767927f0', 'tracker_id1', 'location_57f5a7677b126'),
(43, 'tracker_location_57f5a773edba6', 'tracker_id1', 'location_57f5a773db458'),
(44, 'tracker_location_57f5a795aedfc', 'tracker_id1', 'location_57f5a79595abe'),
(45, 'tracker_location_57f5a7a3d82b2', 'tracker_id1', 'location_57f5a7a3c0843'),
(46, 'tracker_location_57f5a7b34be70', 'tracker_id1', 'location_57f5a7b329923'),
(47, 'tracker_location_57f5a7c1d7acc', 'tracker_id1', 'location_57f5a7c1c0d7f'),
(48, 'tracker_location_57f5a7d0ed7f9', 'tracker_id1', 'location_57f5a7d0dc179'),
(49, 'tracker_location_57f5a7e00532c', 'tracker_id1', 'location_57f5a7dfe04f9'),
(50, 'tracker_location_57f5a9d26acaa', 'tracker_id1', 'location_57f5a9d24833f'),
(51, 'tracker_location_57f5a9e1b5af4', 'tracker_id1', 'location_57f5a9e193227'),
(52, 'tracker_location_57f5a9f04b889', 'tracker_id1', 'location_57f5a9f03a647'),
(53, 'tracker_location_57f5a9ff519b3', 'tracker_id1', 'location_57f5a9ff3df3a'),
(54, 'tracker_location_57f5aa0e6d811', 'tracker_id1', 'location_57f5aa0e47d47'),
(55, 'tracker_location_57f5aa1d54c4c', 'tracker_id1', 'location_57f5aa1d36e48'),
(56, 'tracker_location_57f5aa2ccc6b4', 'tracker_id1', 'location_57f5aa2ca600f'),
(57, 'tracker_location_57f5aa3b70907', 'tracker_id1', 'location_57f5aa3b5df6c'),
(58, 'tracker_location_57f5aa4a7485f', 'tracker_id1', 'location_57f5aa4a5f98d'),
(59, 'tracker_location_57f5aa5955a83', 'tracker_id1', 'location_57f5aa593ee1d'),
(60, 'tracker_location_57f5aa685ba4d', 'tracker_id1', 'location_57f5aa684adb4'),
(61, 'tracker_location_57f5aa774cd75', 'tracker_id1', 'location_57f5aa7738637'),
(62, 'tracker_location_57f5aa866d237', 'tracker_id1', 'location_57f5aa8653b3d'),
(63, 'tracker_location_57f5aa95764b4', 'tracker_id1', 'location_57f5aa955b40b'),
(64, 'tracker_location_57f5aaa468682', 'tracker_id1', 'location_57f5aaa44fe37'),
(65, 'tracker_location_57f5aab355d86', 'tracker_id1', 'location_57f5aab33b89c'),
(66, 'tracker_location_57f5aac2c5f8a', 'tracker_id1', 'location_57f5aac2a09c3'),
(67, 'tracker_location_57f5aad160499', 'tracker_id1', 'location_57f5aad146e82'),
(68, 'tracker_location_57f5ac0a371a4', 'tracker_id1', 'location_57f5ac0a1c0c7'),
(69, 'tracker_location_57f5ac1896644', 'tracker_id1', 'location_57f5ac18863f0'),
(70, 'tracker_location_57f5ac27b9c3a', 'tracker_id1', 'location_57f5ac279cbec'),
(71, 'tracker_location_57f5ac36cdb9f', 'tracker_id1', 'location_57f5ac36ae2b5'),
(72, 'tracker_location_57f5ac45b02be', 'tracker_id1', 'location_57f5ac45983f3'),
(73, 'tracker_location_57f5ac54b5faf', 'tracker_id1', 'location_57f5ac549fcde'),
(74, 'tracker_location_57f5ac63de5e8', 'tracker_id1', 'location_57f5ac63bf3ea'),
(75, 'tracker_location_57f5ac72aca68', 'tracker_id1', 'location_57f5ac72943d3'),
(76, 'tracker_location_57f5ac81d5923', 'tracker_id1', 'location_57f5ac81bee0a'),
(77, 'tracker_location_57f5ac91367e4', 'tracker_id1', 'location_57f5ac911d57d'),
(78, 'tracker_location_57f5ac9fdb367', 'tracker_id1', 'location_57f5ac9fbc57e'),
(79, 'tracker_location_57f5acaf06825', 'tracker_id1', 'location_57f5acaee1de6'),
(80, 'tracker_location_57f5acbdb4f38', 'tracker_id1', 'location_57f5acbda6260'),
(81, 'tracker_location_57f5acccc2d52', 'tracker_id1', 'location_57f5accca856d'),
(82, 'tracker_location_57f5acdbd0d82', 'tracker_id1', 'location_57f5acdbb4507'),
(83, 'tracker_location_57f5aceaaff00', 'tracker_id1', 'location_57f5acea95d70'),
(84, 'tracker_location_57f5acf99e213', 'tracker_id1', 'location_57f5acf98809a'),
(85, 'tracker_location_57f5ad091f161', 'tracker_id1', 'location_57f5ad090d5cc'),
(86, 'tracker_location_57f5ad17c3426', 'tracker_id1', 'location_57f5ad17a7c7c'),
(87, 'tracker_location_57f5ad26c1056', 'tracker_id1', 'location_57f5ad2690a89'),
(88, 'tracker_location_57f5ad35be1d5', 'tracker_id1', 'location_57f5ad3596552'),
(89, 'tracker_location_57f5ad449ca9d', 'tracker_id1', 'location_57f5ad44872e4'),
(90, 'tracker_location_57f5ad54045c5', 'tracker_id1', 'location_57f5ad53d5daf'),
(91, 'tracker_location_57f5ad62b8d30', 'tracker_id1', 'location_57f5ad629db00'),
(92, 'tracker_location_57f5ad71ca8bf', 'tracker_id1', 'location_57f5ad71b6c58'),
(93, 'tracker_location_57f5ad80b3c99', 'tracker_id1', 'location_57f5ad80a062c'),
(94, 'tracker_location_57f5ad8fb0a65', 'tracker_id1', 'location_57f5ad8f91b80'),
(95, 'tracker_location_57f5ae98bc805', 'tracker_id1', 'location_57f5ae98a43c4'),
(96, 'tracker_location_57f5aea7cc28e', 'tracker_id1', 'location_57f5aea7b442a'),
(97, 'tracker_location_57f5aeb69eadf', 'tracker_id1', 'location_57f5aeb687e11'),
(98, 'tracker_location_57f5aec6114ac', 'tracker_id1', 'location_57f5aec5edef5'),
(99, 'tracker_location_57f5aed4a37c8', 'tracker_id1', 'location_57f5aed48f809'),
(100, 'tracker_location_57f5aee3c448c', 'tracker_id1', 'location_57f5aee3ae42f'),
(101, 'tracker_location_57f5aef2960fb', 'tracker_id1', 'location_57f5aef2844fe'),
(102, 'tracker_location_57f5af01f075d', 'tracker_id1', 'location_57f5af01d81e0'),
(103, 'tracker_location_57f5af1112a41', 'tracker_id1', 'location_57f5af10f3dc6'),
(104, 'tracker_location_57f5af1faab78', 'tracker_id1', 'location_57f5af1f93cea'),
(105, 'tracker_location_57f5af2ebea0e', 'tracker_id1', 'location_57f5af2ea15d7'),
(106, 'tracker_location_57f5af3e199c0', 'tracker_id1', 'location_57f5af3e06a34'),
(107, 'tracker_location_57f5af4ca06bc', 'tracker_id1', 'location_57f5af4c91647'),
(108, 'tracker_location_57f5af5c1d8aa', 'tracker_id1', 'location_57f5af5c02ac7'),
(109, 'tracker_location_57f5af6ad1ef8', 'tracker_id1', 'location_57f5af6abcee9'),
(110, 'tracker_location_57f5af79a8dc7', 'tracker_id1', 'location_57f5af799189b'),
(111, 'tracker_location_57f5af88cd0d2', 'tracker_id1', 'location_57f5af88b2469'),
(112, 'tracker_location_57f5af97d4e32', 'tracker_id1', 'location_57f5af97bbb78'),
(113, 'tracker_location_57f5afa6e2b34', 'tracker_id1', 'location_57f5afa6d01ea'),
(114, 'tracker_location_57f5afb5ba07d', 'tracker_id1', 'location_57f5afb5a0393'),
(115, 'tracker_location_57f5afc5286fb', 'tracker_id1', 'location_57f5afc505e98'),
(116, 'tracker_location_57f5afd3a5b39', 'tracker_id1', 'location_57f5afd391f4d'),
(117, 'tracker_location_57f5afe2b9aca', 'tracker_id1', 'location_57f5afe29bd4b'),
(118, 'tracker_location_57f5aff1ed164', 'tracker_id1', 'location_57f5aff1d27c2'),
(119, 'tracker_location_57f5f8b20c175', 'tracker_id1', 'location_57f5f8b1eaff1'),
(120, 'tracker_location_57f5f8c140624', 'tracker_id1', 'location_57f5f8c12ef1a'),
(121, 'tracker_location_57f5f8d0240c3', 'tracker_id1', 'location_57f5f8d007c1a'),
(122, 'tracker_location_57f5f8e00521b', 'tracker_id1', 'location_57f5f8dfdf09d'),
(123, 'tracker_location_57f5f8ee25983', 'tracker_id1', 'location_57f5f8ee0c1d9'),
(124, 'tracker_location_57f5f8fdb3e79', 'tracker_id1', 'location_57f5f8fd9e6f7'),
(125, 'tracker_location_57f5f90c43963', 'tracker_id1', 'location_57f5f90c2ae92'),
(126, 'tracker_location_57f5f919ddef6', 'tracker_id1', 'location_57f5f919c4ad5'),
(127, 'tracker_location_57f5f92a28894', 'tracker_id1', 'location_57f5f92a100a5'),
(128, 'tracker_location_57f5f93a28129', 'tracker_id1', 'location_57f5f93a11d8b'),
(129, 'tracker_location_57f97430840a6', 'tracker_id1', 'location_57f974306ef6f'),
(130, 'tracker_location_57f9743f7f3b5', 'tracker_id1', 'location_57f9743f6a221'),
(131, 'tracker_location_57f9744f8d228', 'tracker_id1', 'location_57f9744f7bc78'),
(132, 'tracker_location_57f9745d8ae2a', 'tracker_id1', 'location_57f9745d66c91'),
(133, 'tracker_location_57f9746c826b4', 'tracker_id1', 'location_57f9746c6c0cd'),
(134, 'tracker_location_57f9747b84d63', 'tracker_id1', 'location_57f9747b6c720'),
(135, 'tracker_location_57f9748b22a79', 'tracker_id1', 'location_57f9748b0b633'),
(136, 'tracker_location_57f97499e585b', 'tracker_id1', 'location_57f97499bebfd'),
(137, 'tracker_location_57f974a889abe', 'tracker_id1', 'location_57f974a8708d1'),
(138, 'tracker_location_57f974b7c192c', 'tracker_id1', 'location_57f974b7a9e4c'),
(139, 'tracker_location_57f974c6bbf9e', 'tracker_id1', 'location_57f974c6a55be'),
(140, 'tracker_location_57f974d599ccf', 'tracker_id1', 'location_57f974d570dff'),
(141, 'tracker_location_57f974e48ab31', 'tracker_id1', 'location_57f974e46f163'),
(142, 'tracker_location_57f974f3883ee', 'tracker_id1', 'location_57f974f371b64'),
(143, 'tracker_location_57f975097d79f', 'tracker_id1', 'location_57f97509659b3'),
(144, 'tracker_location_57f97516d3dcf', 'tracker_id1', 'location_57f97516b1f61'),
(145, 'tracker_location_57f9751725cf6', 'tracker_id1', 'location_57f9751714baf'),
(146, 'tracker_location_57f97517b7769', 'tracker_id1', 'location_57f97517a5e93'),
(147, 'tracker_location_57f975269640f', 'tracker_id1', 'location_57f975267d2aa'),
(148, 'tracker_location_57f97526abf0a', 'tracker_id1', 'location_57f97526a00d2'),
(149, 'tracker_location_57f975353a3b1', 'tracker_id1', 'location_57f975352501e'),
(150, 'tracker_location_57f97535b7f25', 'tracker_id1', 'location_57f975359e2d7'),
(151, 'tracker_location_57f9754592923', 'tracker_id1', 'location_57f9754574de3'),
(152, 'tracker_location_57f97553abedd', 'tracker_id1', 'location_57f9755395256'),
(153, 'tracker_location_57f975629e3d9', 'tracker_id1', 'location_57f975628f876'),
(154, 'tracker_location_57f9756ee1355', 'tracker_id1', 'location_57f9756ece0eb'),
(155, 'tracker_location_57f975719a92f', 'tracker_id1', 'location_57f9757174cc8'),
(156, 'tracker_location_57f975800fb6a', 'tracker_id1', 'location_57f9757feef98'),
(157, 'tracker_location_57f9758f2fc20', 'tracker_id1', 'location_57f9758f0fb5a'),
(158, 'tracker_location_57f975b2547f8', 'tracker_id1', 'location_57f975b236214'),
(159, 'tracker_location_57f975c06960f', 'tracker_id1', 'location_57f975c04b2c5'),
(160, 'tracker_location_57f975cf0fc65', 'tracker_id1', 'location_57f975ceebb29'),
(161, 'tracker_location_57f975ddf17ea', 'tracker_id1', 'location_57f975ddddeed'),
(162, 'tracker_location_57f975ed15328', 'tracker_id1', 'location_57f975ecea660'),
(163, 'tracker_location_57f975fc7e97c', 'tracker_id1', 'location_57f975fc61794'),
(164, 'tracker_location_57f9760b13d55', 'tracker_id1', 'location_57f9760aeb2a5'),
(165, 'tracker_location_57f97619f025a', 'tracker_id1', 'location_57f97619dd921'),
(166, 'tracker_location_57f9762920530', 'tracker_id1', 'location_57f9762904639'),
(167, 'tracker_location_57f976385f49f', 'tracker_id1', 'location_57f976384a0aa'),
(168, 'tracker_location_57f9764727c65', 'tracker_id1', 'location_57f976470d888'),
(169, 'tracker_location_57f9765604941', 'tracker_id1', 'location_57f97655dfb8c'),
(170, 'tracker_location_57f976651630a', 'tracker_id1', 'location_57f97664ee2c0'),
(171, 'tracker_location_57f9767459972', 'tracker_id1', 'location_57f9767447c3b'),
(172, 'tracker_location_57f97682f26c3', 'tracker_id1', 'location_57f97682d65ee');

-- --------------------------------------------------------

--
-- Table structure for table `tracker_parcel`
--

CREATE TABLE IF NOT EXISTS `tracker_parcel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_parcel_id` varchar(128) NOT NULL DEFAULT '',
  `tracker_id` varchar(128) NOT NULL DEFAULT '',
  `parcel_id` varchar(128) NOT NULL DEFAULT '',
  `driver_id` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tracker_parcel_id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `tracker_parcel_id` (`tracker_parcel_id`) USING BTREE,
  UNIQUE KEY `tracker_parcel` (`parcel_id`,`tracker_id`) USING BTREE,
  KEY `tracker_parcel_tracker` (`tracker_id`),
  KEY `tracker_parcel_driver` (`driver_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tracker_parcel`
--

INSERT INTO `tracker_parcel` (`id`, `tracker_parcel_id`, `tracker_id`, `parcel_id`, `driver_id`) VALUES
(1, 'tracker_parcel_id1', 'tracker_id1', 'parcel_id1', 'driver_id1'),
(2, 'tracker_parcel_id2', 'tracker_id1', 'parcel_id2', 'driver_id1'),
(3, 'tracker_parcel_id3', 'tracker_id1', 'parcel_id3', 'driver_id1'),
(4, 'tracker_parcel_id4', 'tracker_id1', 'parcel_id4', 'driver_id1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_parcel`
--
ALTER TABLE `customer_parcel`
  ADD CONSTRAINT `customer_parcel_parcel` FOREIGN KEY (`parcel_id`) REFERENCES `parcel` (`parcel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_parcel_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tracker_location`
--
ALTER TABLE `tracker_location`
  ADD CONSTRAINT `tracker_location_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracker_location_tracker` FOREIGN KEY (`tracker_id`) REFERENCES `tracker` (`tracker_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tracker_parcel`
--
ALTER TABLE `tracker_parcel`
  ADD CONSTRAINT `tracker_parcel_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracker_parcel_parcel` FOREIGN KEY (`parcel_id`) REFERENCES `parcel` (`parcel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracker_parcel_tracker` FOREIGN KEY (`tracker_id`) REFERENCES `tracker` (`tracker_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
