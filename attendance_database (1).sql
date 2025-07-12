-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2025 at 07:50 PM
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
-- Database: `attendance_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `role` enum('resources','quality','tech') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `access_token` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `code`, `role`, `created_at`, `access_token`) VALUES
(5, 'جود الطاسان', '1234', 'resources', '2025-07-12 17:30:38', 'e2fd92bc423a98e63260939f0f5df782'),
(6, 'بشاير الحربي', '5678', 'quality', '2025-07-12 17:31:26', '1d2dc7c094898357872af8630b92bfa5');

-- --------------------------------------------------------

--
-- Table structure for table `campaigndates`
--

CREATE TABLE `campaigndates` (
  `id` int(11) NOT NULL,
  `campaign_start_date` date NOT NULL,
  `campaign_end_date` date NOT NULL,
  `exhibition_start_date` date NOT NULL,
  `exhibition_end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committeeattendance`
--

CREATE TABLE `committeeattendance` (
  `id` int(11) NOT NULL,
  `volunteer_id` int(11) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `status` enum('حضر','لم يحضر') DEFAULT 'لم يحضر',
  `leader_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committeeleader`
--

CREATE TABLE `committeeleader` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `committee_section` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committeevolunteer`
--

CREATE TABLE `committeevolunteer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committee_volunteer_evaluations`
--

