-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 29, 2014 at 08:39 AM
-- Server version: 5.6.19
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jungdokwan`
--

-- --------------------------------------------------------

--
-- Table structure for table `album_gallery`
--

CREATE TABLE IF NOT EXISTS `album_gallery` (
`id` int(11) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `description_vi` text NOT NULL,
  `description_en` text NOT NULL,
  `highlight` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `album_gallery`
--

INSERT INTO `album_gallery` (`id`, `name_vi`, `name_en`, `description_vi`, `description_en`, `highlight`, `created`, `image`) VALUES
(1, 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, '2014-08-02 22:02:11', 'img1.png'),
(2, 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, '2014-08-02 22:04:23', 'img2.png'),
(3, 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, '2014-08-02 22:04:23', 'img3.png'),
(4, 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, '2014-08-02 22:04:43', 'img2.png'),
(5, 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, '2014-08-02 22:04:43', 'img3.png'),
(6, 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, '2014-08-02 22:04:52', 'img2.png'),
(7, 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, '2014-08-02 22:04:52', 'img3.png');

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE IF NOT EXISTS `coach` (
`id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `id_pom_dan` int(11) NOT NULL,
  `position_vi` varchar(255) NOT NULL,
  `position_en` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`id`, `first_name`, `last_name`, `id_pom_dan`, `position_vi`, `position_en`, `image`, `facebook`, `twitter`) VALUES
(1, 'Kim', 'Jung Silk', 1, 'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới', 'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới', 'img-trainer.png', '', ''),
(2, 'Kim', 'Jung Silk', 2, 'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới', 'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới', 'img-trainer.png', '', ''),
(3, 'Kim', 'Jung Silk', 3, 'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới', 'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới', 'img-trainer.png', '', ''),
(4, 'Kim ', 'Jung Silk', 4, 'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới', 'Chủ tịch Jungdokwan Việt Nam, thành viên Kukkiwon Thế giới', 'img-trainer.png', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
`id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `description_vi` text,
  `description_en` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `id_post`, `url`, `file_name`, `description_vi`, `description_en`) VALUES
(1, 2, 'img', 'g1.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(2, 2, 'img', 'g2.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(3, 2, 'img', 'g3.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(4, 2, 'img', 'g4.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(5, 2, 'img', 'g5.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(6, 2, 'img', 'g6.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(7, 2, 'img', 'g7.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(8, 2, 'img', 'g8.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(9, 2, 'img', 'g9.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(10, 2, 'img', 'g10.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(11, 2, 'img', 'g11.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(12, 2, 'img', 'g12.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(13, 2, 'img', 'g13.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(14, 2, 'img', 'g14.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(15, 2, 'img', 'g15.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(16, 2, 'img', 'g16.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'),
(17, 2, 'img', 'g17.png', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013', 'Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013'', ''Võ sư: Lê Văn Dũng, Taekwondo Jungdowan 7 đẳng trong đợt tập huấn tại Hàn Quốc, tháng 8 năm 2013');

-- --------------------------------------------------------

--
-- Table structure for table `main_menu`
--

CREATE TABLE IF NOT EXISTS `main_menu` (
`id` int(11) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `main_menu`
--

INSERT INTO `main_menu` (`id`, `name_vi`, `name_en`, `hash`, `order`) VALUES
(1, 'Trang Chủ', 'Home Page', 'home', 0),
(2, 'Giới Thiệu', 'About', 'about', 1),
(3, 'Chương Trình', 'Course', 'course', 2),
(4, 'Tin Tức & Sự Kiện', 'News & Event', 'news_event', 3),
(5, 'Hình Ảnh & Video', 'Images & Videos', 'gallery', 4),
(6, 'Liên Hệ', 'Contact Us', 'contact', 5);

-- --------------------------------------------------------

--
-- Table structure for table `news_event`
--

CREATE TABLE IF NOT EXISTS `news_event` (
`id` int(11) NOT NULL,
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
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `news_event`
--

INSERT INTO `news_event` (`id`, `id_categories`, `id_type`, `title_vi`, `title_en`, `description_vi`, `description_en`, `content_vi`, `content_en`, `image`, `highlight`, `created_date`, `updated_date`) VALUES
(1, 1, 1, 'Tiêu đề tin tức & sự kiện tiếng Việt', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Tóm tắt nội dung tin tức & sự kiện tiếng Việt.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Nội dung tin tức & sự kiện tiếng Việt', 'Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'img1.png', 1, '2014-07-27 05:37:49', '2014-07-27 12:21:22'),
(2, 1, 1, 'Tiêu đề tin tức & sự kiện tiếng Việt', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Tóm tắt nội dung tin tức & sự kiện tiếng Việt.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Nội dung tin tức & sự kiện tiếng Việt', 'Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'img2.png', 1, '2014-07-27 05:37:49', '2014-07-27 12:21:22'),
(3, 2, 1, 'Tiêu đề tin tức & sự kiện tiếng Việt', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Tóm tắt nội dung tin tức & sự kiện tiếng Việt.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Nội dung tin tức & sự kiện tiếng Việt', 'Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'img3.png', 1, '2014-07-27 05:37:49', '2014-07-27 12:21:22'),
(4, 3, 1, 'Tiêu đề tin tức & sự kiện tiếng Việt', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Tóm tắt nội dung tin tức & sự kiện tiếng Việt.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Nội dung tin tức & sự kiện tiếng Việt', 'Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'img1.png', 0, '2014-07-27 05:37:49', '2014-07-27 12:21:22'),
(5, 4, 1, 'Tiêu đề tin tức & sự kiện tiếng Việt', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Tóm tắt nội dung tin tức & sự kiện tiếng Việt.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Nội dung tin tức & sự kiện tiếng Việt', 'Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\nDuis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'img1.png', 0, '2014-07-27 05:37:49', '2014-07-27 12:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `news_event_categories`
--

CREATE TABLE IF NOT EXISTS `news_event_categories` (
`id` int(11) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `news_event_categories`
--

INSERT INTO `news_event_categories` (`id`, `name_vi`, `name_en`, `description`, `order`) VALUES
(1, 'Tin tức & Sự kiện 1', 'News & Event 1', '', 0),
(2, 'Tin tức & Sự kiện 2', 'News & Event 2', '', 1),
(3, 'Tin tức & Sự kiện 3', 'News & Event 3', '', 2),
(4, 'Tin tức & Sự kiện 4', 'News & Event 4', '', 3),
(5, 'Tin tức & Sự kiện 5', 'News & Event 5', '', 4),
(6, 'Tin tức & Sự kiện 6', 'News & Event 6', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `page_setting`
--

CREATE TABLE IF NOT EXISTS `page_setting` (
`id` int(11) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `page_setting`
--

INSERT INTO `page_setting` (`id`, `logo_url`, `banner_url`) VALUES
(1, 'logo_index.png', 'banner_index.png');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`id` bigint(20) NOT NULL,
  `post_author` bigint(20) NOT NULL,
  `post_date` datetime NOT NULL,
  `post_content_en` longtext NOT NULL,
  `post_content_vi` longtext NOT NULL,
  `post_title_en` text NOT NULL,
  `post_title_vi` text NOT NULL,
  `post_modified` datetime NOT NULL,
  `description_en` text NOT NULL,
  `description_vi` text NOT NULL,
  `highlight` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `post_categories` int(11) DEFAULT NULL,
  `post_type_id` int(11) NOT NULL,
  `news_type` enum('file','photo','video','quote','audio') DEFAULT NULL,
  `view_no` int(11) NOT NULL DEFAULT '0',
  `tag` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_author`, `post_date`, `post_content_en`, `post_content_vi`, `post_title_en`, `post_title_vi`, `post_modified`, `description_en`, `description_vi`, `highlight`, `image`, `post_categories`, `post_type_id`, `news_type`, `view_no`, `tag`) VALUES
