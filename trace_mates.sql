-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: trace_mates_dev
-- ------------------------------------------------------
-- Server version	5.7.15-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_parcels`
--

DROP TABLE IF EXISTS `customer_parcels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_parcels` (
  `id` int(11) NOT NULL,
  `customer_parcel_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parcel_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `customer_parcel` (`customer_id`,`parcel_id`) USING BTREE,
  UNIQUE KEY `customer_parcel_id` (`customer_parcel_id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `customer_parcel_parcel` (`parcel_id`) USING BTREE,
  CONSTRAINT `customer_parcel_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_parcel_parcel` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`parcel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `customer_id` (`customer_id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `driver_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `driver_id` (`driver_id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `location_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `longitude` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `latitude` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `street_address` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `neighbourhood` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `region` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `country` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `location_id` (`location_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parcels`
--

DROP TABLE IF EXISTS `parcels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parcels` (
  `id` int(11) NOT NULL,
  `parcel_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parcel_details` text COLLATE utf8_unicode_ci,
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `parcel_id` (`parcel_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tracker_locations`
--

DROP TABLE IF EXISTS `tracker_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker_locations` (
  `id` int(11) NOT NULL,
  `tracker_location_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tracker_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `tracker_location` (`tracker_id`,`location_id`) USING BTREE,
  UNIQUE KEY `tracker_location_id` (`tracker_location_id`) USING BTREE,
  KEY `tracker_location_location` (`location_id`) USING BTREE,
  CONSTRAINT `tracker_location_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_location_tracker` FOREIGN KEY (`tracker_id`) REFERENCES `trackers` (`tracker_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tracker_parcels`
--

DROP TABLE IF EXISTS `tracker_parcels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker_parcels` (
  `id` int(11) NOT NULL,
  `tracker_parcel_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tracker_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parcel_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `driver_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `tracker_parcel` (`parcel_id`,`tracker_id`) USING BTREE,
  UNIQUE KEY `tracker_parcel_id` (`tracker_parcel_id`) USING BTREE,
  KEY `tracker_parcel_driver` (`driver_id`) USING BTREE,
  KEY `tracker_parcel_tracker` (`tracker_id`) USING BTREE,
  CONSTRAINT `tracker_parcel_driver` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_parcel_parcel` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`parcel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracker_parcel_tracker` FOREIGN KEY (`tracker_id`) REFERENCES `trackers` (`tracker_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL,
  `tracker_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tracker_start_time` datetime NOT NULL,
  `tracker_stop_time` datetime NOT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `tracker_id` (`tracker_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-20 21:38:54
