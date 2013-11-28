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