(1, 1, '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 1, 'img1.png', NULL, 2, 'file', 0, NULL),
(2, 1, '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 1, 'img2.png', NULL, 3, 'photo', 6, 'hau nguyen,test,tag,jungdokwan,hcmc,trung hau'),
(3, 1, '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 1, 'img3.png', NULL, 2, 'video', 3, NULL),
(4, 1, '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, 'img2.png', NULL, 2, 'quote', 8, NULL),
(5, 1, '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, 'img2.png', NULL, 2, 'audio', 0, NULL),
(6, 1, '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem', '2014-08-13 00:00:00', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 'Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, consequat ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque sed dolor. Aliquam congue fermentum nisl.', 0, 'img2.png', NULL, 2, 'audio', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE IF NOT EXISTS `post_categories` (
`id` int(11) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `order by` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `post_type_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name_en`, `name_vi`, `order by`, `description`, `post_type_id`) VALUES
(1, 'News & Event', 'Tin Tức & Sự Kiện', 1, '', 2),
(2, 'News & Event', 'Tin Tức & Sự Kiện', 1, '', 2),
(3, 'News & Event', 'Tin Tức & Sự Kiện', 1, '', 2),
(4, 'News & Event', 'Tin Tức & Sự Kiện', 1, '', 2),
(5, 'News & Event', 'Tin Tức & Sự Kiện', 1, '', 2),
(6, 'News & Event', 'Tin Tức & Sự Kiện', 1, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `post_type`
--

CREATE TABLE IF NOT EXISTS `post_type` (
`id` bigint(20) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `post_type`
--

INSERT INTO `post_type` (`id`, `name_en`, `name_vi`, `order`, `description`, `enable`) VALUES
(1, 'Course', 'Chương trình', 0, '', 1),
(2, 'News & event', 'Tin tức & sự kiện', 1, '', 1),
(3, 'Images', 'Hình ảnh', 2, '', 1),
(4, 'Video', 'Video', 3, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_main_menu`
--

CREATE TABLE IF NOT EXISTS `sub_main_menu` (
`id` int(11) NOT NULL,
  `main_menu_id` int(11) NOT NULL,
  `name_vi` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sub_main_menu`
--

INSERT INTO `sub_main_menu` (`id`, `main_menu_id`, `name_vi`, `name_en`, `order`) VALUES
(1, 3, 'Chương Trình 1', 'Course 1', 0),
(2, 3, 'Chương trình 2', 'Course 2', 1),
(3, 3, 'Chương Trình 3', 'Course 3', 2),
(4, 3, 'Chương Trình 4', 'Course 4', 3),
(5, 3, 'Chương Trình 5', 'Course 5', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album_gallery`
--
ALTER TABLE `album_gallery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_menu`
--
ALTER TABLE `main_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_event`
--
ALTER TABLE `news_event`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_event_categories`
--
ALTER TABLE `news_event_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_setting`
--
ALTER TABLE `page_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_type`
--
ALTER TABLE `post_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_main_menu`
--
ALTER TABLE `sub_main_menu`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album_gallery`
--
ALTER TABLE `album_gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `coach`
--
ALTER TABLE `coach`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `main_menu`
--
ALTER TABLE `main_menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `news_event`
--
ALTER TABLE `news_event`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `news_event_categories`
--
ALTER TABLE `news_event_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `page_setting`
--
ALTER TABLE `page_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `post_type`
--
ALTER TABLE `post_type`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sub_main_menu`
--
ALTER TABLE `sub_main_menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
