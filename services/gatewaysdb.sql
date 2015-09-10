-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 10, 2015 at 12:09 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gatewaysdb`
--
CREATE DATABASE IF NOT EXISTS `gatewaysdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gatewaysdb`;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE IF NOT EXISTS `colleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL COMMENT 'teacher or someone else from college',
  `email` varchar(80) NOT NULL,
  `lead` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '0-not_registered, 1-registed,2-reported at reception',
  `reported_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`),
  KEY `lead` (`lead`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `name`, `city`, `state`, `contact`, `email`, `lead`, `status`, `reported_time`) VALUES
(1, 'MAC', NULL, NULL, NULL, '', NULL, NULL, NULL),
(2, 'EEX', NULL, NULL, NULL, '', NULL, NULL, NULL),
(3, 'Jyothi Nivas', NULL, NULL, NULL, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `original_name` varchar(50) DEFAULT NULL,
  `tag_line` varchar(100) NOT NULL,
  `description` mediumtext,
  `rounds` int(2) DEFAULT NULL,
  `latest_status` int(11) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '0- Non Technical, 1-Technical, 2-functions',
  `teams_per_college` int(2) DEFAULT '2',
  `participants_per_team` int(2) DEFAULT '1',
  `photo` varchar(100) DEFAULT NULL COMMENT 'event main pic',
  PRIMARY KEY (`id`),
  KEY `latest_status` (`latest_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `events2`
--

CREATE TABLE IF NOT EXISTS `events2` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `events2`
--

INSERT INTO `events2` (`event_id`, `event_name`) VALUES
(1, 'Product Launch'),
(2, 'JAM'),
(3, 'Treasure Hunt'),
(4, 'Coding'),
(5, 'Photography'),
(6, 'Gaming'),
(7, 'Mock Parliament'),
(8, 'Web Designing'),
(9, 'Video Making'),
(10, 'App Development'),
(11, 'Dumb Charades'),
(12, 'Quiz'),
(13, 'IT Manager'),
(14, 'Brushless Painting');

-- --------------------------------------------------------

--
-- Table structure for table `event_heads`
--

CREATE TABLE IF NOT EXISTS `event_heads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizer_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organizer_id` (`organizer_id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `organizers`
--

CREATE TABLE IF NOT EXISTS `organizers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `class` int(3) DEFAULT NULL,
  `register_no` varchar(20) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `email_personal` varchar(60) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE IF NOT EXISTS `participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `email` varchar(60) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0 - not varified, 1 - varified',
  `accomodation` int(2) NOT NULL DEFAULT '0' COMMENT '0- no 1-yes',
  PRIMARY KEY (`id`),
  KEY `college_id` (`college_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `first_name`, `last_name`, `gender`, `college_id`, `contact`, `email`, `password`, `status`, `accomodation`) VALUES
(86, 'Germiyan', '', 'male', 2, '1943242988', 'germiya000@gmail.com', 'germiya123', 0, 0),
(87, 'germiya', 'germiya', 'male', 1, '4706263588', 'germi00@gmail.com', 'germiya', 0, 0),
(88, 'germiya', 'germiya', 'male', 1, '4706263588', 'germ0@gmail.com', 'germiya', 0, 0),
(89, 'germiya', 'germiya', 'male', 1, '4706263588', 'ge00@gmail.com', 'germiya', 0, 0),
(90, '', '', 'undefin', 1, '', '', '', 0, 0),
(91, '', '', 'undefin', 1, '', '', '', 0, 0),
(92, 'Germiya', 'Jose', 'male', 1, '0406231955', 'g@g', '1', 0, 1),
(93, 'chk', 'k', 'male', 1, '7406532955', 'c@v', '1', 0, 1),
(94, 'chk', 'k', 'male', 1, '7406532955', 'c@v', '1', 0, 1),
(95, 'chk', 'klll', 'male', 1, '7406532955', 'c@v', '1', 0, 1),
(96, 'Germiya', 'Jose', 'male', 1, '0740621955', 'h@hg', '1', 0, 0),
(97, 'Germiya', 'Jose', 'undefin', 1, '0740623195', 'g@v', 'q', 0, 1),
(98, 'Germiya', 'Jose', 'undefin', 1, '0740623195', 'g@v', 'q', 0, 1),
(99, 'Germiya', 'Jose', 'undefin', 1, '0740623195', 'g@v', 'q', 0, 1),
(100, 'Germiya', 'Jose', 'undefin', 1, '0740623195', 'g@v', 'q', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `participants_events`
--

CREATE TABLE IF NOT EXISTS `participants_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `team_no` int(2) DEFAULT NULL,
  `attendance` int(2) DEFAULT NULL COMMENT '0-absent, 1-present',
  `remarks` varchar(500) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `reported_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `participant_id` (`participant_id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `participants_events2`
--

CREATE TABLE IF NOT EXISTS `participants_events2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `participants_events2`
--

INSERT INTO `participants_events2` (`id`, `participant_id`, `event_id`) VALUES
(4, 87, 1),
(5, 87, 1),
(6, 87, 1),
(7, 88, 1),
(8, 88, 1),
(9, 89, 1),
(10, 89, 1),
(11, 90, 1),
(12, 90, 1),
(13, 91, 1),
(15, 86, 1),
(16, 86, 2);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `first` int(11) DEFAULT NULL,
  `second` int(11) DEFAULT NULL,
  `third` int(11) DEFAULT NULL,
  `remarks` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `permissions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `day` int(2) DEFAULT NULL COMMENT '1 - day1, 2-day2',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL COMMENT 'in minutes',
  `venue_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `venue_id` (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL COMMENT '1-day1, 2-day2',
  `time` time DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE IF NOT EXISTS `venues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `reach` varchar(300) DEFAULT NULL,
  `map` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `colleges`
--
ALTER TABLE `colleges`
  ADD CONSTRAINT `colleges_ibfk_1` FOREIGN KEY (`lead`) REFERENCES `participants` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`latest_status`) REFERENCES `status` (`id`);

--
-- Constraints for table `event_heads`
--
ALTER TABLE `event_heads`
  ADD CONSTRAINT `event_heads_ibfk_1` FOREIGN KEY (`organizer_id`) REFERENCES `organizers` (`id`),
  ADD CONSTRAINT `event_heads_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `organizers`
--
ALTER TABLE `organizers`
  ADD CONSTRAINT `organizers_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`id`);

--
-- Constraints for table `participants_events`
--
ALTER TABLE `participants_events`
  ADD CONSTRAINT `participants_events_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`),
  ADD CONSTRAINT `participants_events_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`id`) REFERENCES `events` (`id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`);

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
