-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 11:42 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
('admin', 'admin', '2023-03-02 22:08:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `devotee`
--

CREATE TABLE `devotee` (
  `id` int(11) NOT NULL,
  `mandal_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `relation_id` int(11) NOT NULL DEFAULT 1,
  `occupation_id` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `study_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devotee`
--

INSERT INTO `devotee` (`id`, `mandal_id`, `name`, `birthdate`, `age`, `relation_id`, `occupation_id`, `phone_number`, `address`, `study_id`, `shift_id`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 1, 'Kirtan J Limbachiya', '2001-06-22', 21, 1, 2, '9106617646', 'tuldiham', 13, NULL, '2023-03-09 14:21:45', NULL, NULL),
(2, 1, 'test2', '2023-03-08', 0, 1, 2, '1212121212', 'ghghghghgh', 3, NULL, '2023-03-09 14:30:48', '2023-03-09 14:31:57', NULL),
(3, 1, 'test2', '2023-03-09', 0, 1, 4, '54554545', 'tulsidham', 13, NULL, '2023-03-09 15:10:27', '2023-03-09 15:10:29', NULL),
(4, 2, 'Jayveersinh Mahida', '2002-05-04', 20, 1, 1, '1212121212', 'tuldiham', 13, NULL, '2023-03-09 15:11:45', '2023-03-10 10:36:30', NULL),
(5, 3, 'family 1', '2001-06-18', 21, 1, 1, '54554545', 'sdsdsd', 12, NULL, '2023-03-10 10:31:41', NULL, NULL),
(6, 3, 'family 2', '2016-06-08', 6, 1, 2, '1212121212', 'sdsdsd', 3, NULL, '2023-03-10 10:42:26', NULL, NULL),
(7, 3, 'family 3', '2010-02-02', 13, 1, 2, '54554545', 'tuldiham', 3, NULL, '2023-03-10 10:44:39', '2023-03-10 11:02:58', NULL),
(8, 3, 'family 4', '0000-00-00', 14, 1, 3, '8734866391', 'Luvkush appartment', 14, NULL, '2023-03-10 11:01:33', '2023-03-10 11:03:01', NULL),
(9, 3, 'family 5', '0000-00-00', 19, 1, 1, '1212121212', 'Luvkush appartment', 11, NULL, '2023-03-10 11:02:10', '2023-03-10 11:02:56', NULL),
(10, 3, 'family6', '0000-00-00', 22, 1, 3, '8585858585', 'Luvkush appartment', 6, NULL, '2023-03-10 11:03:24', '2023-03-10 11:51:21', NULL),
(11, 3, 'family 7 ', '0000-00-00', 23, 1, 3, '1212121212', 'Luvkush appartment', 3, NULL, '2023-03-10 11:17:22', '2023-03-10 11:51:24', NULL),
(12, 3, 'family 8', '2003-02-26', 20, 1, 3, '54554545', 'Luvkush appartment', 9, NULL, '2023-03-10 11:35:05', '2023-03-10 11:51:26', NULL),
(13, 3, 'family 9 ', '0000-00-00', -1, 1, 4, '8585858585', 'sdsdsd', 14, NULL, '2023-03-10 11:36:41', '2023-03-10 11:51:20', NULL),
(14, 3, 'family 10', NULL, 23, 1, 4, '8585858585', 'sdsdsd', 14, NULL, '2023-03-10 11:47:51', '2023-03-10 11:51:28', NULL),
(15, 3, 'family 11', NULL, 24, 1, 4, '8734866391', 'shaktinath', 14, NULL, '2023-03-10 11:48:29', '2023-03-10 11:51:17', NULL),
(16, 3, 'family14', NULL, 12, 1, 2, '', 'tulsidham', 4, NULL, '2023-03-10 11:51:54', NULL, NULL),
(17, 3, 'family 15', '2007-02-28', 16, 1, 4, '54554545', 'ghghghghgh', 14, NULL, '2023-03-10 11:57:21', NULL, NULL),
(18, 3, 'family 26', '2005-07-07', 17, 1, 4, '54554545', 'ghghghghgh', 14, NULL, '2023-03-10 11:59:58', '2023-03-10 12:36:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `devotee_family`
--

CREATE TABLE `devotee_family` (
  `id` int(11) NOT NULL,
  `devotee_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `relation_id` int(11) NOT NULL DEFAULT 1,
  `birthdate` date DEFAULT NULL,
  `age` int(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `occupation_id` int(11) DEFAULT 4,
  `study_id` int(11) DEFAULT 14,
  `shift_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devotee_family`
--

INSERT INTO `devotee_family` (`id`, `devotee_id`, `name`, `relation_id`, `birthdate`, `age`, `address`, `phone_number`, `occupation_id`, `study_id`, `shift_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Kirtan J Limbachiya', 1, '2001-06-22', 21, 'tuldiham', '9106617646', 2, 13, NULL, '2023-03-09 14:21:45', NULL, NULL),
(2, 2, 'test2', 1, '2023-03-08', 0, 'ghghghghgh', '1212121212', 2, 3, NULL, '2023-03-09 14:30:48', NULL, '2023-03-09 14:31:57'),
(3, 1, 'Member 1', 9, '2008-06-09', 14, 'tuldiham', '54554545', 4, 12, NULL, '2023-03-09 14:47:53', '2023-03-09 15:06:07', '2023-03-09 15:09:40'),
(4, 2, 'test2', 1, '2023-03-09', 0, 'tulsidham', '54554545', 4, 13, NULL, '2023-03-09 15:10:27', NULL, NULL),
(5, 4, 'Jayveersinh Mahida', 1, '2002-05-04', 20, 'tuldiham', '1212121212', 1, 13, NULL, '2023-03-09 15:11:45', NULL, '2023-03-10 10:36:30'),
(6, 5, 'family 1', 1, '2001-06-18', 21, 'sdsdsd', '54554545', 1, 12, NULL, '2023-03-10 10:31:41', NULL, NULL),
(7, 6, 'family 2', 1, '2016-06-08', 6, 'sdsdsd', '1212121212', 2, 3, NULL, '2023-03-10 10:42:26', NULL, NULL),
(8, 7, 'family 3', 1, '2010-02-02', 13, 'tuldiham', '54554545', 2, 3, NULL, '2023-03-10 10:44:39', NULL, '2023-03-10 11:02:58'),
(9, 8, 'family 4', 1, '0000-00-00', 14, 'Luvkush appartment', '8734866391', 3, 14, NULL, '2023-03-10 11:01:33', NULL, '2023-03-10 11:03:01'),
(10, 9, 'family 5', 1, '0000-00-00', 19, 'Luvkush appartment', '1212121212', 1, 11, NULL, '2023-03-10 11:02:10', NULL, '2023-03-10 11:02:56'),
(11, 10, 'family6', 1, '0000-00-00', 22, 'Luvkush appartment', '8585858585', 3, 6, NULL, '2023-03-10 11:03:24', NULL, '2023-03-10 11:51:21'),
(12, 11, 'family 7 ', 1, '0000-00-00', 23, 'Luvkush appartment', '1212121212', 3, 3, NULL, '2023-03-10 11:17:22', NULL, '2023-03-10 11:51:24'),
(13, 12, 'family 8', 1, '2003-02-26', 20, 'Luvkush appartment', '54554545', 3, 9, NULL, '2023-03-10 11:35:05', NULL, '2023-03-10 11:51:26'),
(14, 13, 'family 9 ', 1, '0000-00-00', -1, 'sdsdsd', '8585858585', 4, 14, NULL, '2023-03-10 11:36:41', NULL, '2023-03-10 11:51:20'),
(15, 14, 'family 10', 1, NULL, 23, 'sdsdsd', '8585858585', 4, 14, NULL, '2023-03-10 11:47:51', NULL, '2023-03-10 11:51:28'),
(16, 15, 'family 11', 1, NULL, 24, 'shaktinath', '8734866391', 4, 14, NULL, '2023-03-10 11:48:29', NULL, '2023-03-10 11:51:17'),
(17, 16, 'family14', 1, NULL, 12, 'tulsidham', '', 2, 4, NULL, '2023-03-10 11:51:54', NULL, NULL),
(18, 17, 'family 15', 1, '2007-02-28', 16, 'ghghghghgh', '54554545', 4, 14, NULL, '2023-03-10 11:57:21', NULL, NULL),
(19, 18, 'family 26', 1, '2005-07-07', 17, 'ghghghghgh', '54554545', 4, 14, NULL, '2023-03-10 11:59:58', NULL, '2023-03-10 12:36:23'),
(20, 5, 'member 45', 9, '2023-03-16', -1, 'tulsidham', '8734866391', 4, 14, NULL, '2023-03-10 12:17:53', NULL, '2023-03-10 12:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `mandal`
--

CREATE TABLE `mandal` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mandal`
--

INSERT INTO `mandal` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'zone 1', '2023-03-09 14:09:54', NULL, NULL),
(2, 'zone 2', '2023-03-09 14:09:59', NULL, NULL),
(3, 'zone 3', '2023-03-09 14:10:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `occupation`
--

CREATE TABLE `occupation` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `occupation`
--

INSERT INTO `occupation` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Job', '2023-03-03 22:37:47', NULL, NULL),
(2, 'business', '2023-03-03 22:37:47', NULL, NULL),
(3, 'Housewife', '2023-03-03 22:38:04', NULL, NULL),
(4, 'none', '2023-03-04 18:30:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE `relation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relation`
--

INSERT INTO `relation` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Head', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Father', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Son', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Daughter', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Grandfather', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Grandmother', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Brother', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Sister', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'first', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'second', NULL, NULL, NULL),
(3, 'general', NULL, NULL, NULL),
(4, 'none', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `study`
--

CREATE TABLE `study` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `study`
--

INSERT INTO `study` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', NULL, NULL, NULL),
(2, '2', NULL, NULL, NULL),
(3, '3', NULL, NULL, NULL),
(4, '4', NULL, NULL, NULL),
(5, '5', NULL, NULL, NULL),
(6, '6', NULL, NULL, NULL),
(7, '7', NULL, NULL, NULL),
(8, '8', NULL, NULL, NULL),
(9, '9', NULL, NULL, NULL),
(10, '10', NULL, NULL, NULL),
(11, '11', NULL, NULL, NULL),
(12, '12', NULL, NULL, NULL),
(13, 'Grad/Post-Grad', NULL, NULL, NULL),
(14, 'none', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devotee`
--
ALTER TABLE `devotee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mandal_foreign_key` (`mandal_id`),
  ADD KEY `occupation_foreign_key` (`occupation_id`),
  ADD KEY `study_foreign_key` (`study_id`),
  ADD KEY `shift_id_foreign_key` (`shift_id`),
  ADD KEY `relation_id_foriegn_key` (`relation_id`);

--
-- Indexes for table `devotee_family`
--
ALTER TABLE `devotee_family`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devotee_foreign_key` (`devotee_id`),
  ADD KEY `relation_foreign_key` (`relation_id`),
  ADD KEY `occupation_foreign_key` (`occupation_id`),
  ADD KEY `shift_foreign_key` (`shift_id`),
  ADD KEY `study_foreign_key` (`study_id`);

--
-- Indexes for table `mandal`
--
ALTER TABLE `mandal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occupation`
--
ALTER TABLE `occupation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relation`
--
ALTER TABLE `relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `study`
--
ALTER TABLE `study`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devotee`
--
ALTER TABLE `devotee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `devotee_family`
--
ALTER TABLE `devotee_family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mandal`
--
ALTER TABLE `mandal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `occupation`
--
ALTER TABLE `occupation`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `relation`
--
ALTER TABLE `relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `study`
--
ALTER TABLE `study`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `devotee`
--
ALTER TABLE `devotee`
  ADD CONSTRAINT `occupation_id_foriegn_key` FOREIGN KEY (`occupation_id`) REFERENCES `occupation` (`id`),
  ADD CONSTRAINT `relation_id_foriegn_key` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`id`),
  ADD CONSTRAINT `shift_id_foreign_key` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`),
  ADD CONSTRAINT `study_id` FOREIGN KEY (`study_id`) REFERENCES `study` (`id`);

--
-- Constraints for table `devotee_family`
--
ALTER TABLE `devotee_family`
  ADD CONSTRAINT `occupation_id2_foriegn_key` FOREIGN KEY (`occupation_id`) REFERENCES `occupation` (`id`),
  ADD CONSTRAINT `relation_id2_foriegn_key` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`id`),
  ADD CONSTRAINT `shift_id2_foriegn_key` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`),
  ADD CONSTRAINT `study_foreign_key` FOREIGN KEY (`study_id`) REFERENCES `study` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
