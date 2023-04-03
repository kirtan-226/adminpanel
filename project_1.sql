-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2023 at 07:48 PM
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'ND'),
(2, 'SN'),
(3, 'NR'),
(4, 'S'),
(5, 'SS'),
(6, 'SK'),
(7, 'GK'),
(8, 'SSPN'),
(9, 'IT'),
(10, 'KOS'),
(11, 'DN'),
(12, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `change_id`
--

CREATE TABLE `change_id` (
  `id` int(11) NOT NULL,
  `change` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `change_id`
--

INSERT INTO `change_id` (`id`, `change`) VALUES
(1, '2'),
(2, '4'),
(3, '7'),
(4, '15');

-- --------------------------------------------------------

--
-- Table structure for table `devotee`
--

CREATE TABLE `devotee` (
  `id` int(11) NOT NULL,
  `mandal_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `relation_id` int(11) NOT NULL DEFAULT 1,
  `occupation_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `study_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `change_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devotee`
--

INSERT INTO `devotee` (`id`, `mandal_id`, `category_id`, `name`, `birthdate`, `age`, `relation_id`, `occupation_id`, `company_name`, `phone_number`, `address`, `study_id`, `shift_id`, `change_id`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 1, 5, 'Kirtan J Limbachiya', '2001-06-22', 21, 1, 4, '', '9106617646', 'Luvkush appartment', 13, 5, 4, '2023-04-02 20:15:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `devotee_family`
--

CREATE TABLE `devotee_family` (
  `id` int(11) NOT NULL,
  `devotee_id` int(11) NOT NULL,
  `mandal_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `relation_id` int(11) NOT NULL DEFAULT 1,
  `birthdate` date DEFAULT NULL,
  `age` int(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `occupation_id` int(11) DEFAULT 4,
  `company_name` varchar(255) NOT NULL,
  `study_id` int(11) DEFAULT 14,
  `shift_id` int(11) DEFAULT NULL,
  `change_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devotee_family`
--

INSERT INTO `devotee_family` (`id`, `devotee_id`, `mandal_id`, `category_id`, `name`, `relation_id`, `birthdate`, `age`, `address`, `phone_number`, `occupation_id`, `company_name`, `study_id`, `shift_id`, `change_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 5, 'Kirtan J Limbachiya', 1, '2001-06-22', 21, 'Luvkush appartment', '9106617646', 4, '', 13, 5, 4, '2023-04-02 20:15:33', NULL, NULL),
(2, 1, 1, 6, 'Jagdishbhai', 2, '1973-10-05', 49, 'Luvkush appartment', '8734866391', 1, 'Sanofi', 14, 2, 4, '2023-04-02 20:50:20', NULL, NULL);

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
(3, 'night', NULL, NULL, NULL),
(4, 'general', NULL, NULL, NULL),
(5, 'none', NULL, NULL, NULL);

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
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `change_id`
--
ALTER TABLE `change_id`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devotee`
--
ALTER TABLE `devotee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mandal_foreign_key` (`mandal_id`),
  ADD KEY `occupation_foreign_key` (`occupation_id`),
  ADD KEY `study_foreign_key` (`study_id`),
  ADD KEY `shift_id_foreign_key` (`shift_id`),
  ADD KEY `relation_id_foriegn_key` (`relation_id`),
  ADD KEY `change_id_foreign_key` (`change_id`),
  ADD KEY `category_id_foriegn_key` (`category_id`);

--
-- Indexes for table `devotee_family`
--
ALTER TABLE `devotee_family`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devotee_foreign_key` (`devotee_id`),
  ADD KEY `relation_foreign_key` (`relation_id`),
  ADD KEY `occupation_foreign_key` (`occupation_id`),
  ADD KEY `shift_foreign_key` (`shift_id`),
  ADD KEY `study_foreign_key` (`study_id`),
  ADD KEY `change_foreign_key` (`change_id`),
  ADD KEY `category_id2_foriegn_key` (`category_id`);

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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `change_id`
--
ALTER TABLE `change_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `devotee`
--
ALTER TABLE `devotee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `devotee_family`
--
ALTER TABLE `devotee_family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `category_id_foriegn_key` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `change_id_foreign_key` FOREIGN KEY (`change_id`) REFERENCES `change_id` (`id`),
  ADD CONSTRAINT `occupation_id_foriegn_key` FOREIGN KEY (`occupation_id`) REFERENCES `occupation` (`id`),
  ADD CONSTRAINT `relation_id_foriegn_key` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`id`),
  ADD CONSTRAINT `shift_id_foreign_key` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`),
  ADD CONSTRAINT `study_id` FOREIGN KEY (`study_id`) REFERENCES `study` (`id`);

--
-- Constraints for table `devotee_family`
--
ALTER TABLE `devotee_family`
  ADD CONSTRAINT `category_id2_foriegn_key` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `change_foreign_key` FOREIGN KEY (`change_id`) REFERENCES `change_id` (`id`),
  ADD CONSTRAINT `occupation_id2_foriegn_key` FOREIGN KEY (`occupation_id`) REFERENCES `occupation` (`id`),
  ADD CONSTRAINT `relation_id2_foriegn_key` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`id`),
  ADD CONSTRAINT `shift_id2_foriegn_key` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`),
  ADD CONSTRAINT `study_foreign_key` FOREIGN KEY (`study_id`) REFERENCES `study` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