CREATE TABLE `committee_volunteer_evaluations` (
  `id` int(11) NOT NULL,
  `evaluator_id` int(11) DEFAULT NULL,
  `volunteer_id` int(11) DEFAULT NULL,
  `q1` int(11) DEFAULT NULL,
  `q2` int(11) DEFAULT NULL,
  `q3` int(11) DEFAULT NULL,
  `q4` int(11) DEFAULT NULL,
  `q5` int(11) DEFAULT NULL,
  `q6` int(11) DEFAULT NULL,
  `q7` int(11) DEFAULT NULL,
  `q8` int(11) DEFAULT NULL,
  `q9` int(11) DEFAULT NULL,
  `q10` int(11) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departmentleader`
--

CREATE TABLE `departmentleader` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leader`
--

CREATE TABLE `leader` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leader`
--

INSERT INTO `leader` (`id`, `name`, `phone`, `section_id`) VALUES
(1925, 'ريما الشاوي', '0530621523', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leader_evaluations`
--

CREATE TABLE `leader_evaluations` (
  `id` int(11) NOT NULL,
  `evaluator_id` int(11) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `q1` tinyint(4) DEFAULT NULL,
  `q2` tinyint(4) DEFAULT NULL,
  `q3` tinyint(4) DEFAULT NULL,
  `q4` tinyint(4) DEFAULT NULL,
  `q5` tinyint(4) DEFAULT NULL,
  `q6` tinyint(4) DEFAULT NULL,
  `q7` tinyint(4) DEFAULT NULL,
  `q8` tinyint(4) DEFAULT NULL,
  `q9` tinyint(4) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `leader_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quality`
--

CREATE TABLE `quality` (
  `id` int(11) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `volunteer_id` int(11) DEFAULT NULL,
  `q1` tinyint(4) DEFAULT NULL,
  `q2` tinyint(4) DEFAULT NULL,
  `q3` tinyint(4) DEFAULT NULL,
  `q4` tinyint(4) DEFAULT NULL,
  `q5` tinyint(4) DEFAULT NULL,
  `q6` tinyint(4) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `volunteer_id` int(11) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `from_section_id` int(11) DEFAULT NULL,
  `to_section_id` int(11) DEFAULT NULL,
  `status` enum('جاري المعالجة','تم النقل','مرفوض') DEFAULT 'جاري المعالجة',
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `min` int(11) DEFAULT 0,
  `max` int(11) DEFAULT 0,
  `department_leader_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `min`, `max`, `department_leader_id`) VALUES
(1, 'بلايز وتنانير', 5, 10, 1122),
(2, 'مواليد', 5, 10, 2233),
(3, 'فرز عام', 5, 10, 5566),
(4, 'طفل بنات', 5, 10, 2233),
(7, 'ركن الأحذيه', 40, 50, 5566);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `number_of_requests` tinyint(1) DEFAULT 0,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volunteerattendance`
--

CREATE TABLE `volunteerattendance` (
  `id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `department_leader_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigndates`
--
ALTER TABLE `campaigndates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `committeeattendance`
--
ALTER TABLE `committeeattendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volunteer_id` (`volunteer_id`),
  ADD KEY `leader_id` (`leader_id`);

--
-- Indexes for table `committeeleader`
--
ALTER TABLE `committeeleader`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `committeevolunteer`
--
ALTER TABLE `committeevolunteer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leader_id` (`leader_id`);

--
-- Indexes for table `committee_volunteer_evaluations`
--
ALTER TABLE `committee_volunteer_evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluator_id` (`evaluator_id`),
  ADD KEY `volunteer_id` (`volunteer_id`);

--
-- Indexes for table `departmentleader`
--
ALTER TABLE `departmentleader`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leader`
--
ALTER TABLE `leader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `leader_evaluations`
--
ALTER TABLE `leader_evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leader_id` (`leader_id`),
  ADD KEY `notes_ibfk_1` (`volunteer_id`);

--
-- Indexes for table `quality`
--
ALTER TABLE `quality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leader_id` (`leader_id`),
  ADD KEY `volunteer_id` (`volunteer_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leader_id` (`leader_id`),
  ADD KEY `from_section_id` (`from_section_id`),
  ADD KEY `to_section_id` (`to_section_id`),
  ADD KEY `request_ibfk_2` (`volunteer_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunteerattendance`
--
ALTER TABLE `volunteerattendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_volunteer_date` (`volunteer_id`,`attendance_date`),
  ADD KEY `leader_id` (`leader_id`),
  ADD KEY `department_leader_id` (`department_leader_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `campaigndates`
--
ALTER TABLE `campaigndates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `committeeattendance`
--
ALTER TABLE `committeeattendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `committeeleader`
--
ALTER TABLE `committeeleader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9902;

--
-- AUTO_INCREMENT for table `committeevolunteer`
--
ALTER TABLE `committeevolunteer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `committee_volunteer_evaluations`
--
ALTER TABLE `committee_volunteer_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departmentleader`
--
ALTER TABLE `departmentleader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5567;

--
-- AUTO_INCREMENT for table `leader`
--
ALTER TABLE `leader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1929;

--
-- AUTO_INCREMENT for table `leader_evaluations`
--
ALTER TABLE `leader_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `quality`
--
ALTER TABLE `quality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `volunteerattendance`
--
ALTER TABLE `volunteerattendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `committeeattendance`
--
ALTER TABLE `committeeattendance`
  ADD CONSTRAINT `committeeattendance_ibfk_1` FOREIGN KEY (`volunteer_id`) REFERENCES `committeevolunteer` (`id`),
  ADD CONSTRAINT `committeeattendance_ibfk_2` FOREIGN KEY (`leader_id`) REFERENCES `committeeleader` (`id`);

--
-- Constraints for table `committeevolunteer`
--
ALTER TABLE `committeevolunteer`
  ADD CONSTRAINT `committeevolunteer_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `committeeleader` (`id`);

--
-- Constraints for table `committee_volunteer_evaluations`
--
ALTER TABLE `committee_volunteer_evaluations`
  ADD CONSTRAINT `committee_volunteer_evaluations_ibfk_1` FOREIGN KEY (`evaluator_id`) REFERENCES `committeeleader` (`id`),
  ADD CONSTRAINT `committee_volunteer_evaluations_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `committeevolunteer` (`id`);

--
-- Constraints for table `leader`
--
ALTER TABLE `leader`
  ADD CONSTRAINT `leader_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`leader_id`) REFERENCES `leader` (`id`);

--
-- Constraints for table `quality`
--
ALTER TABLE `quality`
  ADD CONSTRAINT `quality_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `leader` (`id`),
  ADD CONSTRAINT `quality_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `leader` (`id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`from_section_id`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `request_ibfk_4` FOREIGN KEY (`to_section_id`) REFERENCES `section` (`id`);

--
-- Constraints for table `volunteerattendance`
--
ALTER TABLE `volunteerattendance`
  ADD CONSTRAINT `volunteerattendance_ibfk_1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volunteerattendance_ibfk_2` FOREIGN KEY (`leader_id`) REFERENCES `leader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volunteerattendance_ibfk_3` FOREIGN KEY (`department_leader_id`) REFERENCES `departmentleader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
