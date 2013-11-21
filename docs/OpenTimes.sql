-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 21, 2013 at 03:29 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.6-1+debphp.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lmvc_patat`
--

-- --------------------------------------------------------

--
-- Table structure for table `OpenTimes`
--

CREATE TABLE IF NOT EXISTS `OpenTimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `week_day` varchar(255) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `OpenTimes`
--

INSERT INTO `OpenTimes` (`id`, `restaurant_id`, `week_day`, `opening_time`, `closing_time`) VALUES
(37, 49, 'Monday', '00:00:00', '00:00:00'),
(38, 49, 'Tuesday', '00:00:00', '00:00:00'),
(39, 49, 'Wednesday', '00:00:00', '00:00:00'),
(40, 49, 'Thursday', '00:00:00', '00:00:00'),
(41, 49, 'Friday', '00:00:00', '00:00:00'),
(42, 49, 'Saturday', '00:00:00', '00:00:00'),
(43, 49, 'Sunday', '00:00:00', '00:00:00'),
(44, 50, 'Monday', '09:00:00', '21:00:00'),
(45, 50, 'Tuesday', '09:00:00', '21:00:00'),
(46, 50, 'Wednesday', '09:00:00', '21:00:00'),
(47, 50, 'Thursday', '09:00:00', '21:00:00'),
(48, 50, 'Friday', '09:00:00', '21:00:00'),
(49, 50, 'Saturday', '11:00:00', '19:00:00'),
(50, 50, 'Sunday', '11:00:00', '19:00:00'),
(51, 51, 'Monday', '00:00:00', '00:00:00'),
(52, 51, 'Tuesday', '00:00:00', '00:00:00'),
(53, 51, 'Wednesday', '00:00:00', '00:00:00'),
(54, 51, 'Thursday', '00:00:00', '00:00:00'),
(55, 51, 'Friday', '00:00:00', '00:00:00'),
(56, 51, 'Saturday', '00:00:00', '00:00:00'),
(57, 51, 'Sunday', '00:00:00', '00:00:00'),
(58, 52, 'Monday', '00:00:00', '00:00:00'),
(59, 52, 'Tuesday', '00:00:00', '00:00:00'),
(60, 52, 'Wednesday', '00:00:00', '00:00:00'),
(61, 52, 'Thursday', '00:00:00', '00:00:00'),
(62, 52, 'Friday', '00:00:00', '00:00:00'),
(63, 52, 'Saturday', '00:00:00', '00:00:00'),
(64, 52, 'Sunday', '00:00:00', '00:00:00'),
(65, 53, 'Monday', '04:00:00', '18:00:00'),
(66, 53, 'Tuesday', '04:00:00', '18:00:00'),
(67, 53, 'Wednesday', '04:00:00', '18:00:00'),
(68, 53, 'Thursday', '04:00:00', '18:00:00'),
(69, 53, 'Friday', '04:00:00', '18:00:00'),
(70, 53, 'Saturday', '02:00:00', '22:00:00'),
(71, 53, 'Sunday', '02:00:00', '22:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OpenTimes`
--
ALTER TABLE `OpenTimes`
  ADD CONSTRAINT `OpenTimes_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `Locations` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
