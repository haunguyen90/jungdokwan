# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.19)
# Database: jungdokwan
# Generation Time: 2014-10-03 10:35:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table album_gallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `album_gallery`;

CREATE TABLE `album_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `description_vi` text NOT NULL,
  `description_en` text NOT NULL,
  `highlight` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `album_gallery` WRITE;
/*!40000 ALTER TABLE `album_gallery` DISABLE KEYS */;

INSERT INTO `album_gallery` (`id`, `name_vi`, `name_en`, `description_vi`, `description_en`, `highlight`, `created`, `image`)
VALUES
	(1,'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',0,'2014-08-02 22:02:11','img1.png'),
	(2,'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',0,'2014-08-02 22:04:23','img2.png'),
	(3,'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',0,'2014-08-02 22:04:23','img3.png'),
	(4,'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',0,'2014-08-02 22:04:43','img2.png'),
	(5,'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',0,'2014-08-02 22:04:43','img3.png'),
	(6,'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',0,'2014-08-02 22:04:52','img2.png'),
	(7,'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',0,'2014-08-02 22:04:52','img3.png');

/*!40000 ALTER TABLE `album_gallery` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table block_wiget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `block_wiget`;

CREATE TABLE `block_wiget` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `block_wiget` WRITE;
/*!40000 ALTER TABLE `block_wiget` DISABLE KEYS */;

INSERT INTO `block_wiget` (`id`, `name`, `description`, `url`)
VALUES
	(1,'không nên hút thuốc','hút thuốc lá cá hại cho sức khoẻ','post-detail/5'),
	(2,'clip sex 18+','','post-detail/4'),
	(3,'block_wiget 3','test 3','post-detail/3'),
	(4,'block_wiget 4','test 4','post-detail/4');

/*!40000 ALTER TABLE `block_wiget` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table coach
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coach`;

CREATE TABLE `coach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `id_pom_dan` int(11) NOT NULL,
  `position_vi` varchar(255) NOT NULL,
  `position_en` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;

INSERT INTO `coach` (`id`, `first_name`, `last_name`, `id_pom_dan`, `position_vi`, `position_en`, `image`, `facebook`, `twitter`)
VALUES
	(1,'Kim','Jung Silk',1,'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới','Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới','img-trainer.png','',''),
	(2,'Kim','Jung Silk',2,'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới','Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới','img-trainer.png','',''),
	(3,'Kim','Jung Silk',3,'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới','Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới','img-trainer.png','',''),
	(4,'Kim ','Jung Silk',4,'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới','Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới','img-trainer.png','','');

/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gallery`;

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `description_vi` text,
  `description_en` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;

