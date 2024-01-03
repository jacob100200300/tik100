-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 11, 2023 at 05:47 AM
-- Server version: 10.6.15-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u961326291_ddd`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_type` enum('3','2') NOT NULL DEFAULT '2',
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_email` text DEFAULT NULL,
  `username` varchar(225) DEFAULT NULL,
  `password` text NOT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` varchar(999) NOT NULL,
  `mode` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_type`, `admin_name`, `admin_email`, `username`, `password`, `telephone`, `register_date`, `login_date`, `login_ip`, `client_type`, `access`, `mode`) VALUES
(31, '3', 'SMMPANELBDLAB', 'smmpanelbdlab@gmail.com', 'admin', 'admin', '1234567653', '0000-00-00 00:00:00', '2023-10-02 03:15:10', '103.175.17.26', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"themes\":\"1\",\"child-panels\":\"1\",\"language\":\"1\",\"meta\":\"1\",\"twice\":\"1\",\"files\":\"1\",\"coupon\":\"1\",\"admins\":\"1\",\"update-prices\":\"1\",\"bulk\":\"1\",\"bulkc\":\"1\",\"synced-logs\":\"1\",\"refill\":\"1\",\"referral\":\"1\",\"broadcast\":\"1\",\"logs\":\"1\",\"videop\":\"1\",\"updates\":\"1\",\"menu\":\"1\",\"inte\":\"1\",\"currency\":\"1\",\"news\":\"1\",\"blog\":\"1\",\"modules\":\"1\",\"subject\":\"1\",\"super_admin\":\"1\",\"tasks\":\"1\",\"decoration\":\"1\",\"currency-manager\":\"1\"}', 'sun');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `image_file` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime NOT NULL,
  `image_file` varchar(200) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `blog_get` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `published_at`, `image_file`, `status`, `blog_get`, `updated_at`) VALUES
(1, 'Testing', 'Social marketing is a strategic approach to promoting behavior change for social good. It involves the application of marketing principles and techniques to address social issues such as public health, environmental conservation, and social justice. The goal of social marketing is to influence and persuade individuals, communities, and organizations to adopt positive behaviors or attitudes that benefit society as a whole. It often involves identifying target audiences, conducting research, developing and implementing marketing campaigns, and evaluating the impact of these efforts. Social marketing aims to create sustainable behavior change by addressing the underlying factors that influence people\'s choices and actions.', '2023-08-19 12:36:47', 'https://jongtasmm.com/img/files/c17fc5811eeff60d91cca72f3c2c727e.png', '1', 'testing', '2023-08-20 08:37:18'),
(2, 'demo', 'Marketing online, also known as digital marketing or internet marketing, refers to the practice of promoting and selling products or services using digital channels such as websites, social media, search engines, email, and mobile apps. It involves various strategies and tactics aimed at reaching and engaging a target audience, driving traffic to websites or landing pages, generating leads, and ultimately converting them into customers. Online marketing encompasses a wide range of activities, including search engine optimization (SEO), content marketing, social media marketing, email marketing, pay-per-click (PPC) advertising, affiliate marketing, and more. It allows businesses to reach a global audience, track and measure results, and personalize marketing efforts based on user preferences and behaviors.', '2023-08-19 10:26:06', 'https://jongtasmm.com/img/files/6f6249911e492e384cf38833dc33499f.png', '1', 'demo1', '2023-08-20 08:38:24'),
(3, 'demo2', 'Digital marketing is the practice of promoting products or services using digital technologies and online platforms. It involves various strategies and tactics such as search engine optimization (SEO), social media marketing, content marketing, email marketing, influencer marketing, and online advertising. The aim of digital marketing is to reach and engage with a target audience, drive website traffic, generate leads, and ultimately convert those leads into customers. It also involves analyzing data and metrics to measure the effectiveness of marketing campaigns and make data-driven decisions.', '2023-08-19 10:26:38', 'https://jongtasmm.com/img/files/f701d6a12137ce96f57929431711496e.png', '1', 'demo2', '2023-08-20 08:39:09'),
(4, 'digi', 'There are several ways to learn social media marketing online. Here are some steps you can follow:\n\n\n\n1. Research and identify reputable online courses or certifications: Look for courses offered by renowned institutions, industry experts, or specialized platforms. Some popular options include Udemy, Coursera, LinkedIn Learning, and HubSpot Academy.\n\n\n\n2. Choose a course that suits your needs: Consider factors like your current skill level, budget, and desired outcome. Look for courses that cover various aspects of social media marketing, such as strategy development, content creation, advertising, analytics, and community management.\n\n\n\n3. Enroll in the course: Once you\'ve selected a course, enroll and start learning. Many online courses offer self-paced learning, allowing you to study at your own convenience.\n\n\n\n4. Participate in online communities: Join social media marketing groups or forums to connect with fellow learners and professionals. Engaging in discussions and sharing experiences can enhance your learning process.\n\n\n\n5. Stay updated with industry trends: Follow influential social media marketing blogs, podcasts, and YouTube channels to keep yourself informed about the latest trends and best practices in the field.\n\n\n\n6. Practice hands-on: Apply the knowledge gained from your online course by creating and managing social media accounts for personal projects or small businesses. Experiment with different strategies, content formats, and advertising techniques to gain practical experience.\n\n\n\n7. Monitor and analyze results: Use social media analytics tools to track the performance of your campaigns. Analyzing data and metrics will help you understand what works and what doesn\'t, allowing you to optimize your strategies.\n\n\n\n8. Continuously learn and adapt: Social media platforms and trends evolve rapidly. Stay updated by regularly learning new techniques, attending webinars, or participating in online workshops.\n\n\n\nRemember, practice and experimentation are crucial for mastering social media marketing. By continuously learning, adapting, and applying your knowledge, you can become proficient in this field.', '2023-08-20 08:40:28', 'https://jongtasmm.com/img/files/f8c07f807b2d5433c17130653befb7d9.png', '1', 'way-to-learning', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `bulkedit`
--

CREATE TABLE `bulkedit` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') NOT NULL DEFAULT '2',
  `category_icon` text NOT NULL,
  `is_refill` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_line`, `category_type`, `category_secret`, `category_icon`, `is_refill`) VALUES
(360, 'SMMscripts.shop', -1, '2', '2', '{\"icon_type\":\"image\",\"image_id\":\"152\"}', '');

-- --------------------------------------------------------

--
-- Table structure for table `childpanels`
--

CREATE TABLE `childpanels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `domain` varchar(191) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `child_username` varchar(191) NOT NULL,
  `child_password` varchar(191) NOT NULL,
  `charge` double NOT NULL,
  `status` enum('Pending','Active','Frozen','Suspended') NOT NULL DEFAULT 'Pending',
  `renewal_date` date NOT NULL,
  `date_created` datetime NOT NULL,
  `dreampanel_id` int(11) NOT NULL,
  `keyc` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `admin_type` enum('1','2') NOT NULL DEFAULT '2',
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` decimal(21,4) NOT NULL DEFAULT 0.0000,
  `spent` decimal(21,4) NOT NULL DEFAULT 0.0000,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `apikey` text NOT NULL,
  `tel_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `email_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text DEFAULT NULL,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT 0,
  `currency_type` varchar(10) DEFAULT NULL,
  `ref_code` text NOT NULL,
  `ref_by` text DEFAULT NULL,
  `change_email` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL,
  `currency` varchar(225) NOT NULL DEFAULT '1',
  `passwordreset_token` varchar(225) NOT NULL,
  `coustm_rate` int(11) NOT NULL,
  `broadcast_id` text NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `username`, `admin_type`, `password`, `telephone`, `balance`, `spent`, `balance_type`, `debit_limit`, `register_date`, `login_date`, `login_ip`, `apikey`, `tel_type`, `email_type`, `client_type`, `access`, `lang`, `timezone`, `currency_type`, `ref_code`, `ref_by`, `change_email`, `resend_max`, `currency`, `passwordreset_token`, `coustm_rate`, `broadcast_id`) VALUES
