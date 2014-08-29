-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for af_v2
CREATE DATABASE IF NOT EXISTS `af_v2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `af_v2`;


-- Dumping structure for table af_v2.actions
DROP TABLE IF EXISTS `actions`;
CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `sequence_scheduled_id` int(11) NOT NULL,
  `sequences_id` int(11) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `template_id` int(11) NOT NULL,
  `automated` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `contact_id` int(11) NOT NULL,
  `opp_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time` int(11) DEFAULT NULL,
  `completed` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table af_v2.actions: ~0 rows (approximately)
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;


-- Dumping structure for table af_v2.sequences
DROP TABLE IF EXISTS `sequences`;
CREATE TABLE IF NOT EXISTS `sequences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_scheduled_id` int(11) NOT NULL COMMENT 'sequence_template_id',
  `user_id` int(11) NOT NULL COMMENT 'User using this template',
  `start_date` date DEFAULT NULL,
  `status` enum('Start','Not Start','End') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table af_v2.sequences: ~0 rows (approximately)
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;


-- Dumping structure for table af_v2.sequence_scheduled
DROP TABLE IF EXISTS `sequence_scheduled`;
CREATE TABLE IF NOT EXISTS `sequence_scheduled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `enable` tinyint(4) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_my_favorite` tinyint(1) NOT NULL DEFAULT '1',
  `is_company_favorite` tinyint(1) NOT NULL DEFAULT '1',
  `last_visit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_drafts` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table af_v2.sequence_scheduled: ~0 rows (approximately)
/*!40000 ALTER TABLE `sequence_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_scheduled` ENABLE KEYS */;


-- Dumping structure for table af_v2.sequence_scheduled_action
DROP TABLE IF EXISTS `sequence_scheduled_action`;
CREATE TABLE IF NOT EXISTS `sequence_scheduled_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `action_type` varchar(255) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `automated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table af_v2.sequence_scheduled_action: ~0 rows (approximately)
/*!40000 ALTER TABLE `sequence_scheduled_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_scheduled_action` ENABLE KEYS */;


-- Dumping structure for table af_v2.sequence_scheduled_assign_contact
DROP TABLE IF EXISTS `sequence_scheduled_assign_contact`;
CREATE TABLE IF NOT EXISTS `sequence_scheduled_assign_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table af_v2.sequence_scheduled_assign_contact: ~0 rows (approximately)
/*!40000 ALTER TABLE `sequence_scheduled_assign_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_scheduled_assign_contact` ENABLE KEYS */;


-- Dumping structure for table af_v2.sequence_scheduled_assign_lead
DROP TABLE IF EXISTS `sequence_scheduled_assign_lead`;
CREATE TABLE IF NOT EXISTS `sequence_scheduled_assign_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL DEFAULT '0',
  `sequence_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table af_v2.sequence_scheduled_assign_lead: ~0 rows (approximately)
/*!40000 ALTER TABLE `sequence_scheduled_assign_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_scheduled_assign_lead` ENABLE KEYS */;


-- Dumping structure for table af_v2.sequence_scheduled_assign_opp
DROP TABLE IF EXISTS `sequence_scheduled_assign_opp`;
CREATE TABLE IF NOT EXISTS `sequence_scheduled_assign_opp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_id` int(11) DEFAULT NULL,
  `opp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table af_v2.sequence_scheduled_assign_opp: ~0 rows (approximately)
/*!40000 ALTER TABLE `sequence_scheduled_assign_opp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_scheduled_assign_opp` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
