-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2024 at 01:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gad_db_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(4) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE `campus` (
  `campus_id` varchar(4) NOT NULL,
  `campus_name` varchar(255) NOT NULL,
  `campus_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `college_id` varchar(5) NOT NULL,
  `college_name` varchar(255) NOT NULL,
  `campus_id` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `submission_id` varchar(16) NOT NULL,
  `evaluator_id` varchar(5) NOT NULL,
  `proponent_id` varchar(4) NOT NULL,
  `content` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evaluator`
--

CREATE TABLE `evaluator` (
  `evaluator_id` varchar(4) NOT NULL,
  `campus_id` varchar(4) NOT NULL,
  `college_id` varchar(4) NOT NULL,
  `office_id` varchar(6) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` varchar(6) NOT NULL,
  `office_name` varchar(255) NOT NULL,
  `campus_id` varchar(4) NOT NULL,
  `college_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proponent`
--

CREATE TABLE `proponent` (
  `proponent_id` varchar(5) NOT NULL,
  `campus_id` varchar(4) NOT NULL,
  `college_id` varchar(4) NOT NULL,
  `office_id` varchar(6) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `emai` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `remarks`
--

CREATE TABLE `remarks` (
  `remarks_id` varchar(7) NOT NULL,
  `submission_id` varchar(16) NOT NULL,
  `remarks` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `submission_id` varchar(16) NOT NULL,
  `proponent_id` varchar(5) NOT NULL,
  `evaluator_id` varchar(4) NOT NULL,
  `campus_id` varchar(4) NOT NULL,
  `college_id` varchar(4) NOT NULL,
  `office_id` varchar(6) NOT NULL,
  `proposal_title` text NOT NULL,
  `proponents` text NOT NULL,
  `proposal_description` text NOT NULL,
  `resources_link` varchar(512) NOT NULL,
  `status` char(20) NOT NULL,
  `remarks_id` varchar(7) NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`campus_id`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`college_id`),
  ADD KEY `campus_id` (`campus_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD UNIQUE KEY `submission_id` (`submission_id`),
  ADD UNIQUE KEY `evaluator_id` (`evaluator_id`),
  ADD UNIQUE KEY `proponent_id` (`proponent_id`);

--
-- Indexes for table `evaluator`
--
ALTER TABLE `evaluator`
  ADD PRIMARY KEY (`evaluator_id`),
  ADD UNIQUE KEY `campus_id` (`campus_id`),
  ADD UNIQUE KEY `college_id` (`college_id`),
  ADD UNIQUE KEY `office_id` (`office_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `campus_id` (`campus_id`),
  ADD KEY `college_id` (`college_id`);

--
-- Indexes for table `proponent`
--
ALTER TABLE `proponent`
  ADD PRIMARY KEY (`proponent_id`),
  ADD UNIQUE KEY `campus_id` (`campus_id`),
  ADD UNIQUE KEY `college_id` (`college_id`),
  ADD UNIQUE KEY `office_id` (`office_id`);

--
-- Indexes for table `remarks`
--
ALTER TABLE `remarks`
  ADD PRIMARY KEY (`remarks_id`),
  ADD UNIQUE KEY `submission_id` (`submission_id`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`submission_id`),
  ADD UNIQUE KEY `proponent_id` (`proponent_id`),
  ADD UNIQUE KEY `evaluator_id` (`evaluator_id`),
  ADD UNIQUE KEY `campus_id` (`campus_id`),
  ADD UNIQUE KEY `college_id` (`college_id`),
  ADD UNIQUE KEY `office_id` (`office_id`),
  ADD UNIQUE KEY `remarks_id` (`remarks_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `college`
--
ALTER TABLE `college`
  ADD CONSTRAINT `college_ibfk_1` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`);

--
-- Constraints for table `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `office_ibfk_1` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`),
  ADD CONSTRAINT `office_ibfk_2` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
