/*
Navicat MySQL Data Transfer

Source Server         : AIC-Monitoring
Source Server Version : 50523
Source Host           : localhost:3306
Source Database       : report_system_development

Target Server Type    : MYSQL
Target Server Version : 50523
File Encoding         : 65001

Date: 2012-11-24 15:36:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `channels`
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of channels
-- ----------------------------
INSERT INTO `channels` VALUES ('1', 'Интернет', '2012-09-23 16:23:18', '2012-09-23 16:23:18');

-- ----------------------------
-- Table structure for `clients`
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idvk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `daysandtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presumed_start` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_clients_on_status_id` (`status_id`),
  KEY `index_clients_on_resource_id` (`resource_id`),
  KEY `index_clients_on_channel_id` (`channel_id`),
  KEY `index_clients_on_manager_id` (`manager_id`),
  KEY `index_clients_on_office_id` (`office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES ('2', '1', '1', 'Петя', '+79219999999', 'tester@testgmail.ru', 'id1231231', '239', 'Big father', '99999999999', '1', '1', '23-09-2012', '23', '1', 'comment posted by manager', '2012-09-24 12:37:07', '2012-09-24 12:37:07', 'Петров', null, null, null, null, null, 'Петрович');
INSERT INTO `clients` VALUES ('3', '1', '1', 'Анна', '+79030942255', '', '', '444', 'Бу Бубу', '+79030942256', '1', null, '', '', '1', '', '2012-10-18 09:49:30', '2012-10-18 09:49:30', 'Чавака', null, null, null, null, null, 'Петрова');

-- ----------------------------
-- Table structure for `clients_courses`
-- ----------------------------
DROP TABLE IF EXISTS `clients_courses`;
CREATE TABLE `clients_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clients_courses
-- ----------------------------
INSERT INTO `clients_courses` VALUES ('1', '2', '2');
INSERT INTO `clients_courses` VALUES ('2', '3', '1');

-- ----------------------------
-- Table structure for `costs`
-- ----------------------------
DROP TABLE IF EXISTS `costs`;
CREATE TABLE `costs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of costs
-- ----------------------------
INSERT INTO `costs` VALUES ('1', 'Аренда', '2012-09-23 15:55:59', '2012-09-23 15:55:59');

-- ----------------------------
-- Table structure for `courses`
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('1', 'ЕГЭ', 'Математика', '2012-09-23 15:49:32', '2012-09-23 15:49:32');
INSERT INTO `courses` VALUES ('2', 'ЕГЭ', 'Английский язык', '2012-09-23 15:49:53', '2012-09-23 15:49:53');
INSERT INTO `courses` VALUES ('3', 'ЕГЭ', 'Алгебра', '2012-11-12 16:53:45', '2012-11-12 16:53:45');

-- ----------------------------
-- Table structure for `courses_teachers`
-- ----------------------------
DROP TABLE IF EXISTS `courses_teachers`;
CREATE TABLE `courses_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of courses_teachers
-- ----------------------------
INSERT INTO `courses_teachers` VALUES ('1', '2', '1');
INSERT INTO `courses_teachers` VALUES ('2', '3', '1');

-- ----------------------------
-- Table structure for `managers`
-- ----------------------------
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idvk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of managers
-- ----------------------------
INSERT INTO `managers` VALUES ('1', 'Вася Пупкин', '(790) 309-4225', '23524', '453, 532,765', null, '2012-09-23 15:54:42', '2012-11-04 01:21:49');

-- ----------------------------
-- Table structure for `msalaries`
-- ----------------------------
DROP TABLE IF EXISTS `msalaries`;
CREATE TABLE `msalaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `summ` float DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `pay_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_msalaries_on_manager_id` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of msalaries
-- ----------------------------
INSERT INTO `msalaries` VALUES ('1', null, '2012-11-16 23:42:00', null, null, '', '2012-11-16 23:44:44', '2012-11-16 23:44:44', '2012-11-17', '2012-11-17', '11/10/2012 00:00', '11/17/2012 00:00');
INSERT INTO `msalaries` VALUES ('2', '1', '2012-11-16 23:48:00', null, null, '', '2012-11-16 23:48:42', '2012-11-16 23:48:42', '2012-11-17', '2012-11-17', '', '');

-- ----------------------------
-- Table structure for `offices`
-- ----------------------------
DROP TABLE IF EXISTS `offices`;
CREATE TABLE `offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of offices
-- ----------------------------
INSERT INTO `offices` VALUES ('1', 'Маяковская', 'ул. Маяковского д.20', '(111) 111-1111', '2012-09-23 15:56:25', '2012-11-04 01:22:02');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `contract` date DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end` date DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_client_id` (`client_id`),
  KEY `index_orders_on_course_id` (`course_id`),
  KEY `index_orders_on_teacher_id` (`teacher_id`),
  KEY `index_orders_on_schedule_id` (`schedule_id`),
  KEY `index_orders_on_office_id` (`office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('2', '2', '2012-09-24', '1', '1', '1', '1', '2012-09-24', 'sunday', '0000-00-00', '0.3', '1234', '2012-09-24 12:37:59', '2012-09-24 12:37:59', null, null, null);
INSERT INTO `orders` VALUES ('3', '3', '2012-11-12', '1', '1', '21', '1', '2012-11-12', 'sunday', '2012-11-12', '', null, '2012-11-12 07:01:34', '2012-11-12 07:01:34', null, null, null);
INSERT INTO `orders` VALUES ('4', '2', '2012-03-07', '2', '1', '20', '1', '2012-11-15', '23423', '2012-11-15', '', '23432', '2012-11-15 07:47:22', '2012-11-15 07:47:22', null, null, null);

-- ----------------------------
-- Table structure for `outlays`
-- ----------------------------
DROP TABLE IF EXISTS `outlays`;
CREATE TABLE `outlays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `summ` float DEFAULT NULL,
  `cost_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_outlays_on_cost_id` (`cost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of outlays
-- ----------------------------
INSERT INTO `outlays` VALUES ('1', '2010-08-09 05:38:00', '234', '1', 'Наличные', 'dsf', '', '2012-11-12 07:38:46', '2012-11-12 07:38:46');
INSERT INTO `outlays` VALUES ('2', '2010-06-06 07:38:00', '234', '1', 'По безналу', 'htrhrth', '', '2012-11-12 07:39:11', '2012-11-12 07:39:11');

-- ----------------------------
-- Table structure for `payments`
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `summ` float DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `pay_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_payments_on_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES ('7', '2012-11-20 20:12:00', '325435000', 'Наличные', '3', '2012-11-20 20:13:16', '2012-11-20 20:13:16', null, null, '', '');
INSERT INTO `payments` VALUES ('8', '2012-11-20 21:28:00', null, null, '4', '2012-11-20 21:42:26', '2012-11-20 21:42:26', null, null, '', '');
INSERT INTO `payments` VALUES ('9', '2012-11-20 21:52:00', null, null, '4', '2012-11-20 21:53:44', '2012-11-20 21:53:44', null, null, '', '');
INSERT INTO `payments` VALUES ('10', '2012-11-20 22:01:00', null, null, '3', '2012-11-20 22:02:10', '2012-11-20 22:02:10', null, null, '', '');
INSERT INTO `payments` VALUES ('11', '2012-11-20 23:53:00', null, null, '3', '2012-11-20 23:54:12', '2012-11-20 23:54:12', null, null, '', '');
INSERT INTO `payments` VALUES ('12', '2012-11-21 10:13:00', null, null, '3', '2012-11-21 10:36:54', '2012-11-21 10:36:54', null, null, '', '');
INSERT INTO `payments` VALUES ('13', '2012-11-21 12:26:00', null, null, '4', '2012-11-21 12:26:34', '2012-11-21 12:26:34', null, null, '', '');
INSERT INTO `payments` VALUES ('14', '2012-11-21 12:28:00', null, null, '3', '2012-11-21 12:32:37', '2012-11-21 12:32:37', null, null, '', '');

-- ----------------------------
-- Table structure for `periods`
-- ----------------------------
DROP TABLE IF EXISTS `periods`;
CREATE TABLE `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of periods
-- ----------------------------
INSERT INTO `periods` VALUES ('1', '48 часов', '2012-11-15 15:55:33', '2012-11-15 15:55:33');
INSERT INTO `periods` VALUES ('2', '72 часа', '2012-11-15 15:56:55', '2012-11-15 15:56:55');
INSERT INTO `periods` VALUES ('3', '84 часа', '2012-11-15 15:57:23', '2012-11-15 15:57:23');
INSERT INTO `periods` VALUES ('4', '96 часов', '2012-11-15 15:57:46', '2012-11-15 15:57:46');

-- ----------------------------
-- Table structure for `resources`
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO `resources` VALUES ('1', 'Интернет-заявка', '2012-09-23 15:48:58', '2012-09-23 15:48:58');

-- ----------------------------
-- Table structure for `salaries`
-- ----------------------------
DROP TABLE IF EXISTS `salaries`;
CREATE TABLE `salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `summ` float DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `pay_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salaries_on_course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of salaries
-- ----------------------------
INSERT INTO `salaries` VALUES ('1', '2009-11-12 13:02:00', '5000', '1', 'Наличные', '', '1', '2012-11-12 12:02:51', '2012-11-12 12:02:51', '2012-11-12', '2012-11-12', '1', null, null);
INSERT INTO `salaries` VALUES ('3', '2012-11-12 22:23:00', null, '2', null, '', '1', '2012-11-12 22:35:09', '2012-11-12 22:35:09', '2012-11-13', '2012-11-13', null, null, null);
INSERT INTO `salaries` VALUES ('4', '2012-11-12 22:37:00', null, '2', 'Наличные', '', '1', '2012-11-12 22:39:07', '2012-11-12 22:39:07', '2012-11-13', '2012-11-13', '20', null, null);
INSERT INTO `salaries` VALUES ('5', null, null, '2', null, null, '1', '2012-11-13 11:46:47', '2012-11-13 11:46:47', null, null, '21', null, null);
INSERT INTO `salaries` VALUES ('6', '2012-11-13 15:26:00', null, '2', null, '', '1', '2012-11-13 15:31:45', '2012-11-13 15:31:45', '2012-11-13', '2012-11-13', '20', null, null);
INSERT INTO `salaries` VALUES ('7', null, null, '2', null, null, '1', '2012-11-13 18:39:38', '2012-11-13 18:39:38', null, null, '20', null, null);
INSERT INTO `salaries` VALUES ('8', null, null, '2', null, null, '1', '2012-11-13 19:57:10', '2012-11-13 19:57:10', null, null, '20', null, null);
INSERT INTO `salaries` VALUES ('9', '2012-11-13 20:20:00', null, '2', 'Наличные', '', '1', '2012-11-13 23:00:44', '2012-11-13 23:00:44', '2012-11-14', '2012-11-14', '1', null, null);
INSERT INTO `salaries` VALUES ('10', '2009-06-08 08:03:00', '500', '2', 'Наличные', 'sadad', '1', '2012-11-13 23:05:08', '2012-11-13 23:05:08', '2010-06-08', '2011-06-17', '20', null, null);
INSERT INTO `salaries` VALUES ('11', '2012-11-16 23:51:00', null, '2', null, '', '1', '2012-11-16 23:54:35', '2012-11-16 23:54:35', '2012-11-17', '2012-11-17', '20', '11/03/2012 00:00', '11/29/2012 00:00');
INSERT INTO `salaries` VALUES ('12', '2012-11-20 13:53:00', null, '2', null, '', '1', '2012-11-20 14:21:14', '2012-11-20 14:21:14', '2012-11-20', '2012-11-20', '1', '', '');
INSERT INTO `salaries` VALUES ('13', '2012-11-20 14:22:00', null, '2', 'Наличные', '', '1', '2012-11-20 14:29:39', '2012-11-20 14:29:39', '2012-11-20', '2012-11-20', '20', '', '');

-- ----------------------------
-- Table structure for `schedules`
-- ----------------------------
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_schedules_on_office_id` (`office_id`),
  KEY `index_schedules_on_teacher_id` (`teacher_id`),
  KEY `index_schedules_on_course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of schedules
-- ----------------------------
INSERT INTO `schedules` VALUES ('1', 'пн, вт', '19.30-20.30', '1', '1', '1', '96', '2012-09-23 16:12:00', '2012-09-23 16:13:12', '2012-09-23 16:13:12');
INSERT INTO `schedules` VALUES ('20', 'понедельник, вторник', '12:13, 15:14', '1', '1', '2', null, '2012-11-11 20:00:00', '2012-11-11 20:52:40', '2012-11-11 20:52:40');
INSERT INTO `schedules` VALUES ('21', 'понедельник, вторник', '05:06, 19:40', '1', '2', '1', '9', '2012-11-12 20:00:00', '2012-11-13 09:13:28', '2012-11-13 09:13:28');
INSERT INTO `schedules` VALUES ('22', 'понедельник, вторник, среда', '', '1', '1', '1', null, null, '2012-11-17 13:59:48', '2012-11-17 13:59:48');

-- ----------------------------
-- Table structure for `schema_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO `schema_migrations` VALUES ('20120822051005');
INSERT INTO `schema_migrations` VALUES ('20120822051300');
INSERT INTO `schema_migrations` VALUES ('20120822051643');
INSERT INTO `schema_migrations` VALUES ('20120822051841');
INSERT INTO `schema_migrations` VALUES ('20120822052111');
INSERT INTO `schema_migrations` VALUES ('20120822052307');
INSERT INTO `schema_migrations` VALUES ('20120822060558');
INSERT INTO `schema_migrations` VALUES ('20120822060815');
INSERT INTO `schema_migrations` VALUES ('20120822061047');
INSERT INTO `schema_migrations` VALUES ('20120822062830');
INSERT INTO `schema_migrations` VALUES ('20120822063442');
INSERT INTO `schema_migrations` VALUES ('20120822064944');
INSERT INTO `schema_migrations` VALUES ('20120822065335');
INSERT INTO `schema_migrations` VALUES ('20120822065438');
INSERT INTO `schema_migrations` VALUES ('20120822065758');
INSERT INTO `schema_migrations` VALUES ('20120822070150');
INSERT INTO `schema_migrations` VALUES ('20120822070539');
INSERT INTO `schema_migrations` VALUES ('20120822070943');
INSERT INTO `schema_migrations` VALUES ('20120901101556');
INSERT INTO `schema_migrations` VALUES ('20121020085317');
INSERT INTO `schema_migrations` VALUES ('20121103073725');
INSERT INTO `schema_migrations` VALUES ('20121103080713');
INSERT INTO `schema_migrations` VALUES ('20121103081126');
INSERT INTO `schema_migrations` VALUES ('20121103083730');
INSERT INTO `schema_migrations` VALUES ('20121103213547');
INSERT INTO `schema_migrations` VALUES ('20121103214422');
INSERT INTO `schema_migrations` VALUES ('20121103215158');
INSERT INTO `schema_migrations` VALUES ('20121103215857');
INSERT INTO `schema_migrations` VALUES ('20121114205735');
INSERT INTO `schema_migrations` VALUES ('20121115122844');
INSERT INTO `schema_migrations` VALUES ('20121115125447');
INSERT INTO `schema_migrations` VALUES ('20121115154947');
INSERT INTO `schema_migrations` VALUES ('20121116185529');
INSERT INTO `schema_migrations` VALUES ('20121116220145');
INSERT INTO `schema_migrations` VALUES ('20121116231532');
INSERT INTO `schema_migrations` VALUES ('20121117105730');
INSERT INTO `schema_migrations` VALUES ('20121117184135');
INSERT INTO `schema_migrations` VALUES ('20121117185604');
INSERT INTO `schema_migrations` VALUES ('20121118193306');
INSERT INTO `schema_migrations` VALUES ('20121118204803');
INSERT INTO `schema_migrations` VALUES ('20121120130939');
INSERT INTO `schema_migrations` VALUES ('20121120132932');
INSERT INTO `schema_migrations` VALUES ('20121120210236');

-- ----------------------------
-- Table structure for `sort_options`
-- ----------------------------
DROP TABLE IF EXISTS `sort_options`;
CREATE TABLE `sort_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `channels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `costs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courses` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `managers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msalaries` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offices` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orders` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outlays` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resources` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salaries` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schedules` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statuses` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teachers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sort_options
-- ----------------------------
INSERT INTO `sort_options` VALUES ('6', '2', null, 'name', null, null, null, null, null, 'discount', null, null, null, null, null, null, null, null, '2012-11-14 22:31:49', '2012-11-23 09:03:51');
INSERT INTO `sort_options` VALUES ('7', '3', null, 'phone', null, null, null, null, null, '', null, null, null, null, null, null, null, null, '2012-11-14 22:34:23', '2012-11-14 22:34:23');
INSERT INTO `sort_options` VALUES ('8', '4', null, 'school', null, null, null, null, null, '', null, null, null, null, null, null, null, null, '2012-11-15 13:26:13', '2012-11-15 14:40:38');

-- ----------------------------
-- Table structure for `statuses`
-- ----------------------------
DROP TABLE IF EXISTS `statuses`;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of statuses
-- ----------------------------
INSERT INTO `statuses` VALUES ('1', 'Договор подписан', '2012-09-23 15:43:29', '2012-09-23 15:43:29');

-- ----------------------------
-- Table structure for `teachers`
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idvk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workplace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('1', 'Вася', '361986871', 'ываываыввывы', 'выаыв', 'выаыв', 'ваывав', '2012-09-23 16:11:33', '2012-09-23 16:11:33', null);
INSERT INTO `teachers` VALUES ('2', 'ыва', '(234) 324-3242', 'petia@yande.xru', '34234', 'выавыа', 'ывавыа', '2012-11-11 20:50:48', '2012-11-11 20:50:48', 'выа');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` int(11) DEFAULT NULL,
  `user_nick` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', 'lvl0nax@gmail.com', '$2a$10$fiUteYFTEFex72pd8/9DuOcKkhTBbGGhCwQvGJiGO4Z8Pph0pOXR6', null, null, null, '64', '2012-11-24 13:12:07', '2012-11-23 08:35:08', '127.0.0.1', '127.0.0.1', '2012-09-01 10:20:15', '2012-11-24 13:12:07', '1', 'Stepa', 'admim', 'false');
INSERT INTO `users` VALUES ('3', 'tia@net-simple.ru', '$2a$10$DncqTUOpqTJtaOApyKQKcepwLdssyGjnbEGU673dgarSZj8anK/fi', null, null, null, '3', '2012-11-14 22:31:53', '2012-11-08 22:05:16', '127.0.0.1', '188.134.8.60', '2012-09-01 10:21:35', '2012-11-14 22:31:53', '1', 'vasia', 'admin', null);
INSERT INTO `users` VALUES ('4', 'petia@yandex.ru', '$2a$10$8an5gmHz2XJQIVfa3S4rguzL8bg/0RLms7Eh0DqdiF6KnvW40iMee', null, null, null, '1', '2012-11-15 12:33:54', '2012-11-15 12:33:54', '127.0.0.1', '127.0.0.1', '2012-11-15 12:33:54', '2012-11-18 21:06:26', null, 'petia', 'admin', 'false');
INSERT INTO `users` VALUES ('8', 'ankain-web@yandex.ru', '$2a$10$CzQeM3jMLSfNerqywfyen.IQqDN8rqnaOUH4hjsriNZw3OnML0Geu', null, null, null, '1', '2012-11-18 20:33:08', '2012-11-18 20:33:08', '127.0.0.1', '127.0.0.1', '2012-11-18 20:20:37', '2012-11-18 20:33:08', '1', 'Norm', 'admin', null);