(27, NULL, 'smmpanelbdlab@gmail.com', 'smmpanelbdlab', '2', '29297a098e9453fb487b61127a53aefb', NULL, 0.0000, 0.0000, '2', NULL, '2023-10-17 16:14:23', '2023-11-10 14:43:35', '103.67.157.112', '4640c5b2368997a189ecb1e5debbed6c', '1', '1', '2', 'null', 'en', 0, 'USD', '', NULL, '2', 0, '1', '', 0, '36'),
(28, '', 'myrentalpanel@gmail.com', 'admin23', '2', '25d55ad283aa400af464c76d713c07ad', '', 0.0000, 0.0000, '2', NULL, '2023-11-10 10:24:44', '2023-11-10 10:38:24', '2409:40d2:5a:85da:c0e4:1a3d:6082:8e38', '53cb69c88f1d9d17924030fbfa5955e1', '1', '2', '2', NULL, 'en', 0, 'USD', 'dea606', NULL, '2', 0, '1', '', 0, '0'),
(29, '', 'officialrentalpanel41@gmail.com', 'admin24', '2', '25d55ad283aa400af464c76d713c07ad', '', 0.0000, 0.0000, '2', NULL, '2023-11-10 11:28:41', NULL, NULL, 'b6bbd5abe3e884f44700ab6fd76fda05', '1', '2', '2', NULL, 'en', 0, 'USD', 'eac64b', NULL, '2', 0, '1', '', 0, '36'),
(30, '', 'mouadmafdal44@gmail.com', 'mouad', '2', '629a3bfb6381580da438d86d4a546486', '', 0.0000, 0.0000, '2', NULL, '2023-11-10 15:06:23', '2023-11-10 15:09:58', '102.78.89.100', '48e7b1f079cd691dbb37184ce7dbe839', '1', '2', '2', NULL, 'en', 0, 'USD', '84c357', NULL, '2', 0, '1', '', 0, '36');

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(37, 7, 'New support ticket created#38', '103.175.17.26', '2023-09-18 15:24:34'),
(38, 7, 'New support ticket created#39', '103.175.17.26', '2023-09-18 15:27:48'),
(39, 7, 'New support ticket created#40', '103.175.17.26', '2023-09-18 15:28:04'),
(40, 7, 'New support ticket created#41', '103.175.17.26', '2023-09-18 15:42:07'),
(41, 7, 'Support request answered#41', '103.175.17.26', '2023-09-18 17:56:18'),
(42, 7, 'Support request answered#41', '103.175.17.26', '2023-09-18 17:56:23'),
(43, 7, 'Support request answered#41', '103.175.17.26', '2023-09-18 18:00:44'),
(44, 7, 'New support ticket created#42', '103.175.17.26', '2023-09-18 18:01:10'),
(45, 7, 'Support request answered#42', '103.175.17.26', '2023-09-18 18:01:16'),
(46, 7, 'Support request answered#42', '103.175.17.26', '2023-09-18 18:01:31'),
(47, 7, 'Support request answered#42', '103.175.17.26', '2023-09-18 18:01:41'),
(48, 7, 'Support request answered#42', '103.175.17.26', '2023-09-18 18:01:52'),
(49, 7, 'Support request answered#42', '103.175.17.26', '2023-09-18 18:01:57'),
(50, 7, 'New support ticket created#43', '103.175.17.26', '2023-09-18 18:20:08'),
(51, 7, 'Member logged in.', '103.175.17.26', '2023-09-18 21:16:32'),
(52, 7, 'New support ticket created#44', '103.175.17.26', '2023-09-18 21:42:46'),
(53, 7, 'New support ticket created#45', '103.175.17.24', '2023-09-19 00:52:18'),
(54, 7, 'Support request answered#45', '103.175.17.24', '2023-09-19 00:52:26'),
(55, 7, 'Support request answered#45', '103.175.17.26', '2023-09-19 01:21:06'),
(56, 6, 'Member logged in.', '103.175.17.26', '2023-09-19 17:34:34'),
(57, 7, 'Member logged in.', '103.175.17.26', '2023-09-19 17:38:21'),
(58, 8, '\r\n    User registered.', '93.177.75.198', '2023-09-20 00:32:01'),
(59, 8, 'Member logged in.', '93.177.75.198', '2023-09-20 00:32:10'),
(60, 9, '\r\n    User registered.', '93.177.75.198', '2023-09-20 00:33:05'),
(61, 10, '\r\n    User registered.', '93.177.75.198', '2023-09-20 00:34:59'),
(62, 11, '\r\n    User registered.', '93.177.75.198', '2023-09-20 00:35:47'),
(63, 12, '\r\n    User registered.', '93.177.75.198', '2023-09-20 00:38:58'),
(64, 13, '\r\n    User registered.', '93.177.75.198', '2023-09-20 00:40:32'),
(65, 11, 'Member logged in.', '146.70.46.34', '2023-09-20 01:52:01'),
(66, 14, '\r\n    User registered.', '103.175.17.26', '2023-09-20 12:21:55'),
(67, 15, '\r\n    User registered.', '103.175.17.26', '2023-09-20 12:22:45'),
(68, 8, 'Member logged in.', '103.155.53.211', '2023-09-20 14:53:32'),
(69, 16, '\r\n    User registered.', '103.175.17.26', '2023-09-20 17:53:06'),
(70, 15, 'New support ticket created#46', '103.175.17.26', '2023-09-21 16:34:02'),
(71, 15, 'Member logged in.', '103.175.17.26', '2023-09-21 16:53:30'),
(72, 2, 'Member logged in.', '45.124.15.250', '2023-09-21 20:58:01'),
(73, 17, '\r\n    User registered.', '103.155.53.211', '2023-09-21 21:30:56'),
(74, 17, 'Member logged in.', '103.155.53.211', '2023-09-21 21:31:06'),
(75, 15, 'Member logged in.', '103.175.17.26', '2023-09-22 13:56:03'),
(76, 6, 'Member logged in.', '103.175.17.26', '2023-09-22 14:09:58'),
(77, 6, 'Member logged in.', '103.175.17.26', '2023-09-22 14:27:51'),
(78, 15, 'Member logged in.', '103.175.17.26', '2023-09-22 14:53:26'),
(79, 15, 'Member logged in.', '103.175.17.26', '2023-09-22 16:31:16'),
(80, 15, 'Member logged in.', '103.175.17.26', '2023-09-22 22:32:00'),
(81, 15, 'Member logged in.', '103.175.17.30', '2023-09-22 23:55:43'),
(82, 18, '\r\n    User registered.', '103.175.17.26', '2023-09-23 12:01:02'),
(83, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 12:05:17'),
(84, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 12:26:55'),
(85, 18, 'New support ticket created#47', '103.175.17.27', '2023-09-23 12:48:44'),
(86, 18, 'Support request answered#47', '103.175.17.27', '2023-09-23 12:48:52'),
(87, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 13:15:25'),
(88, 6, 'Member logged in.', '103.175.17.26', '2023-09-23 13:24:18'),
(89, 6, 'Member logged in.', '103.175.17.26', '2023-09-23 13:28:55'),
(90, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 13:48:47'),
(91, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 14:24:27'),
(92, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 15:05:53'),
(93, 6, 'Member logged in.', '103.175.17.26', '2023-09-23 16:11:09'),
(94, 19, '\r\n    User registered.', '103.175.17.28', '2023-09-23 16:34:22'),
(95, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 16:51:54'),
(96, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 17:42:48'),
(97, 15, 'Member logged in.', '103.175.17.26', '2023-09-23 18:31:24'),
(98, 15, 'Member logged in.', '103.175.17.26', '2023-09-24 01:15:16'),
(99, 20, '\r\n    User registered.', '103.175.17.26', '2023-09-24 15:36:11'),
(100, 6, 'Member logged in.', '103.175.17.26', '2023-09-24 22:04:57'),
(101, 15, 'Member logged in.', '103.175.17.26', '2023-09-24 23:09:38'),
(102, 15, 'Member logged in.', '103.175.17.26', '2023-09-25 01:30:46'),
(103, 6, 'Member logged in.', '103.175.17.26', '2023-09-25 17:05:36'),
(104, 15, 'Member logged in.', '103.175.17.26', '2023-09-25 17:46:32'),
(105, 6, '0.785 New Order #200214.', '103.175.17.26', '2023-09-26 17:11:03'),
(106, 6, 'Member logged in.', '103.175.17.26', '2023-09-26 17:17:24'),
(107, 6, 'Member logged in.', '103.175.17.26', '2023-09-26 17:25:56'),
(108, 2, 'Member logged in.', '45.124.15.250', '2023-09-26 17:59:25'),
(109, 6, 'Member logged in.', '103.175.17.26', '2023-09-26 18:49:46'),
(110, 6, '#200214 Order number of has been completed.', '127.0.0.1', '2023-09-26 18:50:02'),
(111, 8, 'Member logged in.', '46.165.250.81', '2023-09-27 16:48:51'),
(112, 6, 'Member logged in.', '103.175.17.31', '2023-09-28 09:51:37'),
(113, 6, 'Member logged in.', '103.175.17.26', '2023-09-28 10:02:02'),
(114, 6, 'Member logged in.', '103.175.17.27', '2023-09-28 12:26:24'),
(115, 6, 'Member logged in.', '103.175.17.26', '2023-09-28 22:36:00'),
(116, 6, 'Member logged in.', '103.175.17.26', '2023-09-29 02:27:54'),
(117, 6, 'Member logged in.', '103.175.17.26', '2023-09-29 12:45:06'),
(118, 6, 'Member logged in.', '103.175.17.26', '2023-09-29 15:45:49'),
(119, 6, 'Member logged in.', '103.175.17.26', '2023-09-29 17:56:53'),
(120, 6, 'Member logged in.', '103.175.17.28', '2023-09-29 19:27:36'),
(121, 6, 'Member logged in.', '103.175.17.26', '2023-09-29 19:35:32'),
(122, 6, 'Member logged in.', '103.175.17.26', '2023-09-29 20:20:02'),
(123, 15, 'Member logged in.', '103.175.17.26', '2023-09-29 21:01:28'),
(124, 6, 'Member logged in.', '103.175.17.26', '2023-09-29 22:29:38'),
(125, 6, '5 New Order #200215.', '103.175.17.26', '2023-09-30 01:06:18'),
(126, 6, '0.314 New Order #200216.', '103.175.17.24', '2023-09-30 01:11:48'),
(127, 6, 'Member logged in.', '103.175.17.26', '2023-09-30 01:15:18'),
(128, 6, '#200216 Order number of has been completed.', '127.0.0.1', '2023-09-30 01:50:07'),
(129, 6, '#200215 Order number of has been completed.', '127.0.0.1', '2023-09-30 02:45:06'),
(130, 6, 'Member logged in.', '103.175.17.26', '2023-09-30 03:38:36'),
(131, 6, 'Member logged in.', '103.175.17.26', '2023-09-30 04:05:40'),
(132, 21, '\r\n    User registered.', '103.175.17.26', '2023-09-30 15:04:08'),
(133, 21, 'Member logged in.', '103.175.17.26', '2023-09-30 15:04:46'),
(134, 21, 'Member logged in.', '103.175.17.26', '2023-09-30 15:07:03'),
(135, 22, '\r\n    User registered.', '103.175.17.26', '2023-09-30 15:09:49'),
(136, 22, 'New support ticket created#48', '103.175.17.26', '2023-09-30 15:12:10'),
(137, 23, '\r\n    User registered.', '103.175.17.26', '2023-09-30 15:26:58'),
(138, 23, 'New support ticket created#49', '103.175.17.26', '2023-09-30 15:32:24'),
(139, 22, 'Member logged in.', '114.130.39.54', '2023-09-30 18:34:54'),
(140, 21, 'Member logged in.', '114.130.184.185', '2023-09-30 20:38:53'),
(141, 21, 'Member logged in.', '114.130.184.105', '2023-10-01 12:39:00'),
(142, 6, 'Member logged in.', '103.175.17.26', '2023-10-01 12:45:13'),
(143, 6, 'Member logged in.', '103.175.17.26', '2023-10-01 12:51:33'),
(144, 6, 'New support ticket created#50', '103.175.17.26', '2023-10-01 14:01:49'),
(145, 6, 'Support request <strong>Automatic</strong> answered as. ID:50', '103.175.17.26', '2023-10-01 14:01:49'),
(146, 6, 'Support request answered#50', '103.175.17.26', '2023-10-01 14:02:02'),
(147, 6, 'Support request answered#50', '103.175.17.26', '2023-10-01 14:02:21'),
(148, 23, 'Member logged in.', '45.124.12.149', '2023-10-01 18:08:35'),
(149, 23, 'User password has been changed', '45.124.12.149', '2023-10-01 18:15:31'),
(150, 23, 'Member logged in.', '45.124.12.149', '2023-10-01 18:16:45'),
(151, 23, 'New support ticket created#51', '45.124.12.149', '2023-10-01 18:22:35'),
(152, 23, 'Support request <strong>Automatic</strong> answered as. ID:51', '45.124.12.149', '2023-10-01 18:22:35'),
(153, 23, 'Member logged in.', '45.124.12.149', '2023-10-01 18:27:23'),
(154, 23, 'Member logged in.', '45.124.12.149', '2023-10-01 18:52:22'),
(155, 23, '1.006 New Order #200217.', '45.124.12.149', '2023-10-01 18:52:41'),
(156, 23, '#200217 Order number of has been completed.', '127.0.0.1', '2023-10-01 19:00:02'),
(157, 24, '\r\n    User registered.', '103.137.74.187', '2023-10-01 23:39:28'),
(158, 25, '\r\n    User registered.', '103.181.180.21', '2023-10-02 00:46:29'),
(159, 25, 'Member logged in.', '103.181.180.21', '2023-10-02 00:46:39'),
(160, 6, 'New support ticket created#52', '103.175.17.26', '2023-10-02 01:23:34'),
(161, 6, 'Support request <strong>Automatic</strong> answered as. ID:52', '103.175.17.26', '2023-10-02 01:23:34'),
(162, 6, 'Member logged in.', '103.175.17.26', '2023-10-02 03:10:34'),
(163, 6, 'New support ticket created#53', '103.175.17.26', '2023-10-02 03:14:07'),
(164, 6, 'Support request <strong>Automatic</strong> answered as. ID:53', '103.175.17.26', '2023-10-02 03:14:07'),
(165, 6, 'New support ticket created#54', '103.175.17.26', '2023-10-02 03:26:22'),
(166, 6, 'Support request <strong>Automatic</strong> answered as. ID:54', '103.175.17.26', '2023-10-02 03:26:22'),
(167, 6, 'New support ticket created#55', '103.175.17.26', '2023-10-02 03:27:53'),
(168, 6, 'Support request <strong>Automatic</strong> answered as. ID:55', '103.175.17.26', '2023-10-02 03:27:53'),
(169, 6, 'New support ticket created#56', '103.175.17.26', '2023-10-02 03:30:22'),
(170, 6, 'Support request <strong>Automatic</strong> answered as. ID:56', '103.175.17.26', '2023-10-02 03:30:22'),
(171, 6, 'New support ticket created#57', '103.175.17.26', '2023-10-02 03:45:10'),
(172, 6, 'Support request <strong>Automatic</strong> answered as. ID:57', '103.175.17.26', '2023-10-02 03:45:10'),
(173, 6, 'New support ticket created#58', '103.175.17.26', '2023-10-02 03:47:22'),
(174, 6, 'Support request <strong>Automatic</strong> answered as. ID:58', '103.175.17.26', '2023-10-02 03:47:22'),
(175, 6, 'Member logged in.', '103.175.17.26', '2023-10-02 03:58:53'),
(176, 6, 'Member logged in.', '103.175.17.26', '2023-10-02 03:59:54'),
(177, 21, 'Member logged in.', '103.175.17.26', '2023-10-02 04:00:49'),
(178, 21, 'New support ticket created#59', '103.175.17.26', '2023-10-02 04:01:07'),
(179, 21, 'Support request <strong>Automatic</strong> answered as. ID:59', '103.175.17.26', '2023-10-02 04:01:07'),
(180, 21, 'New support ticket created#60', '103.175.17.26', '2023-10-02 04:03:38'),
(181, 21, 'Support request <strong>Automatic</strong> answered as. ID:60', '103.175.17.26', '2023-10-02 04:03:38'),
(182, 6, 'New support ticket created#61', '103.175.17.26', '2023-10-02 04:04:19'),
(183, 6, 'Support request <strong>Automatic</strong> answered as. ID:61', '103.175.17.26', '2023-10-02 04:04:19'),
(184, 6, 'New support ticket created#62', '103.175.17.26', '2023-10-02 12:10:04'),
(185, 6, 'Support request <strong>Automatic</strong> answered as. ID:62', '103.175.17.26', '2023-10-02 12:10:04'),
(186, 6, 'New support ticket created#63', '103.175.17.26', '2023-10-02 12:10:30'),
(187, 6, 'Support request <strong>Automatic</strong> answered as. ID:63', '103.175.17.26', '2023-10-02 12:10:30'),
(188, 6, 'New support ticket created#64', '103.175.17.26', '2023-10-02 12:10:50'),
(189, 6, 'Support request <strong>Automatic</strong> answered as. ID:64', '103.175.17.26', '2023-10-02 12:10:50'),
(190, 6, 'New support ticket created#65', '103.175.17.26', '2023-10-02 12:12:54'),
(191, 6, 'Support request <strong>Automatic</strong> answered as. ID:65', '103.175.17.26', '2023-10-02 12:12:54'),
(192, 6, 'New support ticket created#66', '103.175.17.26', '2023-10-02 12:13:19'),
(193, 6, 'Support request <strong>Automatic</strong> answered as. ID:66', '103.175.17.26', '2023-10-02 12:13:19'),
(194, 6, 'New support ticket created#67', '103.175.17.26', '2023-10-02 12:13:35'),
(217, 23, '#200221 Order number of has been completed.', '127.0.0.1', '2023-10-03 20:35:02'),
(218, 6, '1.86 New Order #200222.', '103.175.17.25', '2023-10-03 21:52:09'),
(219, 6, '#200222 Order numbered has been canceled and 1.86 refunded Old balance:1.1430 / New balance:3.0030', '127.0.0.1', '2023-10-04 01:25:03'),
(220, 6, 'Member logged in.', '103.175.17.30', '2023-10-04 21:40:25'),
(221, 2, '3.018 New Order #200223.', '103.134.241.160', '2023-10-05 14:00:17'),
(222, 6, 'Member logged in.', '103.175.17.24', '2023-10-15 14:57:22'),
(223, 6, 'Member logged in.', '103.175.17.24', '2023-10-15 15:10:49'),
(224, 6, 'Member logged in.', '103.175.17.24', '2023-10-15 15:41:06'),
(225, 26, '\r\n    User registered.', '103.155.53.209', '2023-10-15 15:50:37'),
(226, 27, 'Member logged in.', '103.134.241.160', '2023-10-17 16:15:32'),
(227, 28, '\r\n    User registered.', '2409:40d2:5a:85da:c0e4:1a3d:6082:8e38', '2023-11-10 10:24:44'),
(228, 28, 'Member logged in.', '2409:40d2:5a:85da:c0e4:1a3d:6082:8e38', '2023-11-10 10:38:24'),
(229, 29, '\r\n    User registered.', '2409:40d2:5a:85da:3856:12:72eb:c37e', '2023-11-10 11:28:41'),
(230, 27, 'Member logged in.', '103.134.241.160', '2023-11-10 14:42:28'),
(231, 27, 'Member logged in.', '103.67.157.112', '2023-11-10 14:43:35'),
(232, 30, '\r\n    User registered.', '102.78.89.100', '2023-11-10 15:06:23'),
(233, 30, 'Member logged in.', '102.78.89.100', '2023-11-10 15:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(100) NOT NULL,
  `currency_name` varchar(50) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `symbol_position` varchar(10) DEFAULT 'left',
  `currency_rate` double NOT NULL,
  `currency_inverse_rate` double NOT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 0,
  `currency_hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_code`, `currency_symbol`, `symbol_position`, `currency_rate`, `currency_inverse_rate`, `is_enable`, `currency_hash`) VALUES
(1, 'Indian Rupee', 'INR', '₹', 'left', 83.099451896888, 0.012033773715389, 1, 'fb62a4f7c4747614699e835de53e6a479f64d07f'),
(2, 'U.S. Dollar', 'USD', '$', 'left', 1, 83.086314443677, 1, '53cd2b56cdafa88052802f5edf4c817fef84aee4'),
(21, 'Bangladeshi taka', 'BDT', '৳', 'left', 1.3841, 0, 1, '2a0512a173e853406739f3b6fab4ce25a3de91a7'),
(22, 'Euro', 'EUR', '€', 'left', 0.9453415159799, 1.0578187703556, 1, 'e719d1035e57b82b93a5b912f3ad12f6f0c1b1a1'),
(23, 'Brazilian Real', 'BRL', 'R$', 'left', 5.035808723284, 0.19857783624233, 1, 'ff681dac6d9076495b5660c7de3e9d15f882ede0'),
(24, 'Australian Dollar', 'AUD', '$', 'left', 1.550480061716, 0.64496153461867, 1, '37ba98c1feb2ed451876028ceefe96ed062ca40e'),
(25, 'Armenia Dram', 'AMD', '֏', 'left', 385.78135055014, 0.0025921418922246, 1, 'e8116000af75bf9760f7c98a689da37d660c2eb8'),
(26, 'Azerbaijan Manat', 'AZN', '₼', 'left', 1.6979036564132, 0.5889615681213, 1, 'f93e8bd3c9380e8a2d7ae02d35d4b6880c881e86'),
(27, 'Chinese Yuan', 'CNY', '¥', 'left', 7.2990094100369, 0.13700489255773, 1, 'a7890a642622f8d971fdd4739e4bffae60aa46e8'),
(28, 'Pakistani Rupee', 'PKR', '₨', 'left', 294.03656606494, 0.0034009375547501, 1, 'aa8c740b2624edc382a438ccfebcdf2cd0ec86bf'),
(29, 'New Zealand Dollar', 'NZD', '$', 'left', 1.6680003846283, 0.59952024544817, 1, '8d6a06ba54c08b5d5bc409abdafb3876249c268b'),
(30, 'Vietnamese Dong', 'VND', '₫', 'left', 24326.503555108, 0.000041107428271994, 1, '7ed26977fa3d1c72edc49d1e81074a029ae99533');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `symbol` text DEFAULT NULL,
  `value` double DEFAULT NULL,
  `name` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `default` enum('2','1') NOT NULL DEFAULT '2',
  `nouse` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `symbol`, `value`, `name`, `status`, `default`, `nouse`) VALUES
(1, '$', 1, 'USD', '1', '1', '1'),
(7, '฿', 36.33, 'Baht', '1', '2', '2'),
(8, '₹', 79, 'INR', '1', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `custom_settings`
--

CREATE TABLE `custom_settings` (
  `id` int(11) NOT NULL,
  `snow_data` text NOT NULL,
  `snow_data_array` text NOT NULL,
  `snow_status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 - inactive , 2 - active',
  `start_count_parser` text NOT NULL,
  `orders_count_increase` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_settings`
--

INSERT INTO `custom_settings` (`id`, `snow_data`, `snow_data_array`, `snow_status`, `start_count_parser`, `orders_count_increase`) VALUES
(1, '\"snow\":{\"init\":false,\"options\":{\"particles\":{\"move\":{\"speed\":,\"bounce\":false,\"enable\":true,\"random\":false,\"attract\":{\"enable\":false,\"rotateX\":600,\"rotateY\":1200},\"out_mode\":\"out\",\"straight\":false,\"direction\":\"bottom\"},\"size\":{\"anim\":{\"sync\":false,\"speed\":40,\"enable\":false,\"size_min\":0.1},\"value\":10,\"random\":true},\"color\":{\"value\":\"#fff\"},\"number\":{\"value\":,\"density\":{\"enable\":true,\"value_area\":650}},\"opacity\":{\"anim\":{\"sync\":false,\"speed\":1,\"enable\":true,\"opacity_min\":0.9},\"value\":0.9,\"random\":true},\"line_linked\":{\"color\":\"#ffffff\",\"width\":1,\"enable\":false,\"opacity\":0.8,\"distance\":500}},\"interactivity\":{\"modes\":{\"bubble\":{\"size\":4,\"speed\":3,\"opacity\":1,\"distance\":400,\"duration\":0.3},\"repulse\":{\"speed\":3,\"distance\":200,\"duration\":0.4}},\"events\":{\"resize\":true,\"onclick\":{\"mode\":\"repulse\",\"enable\":true},\"onhover\":{\"mode\":\"bubble\",\"enable\":false}},\"detect_on\":\"window\"},\"retina_detect\":true}},\"toys\":{\"init\":false,\"options\":{\"count\":100,\"speed\":1,\"images\":[],\"maxSize\":30,\"launches\":\"1\"}},\"garland\":{\"init\":false,\"options\":{\"type\":\"\",\"style\":\"\"}},\"fireworks\":{\"init\":false,\"options\":{\"delay\":{\"max\":30,\"min\":30},\"friction\":,\"launches\":1,}}', '{\"snow_fall\":\"true\",\"snowflakes\":\"20\",\"snow_speed\":\"3\",\"garlands\":\"true\",\"gar_shape\":\"apple\",\"gar_style\":\"style1\",\"fire_works\":\"true\",\"fire_size\":\"0.95\",\"fire_speed\":\"slow\",\"toy_size\":\"80\",\"toy_quantity\":\"100\",\"toy_speed\":\"6\",\"toy_launch\":\"infinite\"}', '1', '{\"none\":\"Catch from supplier\",\"instagram_follower\":\"Instagram followers\",\"instagram_photo\":\"Instagram likes\",\"instagram_comments\":\"Instagram comments\",\"youtube_views\":\"Youtube views\",\"youtube_likes\":\"Youtube likes\",\"youtube_comments\":\"Youtube comments\",\"youtube_subscribers\":\"Youtube subscribers\"}', '0:0'),
(1, '\"snow\":{\"init\":false,\"options\":{\"particles\":{\"move\":{\"speed\":,\"bounce\":false,\"enable\":true,\"random\":false,\"attract\":{\"enable\":false,\"rotateX\":600,\"rotateY\":1200},\"out_mode\":\"out\",\"straight\":false,\"direction\":\"bottom\"},\"size\":{\"anim\":{\"sync\":false,\"speed\":40,\"enable\":false,\"size_min\":0.1},\"value\":10,\"random\":true},\"color\":{\"value\":\"#fff\"},\"number\":{\"value\":,\"density\":{\"enable\":true,\"value_area\":650}},\"opacity\":{\"anim\":{\"sync\":false,\"speed\":1,\"enable\":true,\"opacity_min\":0.9},\"value\":0.9,\"random\":true},\"line_linked\":{\"color\":\"#ffffff\",\"width\":1,\"enable\":false,\"opacity\":0.8,\"distance\":500}},\"interactivity\":{\"modes\":{\"bubble\":{\"size\":4,\"speed\":3,\"opacity\":1,\"distance\":400,\"duration\":0.3},\"repulse\":{\"speed\":3,\"distance\":200,\"duration\":0.4}},\"events\":{\"resize\":true,\"onclick\":{\"mode\":\"repulse\",\"enable\":true},\"onhover\":{\"mode\":\"bubble\",\"enable\":false}},\"detect_on\":\"window\"},\"retina_detect\":true}},\"toys\":{\"init\":false,\"options\":{\"count\":100,\"speed\":1,\"images\":[],\"maxSize\":30,\"launches\":\"1\"}},\"garland\":{\"init\":false,\"options\":{\"type\":\"\",\"style\":\"\"}},\"fireworks\":{\"init\":false,\"options\":{\"delay\":{\"max\":30,\"min\":30},\"friction\":,\"launches\":1,}}', '{\"snow_fall\":\"true\",\"snowflakes\":\"20\",\"snow_speed\":\"3\",\"garlands\":\"true\",\"gar_shape\":\"apple\",\"gar_style\":\"style1\",\"fire_works\":\"true\",\"fire_size\":\"0.95\",\"fire_speed\":\"slow\",\"toy_size\":\"80\",\"toy_quantity\":\"100\",\"toy_speed\":\"6\",\"toy_launch\":\"infinite\"}', '1', '{\"none\":\"Catch from supplier\",\"instagram_follower\":\"Instagram followers\",\"instagram_photo\":\"Instagram likes\",\"instagram_comments\":\"Instagram comments\",\"youtube_views\":\"Youtube views\",\"youtube_likes\":\"Youtube likes\",\"youtube_comments\":\"Youtube comments\",\"youtube_subscribers\":\"Youtube subscribers\"}', '0:0');

-- --------------------------------------------------------

--
-- Table structure for table `decoration`
--

CREATE TABLE `decoration` (
  `id` int(11) NOT NULL,
  `snow_effect` int(3) NOT NULL,
  `snow_colour` text NOT NULL,
  `diwali_lights` int(3) NOT NULL,
  `video_link` text NOT NULL,
  `christmas_deco` varchar(5000) NOT NULL,
  `action_link` text NOT NULL,
  `pop_noti` int(2) NOT NULL,
  `pop_title` text NOT NULL,
  `pop_desc` text NOT NULL,
  `action_text` varchar(10) NOT NULL,
  `action_button` int(2) NOT NULL,
  `snow_fall` varchar(500) DEFAULT NULL,
  `garlands` text DEFAULT NULL,
  `fire_works` text DEFAULT NULL,
  `toys` text DEFAULT NULL,
  `snowflakes` int(10) NOT NULL,
  `snow_speed` int(20) NOT NULL,
  `gar_shape` text NOT NULL,
  `gar_style` text NOT NULL,
  `fire_size` varchar(100) NOT NULL,
  `fire_speed` text NOT NULL,
  `toy_size` int(20) NOT NULL,
  `toy_quantity` int(50) NOT NULL,
  `toy_speed` int(10) NOT NULL,
  `toy_launch` varchar(100) NOT NULL,
  `toy_a` varchar(50) NOT NULL,
  `toy_b` varchar(50) NOT NULL,
  `toy_c` varchar(50) NOT NULL,
  `toy_d` varchar(50) NOT NULL,
  `toy_e` varchar(50) NOT NULL,
  `toy_f` varchar(50) NOT NULL,
  `toy_g` varchar(50) NOT NULL,
  `toy_h` varchar(50) NOT NULL,
  `toy_i` varchar(50) NOT NULL,
  `toy_j` varchar(50) NOT NULL,
  `toy_k` varchar(50) NOT NULL,
  `psw_license` text NOT NULL,
  `toy_l` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `decoration`
--

INSERT INTO `decoration` (`id`, `snow_effect`, `snow_colour`, `diwali_lights`, `video_link`, `christmas_deco`, `action_link`, `pop_noti`, `pop_title`, `pop_desc`, `action_text`, `action_button`, `snow_fall`, `garlands`, `fire_works`, `toys`, `snowflakes`, `snow_speed`, `gar_shape`, `gar_style`, `fire_size`, `fire_speed`, `toy_size`, `toy_quantity`, `toy_speed`, `toy_launch`, `toy_a`, `toy_b`, `toy_c`, `toy_d`, `toy_e`, `toy_f`, `toy_g`, `toy_h`, `toy_i`, `toy_j`, `toy_k`, `psw_license`, `toy_l`) VALUES
(1, 0, '#ffffff', 0, '', '\n<style>.particle-snow{position:fixed;top:0;left:0;width:100%;height:100%;z-index:1;pointer-events:none}.particle-snow canvas{position:fixed;top:0;left:0;width:100%;height:100%;pointer-events:none}.christmas-garland{text-align:center;white-space:nowrap;overflow:hidden;position:absolute;z-index:1;padding:0;pointer-events:none;width:100%;height:85px}.christmas-garland .christmas-garland__item{position:relative;width:28px;height:28px;border-radius:50%;display:inline-block;margin-left:20px}.christmas-garland .christmas-garland__item .shape{-webkit-animation-fill-mode:both;animation-fill-mode:both;-webkit-animation-iteration-count:infinite;animation-iteration-count:infinite;-webkit-animation-name:flash-1;animation-name:flash-1;-webkit-animation-duration:2s;animation-duration:2s}.christmas-garland .christmas-garland__item .apple{width:22px;height:22px;border-radius:50%;margin-left:auto;margin-right:auto;margin-top:8px}.christmas-garland .christmas-garland__item .pear{width:12px;height:28px;border-radius:50%;margin-left:auto;margin-right:auto;margin-top:6px}.christmas-garland .christmas-garland__item:nth-child(2n+1) .shape{-webkit-animation-name:flash-2;animation-name:flash-2;-webkit-animation-duration:.4s;animation-duration:.4s}.christmas-garland .christmas-garland__item:nth-child(4n+2) .shape{-webkit-animation-name:flash-3;animation-name:flash-3;-webkit-animation-duration:1.1s;animation-duration:1.1s}.christmas-garland .christmas-garland__item:nth-child(odd) .shape{-webkit-animation-duration:1.8s;animation-duration:1.8s}.christmas-garland .christmas-garland__item:nth-child(3n+1) .shape{-webkit-animation-duration:1.4s;animation-duration:1.4s}.christmas-garland .christmas-garland__item:before{content:\"\";position:absolute;background:#222;width:10px;height:10px;border-radius:3px;top:-1px;left:9px}.christmas-garland .christmas-garland__item:after{content:\"\";top:-9px;left:14px;position:absolute;width:52px;height:18px;border-bottom:solid #222 2px;border-radius:50%}.christmas-garland .christmas-garland__item:last-child:after{content:none}.christmas-garland .christmas-garland__item:first-child{margin-left:-40px}</style>\n<!-- developed by Raj Patel-->\n      \n<!-- developed by Raj Patel-->  \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/libs/jquery/1.12.4/jquery.min.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/flpbonhmkq9tsp29.js\">\n          </script>\n    \n        \n<!-- developed by Raj Patel-->\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/a4kdpfesx15uh7ae.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/596z6ya3isgxcipy.js\">\n          </script>\n    \n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/39j8e9yrxs283d1x.js\">\n          </script>\n    \n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/33srijdbqcgk6lsz.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/52pp7z/wxbh27w4jdzpslxn.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/52pp7z/angedasgma230hxr.js\">\n          </script>\n    \n        \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n    <script type=\"text/javascript\" >\n       window.modules.layouts = {\"theme_id\":1,\"auth\":0,\"live\":true};     </script>\n    \n        \n    <script type=\"text/javascript\" >\n       window.modules.signin = [];     </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" >\n       document.addEventListener(\'DOMContentLoaded\', function() { \nvar newYearEvent = new window.NewYearEvent({\"snow\":{\"init\":true,\"options\":{\"particles\":{\"move\":{\"speed\":3,\"bounce\":false,\"enable\":true,\"random\":false,\"attract\":{\"enable\":false,\"rotateX\":600,\"rotateY\":1200},\"out_mode\":\"out\",\"straight\":false,\"direction\":\"bottom\"},\"size\":{\"anim\":{\"sync\":false,\"speed\":40,\"enable\":false,\"size_min\":0.1},\"value\":5,\"random\":true},\"color\":{\"value\":\"#fff\"},\"number\":{\"value\":100,\"density\":{\"enable\":true,\"value_area\":650}},\"opacity\":{\"anim\":{\"sync\":false,\"speed\":1,\"enable\":true,\"opacity_min\":0.9},\"value\":0.9,\"random\":true},\"line_linked\":{\"color\":\"#ffffff\",\"width\":1,\"enable\":false,\"opacity\":0.8,\"distance\":500}},\"interactivity\":{\"modes\":{\"bubble\":{\"size\":4,\"speed\":3,\"opacity\":1,\"distance\":400,\"duration\":0.3},\"repulse\":{\"speed\":3,\"distance\":200,\"duration\":0.4}},\"events\":{\"resize\":true,\"onclick\":{\"mode\":\"repulse\",\"enable\":true},\"onhover\":{\"mode\":\"bubble\",\"enable\":false}},\"detect_on\":\"window\"},\"retina_detect\":true}},\"toys\"', '', 0, '', '', '', 0, NULL, NULL, NULL, NULL, 50, 10, 'pear', 'style3', '0.95', 'medium', 80, 100, 6, 'infinite', '1', '1', '', '', '', '', '', '', '', '1', '1', 'dukesmm.com', '1');

-- --------------------------------------------------------

--
-- Table structure for table `earn`
--

CREATE TABLE `earn` (
  `earn_id` int(255) NOT NULL,
  `client_id` int(255) NOT NULL,
  `link` text NOT NULL,
  `earn_note` text NOT NULL,
  `status` enum('Pending','Under Review','Funds Granted','Rejected','Not Eligible') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `link`, `date`) VALUES
(150, NULL, 'https://silver.smmpanelbdlab.com/img/files/1894b156c527f025eebfdf173be63ed3.png', '2023-10-16 20:18:31'),
(151, NULL, 'https://silver.smmpanelbdlab.com/img/files/819b42118321f4328e22d48927f92f17.png', '2023-10-17 16:12:48'),
(152, NULL, 'https://dharmendragautam.in/img/files/531c33a89ca9a8072f86fc7e2b770054.png', '2023-11-10 11:33:14');

-- --------------------------------------------------------

--
-- Table structure for table `General_options`
--

CREATE TABLE `General_options` (
  `id` int(11) NOT NULL,
  `coupon_status` enum('1','2') NOT NULL DEFAULT '1',
  `updates_show` enum('1','2') NOT NULL DEFAULT '1',
  `panel_status` enum('Pending','Active','Frozen','Suspended') NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `massorder` enum('1','2') NOT NULL DEFAULT '2',
  `balance_format` enum('0.0','0.00','0.000','0.0000') NOT NULL DEFAULT '0.0',
  `currency_format` enum('0','2','3','4') NOT NULL DEFAULT '3',
  `ticket_system` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `General_options`
--

INSERT INTO `General_options` (`id`, `coupon_status`, `updates_show`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `massorder`, `balance_format`, `currency_format`, `ticket_system`) VALUES
(1, '', '2', 'Active', 1024, 20, '2', '', '', '2');

-- --------------------------------------------------------

--
-- Table structure for table `integrations`
--

CREATE TABLE `integrations` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `icon_url` varchar(225) NOT NULL,
  `code` text NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `integrations`
--

INSERT INTO `integrations` (`id`, `name`, `description`, `icon_url`, `code`, `visibility`, `status`) VALUES
(1, 'Beamer', 'Announce updates and get feedback with in-app notification center, widgets and changelog', '/img/integrations/Beamer.svg', 'HELLO', 1, 1),
(2, 'Getsitecontrol', 'It helps you prevent website visitors from leaving your website without taking any action.', '/img/integrations/Getsitecontrol.svg', '', 1, 1),
(3, 'Google Analytics', 'Statistics and basic analytical tools for search engine optimization (SEO) and marketing purposes', '/img/integrations/Google%20Analytics.svg', '', 1, 1),
(4, 'Google Tag manager', 'Manage all your website tags without editing the code using simple tag management solutions', '/img/integrations/Google%20Tag%20manager.svg', '', 1, 1),
(5, 'JivoChat', 'All-in-one business messenger to talk to customers: live chat, phone, email and social', '/img/integrations/JivoChat.svg', '', 1, 1),
(6, 'Onesignal', 'Leader in customer engagement, empowers mobile push, web push, email, in-app messages', '/img/integrations/Onesignal.svg', '', 1, 1),
(7, 'Push alert', 'Increase reach, revenue, retarget users with Push Notifications on desktop and mobile', '/img/integrations/Push%20alert.svg', '<!-- CODE START --> \r\n<!-- WhatsApp Chat Plugin Code by : VCreato Team. --->\r\n<style>.integration-fixed{position:fixed;z-index:10000000}.integration-fixed__top-left{top:0;left:0}.integration-fixed__top-right{top:0;right:0}.integration-fixed__bottom-left{bottom:0;left:0}.integration-fixed__bottom-right{bottom:0;right:0}\r\n.whatsapp-container{padding:24px}.whatsapp-button{width:60px;height:60px;bottom:40px;right:40px;background-color:#25d366;color:#FFF!important;border-radius:50px;text-align:center;font-size:30px;box-shadow:2px 2px 3px #999;display:flex;align-items:center;justify-content:center;text-decoration:none!important;-webkit-transition:all 0.3s ease;-moz-transition:all 0.3s ease;-o-transition:all 0.3s ease;-ms-transition:all 0.3s ease;transition:all 0.3s ease;transform:scale(0.9)}.whatsapp-button:hover{transform:scale(1);background-color:#1fcc5f}\r\n</style>\r\n\r\n<div class=\"integration-fixed integration-fixed__bottom-right\">\r\n    <div class=\"whatsapp-container\">\r\n        <a href=\"https://wa.me/+8801793242627\" target=\"_blank\" class=\"whatsapp-button\">\r\n            <i class=\"fab fa-whatsapp\"></i>\r\n        </a>\r\n    </div>\r\n</div>\r\n<!-- CODE END -->', 1, 1),
(8, 'Smartsupp', 'Live chat, email inbox and Facebook Messenger in one customer messaging platform', '/img/integrations/Smartsupp.svg', '', 1, 1),
(9, 'Tawk.to', 'Track and chat with visitors on your website, mobile app or a free customizable page', '/img/integrations/Tawk.to.svg', '', 1, 1),
(10, 'Tidio', 'Communicator for businesses that keep live chat, chatbots, Messenger and email in one place', '/img/integrations/Tidio.svg', '', 1, 1),
(11, 'Zendesk Chat', 'Helps respond quickly to customer questions, reduce wait times and increase sales', '/img/integrations/Zendesk%20Chat.svg', '', 1, 1),
(12, 'Getbutton.io', 'Chat with website visitors through popular messaging apps. Whatsapp, messenger etc. contact button.', '/img/integrations/Getbutton.svg', '<script type=\"text/javascript\" src=\"https://ebot24.com/js/2waychat/plugin-169174345879.js\"></script><div style=\"z-index:9999999\"><div class=\"fb-customerchat\" page_id=\"103922508803437\" ref=\"jongtasmm\" greeting_dialog_display=\"show\" theme_color=\"#FFFFFF\"></div></div>', 1, 1),
(13, 'Google reCAPTCHA v2', 'It uses an advanced risk analysis engine and adaptive challenges to prevent malware from engaging in abusive activities on your website.', '/img/integrations/reCAPTCHA.svg', '', 1, 1),
(14, 'Whatsapp', 'Whatsapp is for Personal Support of your Users', '/img/integrations/whatsapp.svg', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'English', 'en', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Mailforms`
--

CREATE TABLE `Mailforms` (
  `id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `message` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `header` varchar(225) NOT NULL,
  `footer` varchar(225) NOT NULL,
  `type` enum('Admins','Users') NOT NULL DEFAULT 'Users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `menu_line` double NOT NULL,
  `type` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2',
  `slug` varchar(225) NOT NULL DEFAULT '2',
  `icon` varchar(225) DEFAULT NULL,
  `menu_status` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `visible` enum('Internal','External') NOT NULL DEFAULT 'Internal',
  `active` varchar(225) NOT NULL,
  `tiptext` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `menu_line`, `type`, `slug`, `icon`, `menu_status`, `visible`, `active`, `tiptext`) VALUES
(37, 'SMM Panel BD Lab', 1, '2', 'https://wa.me/880192888410', 'fa fa-youtube', '1', 'Internal', 'https:wa.me8801928884100', ''),
(39, 'Order', 2, '2', '/facebook', 'fa fa-facebook', '1', 'Internal', 'test', ''),
(40, 'Twitter', 3, '2', '/twitter', 'fa fa-twitter', '1', 'Internal', 'twitter', '');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news_icon` varchar(225) NOT NULL,
  `news_title` varchar(225) NOT NULL,
  `news_content` varchar(225) NOT NULL,
  `news_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `news_icon`, `news_title`, `news_content`, `news_date`) VALUES
(6, 'facebook', 'Hello Facebook', 'Hello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello FacebookHello Facebook', '2023-08-18 19:02:07'),
(7, 'instagram', 'Hello Instagram', 'Hello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello InstagramHello Instagram', '2023-08-19 09:02:18'),
(8, 'tiktok', 'Hello TikTok', 'Hello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello TikTokHello Tik', '2023-08-19 09:02:48'),
(9, 'telegram', 'Hello Telegram', 'Hello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello TelegramHello Telegram', '2023-08-19 09:04:44'),
(10, 'youtube', 'Hello Youtube', 'Hello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello YoutubeHello Youtube', '2023-08-19 09:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_popup`
--

CREATE TABLE `notifications_popup` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` text DEFAULT NULL,
  `action_link` text DEFAULT NULL,
  `isAllUser` enum('1','0') NOT NULL DEFAULT '0',
  `expiry_date` date NOT NULL,
  `status` enum('1','2','0') NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `action_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `notifications_popup`
--

INSERT INTO `notifications_popup` (`id`, `title`, `type`, `action_link`, `isAllUser`, `expiry_date`, `status`, `description`, `action_text`) VALUES
(36, 'hi', 'info', '', '0', '2023-11-25', '1', '<p>hi</p>', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text DEFAULT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double NOT NULL DEFAULT 0,
  `api_currencycharge` double DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site',
  `refill_status` enum('Pending','Refilling','Completed','Rejected','Error') NOT NULL DEFAULT 'Pending',
  `is_refill` enum('1','2') NOT NULL DEFAULT '1',
  `refill` varchar(225) NOT NULL DEFAULT '1',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'true',
  `api_refillid` double NOT NULL DEFAULT 0,
  `avg_done` enum('0','1') NOT NULL DEFAULT '1',
  `order_increase` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL,
  `page_status` enum('1','2') NOT NULL DEFAULT '1',
  `active` enum('1','2') NOT NULL DEFAULT '1',
  `seo_title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_keywords` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_modified` datetime NOT NULL,
  `del` varchar(255) NOT NULL DEFAULT '1',
  `page_content2` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`, `page_status`, `active`, `seo_title`, `seo_keywords`, `seo_description`, `last_modified`, `del`, `page_content2`) VALUES
(2, 'Add funds', 'addfunds', '', '1', '1', '', '', '', '2023-10-10 05:39:45', '2', '<h3><br></h3>'),
(787, 'Login', 'auth', '<p>Hello<br></p>', '1', '1', 'SMM Panel BD Lab', '', '', '2023-10-10 05:39:15', '2', '<p>boys<br></p>'),
(9, 'New Order', 'neworder', '', '1', '1', '', '', '', '2023-08-20 04:02:25', '2', ''),
(14, 'Terms', 'terms', '', '1', '1', '', '', '', '2022-02-07 08:41:16', '2', ''),
(789, 'Mass Order', 'massorder', '', '1', '1', '', '', '', '2023-08-20 04:02:02', '2', ''),
(790, 'Orders', 'orders', '', '1', '1', '', '', '', '2022-02-07 08:53:20', '2', ''),
(791, 'Services', 'services', '', '1', '1', '', '', '', '2022-01-26 07:22:09', '2', ''),
(792, 'Tickets', 'tickets', '', '1', '1', '', '', '', '2023-10-01 12:53:23', '2', ''),
(793, 'API', 'api', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', ''),
(794, 'Signup', 'signup', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', ''),
(795, 'Blog', 'blog', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', '');

-- --------------------------------------------------------

--
-- Table structure for table `panel_categories`
--

CREATE TABLE `panel_categories` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1 -> ENABLE, 0 -> DISABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_info`
--

CREATE TABLE `panel_info` (
  `panel_id` int(11) NOT NULL,
  `panel_domain` text NOT NULL,
  `panel_plan` text NOT NULL,
  `panel_status` enum('Pending','Active','Frozen','Suspended') NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `renewal_date` datetime NOT NULL,
  `panel_type` enum('Child','Main') NOT NULL DEFAULT 'Main'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `panel_info`
--

INSERT INTO `panel_info` (`panel_id`, `panel_domain`, `panel_plan`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `date_created`, `api_key`, `renewal_date`, `panel_type`) VALUES
(1, 'thundersmm.xyz', 'A', 'Active', 1449, 1449, '2022-01-24 10:58:08', 'b1fbedd6f1266a8990bf648919068680', '2025-02-23 10:58:08', 'Main');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_amount` decimal(15,4) NOT NULL,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` varchar(255) NOT NULL DEFAULT 'No',
  `payment_mode` enum('Manuel','Otomatik','Auto') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL,
  `payment_update_date` datetime NOT NULL,
  `payment_ip` varchar(225) NOT NULL,
  `payment_extra` text NOT NULL,
  `payment_bank` int(11) NOT NULL,
  `t_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `client_id`, `client_balance`, `payment_amount`, `payment_privatecode`, `payment_method`, `payment_status`, `payment_delivery`, `payment_note`, `payment_mode`, `payment_create_date`, `payment_update_date`, `payment_ip`, `payment_extra`, `payment_bank`, `t_id`) VALUES
(113, 205, 0.00, 1000.0000, 0, 31, '1', '1', 'No', 'Auto', '2023-08-19 08:01:57', '0000-00-00 00:00:00', '103.172.252.205', '1692412317', 0, ''),
(114, 203, 0.00, 50.0000, 0, 31, '1', '1', 'No', 'Auto', '2023-08-19 09:09:23', '0000-00-00 00:00:00', '152.58.190.31', '1692416363', 0, ''),
(115, 203, 0.00, 50.0000, 0, 1, '3', '2', 'No', 'Manuel', '2023-08-19 19:20:20', '2023-08-19 19:20:20', '152.58.190.28', ' sad', 0, ''),
(116, 2, 0.00, 99999.0000, 0, 1, '3', '2', 'No', 'Manuel', '2023-09-15 11:59:16', '2023-09-15 11:59:16', '103.155.53.211', ' sad', 0, NULL),
(117, 2, 99999.00, 15.0000, 0, 1, '3', '2', 'No', 'Manuel', '2023-09-15 12:33:35', '2023-09-15 12:33:35', '45.124.15.251', ' sad', 0, NULL),
(118, 2, 15.00, 5.0000, 0, 1, '3', '2', 'No', 'Manuel', '2023-09-15 12:36:59', '2023-09-15 12:36:59', '45.124.15.251', ' sad', 0, NULL),
(119, 7, 0.00, 5.0000, 0, 11, '3', '2', 'No', 'Manuel', '2023-09-18 21:07:02', '2023-09-18 21:07:02', '103.175.17.24', ' sad', 0, NULL),
(120, 7, 5.00, 5.4500, 0, 11, '3', '2', 'No', 'Manuel', '2023-09-18 21:08:31', '2023-09-18 21:08:31', '103.175.17.24', ' sad', 0, NULL),
(121, 7, 10.45, 5.0000, 0, 11, '3', '2', 'No', 'Manuel', '2023-09-18 21:09:19', '2023-09-18 21:09:19', '103.175.17.24', ' sad', 0, NULL),
(122, 7, 15.45, 10.0000, 0, 1, '3', '2', 'No', 'Manuel', '2023-09-18 21:10:07', '2023-09-18 21:10:07', '103.175.17.24', ' sad', 0, NULL),
(123, 7, 25.45, -20.0000, 0, 1, '3', '2', 'No', 'Manuel', '2023-09-18 21:11:00', '2023-09-18 21:11:00', '103.175.17.26', ' sad', 0, NULL),
(124, 6, 0.00, 5.0000, 0, 2, '3', '2', 'No', 'Manuel', '2023-09-22 14:56:45', '2023-09-22 14:56:45', '103.175.17.26', ' sad', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL,
  `nouse` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`, `nouse`) VALUES
(1, 'Paypal', 'paypal', 10, 10000, '2', '{\"method_type\":\"1\",\"name\":\"Paypal ( USD ) ( International Payments ) [ 10% Charge ]\",\"min\":\"10\",\"max\":\"10000\",\"client_id\":\"AR3wtI3dxA0qU2dme-kQdC6csRL4whF8SNWzJ2jilchyZvQsBJ7URF4UqktveDp67guIenYYX-e0zuCz\",\"client_secret\":\"EMFtatHjrBMf9EYcec0WZqKwGwO2aum03w62b9tZZWPB2G__WoFuBMkMu0z97NR8ooRJNXR0FqrtagrD\",\"fee\":\"0\"}', 8, '2'),
(2, 'Stripe', 'stripe', 1, 100, '2', '{\"method_type\":\"2\",\"name\":\"Credit card\\/ Debit cards \\/Meeza cards\\/Mobile Wallets (5%BONUS FROM 10$)(Ramdan Offer)\",\"min\":\"1\",\"max\":\"100\",\"stripe_publishable_key\":\"pk_live_51HiUnRLjkQAtcIW0F983imoO8qhftSSMSj7oB9xTjGHB51su6vnuDmGNs5l2NNZz1XE1Ogf1svxqjtdasRYr3atk00wEAHHKNT\",\"stripe_secret_key\":\"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\",\"stripe_webhooks_secret\":\"whsec_gSvhMz0eOIOTk5S9uzzzDgpHeclOmiDe\",\"fee\":\"10\",\"currency\":\"USD\"}', 5, '2'),
(3, 'Shopier', 'shopier', 5, 0, '2', '{\"method_type\":\"1\",\"name\":\"Kredi \\/ Banka Kart\\u0131 ile \\u00d6de\",\"min\":\"5\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"website_index\":\"1\",\"processing_fee\":\"1\",\"fee\":\"10\",\"currency\":\"USD\"}', 12, '2'),
(5, 'Paywant', 'paywant', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"Paywant\",\"min\":\"1\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"fee\":\"0\",\"currency\":\"USD\",\"commissionType\":\"2\",\"payment_type\":[\"1\",\"2\",\"3\"]}', 13, '2'),
(7, 'PayTR', 'paytr', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"Paytr\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 14, '2'),
(8, 'Coinpayments', 'coinpayments', 10, 0, '2', '{\"method_type\":\"2\",\"name\":\"CoinPayments ( Cryptocurrency )\",\"min\":\"10\",\"max\":\"0\",\"coinpayments_public_key\":\"5a6f3154ddf28c2017df7ad00ce5c1f2b872822beb1ed32f52e0009a2425ecfd\",\"coinpayments_private_key\":\"da16CB5D8Ce6d90eD7181b5907F2103739ef0D5dbF591Ddf22d8f93649170E2F\",\"coinpayments_currency\":\"BTC\",\"merchant_id\":\"db74662404abc41263c87ed221718ce3\",\"ipn_secret\":\"5566\",\"fee\":\"0\",\"currency\":\"USD\"}', 26, '2'),
(9, '2checkout', '2checkout', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"2checkout\",\"min\":\"1\",\"max\":\"0\",\"seller_id\":\"\",\"private_key\":\"\",\"fee\":\"1\",\"currency\":\"USD\"}', 4, '2'),
(10, 'Payoneer', 'payoneer', 0, 0, '2', '{\"method_type\":\"2\",\"name\":\"Payoneer\",\"email\":\"aibrain24@gmail.com\"}', 2, '2'),
(11, 'Mollie', 'mollie', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"Mollie\",\"min\":\"1\",\"max\":\"0\",\"live_api_key\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 15, '2'),
(12, 'PayTM', 'paytm', 1, 100000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM ( INR )( UPI \\/ NET BANKING \\/ DEBIT \\/ CREDIT CARD)\",\"min\":\"1\",\"max\":\"100000\",\"merchant_key\":\"jDCzC20@UXWt9vkG\",\"merchant_mid\":\"jKsJRS16218831858725\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"INR\"}', 9, '2'),
(13, 'Instamojo', 'instamojo', 0, 0, '2', '{\"method_type\":\"2\",\"name\":\"Instamojo\",\"min\":\"0\",\"max\":\"0\",\"api_key\":\"a2bdf5035c16ad6db389caeb5ceb5273\",\"live_auth_token_key\":\"81ef2affdc5ecfde9b88b13e1cd67cd8\",\"fee\":\"0\",\"currency\":\"INR\"}', 16, '2'),
(14, 'Paytm Business', 'paytmqr', 1, 1000000, '2', '{\"method_type\":\"2\",\"name\":\"PAYTM BUSINESS QR\",\"min\":\"1\",\"max\":\"1000000\",\"merchant_key\":\"https:\\/\\/cdn.panelsupply.in\\/public\\/uploads\\/1c42588c87e16a3cffc8838d8d2fccbc.jpg\",\"merchant_mid\":\"\",\"merchant_website\":\"DEFAULT\",\"fee\":\"5\"}', 10, '2'),
(15, 'Razorpay', 'razorpay', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"Razorpay\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"INR\"}', 17, '2'),
(16, 'Iyzico', 'iyzico', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"Iyzico\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 18, '2'),
(17, 'Authorize.net', 'authorize-net', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"Authorize.net\",\"min\":\"1\",\"max\":\"0\",\"api_login_id\":\"0\",\"secret_transaction_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 19, '2'),
(20, 'Ravepay', 'ravepay', 1, 10, '2', '{\"method_type\":\"2\",\"name\":\"Ravepay\",\"min\":\"1\",\"max\":\"10\",\"public_api_key\":\"0\",\"secret_api_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 20, '2'),
(21, 'Pagseguro', 'pagseguro', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"Pagseguro\",\"min\":\"1\",\"max\":\"0\",\"email_id\":\"0\",\"live_production_token\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 23, '2'),
(22, 'Cashmaal', 'Cashmaal', 10, 10000, '2', '{\"method_type\":\"2\",\"name\":\"CashMaal (USD)(JAZZCASH)(EASYPAISA)\",\"min\":\"10\",\"max\":\"10000\",\"web_id\":\"5396\",\"fee\":\"0\",\"currency\":\"USD\"}', 27, '2'),
(25, 'Refer & earn', 'refer', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Do Not Use\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"P#n%aKfB3&DRAMqH\",\"merchant_mid\":\"DBWvgX98800736620578\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 25, '1'),
(26, 'payumoney', 'payumoney', 10, 0, '2', '{\"method_type\":\"2\",\"name\":\"Payumoney\",\"min\":\"10\",\"max\":\"0\",\"merchant_key\":\"L5is3x\",\"salt_key\":\"hKCK47h9\",\"fee\":\"10\",\"currency\":\"INR\"}', 21, '2'),
(30, 'Freebalance', 'Freebalance', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Freebalance\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\"}', 30, '1'),
(31, 'Perfect Money', 'perfectmoney', 0.1, 10000, '2', '{\"method_type\":\"1\",\"name\":\"Perfect Money\",\"min\":\"0.10\",\"max\":\"10000\",\"passphrase\":\"\",\"usd\":\"\",\"merchant_website\":\"smmxmonky\",\"fee\":\"1\"}', 3, '2'),
(32, 'Coinbase', 'Coinbase', 15, 1500, '2', '{\"method_type\":\"2\",\"name\":\"Coinbase commerce | BTC, LTC, USDT, ETH | Min 15 - Max 1500\",\"min\":\"15\",\"max\":\"1500\",\"api_key\":\"4ef2601e-af71-423f-88ba-16b9087e5e16\",\"webhook_api\":\"71381b16-999d-43f8-989c-ad7688069a60\",\"fee\":\"10\"}', 1, '2'),
(33, 'Webmoney', 'Webmoney', 1, 1, '2', '{\"method_type\":\"2\",\"name\":\"Webmoney\",\"min\":\"1\",\"max\":\"1\",\"wmid\":\"\",\"purse\":\"\",\"fee\":\"0\"}', 22, '2'),
(34, 'UnitPay', 'UnityPay', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"UnitPay\",\"min\":\"1\",\"max\":\"0\",\"secret_key\":\"\",\"reg_email\":\"\",\"fee\":\"0\"}', 24, '2'),
(35, 'Payeer', 'payeer', 10, 0, '2', '{\"method_type\":\"2\",\"name\":\"Payeer\",\"min\":\"1\",\"max\":\"100000\",\"account\":\"P1059667343\",\"client_secret\":\"tQCaSXyX94pRgpOt\",\"user_id\":\"1654044737\",\"user_pass\":\"tQCaSXyX94pRgpOt\",\"m_shop\":\"1652134607\"}', 6, '2'),
(36, '<b>FundsSystem</b>', 'funds', 1, 0, '2', '{}', 25, '2'),
(37, 'opay', 'opay', 1, 1000, '2', '{\"method_type\":\"2\",\"is_demo\":\"1\",\"name\":\"opay - Visa - Mastercard - Mobile Wallets\",\"min\":\"1\",\"max\":\"1000\",\"merchant_id\":\"281822041448063\",\"secret_key\":\"OPAYPRV16499350091410.788976381970694\",\"public_key\":\"OPAYPUB16499350091410.6534196662876502\",\"dollar_rate\":\"18.5\"}', 7, '2'),
(39, 'Phonepe', 'phonepe', 1, 10000, '2', '{\"method_type\":\"1\",\"name\":\"Phone Pe\",\"min\":\"1\",\"max\":\"10000\",\"phonepe_qr_link\":\"https:\\/\\/i.ibb.co\\/jzStZvZ\\/photo-2022-12-23-17-10-12.jpg\",\"email\":\"amitbhatijsm@gmail.com\",\"pass\":\"fgjhjghfjg\"}', 11, '2');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methodsold`
--

CREATE TABLE `payment_methodsold` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL,
  `nouse` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payment_methodsold`
--

INSERT INTO `payment_methodsold` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`, `nouse`) VALUES
(1, 'Paypal', 'paypal', 10, 10000, '2', '{\"method_type\":\"2\",\"name\":\"Paypal ( USD ) ( International Payments ) [ 10% Charge ]\",\"min\":\"10\",\"max\":\"10000\",\"client_id\":\"AWWRCH4eG0dDMY_84cDXJVKVsBGSzJpnezbgAB4Qm49cTQ2dJwZWMaWzNAbUv4ojUunW-pgicoYTMA0l\",\"client_secret\":\"EMiHDg3EejaX_ns8h3ybEkgBcm_mbFfPoK_EeNyW_UGX_LJlKxa3lpW9nDf7-gRrQMV1kyUWS1J48NxC\",\"fee\":\"10\"}', 3, '2'),
(2, 'Stripe', 'stripe', 1, 100, '1', '{\"method_type\":\"2\",\"name\":\"Stripe\",\"min\":\"1\",\"max\":\"100\",\"stripe_publishable_key\":\"pk_live_51HiUnRLjkQAtcIW0F983imoO8qhftSSMSj7oB9xTjGHB51su6vnuDmGNs5l2NNZz1XE1Ogf1svxqjtdasRYr3atk00wEAHHKNT\",\"stripe_secret_key\":\"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\",\"stripe_webhooks_secret\":\"whsec_gSvhMz0eOIOTk5S9uzzzDgpHeclOmiDe\",\"fee\":\"10\",\"currency\":\"USD\"}', 4, '2'),
(3, 'Shopier', 'shopier', 5, 0, '1', '{\"method_type\":\"1\",\"name\":\"Kredi \\/ Banka Kart\\u0131 ile \\u00d6de\",\"min\":\"5\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"website_index\":\"1\",\"processing_fee\":\"1\",\"fee\":\"10\",\"currency\":\"USD\"}', 5, '2'),
(5, 'Paywant', 'paywant', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Paywant\",\"min\":\"1\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"fee\":\"0\",\"currency\":\"USD\",\"commissionType\":\"2\",\"payment_type\":[\"1\",\"2\",\"3\"]}', 6, '2'),
(7, 'PayTR', 'paytr', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Paytr\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 7, '2'),
(8, 'Coinpayments', 'coinpayments', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Coinpayments\",\"min\":\"1\",\"max\":\"0\",\"coinpayments_public_key\":\"\",\"coinpayments_private_key\":\"\",\"coinpayments_currency\":\"LTCT\",\"merchant_id\":\"\",\"ipn_secret\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 8, '2'),
(9, '2checkout', '2checkout', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"2checkout\",\"min\":\"1\",\"max\":\"0\",\"seller_id\":\"\",\"private_key\":\"\",\"fee\":\"1\",\"currency\":\"USD\"}', 9, '2'),
(10, 'Payoneer', 'payoneer', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Payoneer\",\"email\":\"fazilakbulut@outlook.com\"}', 10, '2'),
(11, 'Mollie', 'mollie', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Mollie\",\"min\":\"1\",\"max\":\"0\",\"live_api_key\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 11, '2'),
(12, 'PayTM', 'paytm', 10, 100000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM ( INR )( UPI \\/ NET BANKING \\/ DEBIT \\/ CREDIT CARD)\",\"min\":\"10\",\"max\":\"100000\",\"merchant_key\":\"IR6iRT5L0tOxBte4\",\"merchant_mid\":\"gVkWqH50536759745964\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 2, '2'),
(13, 'Instamojo', 'instamojo', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Instamojo\",\"min\":\"0\",\"max\":\"0\",\"api_key\":\"a2bdf5035c16ad6db389caeb5ceb5273\",\"live_auth_token_key\":\"81ef2affdc5ecfde9b88b13e1cd67cd8\",\"fee\":\"0\",\"currency\":\"INR\"}', 12, '2'),
(14, 'Paytm Business', 'paytmqr', 10, 1000000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM QR (5% Bonus From 2000rs)\",\"min\":\"10\",\"max\":\"1000000\",\"merchant_key\":\"https:\\/\\/i.imgur.com\\/mlAI1qX.png\",\"merchant_mid\":\"HYJEZD46937702834501\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 1, '2'),
(15, 'Razorpay', 'razorpay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Razorpay\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"INR\"}', 13, '2'),
(16, 'Iyzico', 'iyzico', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Iyzico\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 14, '2'),
(17, 'Authorize.net', 'authorize-net', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Authorize.net\",\"min\":\"1\",\"max\":\"0\",\"api_login_id\":\"0\",\"secret_transaction_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 15, '2'),
(20, 'Ravepay', 'ravepay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Ravepay\",\"min\":\"1\",\"max\":\"0\",\"public_api_key\":\"0\",\"secret_api_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 17, '2'),
(21, 'Pagseguro', 'pagseguro', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Pagseguro\",\"min\":\"1\",\"max\":\"0\",\"email_id\":\"0\",\"live_production_token\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 18, '2'),
(22, 'Cashmaal', 'Cashmaal', 1, 10000, '2', '{\"method_type\":\"2\",\"name\":\"CashMaal (USD)(JAZZCASH)(EASYPAISA)\",\"min\":\"1\",\"max\":\"10000\",\"web_id\":\"5396\",\"fee\":\"0\",\"currency\":\"USD\"}', 19, '2'),
(25, 'Refer & earn', 'refer', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Do Not Use\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"P#n%aKfB3&DRAMqH\",\"merchant_mid\":\"DBWvgX98800736620578\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 25, '1'),
(26, 'payumoney', 'payumoney', 10, 0, '1', '{\"method_type\":\"2\",\"name\":\"Payumoney\",\"min\":\"10\",\"max\":\"0\",\"merchant_key\":\"Mv4ctvrc\",\"salt_key\":\"pWUvDRU8CT\",\"fee\":\"10\",\"currency\":\"INR\"}', 16, '2'),
(30, 'Freebalance', 'Freebalance', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Freebalance\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\"}', 30, '1');

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL,
  `referral_client_id` int(11) NOT NULL,
  `referral_clicks` double NOT NULL DEFAULT 0,
  `referral_sign_up` double NOT NULL DEFAULT 0,
  `referral_totalFunds_byReffered` double NOT NULL DEFAULT 0,
  `referral_earned_commision` double DEFAULT 0,
  `referral_requested_commision` varchar(225) DEFAULT '0',
  `referral_total_commision` double DEFAULT 0,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `referral_code` text NOT NULL,
  `referral_rejected_commision` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `referral`
--

INSERT INTO `referral` (`referral_id`, `referral_client_id`, `referral_clicks`, `referral_sign_up`, `referral_totalFunds_byReffered`, `referral_earned_commision`, `referral_requested_commision`, `referral_total_commision`, `referral_status`, `referral_code`, `referral_rejected_commision`) VALUES
(255, 194, 0, 0, 0, 0, '0', 0, '1', 'd899af', 0),
(256, 195, 0, 0, 0, 0, '0', 0, '1', '407c5e', 0),
(257, 196, 0, 0, 0, 0, '0', 0, '1', '6e71c2', 0),
(258, 197, 0, 0, 0, 0, '0', 0, '1', '52bcd9', 0),
(259, 198, 0, 0, 0, 0, '0', 0, '1', '0e64d9', 0),
(260, 199, 0, 0, 0, 0, '0', 0, '1', '11d031', 0),
(261, 200, 0, 0, 0, 0, '0', 0, '1', '99ffd4', 0),
(262, 201, 0, 0, 0, 0, '0', 0, '1', 'd00f13', 0),
(263, 202, 0, 0, 0, 0, '0', 0, '1', '681f3d', 0),
(264, 203, 0, 0, 0, 0, '0', 0, '1', 'faee93', 0),
(265, 204, 0, 0, 0, 0, '0', 0, '1', 'a33348', 0),
(266, 205, 0, 0, 0, 0, '0', 0, '1', '4ec41d', 0),
(267, 206, 0, 0, 0, 0, '0', 0, '1', '37a613', 0),
(268, 207, 0, 0, 0, 0, '0', 0, '1', '1ca51b', 0),
(269, 208, 0, 0, 0, 0, '0', 0, '1', '61b73f', 0),
(270, 209, 0, 0, 0, 0, '0', 0, '1', '6faa97', 0),
(271, 210, 0, 0, 0, 0, '0', 0, '1', 'a978d8', 0),
(272, 211, 0, 0, 0, 0, '0', 0, '1', 'd459bc', 0),
(273, 212, 0, 0, 0, 0, '0', 0, '1', 'af476c', 0),
(274, 213, 0, 0, 0, 0, '0', 0, '1', '3e30d8', 0),
(275, 214, 0, 0, 0, 0, '0', 0, '1', '59a381', 0),
(276, 215, 0, 0, 0, 0, '0', 0, '1', '014532', 0),
(277, 216, 0, 0, 0, 0, '0', 0, '1', '35d3fd', 0),
(278, 217, 0, 0, 0, 0, '0', 0, '1', '732126', 0),
(279, 218, 0, 0, 0, 0, '0', 0, '1', '8ffc31', 0),
(280, 219, 0, 0, 0, 0, '0', 0, '1', '3dd408', 0),
(281, 220, 0, 0, 0, 0, '0', 0, '1', '13e067', 0),
(282, 221, 0, 0, 0, 0, '0', 0, '1', 'fa4a96', 0),
(283, 222, 0, 0, 0, 0, '0', 0, '1', '8f9133', 0),
(284, 223, 0, 0, 0, 0, '0', 0, '1', 'd1e8a7', 0),
(285, 224, 0, 0, 0, 0, '0', 0, '1', 'a73a31', 0),
(286, 225, 0, 0, 0, 0, '0', 0, '1', 'e0873a', 0),
(287, 226, 0, 0, 0, 0, '0', 0, '1', '345dea', 0),
(288, 227, 0, 0, 0, 0, '0', 0, '1', '6f0c2e', 0),
(289, 228, 0, 0, 0, 0, '0', 0, '1', '3ad8c1', 0),
(290, 229, 0, 0, 0, 0, '0', 0, '1', '32462d', 0),
(291, 230, 0, 0, 0, 0, '0', 0, '1', '71b9ad', 0),
(292, 1, 0, 0, 0, 0, '0', 0, '1', '5d96f0', 0),
(293, 2, 0, 0, 0, 0, '0', 0, '1', '6c1351', 0),
(294, 3, 0, 0, 0, 0, '0', 0, '1', '3e17c9', 0),
(295, 4, 0, 0, 0, 0, '0', 0, '1', 'b1eb7e', 0),
(296, 5, 0, 0, 0, 0, '0', 0, '1', '5d005c', 0),
(297, 6, 0, 0, 0, 0, '0', 0, '1', '60efdc', 0),
(298, 7, 0, 0, 0, 0, '0', 0, '1', '3aeaab', 0),
(299, 8, 0, 0, 0, 0, '0', 0, '1', '259c3b', 0),
(300, 9, 0, 0, 0, 0, '0', 0, '1', 'dbf87c', 0),
(301, 10, 0, 0, 0, 0, '0', 0, '1', '6bda7d', 0),
(302, 11, 0, 0, 0, 0, '0', 0, '1', '3671d7', 0),
(303, 12, 0, 0, 0, 0, '0', 0, '1', '8fdc1e', 0),
(304, 13, 0, 0, 0, 0, '0', 0, '1', 'b85030', 0),
(305, 14, 0, 0, 0, 0, '0', 0, '1', '5165f1', 0),
(306, 15, 0, 0, 0, 0, '0', 0, '1', 'ffc490', 0),
(307, 16, 0, 0, 0, 0, '0', 0, '1', '0824be', 0),
(308, 17, 0, 0, 0, 0, '0', 0, '1', '6e0405', 0),
(309, 18, 0, 0, 0, 0, '0', 0, '1', '87ae87', 0),
(310, 19, 0, 0, 0, 0, '0', 0, '1', '0e33b1', 0),
(311, 20, 0, 0, 0, 0, '0', 0, '1', '2bb7b2', 0),
(312, 21, 0, 0, 0, 0, '0', 0, '1', 'b70c50', 0),
(313, 22, 0, 0, 0, 0, '0', 0, '1', '938f61', 0),
(314, 23, 0, 0, 0, 0, '0', 0, '1', '7624f6', 0),
(315, 24, 0, 0, 0, 0, '0', 0, '1', '776a30', 0),
(316, 25, 0, 0, 0, 0, '0', 0, '1', '8d8be8', 0),
(317, 26, 0, 0, 0, 0, '0', 0, '1', '84868c', 0),
(318, 28, 0, 0, 0, 0, '0', 0, '1', 'dea606', 0),
(319, 29, 0, 0, 0, 0, '0', 0, '1', 'eac64b', 0),
(320, 30, 0, 0, 0, 0, '0', 0, '1', '84c357', 0);

-- --------------------------------------------------------

--
-- Table structure for table `referral_payouts`
--

CREATE TABLE `referral_payouts` (
  `r_p_id` int(11) NOT NULL,
  `r_p_code` text NOT NULL,
  `r_p_status` enum('1','2','3','4','0') NOT NULL DEFAULT '0',
  `r_p_amount_requested` double NOT NULL,
  `r_p_requested_at` datetime NOT NULL,
  `r_p_updated_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refill_status`
--

CREATE TABLE `refill_status` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `refill_apiid` int(11) DEFAULT NULL,
  `order_url` text NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `refill_status` enum('Pending','Refilling','Completed','Rejected','Error') DEFAULT 'Pending',
  `order_apiid` int(11) DEFAULT 0,
  `refill_response` text DEFAULT NULL,
  `refill_where` enum('site','api') DEFAULT 'site'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `service_price` varchar(225) NOT NULL,
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text DEFAULT NULL,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` varchar(225) DEFAULT 'en',
  `description_lang` text DEFAULT NULL,
  `time_lang` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `time` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'false',
  `service_profit` varchar(225) NOT NULL,
  `refill_days` varchar(225) NOT NULL DEFAULT '30',
  `refill_hours` varchar(225) NOT NULL DEFAULT '24',
  `avg_days` int(11) NOT NULL,
  `avg_hours` int(11) NOT NULL,
  `avg_minutes` int(11) NOT NULL,
  `avg_many` int(11) NOT NULL,
  `price_profit` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`, `price_profit`) VALUES
(299, 0, 0, '2', '', 360, 1, '2', '2', 'Monthly SMM Panel website Very Cheap Price 💚 SMMscripts.shop', NULL, '5', 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Monthly SMM Panel website Very Cheap Price \\ud83d\\udc9a SMMscripts.shop\"}', NULL, 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `currency` enum('INR','USD') DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi',
  `status` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `service_api`
--

INSERT INTO `service_api` (`id`, `api_name`, `api_url`, `api_key`, `api_type`, `api_limit`, `currency`, `api_alert`, `status`) VALUES
(34, 'smmwings.com', 'https://smmwings.com/api/v2', 'Xyz', 0, 0, 'INR', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` text DEFAULT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `site_base_currency` varchar(20) DEFAULT NULL,
  `site_currency_converter` tinyint(1) NOT NULL DEFAULT 0,
  `site_update_rates_automatically` int(10) NOT NULL DEFAULT 0,
  `last_updated_currency_rates` datetime DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text DEFAULT NULL,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_apimail` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `ns1` varchar(191) DEFAULT NULL,
  `ns2` varchar(191) DEFAULT NULL,
  `childpanel_price` double DEFAULT NULL,
  `snow_effect` enum('1','2') NOT NULL DEFAULT '2',
  `snow_colour` text NOT NULL,
  `promotion` enum('1','2') DEFAULT '2',
  `referral_commision` double NOT NULL,
  `referral_payout` double NOT NULL,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `childpanel_selling` enum('1','2') NOT NULL DEFAULT '1',
  `tickets_per_user` double NOT NULL DEFAULT 5,
  `name_fileds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `skype_feilds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `csymbol` text NOT NULL,
  `inr_symbol` text NOT NULL,
  `inr_value` double NOT NULL DEFAULT 0,
  `usd_symbol` text NOT NULL,
  `inr_convert` double NOT NULL DEFAULT 0,
  `otp_login` enum('1','2','0') NOT NULL DEFAULT '0',
  `auto_deactivate_payment` enum('1','2') NOT NULL DEFAULT '1',
  `service_avg_time` enum('1','0') NOT NULL DEFAULT '0',
  `alert_orderfail` enum('1','2') NOT NULL DEFAULT '2',
  `alert_welcomemail` enum('1','2') NOT NULL DEFAULT '2',
  `freebalance` enum('1','2') NOT NULL DEFAULT '1',
  `freeamount` double DEFAULT 0,
  `alert_newmessage` enum('1','2') NOT NULL DEFAULT '1',
  `email_confirmation` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL,
  `orders` int(255) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `fundstransfer_fees` varchar(10) NOT NULL,
  `permissions` text DEFAULT NULL,
  `fake_order_service_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `fake_order_min` int(11) DEFAULT NULL,
  `fake_order_max` int(11) DEFAULT NULL,
  `panel_orders` int(11) DEFAULT NULL,
  `downloaded_category_icons` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `site_base_currency`, `site_currency_converter`, `site_update_rates_automatically`, `last_updated_currency_rates`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_apimail`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `ns1`, `ns2`, `childpanel_price`, `snow_effect`, `snow_colour`, `promotion`, `referral_commision`, `referral_payout`, `referral_status`, `childpanel_selling`, `tickets_per_user`, `name_fileds`, `skype_feilds`, `csymbol`, `inr_symbol`, `inr_value`, `usd_symbol`, `inr_convert`, `otp_login`, `auto_deactivate_payment`, `service_avg_time`, `alert_orderfail`, `alert_welcomemail`, `freebalance`, `freeamount`, `alert_newmessage`, `email_confirmation`, `resend_max`, `orders`, `orders_id`, `status`, `fundstransfer_fees`, `permissions`, `fake_order_service_enabled`, `fake_order_min`, `fake_order_max`, `panel_orders`, `downloaded_category_icons`) VALUES
(1, 'SMM Panel BD Lab', 'SMM Panel BD Lab', 'SMM Panel BD Lab', 'SMM Panel BD Lab, smm panel,smmpanel,SMM Panel India,SMM Panel Paytm,SMM Panel Cheap India,SMM Reseller Panel,SMM Reseller Panel India,Cheap SMM Panel,cheapest SMM panel,cheap SMM panel india,Cheapest SMM Reseller Panel,Cheapest SMM Panel Paytm,Cheapest SMM Panel Paytm,indian smm panel,IndianSMM Reseller Panel,Best SMM panel,Best SMM Panel India,Top SMM Panel', 'public/images/e97ee2054defb209c35fe4dc94599061.png', 'smmscripts.shop', 'USD', 'USD', 0, 0, '2023-08-20 15:59:11', '', 'en', 'SMMSUN', 'Grapes', '1', '6LegoTMjAAAAADYk7cwkkNHxFWjagJy3tb9SEIgw', '6LegoTMjAAAAAO3G1lX0hbGgmrSYc7cVL3AdwN_I', '', '', '1', '2', '1', '2', 82.750063, 0, 'info@smmpanelbdlab.com', '@$jongta@$smm@$', 'smmpanelbdlab.com', '465', 'tls', '2', '2', '2', '2', '2', '2', 'bizimsms', '', '', '', '1', 'info@smmpanelbdlab.com', '', '2', '1', '2', '2', 'asc', 500, 2500, 10000, 15000, 'ns1.smmpanelbdlab.com', 'ns2.smmpanelbdlab.com', 28, '', '', '1', 5, 10, '2', '2', 3, '2', '2', '$', '₹', 74.87, '$', 0.013, '0', '1', '1', '2', '2', '1', 0, '2', '2', 2, 0, 0, '0', '1', '{\"pages\":{\"clients\":{\"name\":\"Clients\",\"value\":\"clients\"},\"Admin\":{\"name\":\"Admin\",\"value\":\"admin_access\"},\"orders\":{\"name\":\"Orders\",\"value\":\"orders\"},\"subscriptions\":{\"name\":\"Subscriptions\",\"value\":\"subscriptions\"},\"dripfeed\":{\"name\":\"Dripfeed\",\"value\":\"dripfeed\"},\"services\":{\"name\":\"Services\",\"value\":\"services\"},\"payments\":{\"name\":\"Payments\",\"value\":\"payments\"},\"support\":{\"name\":\"Support\",\"value\":\"support\"},\"broadcast\":{\"name\":\"Broadcast\",\"value\":\"broadcast\"},\"tasks\":{\"name\":\"Tasks\",\"value\":\"tasks\"},\"statistics\":{\"name\":\"Statistics\",\"value\":\"statistics\"},\"referral\":{\"name\":\"Referral\",\"value\":\"referral\"},\"child\":{\"name\":\"Child\",\"value\":\"child\"},\"user_logs\":{\"name\":\"User Logs\",\"value\":\"user_logs\"},\"admin_logs\":{\"name\":\"Admin Logs\",\"value\":\"admin_logs\"},\"service_logs\":{\"name\":\"Service Logs\",\"value\":\"service_logs\"}},\"appearance\":{\"appearance\":{\"name\":\"Appearance\",\"value\":\"appearance\"},\"pages\":{\"name\":\"Pages\",\"value\":\"pages\"},\"annoucements\":{\"name\":\"Announcements\",\"value\":\"announcements\"},\"languages\":{\"name\":\"Languages\",\"value\":\"languages\"},\"themes\":{\"name\":\"Themes\",\"value\":\"themes\"},\"blogs\":{\"name\":\"Blogs\",\"value\":\"blogs\"},\"menu\":{\"name\":\"Menu\",\"value\":\"menus\"},\"files\":{\"name\":\"Files\",\"value\":\"files\"}},\"settings\":{\"general\":{\"name\":\"General\",\"value\":\"general\"},\"providers\":{\"name\":\"Providers\",\"value\":\"providers\"},\"methods\":{\"name\":\"Payment Methods\",\"value\":\"methods\"},\"modules\":{\"name\":\"Modules\",\"value\":\"modules\"},\"integrations\":{\"name\":\"Integrations\",\"value\":\"integrations\"},\"bonuses\":{\"name\":\"Bonuses\",\"value\":\"bonuses\"},\"coupons\":{\"name\":\"Coupons\",\"value\":\"coupons\"},\"notifications\":{\"name\":\"Notifications\",\"value\":\"notifications\"},\"currency\":{\"name\":\"Currency\",\"value\":\"currency\"},\"subjects\":{\"name\":\"Tickets Subjects\",\"value\":\"subjects\"}}}', 0, 1, 10, 505, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sync_logs`
--

CREATE TABLE `sync_logs` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) NOT NULL,
  `api_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `task_api` int(255) DEFAULT NULL,
  `task_type` varchar(225) DEFAULT NULL,
  `task_status` varchar(225) DEFAULT 'pending',
  `task_response` text DEFAULT NULL,
  `task_created_at` datetime DEFAULT NULL,
  `task_updated_at` datetime DEFAULT NULL,
  `task_by` text DEFAULT NULL,
  `check_refill_status` int(10) DEFAULT NULL,
  `refill_orderid` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL,
  `last_modified` datetime NOT NULL,
  `newpage` text NOT NULL,
  `colour` enum('1','2') NOT NULL DEFAULT '1',
  `site_theme_alt` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`, `last_modified`, `newpage`, `colour`, `site_theme_alt`) VALUES
(1, 'SMMSUN', 'SMMSUN', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\"],\"scripts\":[\"public/pro/script.js\",\"public/ajax.js\"]}', '2023-08-21 01:34:19', '{% include \'header.twig\' %}\n\n	<br><br><br>\n\n	\n\n	<div class=\"container-fluid container-fluid-spacious\">\n\n		<div class=\"row\">\n\n			<div class=\"col-md-12\">\n\n			{% if contentText %}\n\n{{ contentText }}\n\n{% endif %}\n\n				{% if contentText2 %}\n\n{{ contentText2 }}\n\n{% endif %}\n\n				\n\n			</div>\n\n		</div>\n\n	</div>\n\n   \n\n      \n\n        \n\n   ', '2', ''),
(2, 'caste', 'caste', '', '2023-11-10 05:22:13', '', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `client_id`, `subject`, `time`, `lastupdate_time`, `client_new`, `status`, `support_new`, `canmessage`) VALUES
(70, 6, 'স্পীড আপ', '2023-10-02 12:33:22', '2023-10-02 12:33:22', '1', 'closed', '1', '2'),
(71, 6, 'ডলার ডিপোজিট করুন', '2023-10-02 12:33:41', '2023-10-02 12:33:41', '1', 'closed', '1', '2'),
(72, 6, 'অর্ডার ইস্যু', '2023-10-02 12:34:03', '2023-10-02 12:34:03', '1', 'closed', '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `readed` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `ticket_reply`
--

INSERT INTO `ticket_reply` (`id`, `ticket_id`, `client_id`, `time`, `support`, `message`, `readed`) VALUES
(103, 33, 0, '2023-09-15 12:58:58', '1', 'SMM Panel BD Lab', '1'),
(104, 34, 0, '2023-09-17 12:22:54', '1', 'hi', '1'),
(105, 35, 0, '2023-09-17 14:25:15', '1', 'hello sir', '1'),
(106, 34, 0, '2023-09-17 18:51:49', '2', 'Hello', '1'),
(107, 36, 0, '2023-09-18 01:39:59', '1', 'বিষয় টা গুরুত্ব সহকারে দেখবেন।  ধন্যবাদ ', '1'),
(108, 37, 0, '2023-09-18 14:48:16', '1', 'Hi', '1'),
(109, 37, 0, '2023-09-18 15:22:40', '2', 'hello', '1'),
(110, 38, 0, '2023-09-18 15:24:34', '1', 'hi', '1'),
(111, 38, 0, '2023-09-18 15:24:57', '2', 'hello', '1'),
(112, 38, 0, '2023-09-18 15:26:34', '2', 'bolun', '1'),
(113, 39, 0, '2023-09-18 15:27:48', '1', 'hello', '1'),
(114, 40, 0, '2023-09-18 15:28:04', '1', 'hi', '1'),
(115, 39, 0, '2023-09-18 15:32:32', '2', 'hello', '1'),
(116, 41, 0, '2023-09-18 15:42:07', '1', 'Hi', '1'),
(117, 41, 0, '2023-09-18 17:56:18', '1', 'hell8', '1'),
(118, 41, 0, '2023-09-18 17:56:23', '1', 'hi', '1'),
(119, 41, 0, '2023-09-18 17:59:11', '2', 'hmm', '1'),
(120, 41, 0, '2023-09-18 18:00:44', '1', 'thank you so much', '1'),
(121, 42, 0, '2023-09-18 18:01:10', '1', 'Hi', '1'),
(122, 42, 0, '2023-09-18 18:01:16', '1', 'Hello', '1'),
(123, 42, 0, '2023-09-18 18:01:31', '1', 'Asen', '1'),
(124, 42, 0, '2023-09-18 18:01:41', '1', 'Hello', '1'),
(125, 42, 0, '2023-09-18 18:01:52', '1', 'Hi', '1'),
(126, 42, 0, '2023-09-18 18:01:57', '1', 'Ji', '1'),
(127, 33, 0, '2023-09-18 18:10:14', '2', 'tnx', '1'),
(128, 41, 0, '2023-09-18 18:10:24', '2', 'tnx', '1'),
(129, 42, 0, '2023-09-18 18:10:34', '2', 'tnx', '1'),
(130, 43, 0, '2023-09-18 18:20:08', '1', 'hello', '1'),
(131, 43, 0, '2023-09-18 18:24:46', '2', '1120561 - Hello dear customer,\r\nSorry for the delay to deliver your order.\r\nWe are constantly striving to satisfy our customers\' needs.\r\nI am going to add your order for boost up. The speed of order will increase &amp; deliver within 12-36 hours.\r\nThanks for your understanding.\r\n\r\n\r\nHave a nice day.\r\nAt you service,\r\n~ Alif, Customer Support Team.', '1'),
(132, 44, 0, '2023-09-18 21:42:46', '1', 'কোনো সমস্যা নাই আলহামদুলিল্লাহ।  চলবে।', '1'),
(133, 45, 0, '2023-09-19 00:52:18', '1', 'doller need', '1'),
(134, 45, 0, '2023-09-19 00:52:26', '1', 'hello', '1'),
(135, 45, 0, '2023-09-19 01:21:06', '1', 'হ্যালো ', '1'),
(136, 45, 0, '2023-09-19 17:08:28', '2', 'জ্বি- বলুন', '1'),
(137, 44, 0, '2023-09-19 17:09:06', '2', 'জাজাকাল্লাহ খাইরান। ', '1'),
(138, 46, 0, '2023-09-21 16:34:02', '1', '5 dollars need', '1'),
(139, 47, 0, '2023-09-23 12:48:44', '1', 'hii', '1'),
(140, 47, 0, '2023-09-23 12:48:52', '1', 'hello', '1'),
(141, 48, 0, '2023-09-30 15:12:10', '1', '1৳ dollar need\r\n', '1'),
(142, 49, 0, '2023-09-30 15:32:24', '1', 'Add found 1৳\r\nLast 2627', '1'),
(143, 48, 0, '2023-09-30 23:15:13', '2', 'bkash Number a send money korun. 01793242627.', '1'),
(144, 49, 0, '2023-09-30 23:15:31', '2', 'done', '1'),
(145, 50, 0, '2023-10-01 14:01:49', '1', 'আমার অর্ডার টি ফাস্ট করে দিন', '1'),
(146, 50, 0, '2023-10-01 14:01:49', '2', '', '1'),
(147, 50, 0, '2023-10-01 14:02:02', '1', 'উপকৃত হবো ', '1'),
(148, 50, 0, '2023-10-01 14:02:21', '1', 'হ্যালো ', '1'),
(149, 50, 0, '2023-10-01 15:33:19', '2', 'opekkha korun', '1'),
(150, 51, 0, '2023-10-01 18:22:35', '1', 'অবশিষ্ট ডলার জমা করে দেন', '1'),
(151, 51, 0, '2023-10-01 18:22:35', '2', '', '1'),
(152, 51, 0, '2023-10-01 18:23:37', '2', 'ok wait a minute ', '1'),
(153, 51, 0, '2023-10-01 19:05:47', '2', 'Added ', '1'),
(154, 52, 0, '2023-10-02 01:23:34', '1', 'hello', '1'),
(155, 52, 0, '2023-10-02 01:23:34', '2', 'Service Icons\r\n\r\n⭐ - Recomended \r\n\r\n? - Non Drop\r\n\r\n♻️ - Refill  \r\n\r\n⛔ - Cancel Button\r\n\r\n? - Drip-Feed\r\n\r\n⚡- Fast', '1'),
(156, 53, 0, '2023-10-02 03:14:07', '1', 'Hi', '1'),
(157, 53, 0, '2023-10-02 03:14:07', '2', 'Service Icons\r\n\r\n⭐ - Recomended \r\n\r\n? - Non Drop\r\n\r\n♻️ - Refill  \r\n\r\n⛔ - Cancel Button\r\n\r\n? - Drip-Feed\r\n\r\n⚡- Fast', '1'),
(158, 54, 0, '2023-10-02 03:26:22', '1', 'এখনও এড হয়নি', '1'),
(159, 54, 0, '2023-10-02 03:26:22', '2', 'আপনার লেনদেন এর তথ্য দিয়ে আমাদের সহায়তা করুন। \r\n▪️আপনার একাউন্টের নাম\r\n▪️আপনার লেনদেনকৃত ফোন নাম্বার\r\nতথ্য গুলো সঠিক দিন- ০-৩ মিনিটের মধ্যে আপনার একাউন্টে ডলার যোগ করা হবে।', '1'),
(160, 55, 0, '2023-10-02 03:27:53', '1', 'এখনও এড হয়নি', '1'),
(161, 55, 0, '2023-10-02 03:27:53', '2', 'আপনার লেনদেন এর তথ্য দিয়ে আমাদের সহায়তা করুন। \r\n▪️আপনার একাউন্টের নাম।\r\n▪️আপনার লেনদেনকৃত ফোন নাম্বার।\r\n\r\n\r\nসাপোর্ট টীম \r\n\r\n', '1'),
(162, 56, 0, '2023-10-02 03:30:22', '1', 'আমার ডলার এড হয়নি কেন', '1'),
(163, 56, 0, '2023-10-02 03:30:22', '2', 'আপনার লেনদেন এর তথ্য দিয়ে আমাদের সহায়তা করুন। \r\n▪️আপনার ইউজার আইডির নাম।\r\n▪️আপনার লেনদেনকৃত ফোন নাম্বার।\r\n\r\n\r\n', '1'),
(164, 57, 0, '2023-10-02 03:45:10', '1', 'কিভাবে? ', '1'),
(165, 57, 0, '2023-10-02 03:45:10', '2', 'মোবাইল থেকে সরাসরি সেন্ড মানি করে খুব সহজে আপনি ডিপোজিট করতে পারেন। \r\nবিকাশ | নগদ | রকেট । \r\nডলার এড করতে কপি করুনঃ ???????????', '1'),
(166, 58, 0, '2023-10-02 03:47:22', '1', 'Place Concorde ', '1'),
(167, 58, 0, '2023-10-02 03:47:22', '2', 'মোবাইল থেকে সরাসরি সেন্ড মানি করে খুব সহজে আপনি ডিপোজিট করতে পারেন। \r\nবিকাশ | নগদ | অথবা রকেট থেকে। \r\n▪️কপি করুনঃ 01793242627', '1'),
(168, 59, 0, '2023-10-02 04:01:07', '1', 'Hello sir', '1'),
(169, 59, 0, '2023-10-02 04:01:07', '2', 'অনুগ্রহ করে অপেক্ষা করুন। আপনার অর্ডার আইডি নাম্বার টা দিন। অবশ্যই পরবর্তী অর্ডারের সময়। ডেসক্রিপশন বক্স এবং এভারেজ টাইম দেখে অর্ডার সাবমিট করবেন।\r\nআমাদের প্রতিনিধি টীম খুব দ্রুত আপনার বিষয় টি দেখছেন। ধন্যবাদ। ', '1'),
(170, 60, 0, '2023-10-02 04:03:38', '1', 'হি', '1'),
(171, 60, 0, '2023-10-02 04:03:38', '2', 'অর্ডার আইডি নাম্বার টা দিন। \r\nখুব দ্রুত আমাদের প্রতিনিধি টীম আপনার বিষয় টি দেখবেন।', '1'),
(172, 61, 0, '2023-10-02 04:04:19', '1', '৪৫৬৮৯', '1'),
(173, 61, 0, '2023-10-02 04:04:19', '2', 'অনুগ্রহ করে আপনার অর্ডার আইডি নাম্বার টা আমাদের প্রোভাইড করুন। ', '1'),
(174, 62, 0, '2023-10-02 12:10:04', '1', 'hi', '1'),
(175, 62, 0, '2023-10-02 12:10:04', '2', 'অর্ডার আইডি নাম্বার টা দিন। \r\nখুব দ্রুত আমাদের প্রতিনিধি টীম আপনার বিষয় টি দেখবেন।', '1'),
(176, 63, 0, '2023-10-02 12:10:30', '1', 'hello', '1'),
(177, 63, 0, '2023-10-02 12:10:30', '2', 'আপনার বিষয় টি আমাদের প্রতিনিধি টীম খুব দ্রুত চেক করে জানাচ্ছেন। সময় দিয়ে সহোযোগিতা করুন।', '1'),
(178, 64, 0, '2023-10-02 12:10:50', '1', 'hi', '1'),
(179, 64, 0, '2023-10-02 12:10:50', '2', 'ধন্যবাদ স্যার অনুগ্রহ করে নিচের নির্দেশনা অনুসরণ করুন এবং \r\nআপনার লেনদেন এর তথ্য দিয়ে পূনরায়  আমাদের সহায়তা করুন। (০১) আপনার ইউজার আইডি নাম। (০২) আপনার লেনদেনকৃত ফোন নাম্বার।\r\nজরুরী প্রয়োজনে আমাদের পেমেন্ট সাপোর্ট টীমকে বিষয় টা অবগত করুন। \r\n\r\n\r\n', '1'),
(180, 65, 0, '2023-10-02 12:12:54', '1', 'bolun', '1'),
(181, 65, 0, '2023-10-02 12:12:54', '2', 'মোবাইল থেকে সরাসরি সেন্ড মানি করে খুব সহজে আপনি ডিপোজিট করতে পারেন। \r\nবিকাশ | নগদ | অথবা রকেট এর মাধ্যমে । \r\nনাম্বারটি কপি করুনঃ 01793242627', '1'),
(182, 66, 0, '2023-10-02 12:13:19', '1', 'ji', '1'),
(183, 66, 0, '2023-10-02 12:13:19', '2', 'সময় দিয়ে সহোযোগিতা করুন। খুব দ্রুত আপনার সাথে আমাদের প্রতিনিধি টীম যোগাযোগ করবেন।', '1'),
(184, 67, 0, '2023-10-02 12:13:35', '1', 'ki', '1'),
(185, 67, 0, '2023-10-02 12:13:35', '2', 'অনুগ্রহ করে কিছুক্ষণ অপেক্ষা করুন। \r\nআপনার অর্ডার আইডি নাম্বার টা পূনরায় আমাদের প্রোভাইড করুন। ', '1'),
(186, 68, 0, '2023-10-02 12:14:26', '1', 'number', '1'),
(187, 68, 0, '2023-10-02 12:14:26', '2', 'অর্ডার আইডি নাম্বার টা দিন। \r\nখুব দ্রুত আমাদের প্রতিনিধি টীম আপনার বিষয় টি দেখবেন।', '1'),
(188, 69, 0, '2023-10-02 12:14:55', '1', 'ki', '1'),
(189, 69, 0, '2023-10-02 12:14:55', '2', 'ধন্যবাদ।  আমাদের প্রতিনিধি টীম খুব দ্রুত আপনার সাথে যোগাযোগ করবেন।', '1'),
(190, 70, 0, '2023-10-02 12:33:22', '1', 'hello', '1'),
(191, 70, 0, '2023-10-02 12:33:22', '2', 'অর্ডার আইডি নাম্বার টা দিন। \r\nখুব দ্রুত আমাদের প্রতিনিধি টীম আপনার বিষয় টি দেখবেন।', '1'),
(192, 71, 0, '2023-10-02 12:33:41', '1', 'koi', '1'),
(193, 71, 0, '2023-10-02 12:33:41', '2', 'ধন্যবাদ স্যার অনুগ্রহ করে নিচের নির্দেশনা অনুসরণ করুন এবং \r\nআপনার লেনদেন এর তথ্য দিয়ে পূনরায়  আমাদের সহায়তা করুন। (০১) আপনার ইউজার আইডি নাম। (০২) আপনার লেনদেনকৃত ফোন নাম্বার।\r\nজরুরী প্রয়োজনে আমাদের পেমেন্ট সাপোর্ট টীমকে বিষয় টা অবগত করুন। \r\n\r\n\r\n', '1'),
(194, 72, 0, '2023-10-02 12:34:03', '1', 'ki', '1'),
(195, 72, 0, '2023-10-02 12:34:03', '2', 'আপনার বিষয় টি আমাদের প্রতিনিধি টীম খুব দ্রুত চেক করে জানাচ্ছেন। সময় দিয়ে সহোযোগিতা করুন।', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_subjects`
--

CREATE TABLE `ticket_subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `content` text DEFAULT NULL,
  `auto_reply` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ticket_subjects`
--

INSERT INTO `ticket_subjects` (`subject_id`, `subject`, `content`, `auto_reply`) VALUES
(11, 'Payment', '', '0'),
(12, 'Order', '', '0'),
(13, 'Others', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `units_per_page`
--

CREATE TABLE `units_per_page` (
  `id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `page` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `units_per_page`
--

INSERT INTO `units_per_page` (`id`, `unit`, `page`) VALUES
(1, 50, 'clients'),
(2, 50, 'orders'),
(3, 50, 'payments'),
(4, 50, 'refill'),
(5, 50, 'bulk'),
(6, 20, 'services');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `u_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'Not enough data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`u_id`, `service_id`, `action`, `date`, `description`) VALUES
(1, 65, 'Refill Deactivated', '2023-09-17 19:40:39', 'Refill Button has been Deativated'),
(2, 65, 'Cancel Deactivated', '2023-09-17 19:40:39', 'Cancel Button has been Deativated'),
(3, 65, 'Price Increased', '2023-09-17 19:40:39', 'Price changed from 2.21 to 4.5705'),
(4, 11, 'Price Increased', '2023-09-26 15:55:03', 'Price changed from 0.504 to 1.504'),
(5, 12, 'Price Increased', '2023-09-26 15:55:49', 'Price changed from 1.1175 to 2.1175'),
(6, 33, 'Refill Deactivated', '2023-09-26 16:11:07', 'Refill Button has been Deativated'),
(7, 33, 'Cancel Deactivated', '2023-09-26 16:11:07', 'Cancel Button has been Deativated'),
(8, 33, 'Price Increased', '2023-09-26 16:11:07', 'Price changed from  to 0.852'),
(9, 33, 'Minimum Increased', '2023-09-26 16:11:07', 'Minimum amount changed from  to 100'),
(10, 33, 'Maximum Increased', '2023-09-26 16:11:07', 'Maximum amount changed from  to 100000'),
(11, 33, 'Refill Deactivated', '2023-09-26 16:12:20', 'Refill Button has been Deativated'),
(12, 33, 'Cancel Deactivated', '2023-09-26 16:12:20', 'Cancel Button has been Deativated'),
(13, 33, 'Price Increased', '2023-09-26 16:12:20', 'Price changed from  to 0.852'),
(14, 33, 'Minimum Increased', '2023-09-26 16:12:20', 'Minimum amount changed from  to 100'),
(15, 33, 'Maximum Increased', '2023-09-26 16:12:20', 'Maximum amount changed from  to 100000'),
(16, 33, 'Refill Deactivated', '2023-09-26 16:13:13', 'Refill Button has been Deativated'),
(17, 33, 'Cancel Deactivated', '2023-09-26 16:13:13', 'Cancel Button has been Deativated'),
(18, 33, 'Price Increased', '2023-09-26 16:13:13', 'Price changed from  to 0.852'),
(19, 33, 'Minimum Increased', '2023-09-26 16:13:13', 'Minimum amount changed from  to 100'),
(20, 33, 'Maximum Increased', '2023-09-26 16:13:13', 'Maximum amount changed from  to 100000'),
(21, 33, 'Refill Deactivated', '2023-09-26 16:40:33', 'Refill Button has been Deativated'),
(22, 33, 'Cancel Deactivated', '2023-09-26 16:40:33', 'Cancel Button has been Deativated'),
(23, 33, 'Price Increased', '2023-09-26 16:40:33', 'Price changed from  to 2.173'),
(24, 33, 'Minimum Increased', '2023-09-26 16:40:33', 'Minimum amount changed from  to 100'),
(25, 33, 'Maximum Increased', '2023-09-26 16:40:33', 'Maximum amount changed from  to 100000'),
(26, 33, 'Refill Deactivated', '2023-09-26 16:41:15', 'Refill Button has been Deativated'),
(27, 33, 'Cancel Deactivated', '2023-09-26 16:41:15', 'Cancel Button has been Deativated'),
(28, 33, 'Price Increased', '2023-09-26 16:41:15', 'Price changed from  to 2.1739'),
(29, 33, 'Minimum Increased', '2023-09-26 16:41:15', 'Minimum amount changed from  to 100'),
(30, 33, 'Maximum Increased', '2023-09-26 16:41:15', 'Maximum amount changed from  to 100000'),
(31, 33, 'Refill Deactivated', '2023-09-26 16:41:52', 'Refill Button has been Deativated'),
(32, 33, 'Cancel Deactivated', '2023-09-26 16:41:52', 'Cancel Button has been Deativated'),
(33, 33, 'Price Increased', '2023-09-26 16:41:52', 'Price changed from  to 2.18'),
(34, 33, 'Minimum Increased', '2023-09-26 16:41:52', 'Minimum amount changed from  to 100'),
(35, 33, 'Maximum Increased', '2023-09-26 16:41:52', 'Maximum amount changed from  to 100000'),
(36, 12, 'Price Decreased', '2023-09-26 16:42:48', 'Price changed from 2.1175 to 2.00'),
(37, 12, 'Price Increased', '2023-09-26 16:43:59', 'Price changed from 2.00 to 2.01'),
(38, 11, 'Price Increased', '2023-09-26 16:45:06', 'Price changed from 1.504 to 1.604'),
(39, 11, 'Price Increased', '2023-09-26 16:47:12', 'Price changed from 1.604 to 1.67'),
(40, 11, 'Price Decreased', '2023-09-26 16:47:49', 'Price changed from 1.67 to 1.57'),
(41, 12, 'Price Decreased', '2023-09-26 16:49:38', 'Price changed from 2.01 to 2.001'),
(42, 12, 'Price Decreased', '2023-09-26 16:51:17', 'Price changed from 2.001 to 1.99'),
(43, 71, 'Refill Deactivated', '2023-09-29 16:47:30', 'Refill Button has been Deativated'),
(44, 71, 'Cancel Deactivated', '2023-09-29 16:47:30', 'Cancel Button has been Deativated'),
(45, 71, 'Price Increased', '2023-09-29 16:47:30', 'Price changed from  to 10.10'),
(46, 71, 'Minimum Increased', '2023-09-29 16:47:30', 'Minimum amount changed from  to 30'),
(47, 71, 'Maximum Increased', '2023-09-29 16:47:30', 'Maximum amount changed from  to 300'),
(48, 71, 'Refill Deactivated', '2023-09-29 16:52:07', 'Refill Button has been Deativated'),
(49, 71, 'Cancel Deactivated', '2023-09-29 16:52:07', 'Cancel Button has been Deativated'),
(50, 71, 'Price Increased', '2023-09-29 16:52:07', 'Price changed from  to 10.00'),
(51, 71, 'Minimum Increased', '2023-09-29 16:52:07', 'Minimum amount changed from  to 30'),
(52, 71, 'Maximum Increased', '2023-09-29 16:52:07', 'Maximum amount changed from  to 300'),
(53, 71, 'Refill Deactivated', '2023-09-29 16:52:56', 'Refill Button has been Deativated'),
(54, 71, 'Cancel Deactivated', '2023-09-29 16:52:56', 'Cancel Button has been Deativated'),
(55, 71, 'Price Increased', '2023-09-29 16:52:56', 'Price changed from  to 15.00'),
(56, 71, 'Minimum Increased', '2023-09-29 16:52:56', 'Minimum amount changed from  to 30'),
(57, 71, 'Maximum Increased', '2023-09-29 16:52:56', 'Maximum amount changed from  to 300'),
(58, 71, 'Refill Deactivated', '2023-09-29 16:53:38', 'Refill Button has been Deativated'),
(59, 71, 'Cancel Deactivated', '2023-09-29 16:53:38', 'Cancel Button has been Deativated'),
(60, 71, 'Price Increased', '2023-09-29 16:53:38', 'Price changed from  to 13.043'),
(61, 71, 'Minimum Increased', '2023-09-29 16:53:38', 'Minimum amount changed from  to 30'),
(62, 71, 'Maximum Increased', '2023-09-29 16:53:38', 'Maximum amount changed from  to 300'),
(63, 71, 'Refill Deactivated', '2023-09-29 16:54:18', 'Refill Button has been Deativated'),
(64, 71, 'Cancel Deactivated', '2023-09-29 16:54:18', 'Cancel Button has been Deativated'),
(65, 71, 'Price Increased', '2023-09-29 16:54:18', 'Price changed from  to 13.083'),
(66, 71, 'Minimum Increased', '2023-09-29 16:54:18', 'Minimum amount changed from  to 30'),
(67, 71, 'Maximum Increased', '2023-09-29 16:54:18', 'Maximum amount changed from  to 300'),
(68, 71, 'Refill Deactivated', '2023-09-29 16:54:58', 'Refill Button has been Deativated'),
(69, 71, 'Cancel Deactivated', '2023-09-29 16:54:58', 'Cancel Button has been Deativated'),
(70, 71, 'Price Increased', '2023-09-29 16:54:58', 'Price changed from  to 13.065'),
(71, 71, 'Minimum Increased', '2023-09-29 16:54:58', 'Minimum amount changed from  to 30'),
(72, 71, 'Maximum Increased', '2023-09-29 16:54:58', 'Maximum amount changed from  to 300'),
(73, 71, 'Refill Deactivated', '2023-09-29 16:56:08', 'Refill Button has been Deativated'),
(74, 71, 'Cancel Deactivated', '2023-09-29 16:56:08', 'Cancel Button has been Deativated'),
(75, 71, 'Price Increased', '2023-09-29 16:56:08', 'Price changed from  to 13.0434'),
(76, 71, 'Minimum Increased', '2023-09-29 16:56:08', 'Minimum amount changed from  to 30'),
(77, 71, 'Maximum Increased', '2023-09-29 16:56:08', 'Maximum amount changed from  to 300'),
(78, 71, 'Refill Deactivated', '2023-09-29 16:57:25', 'Refill Button has been Deativated'),
(79, 71, 'Cancel Deactivated', '2023-09-29 16:57:25', 'Cancel Button has been Deativated'),
(80, 71, 'Price Increased', '2023-09-29 16:57:25', 'Price changed from  to 13.05'),
(81, 71, 'Minimum Increased', '2023-09-29 16:57:25', 'Minimum amount changed from  to 30'),
(82, 71, 'Maximum Increased', '2023-09-29 16:57:25', 'Maximum amount changed from  to 300'),
(83, 72, 'Price Increased', '2023-09-29 17:08:40', 'Price changed from 2.0 to 6.0'),
(84, 72, 'Price Increased', '2023-09-29 17:09:37', 'Price changed from 6.0 to 7.0'),
(85, 75, 'Refill Deactivated', '2023-09-29 22:44:07', 'Refill Button has been Deativated'),
(86, 75, 'Cancel Deactivated', '2023-09-29 22:44:07', 'Cancel Button has been Deativated'),
(87, 75, 'Price Increased', '2023-09-29 22:44:07', 'Price changed from  to 0.60'),
(88, 75, 'Minimum Increased', '2023-09-29 22:44:07', 'Minimum amount changed from  to 50'),
(89, 75, 'Maximum Increased', '2023-09-29 22:44:07', 'Maximum amount changed from  to 50'),
(90, 71, 'Refill Deactivated', '2023-09-29 23:14:57', 'Refill Button has been Deativated'),
(91, 71, 'Cancel Deactivated', '2023-09-29 23:14:57', 'Cancel Button has been Deativated'),
(92, 71, 'Price Increased', '2023-09-29 23:14:57', 'Price changed from  to 13.05'),
(93, 71, 'Minimum Increased', '2023-09-29 23:14:57', 'Minimum amount changed from  to 30'),
(94, 71, 'Maximum Increased', '2023-09-29 23:14:57', 'Maximum amount changed from  to 300'),
(95, 72, 'Price Increased', '2023-09-29 23:17:28', 'Price changed from 7.0 to 10.0'),
(96, 75, 'Refill Deactivated', '2023-09-29 23:50:40', 'Refill Button has been Deativated'),
(97, 75, 'Cancel Deactivated', '2023-09-29 23:50:40', 'Cancel Button has been Deativated'),
(98, 75, 'Price Increased', '2023-09-29 23:50:40', 'Price changed from  to 10.60'),
(99, 75, 'Minimum Increased', '2023-09-29 23:50:40', 'Minimum amount changed from  to 50'),
(100, 75, 'Maximum Increased', '2023-09-29 23:50:40', 'Maximum amount changed from  to 50'),
(101, 71, 'Refill Deactivated', '2023-09-29 23:55:29', 'Refill Button has been Deativated'),
(102, 71, 'Cancel Deactivated', '2023-09-29 23:55:29', 'Cancel Button has been Deativated'),
(103, 71, 'Price Increased', '2023-09-29 23:55:29', 'Price changed from  to 10.06'),
(104, 71, 'Minimum Increased', '2023-09-29 23:55:29', 'Minimum amount changed from  to 30'),
(105, 71, 'Maximum Increased', '2023-09-29 23:55:29', 'Maximum amount changed from  to 300'),
(106, 72, 'Price Increased', '2023-09-29 23:56:10', 'Price changed from 10.0 to 10.06'),
(107, 68, 'Price Increased', '2023-09-30 02:52:42', 'Price changed from 0.01089 to 2.00'),
(108, 68, 'Price Increased', '2023-09-30 02:54:46', 'Price changed from 2.00 to 2.70'),
(109, 78, 'Price Increased', '2023-09-30 02:58:35', 'Price changed from 0.5 to 1.5'),
(110, 78, 'Minimum Increased', '2023-09-30 03:01:27', 'Minimum amount changed from 50 to 100'),
(111, 68, 'Price Decreased', '2023-09-30 03:02:17', 'Price changed from 2.70 to 2.50'),
(112, 68, 'Minimum Decreased', '2023-09-30 03:02:17', 'Minimum amount changed from 500 to 100'),
(113, 68, 'Price Increased', '2023-09-30 03:09:06', 'Price changed from 2.50 to 2.80'),
(114, 80, 'Minimum Increased', '2023-09-30 03:10:01', 'Minimum amount changed from 50 to 100'),
(115, 68, 'Price Decreased', '2023-09-30 03:10:45', 'Price changed from 2.80 to 2.50'),
(116, 47, 'Disabled', '2023-10-02 01:13:52', ''),
(117, 48, 'Price Increased', '2023-10-02 01:16:37', 'Price changed from 1.11 to 1.652'),
(118, 49, 'Disabled', '2023-10-02 01:19:00', ''),
(119, 51, 'Disabled', '2023-10-02 01:19:23', ''),
(120, 51, 'Activated', '2023-10-02 01:19:31', ''),
(121, 50, 'Disabled', '2023-10-02 01:19:35', ''),
(122, 51, 'Price Increased', '2023-10-02 01:20:40', 'Price changed from 1.44 to 1.74'),
(123, 52, 'Price Increased', '2023-10-02 01:27:03', 'Price changed from 1.71 to 1.91'),
(124, 52, 'Disabled', '2023-10-02 01:32:01', ''),
(125, 71, 'Refill Deactivated', '2023-10-02 01:35:45', 'Refill Button has been Deativated'),
(126, 71, 'Cancel Deactivated', '2023-10-02 01:35:45', 'Cancel Button has been Deativated'),
(127, 71, 'Price Increased', '2023-10-02 01:35:45', 'Price changed from  to 10.06'),
(128, 71, 'Minimum Increased', '2023-10-02 01:35:45', 'Minimum amount changed from  to 30'),
(129, 71, 'Maximum Increased', '2023-10-02 01:35:45', 'Maximum amount changed from  to 300'),
(130, 75, 'Refill Deactivated', '2023-10-02 01:36:02', 'Refill Button has been Deativated'),
(131, 75, 'Cancel Deactivated', '2023-10-02 01:36:02', 'Cancel Button has been Deativated'),
(132, 75, 'Price Increased', '2023-10-02 01:36:02', 'Price changed from  to 10.60'),
(133, 75, 'Minimum Increased', '2023-10-02 01:36:02', 'Minimum amount changed from  to 50'),
(134, 75, 'Maximum Increased', '2023-10-02 01:36:02', 'Maximum amount changed from  to 50'),
(135, 71, 'Refill Deactivated', '2023-10-02 01:37:55', 'Refill Button has been Deativated'),
(136, 71, 'Cancel Deactivated', '2023-10-02 01:37:55', 'Cancel Button has been Deativated'),
(137, 71, 'Price Increased', '2023-10-02 01:37:55', 'Price changed from  to 10.06'),
(138, 71, 'Minimum Increased', '2023-10-02 01:37:55', 'Minimum amount changed from  to 30'),
(139, 71, 'Maximum Increased', '2023-10-02 01:37:55', 'Maximum amount changed from  to 300'),
(140, 75, 'Refill Deactivated', '2023-10-02 01:38:08', 'Refill Button has been Deativated'),
(141, 75, 'Cancel Deactivated', '2023-10-02 01:38:08', 'Cancel Button has been Deativated'),
(142, 75, 'Price Increased', '2023-10-02 01:38:08', 'Price changed from  to 10.60'),
(143, 75, 'Minimum Increased', '2023-10-02 01:38:08', 'Minimum amount changed from  to 50'),
(144, 75, 'Maximum Increased', '2023-10-02 01:38:08', 'Maximum amount changed from  to 50'),
(145, 33, 'Refill Deactivated', '2023-10-02 01:39:56', 'Refill Button has been Deativated'),
(146, 33, 'Cancel Deactivated', '2023-10-02 01:39:56', 'Cancel Button has been Deativated'),
(147, 33, 'Price Increased', '2023-10-02 01:39:56', 'Price changed from  to 2.18'),
(148, 33, 'Minimum Increased', '2023-10-02 01:39:56', 'Minimum amount changed from  to 100'),
(149, 33, 'Maximum Increased', '2023-10-02 01:39:56', 'Maximum amount changed from  to 100000'),
(150, 33, 'Refill Deactivated', '2023-10-02 01:47:04', 'Refill Button has been Deativated'),
(151, 33, 'Cancel Deactivated', '2023-10-02 01:47:04', 'Cancel Button has been Deativated'),
(152, 33, 'Price Increased', '2023-10-02 01:47:04', 'Price changed from  to 2.18'),
(153, 33, 'Minimum Increased', '2023-10-02 01:47:04', 'Minimum amount changed from  to 100'),
(154, 33, 'Maximum Increased', '2023-10-02 01:47:04', 'Maximum amount changed from  to 100000'),
(155, 34, 'Disabled', '2023-10-02 02:01:21', ''),
(156, 35, 'Disabled', '2023-10-02 02:01:32', ''),
(157, 36, 'Disabled', '2023-10-02 02:01:45', ''),
(158, 37, 'Disabled', '2023-10-02 02:01:56', ''),
(159, 38, 'Disabled', '2023-10-02 02:02:11', ''),
(160, 39, 'Disabled', '2023-10-02 02:02:21', ''),
(161, 40, 'Disabled', '2023-10-02 02:06:24', ''),
(162, 46, 'Disabled', '2023-10-02 02:06:41', ''),
(163, 45, 'Price Increased', '2023-10-02 02:07:31', 'Price changed from 1.935 to 2.335'),
(164, 41, 'Disabled', '2023-10-02 02:07:52', ''),
(165, 42, 'Disabled', '2023-10-02 02:08:10', ''),
(166, 43, 'Disabled', '2023-10-02 02:08:45', ''),
(167, 44, 'Disabled', '2023-10-02 02:09:05', ''),
(168, 296, 'Refill Deactivated', '2023-10-02 02:16:59', 'Refill Button has been Deativated'),
(169, 296, 'Cancel Deactivated', '2023-10-02 02:16:59', 'Cancel Button has been Deativated'),
(170, 296, 'Price Increased', '2023-10-02 02:16:59', 'Price changed from  to 2.18'),
(171, 296, 'Minimum Increased', '2023-10-02 02:16:59', 'Minimum amount changed from  to 1000'),
(172, 296, 'Maximum Increased', '2023-10-02 02:16:59', 'Maximum amount changed from  to 100000'),
(173, 296, 'Refill Deactivated', '2023-10-02 02:18:15', 'Refill Button has been Deativated'),
(174, 296, 'Cancel Deactivated', '2023-10-02 02:18:15', 'Cancel Button has been Deativated'),
(175, 296, 'Price Increased', '2023-10-02 02:18:15', 'Price changed from  to 2.18'),
(176, 296, 'Minimum Increased', '2023-10-02 02:18:15', 'Minimum amount changed from  to 1000'),
(177, 296, 'Maximum Increased', '2023-10-02 02:18:15', 'Maximum amount changed from  to 100000'),
(178, 81, 'Price Decreased', '2023-10-02 12:47:04', 'Price changed from 3.00 to 2.50'),
(179, 80, 'Price Increased', '2023-10-02 12:48:05', 'Price changed from 2.80 to 2.89'),
(180, 82, 'Price Increased', '2023-10-02 12:48:56', 'Price changed from 0.792 to 1.792'),
(181, 83, 'Price Increased', '2023-10-02 12:49:35', 'Price changed from 1.584 to 3.584'),
(182, 58, 'Price Increased', '2023-10-02 13:18:57', 'Price changed from 0.8025 to 0.9025'),
(183, 59, 'Price Increased', '2023-10-02 13:19:24', 'Price changed from 0.8025 to 0.9025'),
(184, 60, 'Price Increased', '2023-10-02 13:21:28', 'Price changed from 0.8025 to 1.15'),
(185, 58, 'Price Increased', '2023-10-02 13:22:12', 'Price changed from 0.9025 to 1.15'),
(186, 59, 'Price Increased', '2023-10-02 13:23:06', 'Price changed from 0.9025 to 1.15'),
(187, 61, 'Price Increased', '2023-10-02 13:24:03', 'Price changed from 0.8025 to 1.15'),
(188, 62, 'Price Increased', '2023-10-02 13:24:43', 'Price changed from 0.8025 to 1.15'),
(189, 63, 'Price Increased', '2023-10-02 13:25:23', 'Price changed from 0.8025 to 1.15'),
(190, 64, 'Price Increased', '2023-10-02 13:25:58', 'Price changed from 0.8025 to 1.15'),
(191, 91, 'Price Increased', '2023-10-02 13:39:01', 'Price changed from 0.649 to 0.949'),
(192, 92, 'Price Increased', '2023-10-02 13:40:54', 'Price changed from 0.649 to 0.949'),
(193, 40, 'Activated', '2023-10-03 13:39:35', ''),
(194, 45, 'Disabled', '2023-10-03 13:40:16', ''),
(195, 40, 'Price Increased', '2023-10-03 13:42:06', 'Price changed from 1.545 to 2.345'),
(196, 108, 'Disabled', '2023-10-03 13:48:44', ''),
(197, 109, 'Disabled', '2023-10-03 13:49:00', ''),
(198, 110, 'Disabled', '2023-10-03 13:49:39', ''),
(199, 111, 'Disabled', '2023-10-03 14:08:43', ''),
(200, 53, 'Disabled', '2023-10-03 19:30:13', ''),
(201, 298, 'Minimum Decreased', '2023-10-03 21:42:55', 'Minimum amount changed from 10000 to 1000'),
(202, 55, 'Price Decreased', '2023-10-04 02:59:32', 'Price changed from 2.01 to 0.49'),
(203, 55, 'Price Decreased', '2023-10-04 03:02:46', 'Price changed from 0.49 to 0.484'),
(204, 55, 'Disabled', '2023-10-04 03:07:15', ''),
(205, 135, 'Disabled', '2023-10-10 17:40:26', ''),
(206, 136, 'Disabled', '2023-10-10 17:40:26', ''),
(207, 137, 'Disabled', '2023-10-10 17:40:26', ''),
(208, 138, 'Disabled', '2023-10-10 17:40:26', ''),
(209, 139, 'Disabled', '2023-10-10 17:40:26', ''),
(210, 140, 'Disabled', '2023-10-10 17:40:26', ''),
(211, 141, 'Disabled', '2023-10-10 17:40:26', ''),
(212, 142, 'Disabled', '2023-10-10 17:40:26', ''),
(213, 143, 'Disabled', '2023-10-10 17:40:26', ''),
(214, 144, 'Disabled', '2023-10-10 17:40:26', ''),
(215, 145, 'Disabled', '2023-10-10 17:40:26', ''),
(216, 146, 'Disabled', '2023-10-10 17:40:26', ''),
(217, 147, 'Disabled', '2023-10-10 17:40:26', ''),
(218, 148, 'Disabled', '2023-10-10 17:40:26', ''),
(219, 149, 'Disabled', '2023-10-10 17:40:26', ''),
(220, 150, 'Disabled', '2023-10-10 17:40:26', ''),
(221, 151, 'Disabled', '2023-10-10 17:40:26', ''),
(222, 152, 'Disabled', '2023-10-10 17:40:26', ''),
(223, 153, 'Disabled', '2023-10-10 17:40:26', ''),
(224, 154, 'Disabled', '2023-10-10 17:40:26', ''),
(225, 155, 'Disabled', '2023-10-10 17:40:26', ''),
(226, 156, 'Disabled', '2023-10-10 17:40:26', ''),
(227, 157, 'Disabled', '2023-10-10 17:40:26', ''),
(228, 158, 'Disabled', '2023-10-10 17:40:26', ''),
(229, 159, 'Disabled', '2023-10-10 17:40:26', ''),
(230, 160, 'Disabled', '2023-10-10 17:40:26', ''),
(231, 161, 'Disabled', '2023-10-10 17:40:26', ''),
(232, 162, 'Disabled', '2023-10-10 17:40:26', ''),
(233, 163, 'Disabled', '2023-10-10 17:40:26', ''),
(234, 164, 'Disabled', '2023-10-10 17:40:26', ''),
(235, 165, 'Disabled', '2023-10-10 17:40:26', ''),
(236, 166, 'Disabled', '2023-10-10 17:40:26', ''),
(237, 167, 'Disabled', '2023-10-10 17:40:26', ''),
(238, 168, 'Disabled', '2023-10-10 17:40:26', ''),
(239, 169, 'Disabled', '2023-10-10 17:40:26', ''),
(240, 170, 'Disabled', '2023-10-10 17:40:26', ''),
(241, 171, 'Disabled', '2023-10-10 17:40:26', ''),
(242, 172, 'Disabled', '2023-10-10 17:40:26', ''),
(243, 173, 'Disabled', '2023-10-10 17:40:26', ''),
(244, 174, 'Disabled', '2023-10-10 17:40:26', ''),
(245, 175, 'Disabled', '2023-10-10 17:40:26', ''),
(246, 176, 'Disabled', '2023-10-10 17:40:26', ''),
(247, 177, 'Disabled', '2023-10-10 17:40:26', ''),
(248, 178, 'Disabled', '2023-10-10 17:40:26', ''),
(249, 179, 'Disabled', '2023-10-10 17:40:26', ''),
(250, 180, 'Disabled', '2023-10-10 17:40:26', ''),
(251, 181, 'Disabled', '2023-10-10 17:40:26', ''),
(252, 182, 'Disabled', '2023-10-10 17:40:26', ''),
(253, 183, 'Disabled', '2023-10-10 17:40:26', ''),
(254, 184, 'Disabled', '2023-10-10 17:40:26', ''),
(255, 185, 'Disabled', '2023-10-10 17:40:26', ''),
(256, 186, 'Disabled', '2023-10-10 17:40:26', ''),
(257, 187, 'Disabled', '2023-10-10 17:40:26', ''),
(258, 188, 'Disabled', '2023-10-10 17:40:26', ''),
(259, 189, 'Disabled', '2023-10-10 17:40:26', ''),
(260, 190, 'Disabled', '2023-10-10 17:40:26', ''),
(261, 191, 'Disabled', '2023-10-10 17:40:26', ''),
(262, 192, 'Disabled', '2023-10-10 17:40:26', ''),
(263, 193, 'Disabled', '2023-10-10 17:40:26', ''),
(264, 194, 'Disabled', '2023-10-10 17:40:26', ''),
(265, 195, 'Disabled', '2023-10-10 17:40:26', ''),
(266, 196, 'Disabled', '2023-10-10 17:40:26', ''),
(267, 197, 'Disabled', '2023-10-10 17:40:26', ''),
(268, 198, 'Disabled', '2023-10-10 17:40:26', ''),
(269, 199, 'Disabled', '2023-10-10 17:40:26', ''),
(270, 200, 'Disabled', '2023-10-10 17:40:26', ''),
(271, 201, 'Disabled', '2023-10-10 17:40:26', ''),
(272, 202, 'Disabled', '2023-10-10 17:40:26', ''),
(273, 203, 'Disabled', '2023-10-10 17:40:26', ''),
(274, 204, 'Disabled', '2023-10-10 17:40:26', ''),
(275, 205, 'Disabled', '2023-10-10 17:40:26', ''),
(276, 206, 'Disabled', '2023-10-10 17:40:26', ''),
(277, 207, 'Disabled', '2023-10-10 17:40:26', ''),
(278, 208, 'Disabled', '2023-10-10 17:40:26', ''),
(279, 209, 'Disabled', '2023-10-10 17:40:26', ''),
(280, 210, 'Disabled', '2023-10-10 17:40:26', ''),
(281, 211, 'Disabled', '2023-10-10 17:40:26', ''),
(282, 212, 'Disabled', '2023-10-10 17:40:26', ''),
(283, 213, 'Disabled', '2023-10-10 17:40:26', ''),
(284, 214, 'Disabled', '2023-10-10 17:40:26', ''),
(285, 215, 'Disabled', '2023-10-10 17:40:26', ''),
(286, 216, 'Disabled', '2023-10-10 17:40:26', ''),
(287, 217, 'Disabled', '2023-10-10 17:40:26', ''),
(288, 218, 'Disabled', '2023-10-10 17:40:26', ''),
(289, 219, 'Disabled', '2023-10-10 17:40:26', ''),
(290, 220, 'Disabled', '2023-10-10 17:40:26', ''),
(291, 221, 'Disabled', '2023-10-10 17:40:26', ''),
(292, 222, 'Disabled', '2023-10-10 17:40:26', ''),
(293, 223, 'Disabled', '2023-10-10 17:40:26', ''),
(294, 224, 'Disabled', '2023-10-10 17:40:26', ''),
(295, 225, 'Disabled', '2023-10-10 17:40:26', ''),
(296, 226, 'Disabled', '2023-10-10 17:40:26', ''),
(297, 227, 'Disabled', '2023-10-10 17:40:26', ''),
(298, 228, 'Disabled', '2023-10-10 17:40:26', ''),
(299, 229, 'Disabled', '2023-10-10 17:40:26', ''),
(300, 230, 'Disabled', '2023-10-10 17:40:26', ''),
(301, 231, 'Disabled', '2023-10-10 17:40:26', ''),
(302, 232, 'Disabled', '2023-10-10 17:40:26', ''),
(303, 233, 'Disabled', '2023-10-10 17:40:26', ''),
(304, 234, 'Disabled', '2023-10-10 17:40:26', ''),
(305, 235, 'Disabled', '2023-10-10 17:40:26', ''),
(306, 236, 'Disabled', '2023-10-10 17:40:26', ''),
(307, 237, 'Disabled', '2023-10-10 17:40:26', ''),
(308, 238, 'Disabled', '2023-10-10 17:40:26', ''),
(309, 239, 'Disabled', '2023-10-10 17:40:26', ''),
(310, 240, 'Disabled', '2023-10-10 17:40:26', ''),
(311, 241, 'Disabled', '2023-10-10 17:40:26', ''),
(312, 242, 'Disabled', '2023-10-10 17:40:26', ''),
(313, 243, 'Disabled', '2023-10-10 17:40:26', ''),
(314, 244, 'Disabled', '2023-10-10 17:40:26', ''),
(315, 299, 'Refill Deactivated', '2023-11-10 10:14:48', 'Refill Button has been Deativated'),
(316, 299, 'Cancel Deactivated', '2023-11-10 10:14:48', 'Cancel Button has been Deativated'),
(317, 299, 'Price Increased', '2023-11-10 10:14:48', 'Price changed from  to 5'),
(318, 299, 'Minimum Increased', '2023-11-10 10:14:48', 'Minimum amount changed from  to 1000'),
(319, 299, 'Maximum Increased', '2023-11-10 10:14:48', 'Maximum amount changed from  to 1000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulkedit`
--
ALTER TABLE `bulkedit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `childpanels`
--
ALTER TABLE `childpanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earn`
--
ALTER TABLE `earn`
  ADD PRIMARY KEY (`earn_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `General_options`
--
ALTER TABLE `General_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Mailforms`
--
ALTER TABLE `Mailforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `panel_categories`
--
ALTER TABLE `panel_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_info`
--
ALTER TABLE `panel_info`
  ADD PRIMARY KEY (`panel_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methodsold`
--
ALTER TABLE `payment_methodsold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`referral_id`);

--
-- Indexes for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  ADD PRIMARY KEY (`r_p_id`);

--
-- Indexes for table `refill_status`
--
ALTER TABLE `refill_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sync_logs`
--
ALTER TABLE `sync_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `units_per_page`
--
ALTER TABLE `units_per_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bulkedit`
--
ALTER TABLE `bulkedit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `childpanels`
--
ALTER TABLE `childpanels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `earn`
--
ALTER TABLE `earn`
  MODIFY `earn_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `General_options`
--
ALTER TABLE `General_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `integrations`
--
ALTER TABLE `integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Mailforms`
--
ALTER TABLE `Mailforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200224;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=915;

--
-- AUTO_INCREMENT for table `panel_categories`
--
ALTER TABLE `panel_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_info`
--
ALTER TABLE `panel_info`
  MODIFY `panel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1147;

--
-- AUTO_INCREMENT for table `payment_methodsold`
--
ALTER TABLE `payment_methodsold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `referral`
--
ALTER TABLE `referral`
  MODIFY `referral_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  MODIFY `r_p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refill_status`
--
ALTER TABLE `refill_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sync_logs`
--
ALTER TABLE `sync_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `units_per_page`
--
ALTER TABLE `units_per_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