INSERT INTO `gallery` (`id`, `id_post`, `url`, `file_name`, `description_vi`, `description_en`)
VALUES
	(2,2,'img','g2.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(3,2,'img','g3.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(4,2,'img','g4.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(5,2,'img','g5.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(6,2,'img','g6.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(7,2,'img','g7.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(8,2,'img','g8.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(9,2,'img','g9.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(11,2,'img','g11.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(12,2,'img','g12.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(17,2,'img','g17.png','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013','Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013\', \'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
	(20,13,'www.youtube.com/embed/uelHwf8o7_U',NULL,'Bruno Mars - Gorilla available now on iTunes: http://atlr.ec/17L4ye4\n\nDirected By: Bruno Mars & Cameron Duddy','Bruno Mars - Gorilla available now on iTunes: http://atlr.ec/17L4ye4\n\nDirected By: Bruno Mars & Cameron Duddy'),
	(21,11,'www.youtube.com/embed/uelHwf8o7_U',NULL,'love the way you lie','love the way you lie'),
	(22,13,'www.youtube.com/embed/wnS6RGmYdxg',NULL,'Iphone message remix','Iphone message remix');

/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table main_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `main_menu`;

CREATE TABLE `main_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `main_menu` WRITE;
/*!40000 ALTER TABLE `main_menu` DISABLE KEYS */;

INSERT INTO `main_menu` (`id`, `name_vi`, `name_en`, `hash`, `order`)
VALUES
	(1,'Trang Chủ','Home Page','home',0),
	(2,'Giới Thiệu','About','about',1),
	(3,'Chương Trình','Course','posts/type/1/page/1',2),
	(4,'Tin Tức & Sự Kiện','News & Event','posts/type/2/page/1',3),
	(5,'Hình Ảnh & Video','Images & Videos','gallery',4),
	(6,'Liên Hệ','Contact Us','contact',5);

/*!40000 ALTER TABLE `main_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news_event`;

CREATE TABLE `news_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categories` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `title_vi` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `description_vi` text NOT NULL,
  `description_en` text NOT NULL,
  `content_vi` longtext NOT NULL,
  `content_en` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `highlight` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `news_event` WRITE;
/*!40000 ALTER TABLE `news_event` DISABLE KEYS */;

INSERT INTO `news_event` (`id`, `id_categories`, `id_type`, `title_vi`, `title_en`, `description_vi`, `description_en`, `content_vi`, `content_en`, `image`, `highlight`, `created_date`, `updated_date`)
VALUES
	(1,1,1,'Tiêu đề tin tức & sự kiện tiếng Việt','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Tóm tắt nội dung tin tức & sự kiện tiếng Việt.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Nội dung tin tức & sự kiện tiếng Việt','Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.','img1.png',1,'2014-07-27 05:37:49','2014-07-27 12:21:22'),
	(2,1,1,'Tiêu đề tin tức & sự kiện tiếng Việt','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Tóm tắt nội dung tin tức & sự kiện tiếng Việt.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Nội dung tin tức & sự kiện tiếng Việt','Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.','img2.png',1,'2014-07-27 05:37:49','2014-07-27 12:21:22'),
	(3,2,1,'Tiêu đề tin tức & sự kiện tiếng Việt','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Tóm tắt nội dung tin tức & sự kiện tiếng Việt.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Nội dung tin tức & sự kiện tiếng Việt','Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.','img3.png',1,'2014-07-27 05:37:49','2014-07-27 12:21:22'),
	(4,3,1,'Tiêu đề tin tức & sự kiện tiếng Việt','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Tóm tắt nội dung tin tức & sự kiện tiếng Việt.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Nội dung tin tức & sự kiện tiếng Việt','Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.','img1.png',0,'2014-07-27 05:37:49','2014-07-27 12:21:22'),
	(5,4,1,'Tiêu đề tin tức & sự kiện tiếng Việt','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Tóm tắt nội dung tin tức & sự kiện tiếng Việt.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Nội dung tin tức & sự kiện tiếng Việt','Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.','img1.png',0,'2014-07-27 05:37:49','2014-07-27 12:21:22');

/*!40000 ALTER TABLE `news_event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news_event_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news_event_categories`;

CREATE TABLE `news_event_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `news_event_categories` WRITE;
/*!40000 ALTER TABLE `news_event_categories` DISABLE KEYS */;

INSERT INTO `news_event_categories` (`id`, `name_vi`, `name_en`, `description`, `order`)
VALUES
	(1,'Tin tức & Sự kiện 1','News & Event 1','',0),
	(2,'Tin tức & Sự kiện 2','News & Event 2','',1),
	(3,'Tin tức & Sự kiện 3','News & Event 3','',2),
	(4,'Tin tức & Sự kiện 4','News & Event 4','',3),
	(5,'Tin tức & Sự kiện 5','News & Event 5','',4),
	(6,'Tin tức & Sự kiện 6','News & Event 6','',5);

/*!40000 ALTER TABLE `news_event_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_setting`;

CREATE TABLE `page_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_url` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `page_setting` WRITE;
/*!40000 ALTER TABLE `page_setting` DISABLE KEYS */;

INSERT INTO `page_setting` (`id`, `logo_url`, `banner_url`)
VALUES
	(1,'logo_index.png','banner_index.png');

/*!40000 ALTER TABLE `page_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `order by` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `post_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;

INSERT INTO `post_categories` (`id`, `name_en`, `name_vi`, `order by`, `description`, `post_type_id`)
VALUES
	(1,'News & Event','Tin Tức & Sự Kiện',1,'',2),
	(2,'News & Event','Tin Tức & Sự Kiện',1,'',2),
	(3,'News & Event','Tin Tức & Sự Kiện',1,'',2),
	(4,'News & Event','Tin Tức & Sự Kiện',1,'',2),
	(5,'News & Event','Tin Tức & Sự Kiện',1,'',2),
	(6,'News & Event','Tin Tức & Sự Kiện',1,'',2);

/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_type`;

CREATE TABLE `post_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post_type` WRITE;
/*!40000 ALTER TABLE `post_type` DISABLE KEYS */;

INSERT INTO `post_type` (`id`, `name_en`, `name_vi`, `order`, `description`, `enable`)
VALUES
	(1,'Course','Chương trình',0,'',1),
	(2,'News & event','Tin tức & sự kiện',1,'',1),
	(3,'Images','Hình ảnh',2,'',1),
	(4,'Video','Video',3,'',1);

/*!40000 ALTER TABLE `post_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) NOT NULL,
  `post_date` datetime NOT NULL,
  `post_content_en` longtext,
  `post_content_vi` longtext,
  `post_title_en` text NOT NULL,
  `post_title_vi` text NOT NULL,
  `post_modified` datetime NOT NULL,
  `description_en` text,
  `description_vi` text,
  `highlight` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `post_categories` int(11) DEFAULT NULL,
  `post_type_id` int(11) NOT NULL,
  `news_type` enum('file','photo','video','quote','audio') DEFAULT NULL,
  `view_no` int(11) NOT NULL DEFAULT '0',
  `tag` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `post_author`, `post_date`, `post_content_en`, `post_content_vi`, `post_title_en`, `post_title_vi`, `post_modified`, `description_en`, `description_vi`, `highlight`, `image`, `post_categories`, `post_type_id`, `news_type`, `view_no`, `tag`)
VALUES
	(1,1,'2014-08-13 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Chi sua lai tieu de ','2014-08-13 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',1,'img1.png',NULL,2,'file',0,NULL),
	(2,1,'2014-08-13 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','2014-09-09 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',1,'img2.png',NULL,3,'photo',6,'hau nguyen,test,tag,jungdokwan,hcmc,trung hau'),
	(3,1,'2014-08-13 00:00:00','<p>dasd asd asd asd as&nbsp;<img alt=\"\" src=\"/static/media/images/about4.png\" style=\"height:220px; width:220px\" /></p>\r\n','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','2014-08-13 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',1,'img3.png',NULL,2,'video',3,NULL),
	(4,1,'2014-08-13 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','clip sex 18+','2014-08-13 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',1,'img2.png',NULL,4,'quote',8,NULL),
	(5,1,'2014-08-13 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem','2014-08-13 00:00:00','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.','Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.',0,'img2.png',NULL,2,'audio',0,NULL),
	(9,1,'2014-09-18 15:06:30',NULL,NULL,'test insert','test insert','2014-09-09 00:00:00','test insert','test insert',0,'sangtaonoidung.jpg',NULL,3,NULL,0,NULL),
	(11,1,'2014-10-03 09:54:40',NULL,NULL,'kenney sang ís coming to town','kenny đã trở lại','2014-09-09 00:00:00','stupid guy','thăng điên tình',0,'3.jpg',NULL,4,NULL,0,NULL),
	(12,1,'2014-10-03 10:49:53',NULL,NULL,'lorem isum','lorem isum','2014-09-09 00:00:00',NULL,NULL,0,'IMG_0645.jpg',NULL,3,NULL,0,NULL),
	(13,1,'2014-10-03 11:54:45',NULL,NULL,'angular','angular','2014-09-09 00:00:00','framework js','framework js',0,'carousel-image-6.jpg',NULL,4,NULL,0,NULL);

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sub_main_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sub_main_menu`;

CREATE TABLE `sub_main_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_menu_id` int(11) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sub_main_menu` WRITE;
/*!40000 ALTER TABLE `sub_main_menu` DISABLE KEYS */;

INSERT INTO `sub_main_menu` (`id`, `main_menu_id`, `name_vi`, `name_en`, `order`)
VALUES
	(1,3,'Chương Trình 1','Course 1',0),
	(2,3,'Chương trình 2','Course 2',1),
	(3,3,'Chương Trình 3','Course 3',2),
	(4,3,'Chương Trình 4','Course 4',3),
	(5,3,'Chương Trình 5','Course 5',4);

/*!40000 ALTER TABLE `sub_main_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('admin','user') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `password`, `type`)
VALUES
	(1,'admin','admin','admin');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
